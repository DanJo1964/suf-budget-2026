Attribute VB_Name = "UdpateInterntBudget"
Option Compare Database
Option Explicit

'==============================================================================
' ADO constants (late binding friendly)
'==============================================================================
Private Const adCmdText As Long = 1
Private Const adParamInput As Long = 1
Private Const adVarWChar As Long = 202
Private Const adInteger As Long = 3
Private Const adCurrency As Long = 6
Private Const adOpenForwardOnly As Long = 0
Private Const adOpenKeyset As Long = 1
Private Const adOpenDynamic As Long = 2
Private Const adLockReadOnly As Long = 1
Private Const adLockOptimistic As Long = 3
Private Const adStateOpen As Long = 1

'==============================================================================
' Public API (bevarer dine navne)
'==============================================================================

' Opdaterer en konto i tblInterntBudget: BudgetIalt + _1.._12
' Fordeling styres af:
'   - strKtoAs12 = "12" => ligelig fordeling
'   - ellers: fordel efter mønsteret i konto = strKtoAs12 (procent pr måned ud fra den kontos måned/total)
' Special cases:
'   - 1160 -> altid januar
'   - 1805 -> altid juli
Public Function fncUpdIntBud( _
    ByVal strAfdUni As String, _
    ByVal intYear As Integer, _
    ByVal strKonto As String, _
    ByVal dblBeløb As Double, _
    ByVal strKtoAs12 As String _
) As Boolean

    On Error GoTo ErrHandler

    Dim cn As Object
    Dim months(1 To 12) As Double
    Dim dblBudgetIaltToSet As Double
    Dim dblRegulering As Double

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    ' 1) Læs regulering (hvis den findes) for kontoen der opdateres
    dblRegulering = Nz(ADOLookupValue(cn, _
        "SELECT Regulering FROM tblInterntBudget WHERE Afdeling = ? AND Year_ = ? AND Konto = ?", _
        Array(strAfdUni, intYear, strKonto)), 0)

    ' 2) Bestem BudgetIalt der skal sættes
    If dblRegulering <> 0 Then
        dblBudgetIaltToSet = dblRegulering
    Else
        dblBudgetIaltToSet = dblBeløb
    End If

    ' 3) Beregn månedstal (months array)
    Call BuildMonthsDistribution(cn, strAfdUni, intYear, strKonto, dblBudgetIaltToSet, strKtoAs12, months)

    ' 4) Kør UPDATE (hurtigt, parameteriseret)
    fncUpdIntBud = UpdateIBMonths(cn, strAfdUni, intYear, strKonto, dblBeløb, dblBudgetIaltToSet, months)

CleanExit:
    On Error Resume Next
    If Not cn Is Nothing Then
        If cn.State = adStateOpen Then cn.Close
    End If
    Set cn = Nothing
    Exit Function

ErrHandler:
    MsgBox "fncUpdIntBud - fejl: " & Err.Description, vbExclamation
    fncUpdIntBud = False
    Resume CleanExit
End Function

' Din DAO-variant beholdes som wrapper (så eksisterende kald ikke knækker),
' men den kalder nu ADO-versionen for performance og robusthed.
Public Function fncUpdIntBud_DAO( _
    ByVal strAfdUni As String, _
    ByVal intYear As Integer, _
    ByVal strKonto As String, _
    ByVal dblBeløb As Double, _
    ByVal strKtoAs12 As String _
) As Boolean
    fncUpdIntBud_DAO = fncUpdIntBud(strAfdUni, intYear, strKonto, dblBeløb, strKtoAs12)
End Function

