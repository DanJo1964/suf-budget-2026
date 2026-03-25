Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim isFromPrisberegning As Boolean
Dim currentID As Long
Dim currentAfdeling As String
Dim currentYear As Integer
Dim currentPrisberegningNavn As String
Dim currentPrisberegningAfd As String
Dim currentYearGrund As Integer

Private Sub btnCalcSubstituteAmount_Click()
Dim varAfdeling As String

    Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))

    If currentPrisberegningNavn <> "" Then
        varAfdeling = currentPrisberegningNavn
    Else
        varAfdeling = currentAfdeling
    End If

    DoCmd.OpenForm "frmTmpMedarbVikar", acNormal, , , acFormEdit, , varAfdeling & "|" & currentYear

End Sub

Private Sub btnCopyToRådighed_Click()
    Call cmdKopierTilRaadighed
End Sub
Private Sub cmdKopierTilRaadighed()

    'On Error GoTo Err_Handler

    Const C_SUBFORM_CONTROL As String = "frm_UnderTmpAfdMedarbejdBudget" ' <-- SUBFORM-KONTROLNAVN
    Const C_TABLE As String = "tblTmpMedarbejder"

    Const C_RAW_LOENART As String = "1560"
    Const C_KONTO As String = "LønRådighed"
    Const C_OMREGN As Double = 160.33

    Dim fSub As Form
    Dim dB As DAO.Database
    Dim rsSrc As DAO.Recordset
    Dim rsNew As DAO.Recordset
    Dim fld As DAO.field

    Dim lngNewID As Long
    Dim lngYear As Long

    Dim dFra As Date, dTil As Date
    Dim dblBelob As Double
    Dim dblNormtid As Double
    Dim dblBelobBudget As Double
    Dim dblMdr As Double

    '--- Peg på subform og aktuel record
    Set fSub = Me.Controls(C_SUBFORM_CONTROL).Form
    If fSub.Recordset Is Nothing Then Exit Sub
    If fSub.NewRecord Then
        MsgBox "Stå på en eksisterende linje først.", vbInformation
        Exit Sub
    End If

    Set rsSrc = fSub.RecordsetClone
    rsSrc.Bookmark = fSub.Bookmark

    '--- Opret kopi
    Set dB = CurrentDb
    Set rsNew = dB.OpenRecordset(C_TABLE, dbOpenDynaset, dbAppendOnly Or dbSeeChanges)

    rsNew.AddNew
    For Each fld In rsSrc.Fields
        If fld.DataUpdatable And fld.Name <> "ID" Then
            rsNew.Fields(fld.Name).value = fld.value
        End If
    Next fld

    '========================
    ' DINE STATISKE ÆNDRINGER
    '========================

    ' 1) Lønart = "1560"
    rsNew.Fields("Lønart").value = C_RAW_LOENART

    ' 2) Beløb via DLookup i tblParm_BeløbUdenKonti
    lngYear = Nz(Me.cboYearAfd.value, 0)

    dblBelob = Nz(DLookup( _
        "Beløb", _
        "tblParm_BeløbUdenKonti", _
        "BudgetYear=" & lngYear & " AND Konto='" & Replace(C_KONTO, "'", "''") & "'"), 0)

    rsNew.Fields("Beløb").value = dblBelob

    ' 3) BeløbBudget = Beløb / 160.33 * Normtid
    dblNormtid = Nz(rsNew.Fields("Normtid").value, 0)
    dblBelobBudget = 0
    If C_OMREGN <> 0 Then
        dblBelobBudget = (dblBelob / C_OMREGN) * dblNormtid
    End If
    rsNew.Fields("BeløbBudget").value = dblBelobBudget

    ' 4) TotalBeløbBudgetDÅ = BeløbBudget * (måneder som decimal mellem DatoFra og DatoTil)
    If IsDate(rsNew.Fields("DatoFra").value) And IsDate(rsNew.Fields("DatoTil").value) Then
        dFra = rsNew.Fields("DatoFra").value
        dTil = rsNew.Fields("DatoTil").value

        dblMdr = MonthsFraction(dFra, dTil) ' kan være fx 0,5 + 1 + 0,3 etc.
        rsNew.Fields("TotalBeløbBudgetDÅ").value = dblBelobBudget * dblMdr
    Else
        rsNew.Fields("TotalBeløbBudgetDÅ").value = 0
    End If

    rsNew.Update

    '--- Hop til den nye record
    rsNew.Bookmark = rsNew.LastModified
    lngNewID = Nz(rsNew.Fields("ID").value, 0)

    fSub.Requery
    Set rsSrc = fSub.RecordsetClone
    rsSrc.FindFirst "ID=" & lngNewID
    If Not rsSrc.NoMatch Then
        fSub.Bookmark = rsSrc.Bookmark
    End If

