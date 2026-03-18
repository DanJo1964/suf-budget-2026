Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Dim intUdregnLøn As Integer
Dim dblSum_1100 As Double
Dim IB_isFromPrisberegning As Boolean

'=============================================================================
' GENERISK ADO HELPER FUNKTIONER
'=============================================================================

Public Function ADOLookup( _
    ByVal strField As String, _
    ByVal strTable As String, _
    ByVal strWhere As String _
) As Variant

    On Error GoTo ErrHandler

    Dim cn As Object
    Dim rs As Object
    Dim strSQL As String

    strSQL = "SELECT TOP 1 " & strField & " FROM " & strTable & " WHERE " & strWhere

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    Set rs = CreateObject("ADODB.Recordset")
    rs.Open strSQL, cn, 1, 1  ' adOpenKeyset, adLockReadOnly

    If Not rs.EOF Then
        ADOLookup = rs.Fields(0).value
    Else
        ADOLookup = Null
    End If

    rs.Close
    cn.Close
    Set rs = Nothing
    Set cn = Nothing
    Exit Function

ErrHandler:
    ADOLookup = Null
    If Not rs Is Nothing Then rs.Close
    If Not cn Is Nothing Then cn.Close
End Function

Public Function UpdateInterntBudgetLineADO(ByVal strAfdeling As String, _
    ByVal intYear As Integer, _
    ByVal strKonto As String, _
    ByVal dblBudgetIalt As Double, _
    ByVal dblMonth1 As Double, _
    ByVal dblMonth2 As Double, _
    ByVal dblMonth3 As Double, _
    ByVal dblMonth4 As Double, _
    ByVal dblMonth5 As Double, _
    ByVal dblMonth6 As Double, _
    ByVal dblMonth7 As Double, _
    ByVal dblMonth8 As Double, _
    ByVal dblMonth9 As Double, _
    ByVal dblMonth10 As Double, _
    ByVal dblMonth11 As Double, _
    ByVal dblMonth12 As Double _
) As Boolean

    On Error GoTo ErrHandler

    Dim cn As Object
    Dim cmd As Object
    Dim lngRecordsAffected As Long

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = cn

    cmd.CommandText = _
        "UPDATE tblInterntBudget SET " & _
        "BudgetIalt = ?, " & _
        "[_1] = ?, [_2] = ?, [_3] = ?, [_4] = ?, [_5] = ?, [_6] = ?, " & _
        "[_7] = ?, [_8] = ?, [_9] = ?, [_10] = ?, [_11] = ?, [_12] = ? " & _
        "WHERE Afdeling = ? AND Year_ = ? AND Konto = ?"

    ' Brug adCurrency (type 6) for alle beløb
    cmd.Parameters.Append cmd.CreateParameter("pBudgetIalt", 6, 1, , dblBudgetIalt)
    cmd.Parameters.Append cmd.CreateParameter("pM1", 6, 1, , dblMonth1)
    cmd.Parameters.Append cmd.CreateParameter("pM2", 6, 1, , dblMonth2)
    cmd.Parameters.Append cmd.CreateParameter("pM3", 6, 1, , dblMonth3)
    cmd.Parameters.Append cmd.CreateParameter("pM4", 6, 1, , dblMonth4)
    cmd.Parameters.Append cmd.CreateParameter("pM5", 6, 1, , dblMonth5)
    cmd.Parameters.Append cmd.CreateParameter("pM6", 6, 1, , dblMonth6)
    cmd.Parameters.Append cmd.CreateParameter("pM7", 6, 1, , dblMonth7)
    cmd.Parameters.Append cmd.CreateParameter("pM8", 6, 1, , dblMonth8)
    cmd.Parameters.Append cmd.CreateParameter("pM9", 6, 1, , dblMonth9)
    cmd.Parameters.Append cmd.CreateParameter("pM10", 6, 1, , dblMonth10)
    cmd.Parameters.Append cmd.CreateParameter("pM11", 6, 1, , dblMonth11)
    cmd.Parameters.Append cmd.CreateParameter("pM12", 6, 1, , dblMonth12)
    cmd.Parameters.Append cmd.CreateParameter("pAfdeling", 200, 1, 255, strAfdeling)
    cmd.Parameters.Append cmd.CreateParameter("pYear", 3, 1, , intYear)
    cmd.Parameters.Append cmd.CreateParameter("pKonto", 200, 1, 50, strKonto)

    cmd.Execute lngRecordsAffected

    cn.Close
    Set cmd = Nothing
    Set cn = Nothing

    ' Returner True hvis række blev opdateret, False hvis ikke fundet
    UpdateInterntBudgetLineADO = (lngRecordsAffected > 0)
    Exit Function

ErrHandler:
    If Not cn Is Nothing Then cn.Close
    UpdateInterntBudgetLineADO = False
    MsgBox "Fejl ved opdatering af konto " & strKonto & ": " & Err.Description, vbExclamation
End Function

'=============================================================================
' FORM EVENTS
'=============================================================================

