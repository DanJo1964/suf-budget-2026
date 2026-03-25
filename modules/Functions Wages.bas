Attribute VB_Name = "Functions Wages"
Option Compare Database
Option Explicit
Dim intCntFunkt As Integer
Dim dblPctUdskift As Double
Dim strAfd As String
Dim intYear As Integer
Dim strAfdUni As String
Dim dblGager As Double
Dim dblBeløb As Double
Dim dblTotalBeløb As Double
Dim dblPctReduktFerieGr As Double
Dim intTotalAnsatMdr As Integer

Function fncWages(strAfd_ As String, intYear_ As Integer, strAfdUni_ As String, dblGager_ As Double)
    strAfd = strAfdUni_
    intYear = intYear_
    strAfdUni = strAfdUni_
    dblGager = dblGager_

    'E12 + E15
    intCntFunkt = DCount("Fornavn", "tblTmpMedarbejder", "Afdeling = '" & strAfd & "' AND Year_ = " & intYear & " AND Lønart = '1000'")
    'Satser!E64
    dblPctUdskift = ELookup("Procent", "tblParm_ProcentSatser", "BudgetYear = " & intYear & " AND Konto = 'MedUdskPct'")
    'Satser!C4
    dblPctReduktFerieGr = ELookup("Procent", "tblParm_ProcentSatser", "BudgetYear = " & intYear & " AND Konto = 'RedukFPgrundlag'")


    fnc1120
    fnc1121
    fnc1124
    fnc1125
    'KM penge fra Prisberegning:
    If TempVars("IB_isFromPrisberegning").value = True Then fnc1135
    fnc1145
    'fnc1150 kaldes fra fnc1145 da beløbet derfra skal bruges i 1150
    'Konto 1155 opdateres i fnc1150
    fnc1160
    fnc1168
    fnc1169
    'fnc1118 og fnc1119 SKAL kaldes EFTER fnc1145, da det er her det samlede antal arbejdsmåneder bliver udregnet i
    '  variablen intTotalAnsatMdr
    fnc1118
    fnc1119
    fncTøjpenge
    fncBededagsTill
    fncMedarbVikarBudget

    Call fncFBkti(strAfdUni, intYear, "", 0, "12")



End Function
Function fnc1118()

    dblBeløb = fncLookupKtoBeløb(intYear, "1118")
    dblTotalBeløb = intTotalAnsatMdr * dblBeløb

    Call fncUpdIntBud(strAfdUni, intYear, "1118", -dblTotalBeløb, "12")

End Function
Function fnc1119()

    dblBeløb = fncLookupKtoBeløb(intYear, "1119")
    dblTotalBeløb = intTotalAnsatMdr * dblBeløb

    Call fncUpdIntBud(strAfdUni, intYear, "1119", -dblTotalBeløb, "12")

End Function
Function fnc1120()
Dim dblPctFeriepenge As Double

    'dblPctReduktFerieGr

    dblPctFeriepenge = fncLookupKtoPct(intYear, "1120")
    dblTotalBeløb = ((dblGager * dblPctReduktFerieGr) * dblPctUdskift) * dblPctFeriepenge


    Call fncUpdIntBud(strAfdUni, intYear, "1120", dblTotalBeløb, "1100")

End Function
Function fnc1121()
Dim dblPctFerieTillæg As Double

    dblPctFerieTillæg = fncLookupKtoPct(intYear, "1121")
    dblTotalBeløb = dblGager * dblPctReduktFerieGr * dblPctFerieTillæg


    Call fncUpdIntBud(strAfdUni, intYear, "1121", dblTotalBeløb, "1100")
End Function
Function fnc1124()
Dim dblPctFerieForplFunkt As Double

    dblPctFerieForplFunkt = fncLookupKtoPct(intYear, "1124")
    dblTotalBeløb = dblGager * dblPctReduktFerieGr * dblPctUdskift * dblPctFerieForplFunkt

        ''Debug.Print dblGager, * dblPctReduktFerieGr * dblPctUdskift * dblPctFerieForplFunkt

    Call fncUpdIntBud(strAfdUni, intYear, "1124", dblTotalBeløb, "1100")