' Summerer Sum-konti og opdaterer dem + opdaterer tblFB_Totaler nøgletal.
' Dette er en “afbalanceret” optimering:
' - færre recordset updates, flere direkte UPDATE med parametre
' - beholder din forretningslogik (1098/1918 omsætning, 2990 overskud, FB-beregning osv.)
Public Function fncUpdateSumKti(ByVal strAfdUni As String, ByVal intYear As Integer) As Boolean
    On Error GoTo ErrHandler

    Dim cn As Object
    Dim rsSumLines As Object
    Dim rsRanges As Object
    Dim rsOG As Object

    Dim sqlRanges As String
    Dim sqlSumLines As String

    Dim dblOmsætning As Double
    Dim dblOverskud As Double
    Dim dblOverskudsGrad As Double
    Dim dblOmkostninger As Double

    Dim dblSumFB As Double
    dblOmsætning = 0
    dblOverskud = 0

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    ' 0) Beregn FB_SamletBidrag hurtigere (din dictionary tilgang beholdes, men parameteriseres)
    dblSumFB = CalcSumFB(cn, strAfdUni, intYear)

    ' 1) Hent alle sum-ranges (konti hvor Kontotype='Sum' og feltet Sum indeholder "xxxx..yyyy")
    sqlRanges = _
        "SELECT Konto, Sum " & _
        "FROM tblInterntBudget " & _
        "WHERE Year_ = ? AND Afdeling = ? AND Kontotype = 'Sum'"

    Set rsRanges = OpenRsParams(cn, sqlRanges, Array(intYear, strAfdUni))

    Do While Not rsRanges.EOF
        Dim strSumLineKonto As String
        Dim strRange As String
        Dim strKtoFra As String
        Dim strKtoTil As String
        Dim pos As Long

        strSumLineKonto = Nz(rsRanges.Fields("Konto").value, "")
        strRange = Nz(rsRanges.Fields("Sum").value, "")

        pos = InStr(1, strRange, "..")
        If pos > 0 Then
            strKtoFra = Left$(strRange, pos - 1)
            strKtoTil = Mid$(strRange, pos + 2)
        Else
            ' hvis range ikke er valid, spring over
            rsRanges.MoveNext
            GoTo NextRange
        End If

        ' 2) Beregn summer for det interval i én query (kun for den afdeling+år)
        sqlSumLines = _
            "SELECT " & _
            "  SUM(EstimatForrigeÅr) AS EstForrige, " & _
            "  SUM(EstimatFremskrevet) AS EstFrem, " & _
            "  SUM(RealForrigeÅr) AS RealForrige, " & _
            "  SUM(Regulering) AS Regulering, " & _
            "  SUM(BudgetIalt) AS BudgetIalt, " & _
            "  SUM([_1]) AS M1, SUM([_2]) AS M2, SUM([_3]) AS M3, SUM([_4]) AS M4, " & _
            "  SUM([_5]) AS M5, SUM([_6]) AS M6, SUM([_7]) AS M7, SUM([_8]) AS M8, " & _
            "  SUM([_9]) AS M9, SUM([_10]) AS M10, SUM([_11]) AS M11, SUM([_12]) AS M12 " & _
            "FROM tblInterntBudget " & _
            "WHERE Year_ = ? AND Afdeling = ? " & _
            "  AND Konto >= ? AND Konto <= ? " & _
            "  AND Kontotype <> 'Sum' AND Kontotype <> 'Overskrift'"

        Set rsSumLines = OpenRsParams(cn, sqlSumLines, Array(intYear, strAfdUni, strKtoFra, strKtoTil))

        If Not rsSumLines.EOF Then
            Dim months(1 To 12) As Double
            Dim dblBudget As Double

            dblBudget = Nz(rsSumLines.Fields("BudgetIalt").value, 0)

            months(1) = Nz(rsSumLines.Fields("M1").value, 0)
            months(2) = Nz(rsSumLines.Fields("M2").value, 0)
            months(3) = Nz(rsSumLines.Fields("M3").value, 0)
            months(4) = Nz(rsSumLines.Fields("M4").value, 0)
            months(5) = Nz(rsSumLines.Fields("M5").value, 0)
            months(6) = Nz(rsSumLines.Fields("M6").value, 0)
            months(7) = Nz(rsSumLines.Fields("M7").value, 0)
            months(8) = Nz(rsSumLines.Fields("M8").value, 0)
            months(9) = Nz(rsSumLines.Fields("M9").value, 0)
            months(10) = Nz(rsSumLines.Fields("M10").value, 0)
            months(11) = Nz(rsSumLines.Fields("M11").value, 0)
            months(12) = Nz(rsSumLines.Fields("M12").value, 0)

            ' 3) Opdater selve sum-kontoen direkte (hurtigt)
            Call UpdateSumLine(cn, strAfdUni, intYear, strSumLineKonto, _
                Nz(rsSumLines.Fields("EstForrige").value, 0), _
                Nz(rsSumLines.Fields("EstFrem").value, 0), _
                Nz(rsSumLines.Fields("RealForrige").value, 0), _
                Nz(rsSumLines.Fields("Regulering").value, 0), _
                dblBudget, months)

            ' 4) Opsamling til nøgletal
            If strSumLineKonto = "1098" Then
                dblOmsætning = dblBudget
            End If
            If strSumLineKonto = "1918" And dblOmsætning = 0 Then
                dblOmsætning = dblBudget
            End If
            If strSumLineKonto = "2990" Then
                dblOverskud = dblBudget
            End If
        End If

        rsSumLines.Close
        Set rsSumLines = Nothing