Private Sub btnCreateLines_Click()
    Dim intYear_ As Integer
    Dim strSrcAfd As String

    intYear_ = Me.cboYearIntBud
    If intYear_ = 0 Then
        MsgBox "Vælg årstal!"
        Exit Sub
    End If

    strSrcAfd = GetSourceDepartment(Me.cboAfdelingUni.value, intYear_)
    If strSrcAfd = "" Then Exit Sub

    Me.lblArbejder.Visible = True
    Me.lblArbejder.Caption = "Overfører " & vbCrLf & "finans- og " & vbCrLf & "budgetposter ... "
    Me.Repaint
    DoEvents

    If CreateInterntBudgetRecords(intYear_, strSrcAfd) = 0 Then
        Me.lblArbejder.Visible = False
        Exit Sub
    End If

    Call ApplyFilter(True)
    Me.lblUpdDte01.Caption = Format(Date, "dd-mm-yyyy")

    Call UpdateIntBudFormHeader("DteOpr", Me.lblUpdDte01.Caption)
    Call fncUpdateSumKti(Me.cboAfdelingUni.value, intYear_)

    Me.Repaint
    Me.frmTmpInterntBudget.Form.Requery
    Me.lblArbejder.Visible = False
End Sub

Private Sub btnIndt_Click()
    Dim strSumTable As String

    strSumTable = "tblTmpDebtor"

    Me.lblUpdDte02.Caption = Format(Date, "dd-mm-yyyy")
    Me.lblArbejder.Visible = True
    Me.lblArbejder.Caption = "Overfører " & vbCrLf & "debitorposter... "
    Me.Repaint
    DoEvents

    Call UpdateIntBudFormHeader("DteIndt", Me.lblUpdDte02.Caption)
    Call NulstilIndt(Me.cboAfdelingUni.value, Me.cboYearIntBud.value)
    Call TransferToInterntBudget(strSumTable, -1)
    Call fncUpdateSumKti(Me.cboAfdelingUni.value, Me.cboYearIntBud.value)

    Me.lblArbejder.Visible = False
    Me.frmTmpInterntBudget.Requery
End Sub

Private Sub btnLøn_Click()
    Dim strSumTable As String
    Dim intYear_ As Integer
    Dim intYearGrund As Integer
    Dim strAfd As String
    Dim strAfdUni As String
    Dim dblOmsFiktiv As Double
    Dim dblOG As Double
    Dim dblMonthlyAmount As Double
    Dim blnSuccess As Boolean

    intYear_ = Me.cboYearIntBud.value
    strAfdUni = Me.cboAfdelingUni
    strSumTable = "tblTmpMedarbejder"

    Me.lblUpdDte03.Caption = Format(Date, "dd-mm-yyyy")
    Me.lblArbejder.Visible = True
    Me.lblArbejder.Caption = "Overfører " & vbCrLf & "lønposter... "
    Me.Repaint
    DoEvents

    Call UpdateIntBudFormHeader("DteLøn", Me.lblUpdDte03.Caption)
    Call TransferToInterntBudget(strSumTable, 1)

    If dblSum_1100 <> 0 Then
        If TempVars("IB_isFromPrisberegning") = True Then
            intYearGrund = TempVars("IB_currentYearGrund").value
            strAfd = strAfdUni
            Call fncWages(strAfd, intYearGrund, strAfdUni, dblSum_1100)
        Else
            strAfd = Nz(ADOLookup("Afdeling", "tblAfdeling", "[AfdNr Uniconta] = '" & strAfdUni & "' and Year_ = " & intYear_), "")
            Call fncWages(strAfd, intYear_, strAfdUni, dblSum_1100)
        End If
    End If

    Call fncUpdateSumKti(strAfdUni, intYear_)

    ' Opdater konto 1040 hvis det er fra Prisberegning
    If TempVars("IB_isFromPrisberegning").value = True _
       And TempVars("IB_BeregnType").value = 2 Then

        Dim dbl2990 As Double
        Dim dbl1040Existing As Double
        Dim dblOmkostninger As Double

        dblOG = Nz(TempVars("IB_OGrad").value, 0)   ' fx 0,10

        ' Omkostninger (positivt tal)
        dbl2990 = Nz(ADOLookup("BudgetIalt", "tblInterntBudget", _
            "Afdeling = '" & strAfdUni & "' AND Year_ = " & intYear_ & " AND Konto = '2990'"), 0)

        ' Eksisterende omsætning (kan være 0 første gang)
        dbl1040Existing = Nz(ADOLookup("BudgetIalt", "tblInterntBudget", _
            "Afdeling = '" & strAfdUni & "' AND Year_ = " & intYear_ & " AND Konto = '1040'"), 0)

        ' Samlede omkostninger
        dblOmkostninger = dbl2990
        If dbl1040Existing <> 0 Then
            dblOmkostninger = dblOmkostninger + Abs(dbl1040Existing)
        End If

        ' ?? KORREKT omsætning ud fra ønsket overskudsgrad
        ' R = C / (1 - OG)
        dblOmsFiktiv = -(dblOmkostninger / (1 - dblOG))

        dblMonthlyAmount = dblOmsFiktiv / 12

        blnSuccess = UpdateInterntBudgetLineADO( _
            strAfdUni, intYear_, "1040", _
            dblOmsFiktiv, _
            dblMonthlyAmount, dblMonthlyAmount, dblMonthlyAmount, dblMonthlyAmount, _
            dblMonthlyAmount, dblMonthlyAmount, dblMonthlyAmount, dblMonthlyAmount, _
            dblMonthlyAmount, dblMonthlyAmount, dblMonthlyAmount, dblMonthlyAmount _
        )

        If Not blnSuccess Then
            MsgBox "Konto 1040 blev ikke fundet i tblInterntBudget for afdeling " & _
                   strAfdUni & " og år " & intYear_ & ".", _
                   vbExclamation, "Konto ikke fundet"
        End If
    End If
    Call fncUpdateSumKti(strAfdUni, intYear_)

    Me.tbxOverskudsGrad = Format(Nz(ADOLookup("Overskudsgrad", "tblFB_Totaler", _
        "Afdeling = '" & Me.cboAfdelingUni.value & "' And Year_ = " & Me.cboYearIntBud.value), 0), "###.00") & "%"

    Me.lblArbejder.Visible = False
    Me.frmTmpInterntBudget.Requery
    Me.Repaint