End Function
Function fnc1125()
Dim dblPctPensionAfr As Double

    dblPctPensionAfr = fncLookupKtoPct(intYear, "1125")

    dblTotalBeløb = dblGager * dblPctPensionAfr

    Call fncUpdIntBud(strAfdUni, intYear, "1125", dblTotalBeløb, "1100")

End Function
Function fnc1135()
Dim dblKMSats As Double

    dblKMSats = fncLookupKtoBeløb(TempVars("IB_currentYearGrund"), "1135") ' Nz(ELookup("Beløb", "tblParm_BeløbPctMedKonti", "Konto = '1135' AND BudgetYear = " & TempVars("IB_currentYearGrund")), 0)

    dblTotalBeløb = Nz(TempVars("IB_KM"), 0) * dblKMSats

    Call fncUpdIntBud(strAfdUni, intYear, "1135", dblTotalBeløb, "1100")

End Function
Function fnc1145()
    'On Error GoTo ErrorHandler ' Error handling

    Dim dB As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim rsT As DAO.Recordset
    Dim dblNormtid As Double
    Dim intNormTid As Integer
    Dim dblATPbeløb(1 To 4) As Double
    Dim intAnsatMdr As Integer

    dblATPbeløb(1) = fncLookupKtoBeløb(intYear, "1145-000-038")
    dblATPbeløb(2) = fncLookupKtoBeløb(intYear, "1145-039-077")
    dblATPbeløb(3) = fncLookupKtoBeløb(intYear, "1145-078-117")
    dblATPbeløb(4) = fncLookupKtoBeløb(intYear, "1145-118-999")

    dblBeløb = 0
    intAnsatMdr = 0
    intTotalAnsatMdr = 0

    Set dB = CurrentDb

    ' Parameterized query to prevent SQL injection
    Set qdf = dB.CreateQueryDef("", _
        "PARAMETERS pDepartment Text (255), pYear Short; " & _
        "SELECT Fornavn, Normtid, Lønart, " & _
        "    IIf(Year([DatoFra]) < [Year_] And ([DatoTil] Is Null Or Year([DatoTil]) > [Year_]),12, " & _
        "    IIf(Year([DatoFra]) < [Year_] And ([DatoTil] Is Null Or Year([DatoTil]) = [Year_]),Month([DatoTil]), " & _
        "    IIf(Year([DatoFra]) = [Year_] And ([DatoTil] Is Null Or Year([DatoTil]) > [Year_]),12 - (Month([DatoFra]+1)), " & _
        "    IIf(Year([DatoFra]) = [Year_] And Year([DatoTil]) = [Year_],(Month([DatoTil]) - (Month([DatoFra]))+1),0)))) AS AnsatMdr " & _
        "FROM tblTmpMedarbejder " & _
        "WHERE Afdeling = [pDepartment] AND Year_ = [pYear] AND (Lønart = '1000' OR Lønart = '1101' OR Lønart = '9900')")

    qdf!pDepartment = strAfd
    qdf!pYear = intYear

    Set rsT = qdf.OpenRecordset(dbOpenDynaset)

    If rsT.RecordCount > 0 Then

        Do While Not rsT.EOF

                dblNormtid = rsT!Normtid
                intNormTid = CInt(dblNormtid)
                intAnsatMdr = rsT!AnsatMdr
                intTotalAnsatMdr = intTotalAnsatMdr + rsT!AnsatMdr

                ''Debug.Print rst!Fornavn, rst!Normtid, intTotalAnsatMdr, rst!AnsatMdr

                Select Case intNormTid

                    Case 117 To 999
                        dblBeløb = dblBeløb + (dblATPbeløb(4) * intAnsatMdr)
                    Case 77 To 118
                        dblBeløb = dblBeløb + (dblATPbeløb(3) * intAnsatMdr)
                    Case 38 To 78
                        dblBeløb = dblBeløb + (dblATPbeløb(2) * intAnsatMdr)
                    Case 0 To 39
                        dblBeløb = dblBeløb + (dblATPbeløb(1) * intAnsatMdr)
                End Select

            rsT.MoveNext
        Loop
    End If

    rsT.Close
    Set rsT = Nothing
    Set qdf = Nothing
    Set dB = Nothing

    Call fncUpdIntBud(strAfdUni, intYear, "1145", dblBeløb, "1100")
    Call fnc1150(dblBeløb, dblATPbeløb(4))

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub

End Function
Function fnc1150(dblTotalBeløbATP As Double, dblBeløbATP As Double)
    On Error GoTo ErrorHandler ' Error handling

    Dim dB As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim rsT As DAO.Recordset
    Dim dblSumATP As Double

    dblSumATP = dblTotalBeløbATP

    Set dB = CurrentDb

    ' Parameterized query to prevent SQL injection
    Set qdf = dB.CreateQueryDef("", _
        "PARAMETERS pYear Short, pKonto Text (255); " & _
        "SELECT Sum(Beløb) AS Amount, Konto, BudgetYear " & _
        "FROM tblParm_BeløbPctMedKonti " & _
        "GROUP BY Konto, BudgetYear " & _
        "HAVING BudgetYear = [pYear] AND Konto = [pKonto]")

    qdf!pYear = intYear
    qdf!pKonto = "1150"

    dblBeløb = 0
    dblTotalBeløb = 0

    Set rsT = qdf.OpenRecordset(dbOpenDynaset)

    If rsT.RecordCount > 0 Then

        Do While Not rsT.EOF
            dblBeløb = dblBeløb + rsT!amount
            rsT.MoveNext
        Loop
    End If

    rsT.Close
    Set rsT = Nothing
    Set qdf = Nothing
    Set dB = Nothing


    dblTotalBeløb = (dblSumATP / dblBeløbATP) * dblBeløb

    Call fncUpdIntBud(strAfdUni, intYear, "1150", dblTotalBeløb, "1100")

    'Her finder jeg beløb til konto 1155 da dblSumATP og dblBeløbATP er de samme
    dblTotalBeløb = 0
    dblBeløb = 0

    dblBeløb = fncLookupKtoBeløb(intYear, "1155")

    dblTotalBeløb = (dblSumATP / dblBeløbATP) * dblBeløb

    Call fncUpdIntBud(strAfdUni, intYear, "1155", dblTotalBeløb, "1100")

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub


End Function
Function fnc1160()
    dblTotalBeløb = 0
    dblBeløb = 0

    dblBeløb = fncLookupKtoBeløb(intYear, "1160")

    'intTotalAnsatMdr kommer fra fnc1145
    dblTotalBeløb = intTotalAnsatMdr * dblBeløb

    Call fncUpdIntBud(strAfdUni, intYear, "1160", dblTotalBeløb, "1100")
End Function
Function fnc1168()
    dblTotalBeløb = 0
    dblBeløb = 0

    dblBeløb = fncLookupKtoBeløb(intYear, "1168")

    'intTotalAnsatMdr kommer fra fnc1145
    dblTotalBeløb = intTotalAnsatMdr * dblBeløb

    ''Debug.Print intTotalAnsatMdr, dblBeløb

    Call fncUpdIntBud(strAfdUni, intYear, "1168", dblTotalBeløb, "12")
End Function
Function fnc1169()
    dblTotalBeløb = 0
    dblBeløb = 0

    dblBeløb = fncLookupKtoBeløb(intYear, "1169")

    'intTotalAnsatMdr kommer fra fnc1145
    dblTotalBeløb = intTotalAnsatMdr * dblBeløb

    Call fncUpdIntBud(strAfdUni, intYear, "1169", dblTotalBeløb, "12")