Clean_Exit:
    On Error Resume Next
    If Not rsSrc Is Nothing Then rsSrc.Close
    If Not rsNew Is Nothing Then rsNew.Close
    Set rsSrc = Nothing
    Set rsNew = Nothing
    Set dB = Nothing
    Set fSub = Nothing
    Exit Sub

Err_Handler:
    Dim e As DAO.Error
    Dim msg As String

    msg = "Fejl " & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf
    For Each e In DBEngine.Errors
        msg = msg & "DAO/ODBC: " & e.Number & " - " & e.Description & vbCrLf
    Next

    MsgBox msg, vbExclamation, "Kopier til rådighedstillæg"
    Resume Clean_Exit
End Sub

' Returnerer antal måneder som decimal mellem dStart og dEnd ved at summere overlap pr. måned:
' - hele måneder = 1
' - delmåned = (antal overlapdage / antal dage i måneden)
Private Function MonthsFraction(ByVal dStart As Date, ByVal dEnd As Date) As Double
    Dim dA As Date, dB As Date
    Dim dCursor As Date
    Dim dMonthStart As Date, dMonthEnd As Date
    Dim dOverlapStart As Date, dOverlapEnd As Date
    Dim daysInMonth As Long
    Dim overlapDays As Long
    Dim total As Double

    If dEnd < dStart Then
        dA = dEnd
        dB = dStart
    Else
        dA = dStart
        dB = dEnd
    End If

    ' Start ved månedens 1. dag
    dCursor = DateSerial(Year(dA), Month(dA), 1)

    Do While dCursor <= dB
        dMonthStart = dCursor
        dMonthEnd = DateSerial(Year(dCursor), Month(dCursor) + 1, 0) ' sidste dag i måneden

        ' Overlap mellem [dA..dB] og [dMonthStart..dMonthEnd]
        dOverlapStart = IIf(dA > dMonthStart, dA, dMonthStart)
        dOverlapEnd = IIf(dB < dMonthEnd, dB, dMonthEnd)

        If dOverlapEnd >= dOverlapStart Then
            daysInMonth = Day(dMonthEnd)
            ' +1 fordi datoer er inklusive (1.-1. giver 1 dag)
            overlapDays = DateDiff("d", dOverlapStart, dOverlapEnd) + 1
            total = total + (overlapDays / daysInMonth)
        End If

        ' næste måned
        dCursor = DateSerial(Year(dCursor), Month(dCursor) + 1, 1)
    Loop

    MonthsFraction = total