End Sub

Private Sub btnExpToExcel_Click()
    Me.lblArbejder.Visible = True
    Call ExportInterntBudgetToExcel(Me.cboAfdelingUni.value, Me.cboYearIntBud.value, 0)
    Me.lblArbejder.Visible = False
    MsgBox "Filen: " & Me.cboAfdelingUni.value & " ligger klar! "
End Sub

Private Sub cboAfdelingUni_AfterUpdate()
    TempVars.Remove "IB_currentID"
    TempVars.Remove "IB_isFromPrisberegning"
    TempVars.Remove "IB_currentAfdeling"
    TempVars.Remove "IB_currentPrisberegningNavn"
    TempVars.Remove "IB_currentPrisberegningAfd"
    TempVars.Remove "IB_currentYear"
    TempVars.Remove "isFromPrisberegning"
    TempVars.Remove "IB_BeregnType"
    TempVars.Remove "IB_OGrad"

    Me.tbxOverskudsGrad = 0
    Me.txtBoxFBSamlet = 0
    Me.txtBoxFBpct = 0

    Call ApplyFilter(True)
End Sub

Private Sub cboYearIntBud_AfterUpdate()
    TempVars.Remove "IB_currentID"
    TempVars.Remove "IB_isFromPrisberegning"
    TempVars.Remove "IB_currentAfdeling"
    TempVars.Remove "IB_currentPrisberegningNavn"
    TempVars.Remove "IB_currentPrisberegningAfd"
    TempVars.Remove "IB_currentYear"
    TempVars.Remove "IB_BeregnType"
    TempVars.Remove "IB_OGrad"

    Me.tbxOverskudsGrad = 0
    Me.txtBoxFBSamlet = 0
    Me.txtBoxFBpct = 0

    Call ApplyFilter(True)
End Sub

Private Sub Form_Load()
    Dim arrArgs() As String
    Dim lngPrisberegningID As Long
    Dim intYear As Integer
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim strUser As String
    Dim intPrisberegningType As Integer

    strUser = Environ$("USERNAME")
    TempVars("IB_isFromPrisberegning") = False
    IB_isFromPrisberegning = False

    If Not IsNull(Me.OpenArgs) Then
        arrArgs = Split(Me.OpenArgs, "|")
        If UBound(arrArgs) >= 1 Then
            If IsNumeric(arrArgs(0)) Then
                lngPrisberegningID = CLng(arrArgs(0))
                intYear = CInt(arrArgs(1))
                intPrisberegningType = CInt(arrArgs(2))

                strSQL = "SELECT * FROM tblPrisberegning WHERE ID = " & lngPrisberegningID
                Set rs = CurrentDb.OpenRecordset(strSQL, dbOpenSnapshot)

                If Not rs.EOF Then
                    TempVars("IB_currentID") = lngPrisberegningID
                    TempVars("IB_currentYear") = intYear
                    TempVars("IB_isFromPrisberegning") = True
                    TempVars("IB_currentPrisberegningNavn") = Nz(rs!PrisberegningNavn, "")
                    TempVars("IB_currentYearGrund") = Nz(rs!Year_, 0)
                    TempVars("IB_antalPladser") = Nz(rs!AntalPladser, 1)
                    TempVars("IB_KM") = Nz(rs!KM, 0)
                    TempVars("IB_OGrad") = Nz(rs!OGrad, 0)
                    TempVars("IB_BeregnType") = Nz(intPrisberegningType, 0)
                    IB_isFromPrisberegning = True
                Else
                    TempVars("IB_isFromPrisberegning") = False
                    IB_isFromPrisberegning = False
                End If
                rs.Close
            Else
                IB_isFromPrisberegning = False
                TempVars("IB_isFromPrisberegning") = False
            End If
            Set rs = Nothing
        End If
    End If

    If IB_isFromPrisberegning = True Then
        Me.RecordSource = "tblPrisberegning"
        Me.cboAfdelingUni.RowSource = "SELECT PrisberegningNavn FROM tblPrisberegning WHERE BudgetAar = " & intYear & " ORDER BY PrisberegningNavn;"
        Me.cboAfdelingUni.BoundColumn = 1
        Me.cboAfdelingUni.ColumnCount = 1
        Me.cboAfdelingUni.ColumnWidths = 5
        Me.cboAfdelingUni.value = TempVars("IB_currentPrisberegningNavn")
        Me.cboYearIntBud = TempVars("IB_currentYear")

        Me.txtPBAntalPladser.Visible = True
        Me.txtPBAntalPladser.value = CStr(TempVars("IB_antalPladser").value)
        Me.lblPBAntalPladser.Visible = True
        Me.txtPBTimePrisMO.Visible = True
        Me.txtPBTimePrisUO.Visible = True
        Me.lblTimePris.Visible = True
        Me.txtPBDøgnTakstMO.Visible = True
        Me.txtPBDøgnTakstUO.Visible = True
        Me.lblDagPris.Visible = True
        Me.txtPBMdrTakstMO.Visible = True
        Me.txtPBMdrTakstUO.Visible = True
        Me.lblMdrPris.Visible = True
        Me.lblMoverskud.Visible = True
        Me.lblUoverskud.Visible = True
        Me.btnCreateLines.Visible = False
    Else
        AssignValuesToFormObjects Me, strUser, Me.Name

        If IsNull(Me.cboYearIntBud) = True Then
            Me.cboYearIntBud = Year(Date)
            intYear = Year(Date)
        Else
            intYear = Me.cboYearIntBud
        End If

        Me.cboAfdelingUni.RowSource = "SELECT [AfdNr Uniconta], AfdelingsNavn FROM tblAfdeling WHERE Year_ = " & intYear & " ORDER BY [AfdNr Uniconta]; "
        Me.cboAfdelingUni.BoundColumn = 1
        Me.cboAfdelingUni.ColumnCount = 2
    End If

    Call ApplyFilter(True)
    Me.tglSumOnOff.value = True
    tglSumOnOff.Caption = "ALLE linjer"
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim usr As String
    Dim params As New Scripting.Dictionary

    usr = Environ$("USERNAME")

    If Nz(Me.cboAfdelingUni.value, "") <> "" And Nz(Me.cboYearIntBud, "") <> "" And Nz(TempVars("IB_isFromPrisberegning"), False) = False Then
        On Error Resume Next
        params.Add "cboAfdelingUni", Nz(Me.cboAfdelingUni, "")
        params.Add "cboYearIntBud", Nz(Me.cboYearIntBud, "")
        On Error GoTo 0
        SaveFormParameters usr, Me.Name, "", "", params
    End If

    TempVars.Remove "IB_currentID"
    TempVars.Remove "IB_isFromPrisberegning"
    TempVars.Remove "IB_currentPrisberegningNavn"
    TempVars.Remove "IB_currentYear"
    TempVars.Remove "isFromPrisberegning"
    TempVars.Remove "IB_currentYearGrund"
    TempVars.Remove "IB_antalPladser"
    TempVars.Remove "IB_KM"
    TempVars.Remove "IB_OGrad"
    TempVars.Remove "IB_BeregnType"