NextRange:
        rsRanges.MoveNext
    Loop

    rsRanges.Close
    Set rsRanges = Nothing

    ' 5) Beregn overskudsgrad + omkostninger (som du gør i dag)
    If dblOmsætning <> 0 Then
        dblOverskudsGrad = Nz((dblOverskud * 100) / dblOmsætning, 0)
        dblOmkostninger = Abs(dblOmsætning) + dblOverskud

        ' Opdater TotalOmsætning (bevarer din logik med negativ)
        ExecuteNonQueryParams cn, _
            "UPDATE tblFB_Totaler SET TotalOmsætning = ? WHERE Afdeling = ? AND Year_ = ?", _
            Array(CDbl(-dblOmsætning), strAfdUni, intYear)
    Else
        dblOmkostninger = dblOverskud
        dblOverskudsGrad = 0
    End If

    ' 6) Sikr række i tblFB_Totaler (Afdeling,Year_)
    EnsureFBTotalerRow cn, strAfdUni, intYear

    ' 7) Opdater tblFB_Totaler: Overskudsgrad, FB_SamletBidrag, FB_PctAfOms
    Dim dblFBPct As Double
    If Nz(dblOmsætning, 0) <> 0 Then
        dblFBPct = Nz(dblSumFB, 0) / Abs(Nz(dblOmsætning, 0))
    Else
        dblFBPct = 0
    End If

    ExecuteNonQueryParams cn, _
        "UPDATE tblFB_Totaler " & _
        "SET Overskudsgrad = ?, FB_SamletBidrag = ?, FB_PctAfOms = ? " & _
        "WHERE Afdeling = ? AND Year_ = ?", _
        Array(CDbl(dblOverskudsGrad), CDbl(dblSumFB), CDbl(dblFBPct), strAfdUni, intYear)

    ' 8) Hvis InterntBudget-formen er åben, opdater felter på formen (som du gør nu)
    UpdateIBFormUIIfOpen strAfdUni, intYear, dblOverskudsGrad, dblSumFB, dblFBPct, dblOmkostninger, cn

    fncUpdateSumKti = True

CleanExit:
    On Error Resume Next
    If Not cn Is Nothing Then
        If cn.State = adStateOpen Then cn.Close
    End If
    Set cn = Nothing
    Exit Function

ErrHandler:
    MsgBox "fncUpdateSumKti - fejl: " & Err.Description, vbExclamation
    fncUpdateSumKti = False
    Resume CleanExit
End Function

'==============================================================================
' Helper: Nulstil konto (din DAO-version var ok, men ADO er hurtigere og simpelt)
'==============================================================================

Public Function fncNulstilKti(ByVal strAfdUni As String, ByVal intYear As Integer, ByVal strKonto As String) As Boolean
    'On Error GoTo ErrHandler

    Dim cn As Object
    Dim months(1 To 12) As Double
    Dim i As Long

    For i = 1 To 12
        months(i) = 0
    Next i

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    ' Nulstil BudgetIalt, Regulering og måneder til NULL (ikke 0)
    ExecuteNonQueryParams cn, _
        "UPDATE tblInterntBudget SET BudgetIalt = NULL, Regulering = NULL, " & _
        "[_1]=NULL,[_2]=NULL,[_3]=NULL,[_4]=NULL,[_5]=NULL,[_6]=NULL,[_7]=NULL,[_8]=NULL,[_9]=NULL,[_10]=NULL,[_11]=NULL,[_12]=NULL " & _
        "WHERE Afdeling = ? AND Year_ = ? AND Konto = ?", _
        Array(strAfdUni, intYear, strKonto)

    fncNulstilKti = True

CleanExit:
    On Error Resume Next
    If Not cn Is Nothing Then
        If cn.State = adStateOpen Then cn.Close
    End If
    Set cn = Nothing
    Exit Function

ErrHandler:
    MsgBox "fncNulstilKti - fejl: " & Err.Description, vbExclamation
    fncNulstilKti = False
    Resume CleanExit
End Function