End Function
Private Sub btnCreateLines_Click()
    On Error GoTo ErrorHandler

    Dim dB As DAO.Database
    Dim rs As DAO.Recordset         ' Kilde (Visma)
    Dim rsTmp As DAO.Recordset      ' Destination (tblTmpMedarbejder)
    Dim qd As DAO.QueryDef
    Dim p As DAO.Parameter

    Dim strSQL As String
    Dim strAfdUniconta As String
    Dim strAfdEsc As String

    Dim strNextLøntrin As String
    Dim dblNextBeløb As Double
    Dim dblRaise9900 As Double

    Dim intRev As Integer
    Dim intIsFromPris As Integer

    Set dB = CurrentDb

    ' Sørg for at current* variabler er opdateret som i din eksisterende logik
    Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))

    If IsNull(currentYear) Or currentYear = 0 Then
        MsgBox "Der er ikke noget årstal", vbExclamation
        GoTo ExitSub
    End If

    ' --- NYT: Håndter brug fra Prisberegning -------------
    If Nz(TempVars("isFromPrisberegning"), False) Then

        Dim qdfPT As DAO.QueryDef
        Dim strIns As String
        Dim strAfd As String

        strAfd = currentPrisberegningAfd

        Set qdfPT = dB.CreateQueryDef("")
        qdfPT.Connect = dB.TableDefs("tblTmpMedarbejder").Connect
        qdfPT.ReturnsRecords = False

        strIns = _
          "INSERT INTO tblTmpMedarbejder " & _
          "(Afdeling, Year_, DatoFra, DatoTil, Medarbejdernr, Fornavn, Efternavn, [Ekstern titel], " & _
          " StatusDato, Normtid, Løntrin, Lønart, Beløb, LøntrinBudget, BeløbBudget, " & _
          " TotalBeløbBudgetDÅ, TotalNormtidDÅ, Revision, Valgfri1, Valgfri2, Valgfri3) " & _
          "SELECT '" & Replace(currentPrisberegningNavn, "'", "''") & "' AS Afdeling, Year_, DatoFra, DatoTil, Medarbejdernr, Fornavn, Efternavn, [Ekstern titel], " & _
          " StatusDato, Normtid, Løntrin, Lønart, Beløb, LøntrinBudget, BeløbBudget, " & _
          " TotalBeløbBudgetDÅ, TotalNormtidDÅ, Revision, Valgfri1, Valgfri2, Valgfri3 " & _
          "FROM tblTmpMedarbejder " & _
          "WHERE Afdeling = '" & Replace(strAfd, "'", "''") & "' AND Year_ = " & CLng(currentYear) & ";"

        qdfPT.sql = strIns
        qdfPT.Execute dbFailOnError Or dbSeeChanges
        Set qdfPT = Nothing

        ' --- Kopiér også vikarlinjer fra tblTmpMedarbVikar ---
        Dim qdfVikar As DAO.QueryDef
        Dim strInsVikar As String

        Set qdfVikar = dB.CreateQueryDef("")
        qdfVikar.Connect = dB.TableDefs("tblTmpMedarbVikar").Connect
        qdfVikar.ReturnsRecords = False

        strInsVikar = _
          "INSERT INTO tblTmpMedarbVikar " & _
          "(Afdeling, Year_, Antal, Beløb, Løntrin) " & _
          "SELECT '" & Replace(currentPrisberegningNavn, "'", "''") & "' AS Afdeling, " & _
          "Year_, Antal, Beløb, Løntrin " & _
          "FROM tblTmpMedarbVikar " & _
          "WHERE Afdeling = '" & Replace(strAfd, "'", "''") & "' AND Year_ = " & CLng(currentYear) & ";"

        qdfVikar.sql = strInsVikar
        qdfVikar.Execute dbFailOnError Or dbSeeChanges
        Set qdfVikar = Nothing

        Call FilterYearAfd
        Forms!frmAfdMedarbBudget!frm_UnderTmpAfdMedarbejdBudget.Form.Requery
        GoTo ExitSub
    End If
    ' ----------------------------------------------------------------------------------------

    strAfdUniconta = Nz(currentAfdeling, "")
    If Len(strAfdUniconta) = 0 Then
        MsgBox "Afdeling mangler (currentAfdeling).", vbExclamation
        GoTo ExitSub
    End If
    strAfdEsc = Replace(strAfdUniconta, "'", "''")

    ' Hent 9900 forhøjelse
    dblRaise9900 = Nz(ELookup("Beløb", "tblParm_BeløbUdenKonti", _
        "Konto='LønForhøj_9900' And BudgetYear=" & CLng(currentYear)), 0)

    If dblRaise9900 = 0 Then
        ' Ikke fatal - men informér
        MsgBox "LønForhøj_9900 koden/beløb mangler (tblParm_BeløbUdenKonti).", vbExclamation
    End If

    ' --- KILDE-QUERY (robust: alias, mellemrum, q.-prefix) ---
    strSQL = _
    "SELECT q.Afdeling, q.Fornavn, q.Efternavn, q.DatoFra, q.EksternTitel_Out, q.Normtid, q.Løntrin, q.Lønartsnummer, q.[Løn total], q.Medarbejdernr, q.Valgfri1, q.Valgfri2, q.Valgfri3 " & _
    "FROM (" & _
    "   SELECT " & _
    "       [CostCenter] & IIf(Nz([Valgfri2],'')<>'' AND Nz([CostCenter],'')<>'1', '_' & [Valgfri2], '') AS Afdeling, " & _
    "       [Medarbejdernummer] AS Medarbejdernr, " & _
    "       Fornavn, " & _
    "       Efternavn, " & _
    "       [Ansættelsesdato] AS DatoFra, " & _
    "       [Ekstern_Titel] AS EksternTitel_Out, " & _
    "       [Arbejdstid_timer] AS Normtid, " & _
    "       Løntrin, " & _
    "       Valgfri1, Valgfri2, Valgfri3, " & _
    "       Lønartsnummer, " & _
    "       IIf(IsNull([Rammetrin_beløb]), Nz([Beløb],0)/160.33*Nz([Arbejdstid_timer],0), [Rammetrin_beløb]) AS [Løn total] " & _
    "   FROM tblLøndataVisma " & _
    ") AS q " & _
    "WHERE q.Afdeling = '" & strAfdEsc & "' " & _
    "ORDER BY q.Afdeling, q.Fornavn, q.Lønartsnummer;"

    ' Kør som QueryDef så vi kan se evt. manglende felter (Expected parameters)
    Set qd = dB.CreateQueryDef("", strSQL)

    If qd.Parameters.Count > 0 Then
        For Each p In qd.Parameters
            Debug.Print "Mangler felt/parameter: "; p.Name
        Next p
        Err.Raise vbObjectError + 3061, , "SQL indeholder ukendte felter (se Immediate Window)."
    End If

    ' Kilde = snapshot (SELECT)
    Set rs = qd.OpenRecordset(dbOpenSnapshot)

    ' Destination = linked SQL Server tabel (identity => dbSeeChanges)
    Set rsTmp = dB.OpenRecordset("tblTmpMedarbejder", dbOpenDynaset, dbAppendOnly Or dbSeeChanges)

    ' Hvis billedet er kaldt fra frmPrisberegning OG medarbejdere skal hentes direkte fra en eksisterende afdeling
    If intIsFromPris = 2 Then strAfdUniconta = currentPrisberegningNavn

    Do While Not rs.EOF

        ' Find næste løntrin
        If Nz(rs!Løntrin, "") <> "" Then
            strNextLøntrin = Nz(ELookup("LøntrinNext_1", "tblParm_Løntrin", _
                "Konto='" & Replace(Nz(rs!Løntrin, ""), "'", "''") & "'"), Nz(rs!Løntrin, ""))
            If strNextLøntrin = "Stop" Then strNextLøntrin = Nz(rs!Løntrin, "")
        Else
            strNextLøntrin = ""
        End If

        ' Beregn næste beløb
        Select Case Nz(rs!Lønartsnummer, "")
            Case "1000"
                dblNextBeløb = Nz(ELookup("Beløb", "tblParm_Løntrin", _
                              "Konto='" & Replace(strNextLøntrin, "'", "''") & "' And BudgetYear=" & CLng(currentYear)), 0)
                dblNextBeløb = Nz(dblNextBeløb / 160.33 * Nz(rs!Normtid, 0), 0)

            Case "9900"
                dblNextBeløb = Nz(rs![Løn total], 0) + Nz(dblRaise9900 / 160.33 * Nz(rs!Normtid, 0), 0)

            Case Else
                dblNextBeløb = Nz(rs![Løn total], 0)
        End Select

        With rsTmp
            .AddNew
            !Afdeling = Nz(strAfdUniconta, "Mangler")
            !Year_ = CLng(currentYear)
            !DatoFra = DateSerial(CLng(currentYear), 1, 1)
            !DatoTil = DateSerial(CLng(currentYear), 12, 31)
            !Medarbejdernr = Nz(rs!Medarbejdernr, 0)
            !Fornavn = Nz(rs!Fornavn, "Mangler")
            !Efternavn = Nz(rs!Efternavn, "Mangler")
            ![Ekstern titel] = Nz(rs![EksternTitel_Out], "Mangler")
            !StatusDato = Nz(rs!DatoFra, DateSerial(1901, 12, 31))
            !Normtid = Nz(rs!Normtid, 0)
            !NormtidPrUge = Round(Nz((rs!Normtid * 12) / 52, 0), 2)
            !Løntrin = Nz(rs!Løntrin, "")
            !Lønart = Nz(rs!Lønartsnummer, "")
            !Beløb = Nz(rs![Løn total], 0)
            !LøntrinBudget = strNextLøntrin
            !BeløbBudget = dblNextBeløb
            !Valgfri1 = Nz(rs!Valgfri1, "Mangler")
            !Valgfri2 = Nz(rs!Valgfri2, "Mangler")
            !Valgfri3 = Nz(rs!Valgfri3, "Mangler")

            ' Beholder din gamle DÅ-logik her (vi kan senere skifte til MonthsFraction hvis du vil)
            !TotalBeløbBudgetDÅ = (dblNextBeløb * ((Month(!DatoTil) - Month(!DatoFra)) + 1))
            !TotalNormtidDÅ = Nz(rs!Normtid, 0) * (Month(!DatoTil) - (Month(!DatoFra) - 1))

            !Revision = intRev
            .Update
        End With

        rs.MoveNext
    Loop