End Sub

Private Sub tbxOverskudsGrad_GotFocus()
    Me.Requery
End Sub

Private Sub tglSumOnOff_Click()
    If tglSumOnOff.value = True Then
        Call ApplyFilter(True)
        tglSumOnOff.Caption = "ALLE linjer"
    Else
        Call ApplyFilter(False)
        tglSumOnOff.Caption = "Linjer m beløb"
    End If
End Sub

'=============================================================================
' CORE BUSINESS LOGIC
'=============================================================================

Function CreateInterntBudgetRecords(ByVal intYear As Integer, ByVal strSrcAfd As String) As Integer
    On Error GoTo ErrHandler

    Dim intMths As Integer
    Dim strAfd As String
    Dim dblPct As Double
    Dim dblPct_EjAfskr As Double
    Dim maxMonth As Integer
    Dim svar As String
    Dim cn As Object
    Dim cmd As Object
    Dim rsKontoPlan As DAO.Recordset
    Dim strKonto As String
    Dim dblEstimatForrigeAr As Double
    Dim dblBudgetSidsteAar As Double
    Dim dblEstimatFremskrevet As Double
    Dim dblAmount As Double
    Dim intMonth As Integer

    maxMonth = Nz(GetMaxMonthFromGLTransSumByYear(intYear - 1), 0)
    If maxMonth = 0 Then
        MsgBox "Der er ingen finansposter fra i år." & vbCrLf & "Kør Fællesbidrag Real, for at hente dem ind i modulet"
        CreateInterntBudgetRecords = 0
        Exit Function
    End If

    intMths = Nz(ELookup("Beløb", "tblParm_BeløbUdenKonti", "Konto = 'Finans_Antal_Mdr' And BudgetYear = " & intYear), 0)
    If intMths = 0 Then
        MsgBox "Der mangles antal måneder under Parametre!"
        CreateInterntBudgetRecords = 0
        Exit Function
    End If

    If intMths > maxMonth Then
        svar = MsgBox("Der er kun mulighed for at hente " & maxMonth & " antal måneder i finansposterne." & vbCrLf & _
                      "Kør evt. Fællesbidrag Real, for at hente flere måneder ind i modulet" & vbCrLf & _
                      "Vil du nøjes med " & maxMonth & " måneder til at bygge estimerede finansdata med?", _
                      vbYesNo + vbQuestion, "Fortsæt oprettelse")
        If svar <> vbYes Then
            CreateInterntBudgetRecords = 0
            Exit Function
        Else
            intMths = maxMonth
        End If
    End If

    strAfd = Me.cboAfdelingUni
    If IsNull(strAfd) Then
        CreateInterntBudgetRecords = 0
        Exit Function
    End If

    dblPct = Nz(ELookup("Procent", "tblParm_Procentsatser", "Konto = 'FremskrivPct' And BudgetYear = " & intYear), 0)
    If IsNull(dblPct) Then
        CreateInterntBudgetRecords = 0
        Exit Function
    End If

    ' Start ADO connection med transaction
    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString
    cn.BeginTrans

    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = cn

    ' Loop gennem kontoplanen
    Set rsKontoPlan = CurrentDb.OpenRecordset("tblKontoPlan", dbOpenSnapshot)

    Do While Not rsKontoPlan.EOF
        strKonto = Nz(rsKontoPlan("Kontonummer"), "")
        If strKonto = "" Then GoTo NextRecord

        ' Clear parameters fra forrige iteration
        cmd.Parameters.Refresh

        ' Byg INSERT statement
        cmd.CommandText = _
            "INSERT INTO tblInterntBudget " & _
            "(Konto, KontoNavn, KontoType, Sum, Afdeling, Year_, " & _
            "EstimatForrigeÅr, RealForrigeÅr, EstimatFremskrevet, BudgetIalt, " & _
            "[_1], [_2], [_3], [_4], [_5], [_6], [_7], [_8], [_9], [_10], [_11], [_12]) " & _
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"

        ' Basis felter
        cmd.Parameters.Append cmd.CreateParameter("pKonto", 200, 1, 50, strKonto)
        cmd.Parameters.Append cmd.CreateParameter("pKontoNavn", 200, 1, 255, Nz(rsKontoPlan("KontoNavn"), ""))
        cmd.Parameters.Append cmd.CreateParameter("pKontoType", 200, 1, 50, Nz(rsKontoPlan("KontoType"), ""))
        cmd.Parameters.Append cmd.CreateParameter("pSum", 200, 1, 50, Nz(rsKontoPlan("Sum"), ""))
        cmd.Parameters.Append cmd.CreateParameter("pAfdeling", 200, 1, 50, strAfd)
        cmd.Parameters.Append cmd.CreateParameter("pYear", 3, 1, , intYear)

        ' Beregn estimater
        dblEstimatForrigeAr = 0
        dblBudgetSidsteAar = 0
        dblEstimatFremskrevet = 0

        If Nz(rsKontoPlan("KontoType"), "") <> "" And _
           Nz(rsKontoPlan("KontoType"), "") <> "Overskrift" And _
           Nz(rsKontoPlan("KontoType"), "") <> "Sum" Then

            dblEstimatForrigeAr = GetEstimatForrigeÅr(strKonto, strSrcAfd, intYear - 1)
            dblBudgetSidsteAar = Nz(ADOLookup("[BudgetIalt]", "tblInterntBudget", _
                "Konto = '" & strKonto & "' And Year_ = " & intYear - 1 & " And Afdeling = '" & strSrcAfd & "'"), 0)

            ' Afskrivninger fremskrives ikke
            If strKonto = "1820" Or strKonto = "1821" Or strKonto = "1824" Or strKonto = "1970" Then
                dblPct_EjAfskr = 0
            Else
                dblPct_EjAfskr = dblPct
            End If

            dblEstimatFremskrevet = dblBudgetSidsteAar * (1 + dblPct_EjAfskr)
        End If

        cmd.Parameters.Append cmd.CreateParameter("pEstForrige", 6, 1, , IIf(dblEstimatForrigeAr = 0, Null, dblEstimatForrigeAr))
        cmd.Parameters.Append cmd.CreateParameter("pRealForrige", 6, 1, , IIf(dblBudgetSidsteAar = 0, Null, dblBudgetSidsteAar))
        cmd.Parameters.Append cmd.CreateParameter("pEstFrem", 6, 1, , IIf(dblEstimatFremskrevet = 0, Null, dblEstimatFremskrevet))

        ' BudgetIalt
        If strKonto > "1199" And dblEstimatFremskrevet <> 0 Then
            cmd.Parameters.Append cmd.CreateParameter("pBudgetIalt", 6, 1, , dblEstimatFremskrevet)
        Else
            cmd.Parameters.Append cmd.CreateParameter("pBudgetIalt", 6, 1, , Null)
        End If

        ' Måneder
        For intMonth = 1 To 12
            If strKonto > "1199" Then
                dblAmount = Nz(ADOLookup("[_" & intMonth & "]", "tblInterntBudget", _
                    "Konto = '" & strKonto & "' And Afdeling = '" & strSrcAfd & "' And Year_ = " & intYear - 1), 0) * (1 + dblPct)
            Else
                dblAmount = 0
            End If
            cmd.Parameters.Append cmd.CreateParameter("pM" & intMonth, 6, 1, , IIf(dblAmount = 0, Null, dblAmount))
        Next intMonth

        ' Eksekver INSERT
        SysCmd acSysCmdSetStatus, "Indsætter nu konto " & strKonto & " fra afd. " & strSrcAfd & "."
        cmd.Execute