End Function
Function fncTøjpenge()
    On Error GoTo ErrorHandler ' Error handling

    Dim dB As DAO.Database
    Dim rs As Recordset
    Dim str As String
    Dim dblTøjpenge As Double
    Dim dblMaj As Double
    Dim dbl As Double
    Dim dblSum As Double
    Dim intMdr As Integer

    Set dB = CurrentDb

    dblTøjpenge = Nz(ELookup("Beløb", "tblParm_BeløbUdenKonti", "BudgetYear = " & intYear & " AND Konto = 'Tøjpenge'"), 0)

    str = "SELECT * FROM tblTmpMedarbejder " & _
          "WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear & " AND (Lønart = '1000' Or Lønart = '9900')"
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    If Not rs.EOF Then
        Do Until rs.EOF
            With rs

                ''Debug.Print !Fornavn, !Lønart, !Normtid
                dbl = 0
                If Nz(!StatusDato, 99) = 99 Then
                    MsgBox "Der er medarbejdere UDEN statusdato!"
                    GoTo ErrorHandler
                End If

                If Year(!StatusDato) = (intYear - 1) Then
                    intMdr = Nz(13 - Month(!StatusDato), 12)
                    dbl = (dblTøjpenge / 12) * intMdr
                ElseIf Year(!StatusDato) < (intYear - 1) Then
                    dbl = dblTøjpenge
                End If

                If dbl > 0 And Month(!DatoTil) > 4 Then
                    dbl = (dbl / 160.33) * !Normtid
                    dbl = (dbl / 12) * Nz(Month(!DatoTil) - (Month(!DatoFra) - 1), 12)
                    dblSum = dblSum + dbl
                End If

            End With
            rs.MoveNext
        Loop
    End If

    Set rs = Nothing

    str = "SELECT Year_, Afdeling, Konto, [_5], BudgetIalt " & _
          "FROM tblInterntBudget " & _
          "WHERE Year_ = " & intYear & " AND Afdeling = '" & strAfdUni & "' AND Konto = '1100' "
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    If Not rs.EOF Then
        Do Until rs.EOF
            With rs
                .Edit
                !BudgetIalt = !BudgetIalt + dblSum
                ![_5] = ![_5] + dblSum
                .Update
            End With
            rs.MoveNext
        Loop
    End If

rs.Close
Set rs = Nothing
dB.Close


ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub

End Function
Function fncMedarbVikarBudget()
    'On Error GoTo ErrorHandler

    Dim conn As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim strSQL As String
    Dim dblBeløb As Double
    Dim cmd As ADODB.Command
    Dim i As Integer
    Dim strKto_ExtVikar As Double
    Dim strVikarTimerPrUge As String

    strKto_ExtVikar = ELookup("FinansKonto", "tblParm_LønartKonto", "Lønart = 'ExtVikar'")


    ' Initialiser forbindelsen
    Set conn = New ADODB.Connection
    conn.ConnectionString = fncConnString
    conn.Open

    ' Hent beløbet fra tblFB_Totaler
    dblBeløb = Nz(ELookup("MedarbVikarBlbPrMd", "tblFB_Totaler", _
        "Year_ = " & intYear & " AND Afdeling = '" & strAfdUni & "'"), 0)

    strVikarTimerPrUge = Format(Nz(ELookup("MedarbVikarTimPrMd", "tblFB_Totaler", _
        "Year_ = " & intYear & " AND Afdeling = '" & strAfdUni & "'"), 0), "####")

    ' Total for hele året
    dblBeløb = dblBeløb * 12

    ' Åbn budgetposterne for Konto = '1100'
    strSQL = "SELECT * FROM tblInterntBudget " & _
             "WHERE Year_ = " & intYear & " AND Afdeling = '" & strAfdUni & "' " & _
             "AND Konto = '" & strKto_ExtVikar & "'"

    Set rs = New ADODB.Recordset
    rs.Open strSQL, conn, adOpenKeyset, adLockOptimistic

    If Not rs.EOF Then
        Do Until rs.EOF
            ' Update field by field to avoid the multi-step error
            With rs
            If dblBeløb <> 0 Then
                If IsNull(rs!Kommentarer) = True Or rs!Kommentarer = "" Then
                    rs!Kommentarer = "Budgetteret antal vikartimer: " & strVikarTimerPrUge
                ElseIf rs!Kommentarer = "Budgetteret antal vikartimer: " & strVikarTimerPrUge Then

                Else
                    rs!Kommentarer = rs!Kommentarer & " - Budgetteret antal vikartimer: " & strVikarTimerPrUge
                End If

            Else
                rs!Kommentarer = ""
            End If
            rs.Update

            !BudgetIalt = dblBeløb
            rs.Update

            For i = 1 To 12
                .Fields("_" & i) = (dblBeløb / 12)
                rs.Update
            Next i

            rs.MoveNext
            End With

        Loop

    End If

    ' Oprydning
    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Fejl i fncMedarbVikarBudget"
    Resume ExitSub