ExitSub:
    On Error Resume Next

    Call FilterYearAfd
    Me.Repaint
    Forms!frmAfdMedarbBudget!frm_UnderTmpAfdMedarbejdBudget.Form.Requery

    If Not rs Is Nothing Then rs.Close
    If Not rsTmp Is Nothing Then rsTmp.Close
    Set rs = Nothing
    Set rsTmp = Nothing
    Set qd = Nothing
    Set dB = Nothing
    Exit Sub

ErrorHandler:
    MsgBox "Fejl " & Err.Number & ": " & Err.Description, vbCritical, "btnCreateLines_Click"
    Resume ExitSub
End Sub

Private Sub FilterYearAfd()
Dim intYear_ As Integer
Dim intRev As Integer

    Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))

    If IsNull(currentYear) Or IsNull(currentAfdeling) Then
        Me.frm_UnderTmpAfdMedarbejdBudget.Form.filter = "[Year_] = 0"
        Me.frm_UnderTmpAfdMedarbejdBudget.Form.FilterOn = True
    Else
        If TempVars("isFromPrisberegning") = True Then
            Me.frm_UnderTmpAfdMedarbejdBudget.Form.filter = "[Year_] = " & currentYear & " AND Afdeling = '" & currentPrisberegningNavn & "'"
        Else
                Me.frm_UnderTmpAfdMedarbejdBudget.Form.filter = "[Year_] = " & currentYear & " AND Afdeling = '" & currentAfdeling & "'"
        End If

        Me.frm_UnderTmpAfdMedarbejdBudget.Form.FilterOn = True
    End If

    fncTotalPrg