NextRecord:
        rsKontoPlan.MoveNext
    Loop

    ' Commit transaction
    cn.CommitTrans

    rsKontoPlan.Close
    cn.Close
    Set rsKontoPlan = Nothing
    Set cmd = Nothing
    Set cn = Nothing

    SysCmd acSysCmdSetStatus, "Poster er indsat"
    CreateInterntBudgetRecords = 1
    Exit Function

ErrHandler:
    If Not cn Is Nothing Then
        cn.RollbackTrans
        cn.Close
    End If
    If Not rsKontoPlan Is Nothing Then rsKontoPlan.Close
    MsgBox "Fejl ved oprettelse: " & Err.Description, vbExclamation
    CreateInterntBudgetRecords = 0
End Function

Private Sub TransferToInterntBudget(strSumTable As String, intFortegn As Integer)
    On Error GoTo ErrorHandler

    Dim conn As Object
    Dim rsKtoSum As Object
    Dim cmd As Object
    Dim intYear As Integer
    Dim strDepartment As String
    Dim str As String
    Dim i As Integer

    intYear = Me.cboYearIntBud.value
    strDepartment = Me.cboAfdelingUni.value

    intUdregnLøn = 0
    dblSum_1100 = 0

    Set conn = CreateObject("ADODB.Connection")
    conn.Open fncConnString

    If strSumTable = "tblTmpMedarbejder" Then
        intFortegn = 1
        str = "SELECT FinansKonto, " & _
              "[_1], [_2], [_3], [_4], [_5], [_6], [_7], [_8], [_9], [_10], [_11], [_12], " & _
              "[_1] + [_2] + [_3] + [_4] + [_5] + [_6] + [_7] + [_8] + [_9] + [_10] + [_11] + [_12] AS MthSum " & _
              "FROM (SELECT p.FinansKonto, " & _
              "Sum(IIf(1 >= Month(d.[DatoFra]) And 1 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_1], " & _
              "Sum(IIf(2 >= Month(d.[DatoFra]) And 2 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_2], " & _
              "Sum(IIf(3 >= Month(d.[DatoFra]) And 3 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_3], " & _
              "Sum(IIf(4 >= Month(d.[DatoFra]) And 4 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_4], " & _
              "Sum(IIf(5 >= Month(d.[DatoFra]) And 5 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_5], " & _
              "Sum(IIf(6 >= Month(d.[DatoFra]) And 6 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_6], " & _
              "Sum(IIf(7 >= Month(d.[DatoFra]) And 7 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_7], " & _
              "Sum(IIf(8 >= Month(d.[DatoFra]) And 8 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_8], " & _
              "Sum(IIf(9 >= Month(d.[DatoFra]) And 9 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_9], " & _
              "Sum(IIf(10 >= Month(d.[DatoFra]) And 10 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_10], " & _
              "Sum(IIf(11 >= Month(d.[DatoFra]) And 11 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_11], " & _
              "Sum(IIf(12 >= Month(d.[DatoFra]) And 12 <= Month(d.[DatoTil]), d.[BeløbBudget], 0)) AS [_12] " & _
              "FROM (tblTmpMedarbejder AS d LEFT JOIN tblParm_LønartKonto AS p ON d.Lønart = p.Lønart) " & _
              "WHERE d.Year_ = " & intYear & " And d.Afdeling = '" & strDepartment & "' " & _
              "GROUP BY p.FinansKonto) AS subquery;"

    ElseIf strSumTable = "tblTmpDebtor" Then
        intFortegn = -1
        str = "SELECT FinansKonto, " & _
              "[_1], [_2], [_3], [_4], [_5], [_6], [_7], [_8], [_9], [_10], [_11], [_12], " & _
              "[_1] + [_2] + [_3] + [_4] + [_5] + [_6] + [_7] + [_8] + [_9] + [_10] + [_11] + [_12] AS MthSum " & _
              "FROM (SELECT p.FinansKonto, " & _
              "Sum(IIf(1 >= Month(d.[DatoFra]) And 1 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_1], " & _
              "Sum(IIf(2 >= Month(d.[DatoFra]) And 2 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_2], " & _
              "Sum(IIf(3 >= Month(d.[DatoFra]) And 3 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_3], " & _
              "Sum(IIf(4 >= Month(d.[DatoFra]) And 4 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_4], " & _
              "Sum(IIf(5 >= Month(d.[DatoFra]) And 5 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_5], " & _
              "Sum(IIf(6 >= Month(d.[DatoFra]) And 6 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_6], " & _
              "Sum(IIf(7 >= Month(d.[DatoFra]) And 7 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_7], " & _
              "Sum(IIf(8 >= Month(d.[DatoFra]) And 8 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_8], " & _
              "Sum(IIf(9 >= Month(d.[DatoFra]) And 9 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_9], " & _
              "Sum(IIf(10 >= Month(d.[DatoFra]) And 10 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_10], " & _
              "Sum(IIf(11 >= Month(d.[DatoFra]) And 11 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_11], " & _
              "Sum(IIf(12 >= Month(d.[DatoFra]) And 12 <= Month(d.[DatoTil]), d.[TotalTakstMdr], 0)) AS [_12] " & _
              "FROM tblTmpDebtor AS d " & _
              "LEFT JOIN tblParm_ParagrafKonto AS p ON d.Paragraf = p.Paragraf " & _
              "WHERE d.Afdeling = '" & strDepartment & "' AND d.Year_ = " & intYear & " " & _
              "GROUP BY p.FinansKonto) AS subquery;"
    End If

    Set rsKtoSum = CreateObject("ADODB.Recordset")
    rsKtoSum.Open str, conn, 1, 3

    If Not rsKtoSum.EOF Then
        intUdregnLøn = 0
        dblSum_1100 = 0

        Do While Not rsKtoSum.EOF
            Set cmd = CreateObject("ADODB.Command")
            cmd.ActiveConnection = conn

            cmd.CommandText = "UPDATE tblInterntBudget SET " & _
                    "EstimatFremskrevet = ?, " & _
                    "BudgetIalt = ?, " & _
                    "[_1] = ?, [_2] = ?, [_3] = ?, [_4] = ?, [_5] = ?, [_6] = ?, [_7] = ?, [_8] = ?, [_9] = ?, [_10] = ?, [_11] = ?, [_12] = ? " & _
                    "WHERE Year_ = ? AND Konto = ? AND Afdeling = ?"

            ' Brug adCurrency (type 6) i stedet for adDouble
            cmd.Parameters.Append cmd.CreateParameter("EstimatFremskrevet", 6, 1, , Nz(rsKtoSum.Fields("MthSum").value * intFortegn, 0))
            cmd.Parameters.Append cmd.CreateParameter("BudgetIalt", 6, 1, , Nz(rsKtoSum.Fields("MthSum").value * intFortegn, 0))

            If Nz(rsKtoSum.Fields("MthSum").value, 0) <> 0 Then
                intUdregnLøn = 1
                dblSum_1100 = Nz(rsKtoSum.Fields("MthSum").value, 0)
            End If

            For i = 1 To 12
                Dim fieldValue As Variant
                fieldValue = Nz(rsKtoSum.Fields("_" & i).value * intFortegn, 0)
                cmd.Parameters.Append cmd.CreateParameter("Mth_" & i, 6, 1, , fieldValue)
            Next i

            cmd.Parameters.Append cmd.CreateParameter("pYear", 3, 1, , intYear)
            cmd.Parameters.Append cmd.CreateParameter("pKonto", 200, 1, 255, rsKtoSum!FinansKonto)
            cmd.Parameters.Append cmd.CreateParameter("pAfdeling", 200, 1, 255, strDepartment)

            On Error Resume Next
            cmd.Execute
            If Err.Number <> 0 Then Err.Clear
            On Error GoTo 0

            rsKtoSum.MoveNext
        Loop
    End If

    rsKtoSum.Close
    conn.Close
    Set rsKtoSum = Nothing
    Set cmd = Nothing
    Set conn = Nothing
    Exit Sub