'==============================================================================
' Helper: IsFrmOpen (din beholdes)
'==============================================================================

Public Function IsFrmOpen(ByVal sFrmName As String) As Boolean
    On Error GoTo Error_Handler
    IsFrmOpen = Application.CurrentProject.AllForms(sFrmName).IsLoaded
Error_Handler_Exit:
    On Error Resume Next
    Exit Function
Error_Handler:

    MsgBox "The following error has occurred" & vbCrLf & vbCrLf & _
           "Error Number: " & Err.Number & vbCrLf & _
           "Error Source: IsFrmOpen" & vbCrLf & _
           "Error Description: " & Err.Description & _
           Switch(Erl = 0, "", Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "An Error has Occurred!"

    Resume Error_Handler_Exit
End Function

'==============================================================================
' Internals
'==============================================================================

Private Sub BuildMonthsDistribution( _
    ByVal cn As Object, _
    ByVal strAfdUni As String, _
    ByVal intYear As Integer, _
    ByVal strKontoToUpdate As String, _
    ByVal dblBudgetIalt As Double, _
    ByVal strKtoAs12 As String, _
    ByRef months() As Double _
)
    Dim i As Long
    For i = 1 To 12
        months(i) = 0
    Next i

    ' Specialkonti
    If strKontoToUpdate = "1160" Then
        months(1) = dblBudgetIalt
        Exit Sub
    ElseIf strKontoToUpdate = "1805" Then
        months(7) = dblBudgetIalt
        Exit Sub
    End If

    ' Ligelig fordeling?
    If CStr(strKtoAs12) = "12" Then
        For i = 1 To 12
            months(i) = dblBudgetIalt / 12
        Next i
        Exit Sub
    End If

    ' Fordel efter mønsterkonto (strKtoAs12)
    Dim patternBudget As Double
    patternBudget = Nz(ADOLookupValue(cn, _
        "SELECT BudgetIalt FROM tblInterntBudget WHERE Afdeling = ? AND Year_ = ? AND Konto = ?", _
        Array(strAfdUni, intYear, CStr(strKtoAs12))), 0)

    If patternBudget = 0 Then
        ' fallback: ligeligt (undgå division med 0)
        For i = 1 To 12
            months(i) = dblBudgetIalt / 12
        Next i
        Exit Sub
    End If

    Dim mVal As Double
    For i = 1 To 12
        mVal = Nz(ADOLookupValue(cn, _
            "SELECT [_" & i & "] FROM tblInterntBudget WHERE Afdeling = ? AND Year_ = ? AND Konto = ?", _
            Array(strAfdUni, intYear, CStr(strKtoAs12))), 0)

        ' andel = mVal / patternBudget
        months(i) = dblBudgetIalt * (mVal / patternBudget)
    Next i
End Sub

Private Function UpdateIBMonths( _
    ByVal cn As Object, _
    ByVal strAfdUni As String, _
    ByVal intYear As Integer, _
    ByVal strKonto As String, _
    ByVal dblEstimatFremskrevet As Double, _
    ByVal dblBudgetIalt As Double, _
    ByRef months() As Double _
) As Boolean
    On Error GoTo ErrHandler

    Dim cmd As Object
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = cn
    cmd.CommandType = adCmdText

    cmd.CommandText = _
        "UPDATE tblInterntBudget SET " & _
        "EstimatFremskrevet = ?, BudgetIalt = ?, " & _
        "[_1]=?,[_2]=?,[_3]=?,[_4]=?,[_5]=?,[_6]=?,[_7]=?,[_8]=?,[_9]=?,[_10]=?,[_11]=?,[_12]=? " & _
        "WHERE Afdeling = ? AND Year_ = ? AND Konto = ?"

    ' beløb: adCurrency
    cmd.Parameters.Append cmd.CreateParameter("pEst", adCurrency, adParamInput, , CDbl(dblEstimatFremskrevet))
    cmd.Parameters.Append cmd.CreateParameter("pBud", adCurrency, adParamInput, , CDbl(dblBudgetIalt))

    Dim i As Long
    For i = 1 To 12
        cmd.Parameters.Append cmd.CreateParameter("pM" & i, adCurrency, adParamInput, , CDbl(months(i)))
    Next i

    cmd.Parameters.Append cmd.CreateParameter("pAfd", adVarWChar, adParamInput, 50, strAfdUni)
    cmd.Parameters.Append cmd.CreateParameter("pYr", adInteger, adParamInput, , intYear)
    cmd.Parameters.Append cmd.CreateParameter("pKto", adVarWChar, adParamInput, 50, strKonto)

    Dim ra As Long
    cmd.Execute ra
    UpdateIBMonths = (ra > 0)
    Exit Function

ErrHandler:
    UpdateIBMonths = False
End Function

Private Sub UpdateSumLine( _
    ByVal cn As Object, _
    ByVal strAfdUni As String, _
    ByVal intYear As Integer, _
    ByVal strSumKonto As String, _
    ByVal estForrige As Double, _
    ByVal estFrem As Double, _
    ByVal realForrige As Double, _
    ByVal Regulering As Double, _
    ByVal BudgetIalt As Double, _
    ByRef months() As Double _
)
    ExecuteNonQueryParams cn, _
        "UPDATE tblInterntBudget SET " & _
        "EstimatForrigeÅr=?, EstimatFremskrevet=?, RealForrigeÅr=?, Regulering=?, BudgetIalt=?, " & _
        "[_1]=?,[_2]=?,[_3]=?,[_4]=?,[_5]=?,[_6]=?,[_7]=?,[_8]=?,[_9]=?,[_10]=?,[_11]=?,[_12]=? " & _
        "WHERE Afdeling=? AND Year_=? AND Konto=?", _
        Array( _
            CDbl(estForrige), CDbl(estFrem), CDbl(realForrige), CDbl(Regulering), CDbl(BudgetIalt), _
            CDbl(months(1)), CDbl(months(2)), CDbl(months(3)), CDbl(months(4)), CDbl(months(5)), CDbl(months(6)), _
            CDbl(months(7)), CDbl(months(8)), CDbl(months(9)), CDbl(months(10)), CDbl(months(11)), CDbl(months(12)), _
            strAfdUni, intYear, strSumKonto _
        )
End Sub

Private Function CalcSumFB(ByVal cn As Object, ByVal strAfdUni As String, ByVal intYear As Integer) As Double
    ' Beregner SUM(BudgetIalt) for driftskonti i tblParm_FB_Excel_Kti (Konto_2) for året
    On Error GoTo ErrHandler

    Dim rs As Object
    Dim sql As String

    sql = _
        "SELECT SUM(b.BudgetIalt) AS TotalFB " & _
        "FROM tblInterntBudget b " & _
        "WHERE b.Year_ = ? AND b.Afdeling = ? " & _
        "  AND b.Kontotype <> 'Sum' AND b.Kontotype <> 'Overskrift' " & _
        "  AND b.Konto IN (SELECT DISTINCT Konto_2 FROM tblParm_FB_Excel_Kti WHERE Year_ = ? AND Konto_2 IS NOT NULL AND Konto_2 <> '')"

    Set rs = OpenRsParams(cn, sql, Array(intYear, strAfdUni, intYear))
    If Not rs.EOF Then
        CalcSumFB = Nz(rs.Fields("TotalFB").value, 0)
    Else
        CalcSumFB = 0
    End If

    rs.Close
    Set rs = Nothing
    Exit Function

ErrHandler:
    CalcSumFB = 0
End Function

Private Sub EnsureFBTotalerRow(ByVal cn As Object, ByVal strAfdUni As String, ByVal intYear As Integer)
    ' SQL Server style IF NOT EXISTS er OK hvis tblFB_Totaler ligger i SQL Server.
    ' Hvis tblFB_Totaler er lokal Access-tabel, så skal vi gøre det med SELECT + INSERT.
    ' Her bevarer vi din tilgang, men parameteriseret.
    Dim sql As String
    sql = _
        "IF NOT EXISTS (SELECT 1 FROM tblFB_Totaler WHERE Afdeling = ? AND Year_ = ?) " & _
        "INSERT INTO tblFB_Totaler " & _
        "(Afdeling, Year_, Overskudsgrad, FB_SamletBidrag, FB_PctAfOms, PB_AntalPladser, PB_DøgnTakst, PB_TimePris, TotalÅrsværk) " & _
        "VALUES (?, ?, 0, 0, 0, 0, 0, 0, 0);"

    ExecuteNonQueryParams cn, sql, Array(strAfdUni, intYear, strAfdUni, intYear)
End Sub

Private Sub UpdateIBFormUIIfOpen( _
    ByVal strAfdUni As String, _
    ByVal intYear As Integer, _
    ByVal dblOverskudsGrad As Double, _
    ByVal dblSumFB As Double, _
    ByVal dblFBPct As Double, _
    ByVal dblOmkostninger As Double, _
    ByVal cn As Object _
)
    Dim frmName As String
    frmName = "frmSUF_InterntBudget"


    If Not IsFrmOpen(frmName) Then Exit Sub

    On Error Resume Next

    Forms(frmName).tbxOverskudsGrad.value = dblOverskudsGrad
    Forms(frmName).txtBoxFBSamlet.value = dblSumFB
    Forms(frmName).txtBoxFBpct.value = dblFBPct

    ' Prisberegning-felter (hvis de findes/er synlige)
    If Nz(TempVars("IB_isFromPrisberegning"), False) = True Then
        Dim intPB_AntalPladser As Double
        Dim dblPB_DøgntakstMO As Double
        Dim dblPB_TimePrisMO As Double
        Dim dblPB_DøgntakstUO As Double
        Dim dblPB_TimePrisUO As Double
        Dim dblPB_AntalÅrsværk As Double
        Dim dblOmsætning As Double

        dblOmsætning = dblOmkostninger / (1 - (dblOverskudsGrad * 0.01))

        intPB_AntalPladser = Nz(Forms(frmName).txtPBAntalPladser.value, 0)

        ' TotalÅrsværk hentes
        dblPB_AntalÅrsværk = Nz(ADOLookupValue(cn, _
            "SELECT TotalÅrsværk FROM tblFB_Totaler WHERE Afdeling = ? AND Year_ = ?", _
            Array(strAfdUni, intYear)), 0)

        If intPB_AntalPladser > 0 And Nz(dblOmsætning, 0) <> 0 Then
            dblPB_DøgntakstMO = dblOmsætning / 365 / intPB_AntalPladser
            dblPB_DøgntakstUO = dblOmkostninger / 365 / intPB_AntalPladser
            If Nz(dblPB_AntalÅrsværk, 0) > 0 Then
                dblPB_TimePrisMO = dblOmsætning / (Nz(dblPB_AntalÅrsværk, 1) * 1924)
                dblPB_TimePrisUO = dblOmkostninger / (Nz(dblPB_AntalÅrsværk, 1) * 1924)
            End If
        End If

        If Forms(frmName).txtPBDøgnTakstMO.Visible = True Then
            Forms(frmName).txtPBDøgnTakstMO.value = Nz(dblPB_DøgntakstMO, 0)
            Forms(frmName).txtPBDøgnTakstUO.value = Nz(dblPB_DøgntakstUO, 0)

            Forms(frmName).txtPBMdrTakstMO.value = Nz((dblPB_DøgntakstMO * 365) / 12, 0)
            Forms(frmName).txtPBMdrTakstUO.value = Nz((dblPB_DøgntakstUO * 365) / 12, 0)

            Forms(frmName).txtPBTimePrisMO.value = Nz(dblPB_TimePrisMO, 0)
            Forms(frmName).txtPBTimePrisUO.value = Nz(dblPB_TimePrisUO, 0)
        End If
    End If

    On Error GoTo 0
End Sub

'------------------------------------------------------------------------------
' ADO helpers (parametreret SELECT/EXEC)
'------------------------------------------------------------------------------

Private Function OpenRsParams(ByVal cn As Object, ByVal sql As String, ByVal params As Variant) As Object
    Dim cmd As Object, rs As Object
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = cn
    cmd.CommandType = adCmdText
    cmd.CommandText = sql

    AppendParams cmd, params

    Set rs = CreateObject("ADODB.Recordset")
    rs.Open cmd, , adOpenForwardOnly, adLockReadOnly
    Set OpenRsParams = rs
End Function

Private Sub ExecuteNonQueryParams(ByVal cn As Object, ByVal sql As String, ByVal params As Variant)
    ' ADO Konstanter til Late Binding
    Const adCmdText As Long = 1

    Dim cmd As Object
    Dim p As Object
    Dim i As Integer

    On Error GoTo Err_Handler

    ' Initialiser Command objekt
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = cn
    cmd.CommandType = adCmdText
    cmd.CommandText = sql

    ' Tilføj parametre via din eksisterende sub
    AppendParams cmd, params

    ' --- DEBUGGING SEKTION ---
    ' Åbn "Immediate Window" (Ctrl+G) i VBA-editoren for at se resultatet
    'Debug.Print "--- Debugging SQL Parameters ---"
    'Debug.Print "SQL: " & sql

    If cmd.Parameters.Count = 0 Then
        'Debug.Print "ADVARSEL: Ingen parametre blev tilføjet til cmd.Parameters!"
    Else
        For i = 0 To cmd.Parameters.Count - 1
            Set p = cmd.Parameters(i)
            ' Vi udskriver index, navn (hvis angivet), type og den faktiske værdi
            'Debug.Print "Param [" & i & "] - Type: " & p.Type & " - Værdi: " & Nz(p.value, "NULL")
        Next i
    End If
    'Debug.Print "--- Debugging End ---"
    ' --- SLUT PÅ DEBUGGING ---

    ' Udfør kommandoen
    cmd.Execute

    ' Valgfri succes-bekræftelse (fjern hvis sub'en kører mange gange)
    ' MsgBox "Data blev opdateret korrekt.", vbInformation, "Succes"