End Sub

Public Sub btnUpdateTotal_Click()
    Call fncTotalPrg
End Sub
Private Sub cboAfdeling_AfterUpdate()
    Call FilterYearAfd
End Sub
Private Sub cboYearAfd_AfterUpdate()
    Me.cboAfdeling.RowSource = "SELECT [AfdNr Uniconta], AfdelingsNavn FROM tblAfdeling WHERE Year_ = " & Nz(Me.cboYearAfd, Year(Date)) & " ORDER BY [AfdNr Uniconta];"
    Me.cboAfdeling.Requery
    Me.cboAfdeling = ""

    Call FilterYearAfd
End Sub
Private Sub Form_Load()

    Dim arrArgs() As String
    Dim lngPrisberegningID As Long
    Dim strPrisberegningNavn As String
    Dim strPrisAfd As String
    Dim intYear As Integer
    Dim intYearGrund As Integer 'Årstal hvorfra løndata skal hentes i parametrene
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim isFromPrisberegning As Boolean
    Dim strUser As String
    strUser = Environ$("USERNAME")


    ' Standard: antag at formen IKKE åbnes fra Prisberegning
    isFromPrisberegning = False

    ' Tjek om der er sendt OpenArgs med
    If Not IsNull(Me.OpenArgs) Then
        arrArgs = Split(Me.OpenArgs, "|")
        If UBound(arrArgs) >= 3 Then
            ' Tjek om første argument er et tal (ID fra tblPrisberegning)
            If IsNumeric(arrArgs(0)) Then
                lngPrisberegningID = CLng(arrArgs(0))
                strPrisberegningNavn = arrArgs(1)
                intYear = CInt(arrArgs(2))
                strPrisAfd = Nz(arrArgs(3), "")
                intYearGrund = CInt(arrArgs(4))

                ' Valider at der findes en record med dette ID og navn
                strSQL = "SELECT ID FROM tblPrisberegning WHERE ID = " & lngPrisberegningID & " AND PrisberegningNavn = '" & Replace(strPrisberegningNavn, "'", "''") & "'"
                Set rs = CurrentDb.OpenRecordset(strSQL, dbOpenSnapshot)
                If Not rs.EOF Then
                    isFromPrisberegning = True
                End If
                rs.Close
                Set rs = Nothing
            End If
        End If
    End If

    If isFromPrisberegning Then
        TempVars("currentID") = lngPrisberegningID
        TempVars("isFromPrisberegning") = True
        TempVars("currentAfdeling") = strPrisAfd
        TempVars("currentPrisberegningNavn") = strPrisberegningNavn
        TempVars("currentPrisberegningAfd") = strPrisAfd
        TempVars("intYearGrund") = intYearGrund
    Else
        TempVars("isFromPrisberegning") = False
        TempVars("currentAfdeling") = currentAfdeling
    End If

    TempVars("currentYear") = intYear

    Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))

    If isFromPrisberegning Then
        ' 1) Record Source = tblPrisberegning
        Me.RecordSource = "tblPrisberegning"
        ' 2) Row Source for cboAfdeling skal være ID og PrisberegningNavn fra tblPrisberegning, filtreret på år
        Me.cboAfdeling.RowSource = "SELECT PrisberegningNavn FROM tblPrisberegning WHERE BudgetAar = " & currentYear & " ORDER BY PrisberegningNavn;"
        Me.cboAfdeling.BoundColumn = 1
        Me.cboAfdeling.ColumnCount = 1
        Me.cboAfdeling.ColumnWidths = 5

        ' 3) Sæt default værdi

        Me.cboAfdeling.value = strPrisberegningNavn 'Nz(ELookup("ID", "tblPrisberegning", "PrisberegningNavn = '" & strPrisberegningNavn & "' And BudgetAar = " & intYear), 0)
        Me.cboYearAfd = currentYear
    Else

        ' Hent tidligere værdier
        AssignValuesToFormObjects Me, strUser, Me.Name

        If IsNull(Me.cboYearAfd) = True Then
            Me.cboYearAfd = Year(Date)
        End If

        Me.cboAfdeling.RowSource = "SELECT [AfdNr Uniconta], AfdelingsNavn FROM tblAfdeling WHERE Year_ = " & Nz(Me.cboYearAfd, Year(Date)) & " ORDER BY [AfdNr Uniconta];"
        Me.cboAfdeling.BoundColumn = 1
        Me.cboAfdeling.ColumnCount = 2

    End If

        Me.cboAfdeling.Requery

    ''Debug.Print Me.cboAfdeling.Value

    Call FilterYearAfd

    Call fncTotalPrg

    'hvis der findes værdier i tblFB_Totaler, så overskriv tekstboksene
    Dim dB As DAO.Database

    Set dB = CurrentDb
    strSQL = "SELECT MedarbTimerPrMd, MedarbVikarTimPrMd, MedarbVikarBlbPrMd " & _
             "FROM tblFB_Totaler WHERE Year_ = " & Me.cboYearAfd & " AND Afdeling = '" & Me.cboAfdeling & "'"

    Set rs = dB.OpenRecordset(strSQL, dbOpenSnapshot)

    If Not rs.EOF Then
        Me.Text18 = Nz(rs!MedarbTimerPrMd, 0)
        Me.Text28 = Nz(rs!MedarbVikarTimPrMd, 0)
        Me.Text38 = Nz(rs!MedarbVikarBlbPrMd, 0)
    End If

    rs.Close
    Set rs = Nothing
    Set dB = Nothing