ErrorHandler:
    If Not conn Is Nothing Then conn.Close
    MsgBox "Fejl i TransferToInterntBudget: " & Err.Description, vbExclamation
End Sub

Private Sub NulstilIndt(strAfdUni As String, intYear As Integer)
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim str As String

    Set dB = CurrentDb
    str = "SELECT DISTINCT(FinansKonto) FROM tblParm_ParagrafKonto "
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    With rs
        If Not .EOF Then
            Do Until .EOF
                Call fncNulstilKti(strAfdUni, intYear, !FinansKonto)
                .MoveNext
            Loop
        End If
    End With

    rs.Close
    Set rs = Nothing
    Set dB = Nothing
End Sub

Function UpdateIntBudFormHeader(fieldName As String, fieldValue As Variant) As Boolean
    On Error GoTo ErrHandler

    Dim cn As Object
    Dim cmd As Object
    Dim lngRecordsAffected As Long
    Dim intYear_ As Integer
    Dim strAfd As String

    intYear_ = Me.cboYearIntBud.value
    strAfd = Me.cboAfdelingUni.value

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = cn

    ' Prøv først UPDATE
    cmd.CommandText = _
        "UPDATE tblInterntBudgetKtoDato SET " & fieldName & " = ? " & _
        "WHERE Year_ = ? AND Afdeling = ?"

    cmd.Parameters.Append cmd.CreateParameter("pValue", 200, 1, 50, fieldValue)
    cmd.Parameters.Append cmd.CreateParameter("pYear", 3, 1, , intYear_)
    cmd.Parameters.Append cmd.CreateParameter("pAfd", 200, 1, 50, strAfd)

    cmd.Execute lngRecordsAffected

    ' Hvis ingen rækker blev opdateret, INSERT
    If lngRecordsAffected = 0 Then
        cmd.Parameters.Refresh
        cmd.CommandText = _
            "INSERT INTO tblInterntBudgetKtoDato (Year_, Afdeling, " & fieldName & ") " & _
            "VALUES (?, ?, ?)"

        cmd.Parameters.Append cmd.CreateParameter("pYear", 3, 1, , intYear_)
        cmd.Parameters.Append cmd.CreateParameter("pAfd", 200, 1, 50, strAfd)
        cmd.Parameters.Append cmd.CreateParameter("pValue", 200, 1, 50, fieldValue)

        cmd.Execute
    End If

    cn.Close
    Set cmd = Nothing
    Set cn = Nothing

    UpdateIntBudFormHeader = True
    Exit Function