End Function
Function fncBededagsTill() 'Store Bededagstillæg
    'On Error GoTo ErrorHandler ' Error handling

    Dim conn As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim strSQL As String
    Dim dblBedPct As Double
    Dim dblSum As Double
    Dim cmd As ADODB.Command
    Dim i As Integer

    ' Initialize the ADO connection
    Set conn = New ADODB.Connection
    conn.ConnectionString = fncConnString
    conn.Open

    ' Fetch the percentage for Bededag
    dblBedPct = Nz(ELookup("Procent", "tblParm_ProcentSatser", "BudgetYear = " & intYear & " AND Konto = 'BededagsPct'"), 0)

    ' Build the SQL query
    strSQL = "SELECT * " & _
             "FROM tblInterntBudget " & _
             "WHERE Year_ = " & intYear & " AND Afdeling = '" & strAfdUni & "' AND Konto = '1100'"

    ' Initialize recordset
    Set rs = New ADODB.Recordset
    rs.Open strSQL, conn, adOpenKeyset, adLockOptimistic

    ' Calculate the total amount to add
    dblSum = dblGager * dblBedPct

    ' Update the recordset if there are results and the sum is non-zero
    If Not rs.EOF And dblSum <> 0 Then
        Do Until rs.EOF
            With rs
                ' Update the budget fields
                !BudgetIalt = !BudgetIalt + dblSum
                For i = 1 To 12
                    .Fields("_" & i) = .Fields("_" & i) + (dblSum / 12)
                Next i
                .Update
            End With
            rs.MoveNext
        Loop
    End If

    ' Clean up
    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub

End Function
Function fncFBkti(strAfdUni As String, intYear As Integer, strKonto As String, dblBeløb As Double, strKtoAs12 As String)
    'On Error GoTo ErrorHandler ' Error handling

    Dim conn As Object ' ADODB.Connection
    Dim rsInterntBudget As Object ' ADODB.Recordset
    Dim rsT As Object ' ADODB.Recordset
    Dim dblPct12(12) As Double
    Dim str As String
    Dim i As Integer
    Dim strFieldName As String
    Dim cmd As Object ' ADODB.Command

    i = 1

    ' Initialize the ADO connection
    Set conn = CreateObject("ADODB.Connection")
    conn.Open fncConnString

        For i = 1 To 12
            dblPct12(i) = 100 / 12
        Next i

'Prepare an updatable recordset directly
Set rsInterntBudget = CreateObject("ADODB.Recordset")
rsInterntBudget.Open "SELECT * FROM tblInterntBudget WHERE Afdeling = '" & strAfdUni & "' AND Year_ = " & intYear & " " & _
                     "AND Konto > '1101' AND Konto < '1105'", conn, adOpenKeyset, adLockOptimistic

With rsInterntBudget
    Do While Not .EOF
        ' Begin editing the record
        .Fields("BudgetIalt").value = .Fields("EstimatFremskrevet").value

                For i = 1 To 12
                    strFieldName = "_" & CStr(i)
                    .Fields(strFieldName).value = .Fields("EstimatFremskrevet").value * (dblPct12(i) * 0.01)
                Next i


        ' Update the record
        .Update

        ' Move to the next record
        .MoveNext
    Loop
End With

' Cleanup
rsInterntBudget.Close
Set rsInterntBudget = Nothing
conn.Close
Set conn = Nothing

End Function