End Sub
Private Function fncTempVarTilCurrent(isFromPrisberegning As Boolean)

    If isFromPrisberegning Then
        currentID = TempVars("currentID")
        currentPrisberegningNavn = TempVars("currentPrisberegningNavn")
        currentYear = TempVars("currentYear")
        currentPrisberegningAfd = TempVars("currentPrisberegningAfd")
        currentAfdeling = TempVars("currentAfdeling")
        currentYearGrund = TempVars("intYearGrund")

    Else
        currentAfdeling = Nz(Me.cboAfdeling, "")
        currentYear = Nz(Me.cboYearAfd, 0)
    End If


End Function

Private Function fncTotalPrg()
   'On Error GoTo ErrorHandler ' Error handling

    Dim dB As DAO.Database
    Dim qdfPrg As DAO.QueryDef
    Dim qdfAmount As DAO.QueryDef
    Dim rstPrg As DAO.Recordset
    Dim rstAmount As DAO.Recordset
    Dim strAfdTotal As String
    Dim intYear As Integer
    Dim strAfd As String
    Dim strAfdUni As String
    Dim strPrg(10) As String
    Dim strGodkPrg(10) As String
    Dim intCntPrg As Integer
    Dim intCnt As Integer
    Dim intCntRest As Integer
    Dim dblAntalAnsatte(10) As Double
    Dim dblAntalÅrsværk(10) As Double
    Dim dblAntalNormtid(10) As Double
    Dim dblAmountYear(10) As Double
    Dim dblTotalAnsatte As Double
    Dim dblTotalÅrsværk As Double
    Dim dblTotalAmountYear As Double
    Dim dblTotalNormtid As Double
    Dim strQdf As String
    Dim dblFerieSygeDage As Double
    Dim dblVikarTimerPrUge As Double
    Dim dblVikarTimerBeløbPrMd As Double

    If Not IsNull(TempVars("isFromPrisberegning")) Then
        Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))
    End If

    intCntRest = 1
    For intCntRest = 1 To 7
            Me.Controls("Text" & Format(10 + intCntRest, "####")).Visible = False
            Me.Controls("Text" & Format(20 + intCntRest, "####")).Visible = False
            Me.Controls("Text" & Format(30 + intCntRest, "####")).Visible = False
            Me.Controls("Label" & Format(20 + intCntRest, "####")).Visible = False

    Next intCntRest


    Set dB = CurrentDb
    intCntPrg = 1
    intCnt = 1

    intYear = currentYear
    If TempVars("isFromPrisberegning") = True Then
        strAfd = currentPrisberegningNavn
        strAfdUni = currentPrisberegningNavn
    Else
        strAfd = currentAfdeling
        strAfdUni = Nz(ELookup("[AfdNr Uniconta]", "tblAfdeling", "Year_ = " & intYear & " AND Afdeling = '" & currentAfdeling & "'"), "")
    End If

    strQdf = "SELECT DISTINCT Lønart FROM tblTmpMedarbejder " & _
    "WHERE Afdeling = '" & strAfd & "' And Year_ = " & intYear

    Set qdfPrg = dB.CreateQueryDef("", strQdf)

    Set rstPrg = qdfPrg.OpenRecordset(dbOpenSnapshot)
        If rstPrg.RecordCount > 0 Then

        dblFerieSygeDage = ELookup("Dage", "tblParm_Prisberegning", "Tekst = 'Medarbejder årlige feriedage'")
        dblFerieSygeDage = dblFerieSygeDage + ELookup("Dage", "tblParm_Prisberegning", "Tekst = 'Medarbejder årlige sygedage'")


        Do While Not rstPrg.EOF
              strPrg(intCntPrg) = Nz(rstPrg!Lønart, "")


                strQdf = "SELECT Sum(1) as TotalAnsatte, Sum(TotalBeløbBudgetDÅ) AS TotalBeløb, Sum(TotalNormTidDÅ) AS TotalNormtid FROM tblTmpMedarbejder " & _
                "WHERE Afdeling = '" & strAfd & "' And Year_ = " & intYear & " And Lønart = '" & rstPrg!Lønart & "' " & _
                "GROUP BY Lønart"

                Set qdfAmount = dB.CreateQueryDef("", strQdf)

                Set rstAmount = qdfAmount.OpenRecordset(dbOpenSnapshot)

                If rstAmount.RecordCount > 0 Then
                Do While Not rstAmount.EOF

                    dblAntalAnsatte(intCntPrg) = Nz(rstAmount!TotalAnsatte, 0)
                    dblAntalNormtid(intCntPrg) = Nz(rstAmount!TotalNormTid, 0)
                    dblAmountYear(intCntPrg) = Nz(rstAmount!TotalBeløb, 0)

                    If strPrg(intCntPrg) = "1000" Or strPrg(intCntPrg) = "1101" Or strPrg(intCntPrg) = "9900" Then
                        dblTotalAnsatte = dblTotalAnsatte + dblAntalAnsatte(intCntPrg)
                        dblTotalÅrsværk = dblTotalÅrsværk + dblAntalNormtid(intCntPrg)
                        dblTotalNormtid = dblTotalNormtid + dblAntalNormtid(intCntPrg)
                    End If

                    dblTotalAmountYear = dblTotalAmountYear + Nz(rstAmount!TotalBeløb, 0)

                    rstAmount.MoveNext
                Loop
                End If

            rstPrg.MoveNext
            intCntPrg = intCntPrg + 1
        Loop
    End If

    For intCnt = 1 To intCntPrg
            Me.Controls("Text" & Format(10 + intCnt, "####")).Visible = True
            Me.Controls("Text" & Format(20 + intCnt, "####")).Visible = True
            Me.Controls("Text" & Format(30 + intCnt, "####")).Visible = True
            Me.Controls("Label" & Format(20 + intCnt, "####")).Visible = True

        If intCnt < intCntPrg Then

            Me.Controls("Text" & Format(10 + intCnt, "####")).value = dblAntalAnsatte(intCnt)
            Me.Controls("Text" & Format(20 + intCnt, "####")).value = dblAntalNormtid(intCnt) / 160.33 / 12
            Me.Controls("Text" & Format(30 + intCnt, "####")).value = dblAmountYear(intCnt)
            Me.Controls("Label" & Format(20 + intCnt, "####")).value = strPrg(intCnt)

        Else

            strAfdTotal = "SELECT * FROM tblFB_Totaler " & _
                          "WHERE Year_ = " & intYear & " AND Afdeling = '" & strAfdUni & "' "

            Dim conn As ADODB.Connection
            Dim rstAfdTotal As ADODB.Recordset

            ' Initialize the Connection and Recordset objects.
            Set conn = New ADODB.Connection
            Set rstAfdTotal = New ADODB.Recordset

            ' Open a connection to the database.
            conn.Open fncConnString


            With rstAfdTotal

                rstAfdTotal.Open strAfdTotal, conn, adOpenDynamic, adLockOptimistic

                dblTotalÅrsværk = dblTotalÅrsværk / 160.33 / 12

                If Not .EOF Then

                    !Year_ = intYear
                    !Afdeling = strAfd
                    !TotalAnsatte = dblTotalAnsatte
                    !TotalÅrsværk = dblTotalÅrsværk
                    !TotalLønomk = dblTotalAmountYear
                    .Update

                Else
                    .AddNew
                    !Year_ = intYear
                    !Afdeling = strAfd
                    !TotalAnsatte = dblTotalAnsatte
                    !TotalÅrsværk = dblTotalÅrsværk
                    !TotalLønomk = dblTotalAmountYear
                    .Update

                End If

            End With

            Me.Controls("Text" & Format(10 + intCnt, "####")).value = dblTotalAnsatte
            Me.Controls("Text" & Format(20 + intCnt, "####")).value = dblTotalÅrsværk
            Me.Controls("Text" & Format(30 + intCnt, "####")).value = dblTotalAmountYear
            Me.Controls("Label" & Format(20 + intCnt, "####")).value = "Total " & Format(intYear, "####")
        End If
    Next intCnt

    If intCntPrg > 1 Then

        dblVikarTimerPrUge = (dblFerieSygeDage * 7.5) / 52

        Me.Controls("Text" & Format(10 + 8, "####")).value = Nz(dblTotalNormtid / 52, 0)
        Me.Controls("lbl" & Format(10 + 8, "####")).Caption = Format(Nz(dblTotalNormtid / 52, 0), "####")
        Me.Controls("Text" & Format(20 + 8, "####")).value = dblVikarTimerPrUge * dblTotalÅrsværk
        Me.Controls("lbl" & Format(20 + 8, "####")).Caption = Format((dblVikarTimerPrUge * dblTotalÅrsværk), "####")
        Me.Controls("Text" & Format(30 + 8, "####")).value = dblVikarTimerBeløbPrMd
        Me.Controls("Label" & Format(20 + 8, "####")).value = "Timer pr. uge"
        Me.Controls("lbl8").value = "Kalkuleret"

        'Debug.Print dblTotalNormtid / 52


        rstAmount.Close
        Set rstAmount = Nothing
        Set qdfAmount = Nothing

        rstAfdTotal.Close
        Set rstAfdTotal = Nothing
        strAfdTotal = ""

    End If

    rstPrg.Close
    Set rstPrg = Nothing
    Set qdfPrg = Nothing


    ' Overskriv Text18/28/38 med værdier fra tblFB_Totaler hvis de findes
    Dim rsOverride As DAO.Recordset
    Dim strSQLOverride As String

    strSQLOverride = "SELECT MedarbTimerPrMd, MedarbVikarTimPrMd, MedarbVikarBlbPrMd " & _
                     "FROM tblFB_Totaler WHERE Year_ = " & intYear & " AND Afdeling = '" & strAfdUni & "'"

    Set rsOverride = dB.OpenRecordset(strSQLOverride, dbOpenSnapshot)

    If Not rsOverride.EOF Then
        With rsOverride

            If !MedarbVikarBlbPrMd > 0 Then
                           ' Spørg brugeren