ErrHandler:
    If Not cn Is Nothing Then cn.Close
    UpdateIntBudFormHeader = False
End Function

Function fncUpdateFB(strAfd As String, intYear As Integer)
    Dim cn As Object
    Dim rs As Object
    Dim strSQL As String

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    strSQL = "SELECT * FROM tblFB_Totaler " & _
             "WHERE Afdeling = '" & strAfd & "' And Year_ = " & intYear

    Set rs = CreateObject("ADODB.Recordset")
    rs.Open strSQL, cn, 1, 1

    If Not rs.EOF Then
        Me.txtBoxFBSamlet = rs!FB_SamletBidrag
        Me.txtBoxFBpct = rs!FB_PctAfOms
        Me.tbxOverskudsGrad = Format(rs!OverskudsGrad, "###.00") & "%"
    End If

    rs.Close
    cn.Close
    Set rs = Nothing
    Set cn = Nothing
End Function

Private Sub ApplyFilter(Optional blnShowOnlyWithAmounts As Boolean = True)
    Dim intYear_ As Integer
    Dim strFilter As String

    If IsNull(Me.cboYearIntBud.value) Or IsNull(Me.cboAfdelingUni.value) Then
        Me.frmTmpInterntBudget.Form.filter = "[Year_] = 0"
        Me.frmTmpInterntBudget.Form.FilterOn = True
        Exit Sub
    End If

    ' Byg base filter
    If TempVars("IB_isFromPrisberegning") = True Then
        strFilter = "[Year_] = " & TempVars("IB_currentYear") & _
                    " AND Afdeling = '" & TempVars("IB_currentPrisberegningNavn") & "'"
    Else
        intYear_ = Me.cboYearIntBud.value
        strFilter = "[Year_] = " & intYear_ & _
                    " AND [Afdeling] = '" & Me.cboAfdelingUni.value & "'"
    End If

    ' Tilføj beløbsfilter hvis ønsket
    If blnShowOnlyWithAmounts Then
        strFilter = strFilter & _
            " AND ([BudgetIalt] <> 0 OR [KontoType] = 'Overskrift' OR " & _
            "[EstimatFremskrevet] <> 0 OR [EstimatForrigeÅr] <> 0)"
    End If

    With Me.frmTmpInterntBudget.Form
        .filter = strFilter
        .FilterOn = True
        .OrderBy = "Konto"
        .OrderByOn = True
    End With

    Call FindFormHeaderInfo