Exit_Handler:
    ' Ryd op i objekter
    On Error Resume Next
    Set cmd = Nothing
    Exit Sub

Err_Handler:
    ' Dansk fejlmeddelelse med detaljer om fejlen og SQL-strengen
    MsgBox "Der opstod en fejl under udførelse af SQL-kommandoen:" & vbCrLf & vbCrLf & _
           "Fejl nr: " & Err.Number & vbCrLf & _
           "Beskrivelse: " & Err.Description & vbCrLf & vbCrLf & _
           "SQL-streng: " & sql, vbCritical, "Databasefejl"
    Resume Exit_Handler
End Sub
Private Function ADOLookupValue(ByVal cn As Object, ByVal sql As String, ByVal params As Variant) As Variant
    Dim rs As Object
    Set rs = OpenRsParams(cn, sql, params)
    If rs.EOF Then
        ADOLookupValue = Null
    Else
        ADOLookupValue = rs.Fields(0).value
    End If
    rs.Close
    Set rs = Nothing
End Function

Private Sub AppendParams(ByVal cmd As Object, ByVal params As Variant)
    ' ADO Datatype Konstanter
    Const adInteger As Long = 3
    Const adCurrency As Long = 6
    Const adVarWChar As Long = 202
    Const adParamInput As Long = 1
    Const adDate As Long = 7

    Dim i As Long
    Dim v As Variant

    On Error GoTo Err_Handler

    If IsEmpty(params) Then Exit Sub
    If Not IsArray(params) Then Exit Sub

    For i = LBound(params) To UBound(params)
        v = params(i)

        ' Prioriter den faktiske VBA-datatype frem for indholdet (Grounding)
        Select Case VarType(v)
            Case vbString
                ' Selvom strengen er "80", behandles den som tekst (adVarWChar)
                cmd.Parameters.Append cmd.CreateParameter("p" & i, adVarWChar, adParamInput, 255, CStr(v))

            Case vbInteger, vbLong
                ' Årstal, ID'er osv.
                cmd.Parameters.Append cmd.CreateParameter("p" & i, adInteger, adParamInput, , CLng(v))

            Case vbDouble, vbSingle, vbCurrency
                ' Faktiske tal-formater (f.eks. beløb)
                cmd.Parameters.Append cmd.CreateParameter("p" & i, adCurrency, adParamInput, , CCur(v))

            Case vbDate
                cmd.Parameters.Append cmd.CreateParameter("p" & i, adDate, adParamInput, , CDate(v))

            Case vbNull
                ' Håndtering af NULL-værdier (vigtigt for SQL Server)
                cmd.Parameters.Append cmd.CreateParameter("p" & i, adVarWChar, adParamInput, 1, Null)

            Case Else
                ' Backup: Hvis det er numerisk men ikke fanget ovenfor, og IKKE er en streng
                If IsNumeric(v) And VarType(v) <> vbString Then
                    cmd.Parameters.Append cmd.CreateParameter("p" & i, adCurrency, adParamInput, , CDbl(v))
                Else
                    cmd.Parameters.Append cmd.CreateParameter("p" & i, adVarWChar, adParamInput, 255, CStr(v))
                End If
        End Select
    Next i

Exit_Handler:
    Exit Sub

Err_Handler:
    MsgBox "Der opstod en fejl under tilføjelse af parametre (AppendParams):" & vbCrLf & Err.Description, vbCritical, "Systemfejl"
    Resume Exit_Handler
End Sub