'
'                If MsgBox("Der er gemt et beløb på vikarerne,  på ", vbYesNo + vbQuestion, "Bekræft handling") = vbNo Then
'                    Exit Function    ' Eller Exit Function, afhængigt af hvor koden står
'                End If

                'If !MedarbTimerPrMd > 0 Then Me.Text18 = Nz(rsOverride!MedarbTimerPrMd, 0)
                If !MedarbVikarTimPrMd > 0 Then Me.Text28 = Nz(rsOverride!MedarbVikarTimPrMd, 0)
                If !MedarbVikarBlbPrMd > 0 Then Me.Text38 = Nz(rsOverride!MedarbVikarBlbPrMd, 0)

            End If

        End With
    End If

    rsOverride.Close
    Set rsOverride = Nothing
    Set dB = Nothing

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub


End Function

Private Sub Form_Unload(Cancel As Integer)
Dim usr As String: usr = Environ$("USERNAME")
Dim params As New Scripting.Dictionary
Dim dblVikarBlb As Double


    ''Debug.Print Me.cboAfdeling


    If Nz(Me.cboAfdeling, "") <> "" And Nz(Me.cboYearAfd, "") <> "" Then

        Debug.Print val(Replace(Me.Text38, ".", ""))

        Call OpdaterEllerIndsætFBTotal(Me.cboAfdeling, Me.cboYearAfd, val(Replace(Me.Text28, ".", "")), val(Replace(Me.Text38, ".", "")), val(Replace(Me.Text18, ".", "")))

        'Hvis den bliver kaldt fra prisberegning, skal den ikke hente den sidste der var brugt
        If TempVars("isFromPrisberegning") = False Then
            On Error Resume Next
            params.Add "cboAfdeling", Nz(Me.cboAfdeling, "")
            params.Add "cboYearAfd", Nz(Me.cboYearAfd, "")
            On Error GoTo 0

            SaveFormParameters usr, Me.Name, "", "", params
        Else
            TempVars.Remove ("currentID")
            TempVars.Remove ("isFromPrisberegning")
            TempVars.Remove ("currentAfdeling")
            TempVars.Remove ("currentPrisberegningNavn")
            TempVars.Remove ("currentPrisberegningAfd")
            TempVars.Remove ("intYearGrund")

        End If

    End If

End Sub