End Sub

Private Sub FindFormHeaderInfo()
    Dim cn As Object
    Dim rs As Object
    Dim strSQL As String
    Dim intYear_ As Integer
    Dim strAfd As String

    With Me
        .lblUpdDte01.Caption = ""
        .lblUpdDte02.Caption = ""
        .lblUpdDte03.Caption = ""
    End With

    intYear_ = Me.cboYearIntBud.value
    strAfd = Me.cboAfdelingUni

    strSQL = "SELECT * FROM tblInterntBudgetKtoDato " & _
            "WHERE Year_ = " & intYear_ & " " & _
            "AND Afdeling = '" & strAfd & "'"

    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString

    Set rs = CreateObject("ADODB.Recordset")
    rs.Open strSQL, cn, 1, 1

    If Not rs.EOF Then
        With Me
            .lblUpdDte01.Caption = Nz(rs!DteOpr, "")
            .lblUpdDte02.Caption = Nz(rs!DteIndt, "")
            .lblUpdDte03.Caption = Nz(rs!DteLøn, "")
        End With
    End If

    rs.Close
    cn.Close
    Set rs = Nothing
    Set cn = Nothing

    Call fncUpdateFB(strAfd, intYear_)
End Sub

'=============================================================================
' UTILITY FUNCTIONS
'=============================================================================

Private Function GetMaxMonthFromGLTransSumByYear(intYear As Integer) As Integer
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim strSQL As String

    Set dB = CurrentDb
    strSQL = "SELECT Max(Month([Date])) AS MaxMonth " & _
             "FROM tblTmpGLTransSum " & _
             "WHERE Year([Date]) = " & intYear

    Set rs = dB.OpenRecordset(strSQL, dbOpenSnapshot)

    If Not rs.EOF Then
        GetMaxMonthFromGLTransSumByYear = Nz(rs!maxMonth, 0)
    Else
        GetMaxMonthFromGLTransSumByYear = 0
    End If

    rs.Close
    Set rs = Nothing
    Set dB = Nothing
End Function

Public Function GetEstimatForrigeÅr(strKonto As String, strAfd As String, intYear As Integer) As Double
    On Error GoTo ErrorHandler

    Dim cn As Object
    Dim rs As Object
    Dim strSQL As String
    Dim dtMaxDate As Date
    Dim intMaxMonth As Integer
    Dim dblSum As Double
    Dim intMths As Integer

    intMaxMonth = GetMaxMonthFromGLTransSumByYear(intYear)
    If intMaxMonth = 0 Then
        GetEstimatForrigeÅr = 0
        Exit Function
    End If

    dtMaxDate = DateSerial(intYear, intMaxMonth, 1)
    intMths = intMaxMonth

    Dim dimension1Part As String
    Dim dimension4Part As String
    Dim dimensionWhereClause As String

    If InStr(1, strAfd, "_") > 0 Then
        dimension1Part = Split(strAfd, "_")(0)
        dimension4Part = Split(strAfd, "_")(1)
        dimensionWhereClause = "AND Dimension1 = '" & dimension1Part & "' " & _
                    "AND Dimension4 = '" & dimension4Part & "' "
    Else
        dimension1Part = strAfd
        dimensionWhereClause = "AND Dimension1 = '" & dimension1Part & "' " & _
                    "AND (Dimension4 IS NULL OR Dimension4 = '')"
    End If

    strSQL = "SELECT SUM(TRY_CAST(Amount AS decimal(18,2))) AS SumBelob " & _
             "FROM dbo.tblTmpGLTransSum " & _
             "WHERE Account = '" & strKonto & "' " & _
             dimensionWhereClause & _
             "AND [Date] <= '" & Format(dtMaxDate, "yyyy-MM-dd") & "' " & _
             "AND YEAR([Date]) = " & intYear

    Set cn = CreateObject("ADODB.Connection")
    cn.ConnectionString = fncConnString
    cn.Open

    Set rs = CreateObject("ADODB.Recordset")
    rs.Open strSQL, cn, 1, 1

    If Not rs.EOF Then
        dblSum = Nz(rs!Sumbelob, 0)
        GetEstimatForrigeÅr = Round((dblSum / intMths) * 12, 2)
    Else
        GetEstimatForrigeÅr = 0
    End If

    rs.Close
    cn.Close
    Set rs = Nothing
    Set cn = Nothing
    Exit Function

ErrorHandler:
    Debug.Print "Fejl i GetEstimatForrigeÅr (ADO): " & Err.Description
    GetEstimatForrigeÅr = 0
End Function

Function FormatForSQL(ByVal num As Variant) As String
    If IsNull(num) Then
        FormatForSQL = "0"
    Else
        FormatForSQL = Replace(Trim(str(num)), ",", ".")
    End If
End Function

Public Function GetSourceDepartment(defAfd As String, intYear As Integer) As String
    Dim sArgs As String

    sArgs = defAfd & "|" & CStr(intYear)
    DoCmd.OpenForm "frmVælgKildeAfdeling", , , , , acDialog, sArgs
    GetSourceDepartment = Nz(TempVars("SrcAfd"), "")
    TempVars.Remove "SrcAfd"
End Function
