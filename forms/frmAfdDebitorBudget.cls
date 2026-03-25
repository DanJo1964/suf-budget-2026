Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

'=================================================================
'  Prisberegning-integration – fælles variabler
'=================================================================
Dim isFromPrisberegning As Boolean
Dim currentID                 As Long
Dim currentAfdeling           As String
Dim currentYear               As Integer
Dim currentPrisberegningNavn  As String
Dim currentPrisberegningAfd   As String
'-----------------------------------------------------------------
Dim intYear As Integer
Dim strAfd  As String
Private Function fncTempVarTilCurrent(ByVal fromPris As Boolean)
    If fromPris Then
        currentID = TempVars("currentID")
        currentPrisberegningNavn = TempVars("currentPrisberegningNavn")
        currentYear = TempVars("currentYear")
        currentPrisberegningAfd = TempVars("currentPrisberegningAfd")
        currentAfdeling = TempVars("currentAfdeling")
    Else
        currentAfdeling = Nz(Me.cboAfdeling, "")
        currentYear = val(Nz(Me.cboYearAfdDeb, intYear))
    End If
    ' hold de gamle navne i live
    intYear = currentYear
    strAfd = IIf(fromPris, currentPrisberegningNavn, currentAfdeling)
End Function
Private Sub btnCreateCustomer_Click()
Dim strAfd As String

DoCmd.OpenForm "frmTmpAfdDebitorBudgetNew", , , , , acDialog, _
    "Afdeling=" & Me.cboAfdeling & ";BudgetAar=" & Me.cboYearAfdDeb

    If Not IsNull(Nz(TempVars("NewDebtorID"), Null)) Then
        ' Requery underformular-kontrollen
        Me.frm_UnderTmpAfdDebitorBudget.Form.Requery

        TempVars.Remove "NewDebtorID"
        Call fncTotalPrg
    End If

End Sub

Private Sub btnFremskPct_Click()
    'On Error GoTo ErrHandler

    Dim resp As VbMsgBoxResult
    Dim sRaw As String
    Dim dPct As Double
    Dim dblFrmPct As Double
    Dim afdelingVal As Variant
    Dim yearVal As Long

    Dim conn As ADODB.Connection
    Dim cmd As ADODB.Command

    Dim sqlText As String

    ' 1) Bekræftelse
    resp = MsgBox("Er du sikker på, at du vil opdatere fremskrivningsprocenten for den valgte afdeling og år?", _
                  vbQuestion + vbYesNo + vbDefaultButton2, "Bekræft opdatering")
    If resp <> vbYes Then Exit Sub

    ' 2) Læs og valider procent fra tekstboks
    sRaw = Nz(Me.tbxNyFpct.value, "")
    sRaw = Trim$(sRaw)
'    If Len(sRaw) = 0 Then
'        MsgBox "Angiv en fremskrivningsprocent i feltet.", vbExclamation
'        Exit Sub
'    End If

    sRaw = Replace$(sRaw, "%", "")
    sRaw = Replace$(sRaw, " ", "")
    'sRaw = Replace$(sRaw, ",", ".")
    If Not IsNumeric(sRaw) Then
        MsgBox "Fremskrivningsprocenten er ikke et gyldigt tal.", vbExclamation
        Exit Sub
    End If

    dPct = sRaw
    If dPct < -100# Or dPct > 1000# Then
        MsgBox "Ugyldigt interval for procent. Angiv en værdi mellem -100 og 1000.", vbExclamation
        Exit Sub
    End If
    dblFrmPct = dPct

    ' 3) Læs filterværdier
    afdelingVal = Me.cboAfdeling.value
    If IsNull(afdelingVal) Or afdelingVal = "" Then
        MsgBox "Vælg en afdeling.", vbExclamation
        Exit Sub
    End If

    If IsNull(Me.cboYearAfdDeb.value) Or Not IsNumeric(Me.cboYearAfdDeb.value) Then
        MsgBox "Vælg et gyldigt år.", vbExclamation
        Exit Sub
    End If
    yearVal = CLng(Me.cboYearAfdDeb.value)

    ' 4) ADO-connection og transaktion
    Set conn = New ADODB.Connection
    conn.ConnectionString = fncConnString() ' Din funktion med korrekt connection string
    conn.Open
    conn.BeginTrans

    ' 5) Parameteriseret UPDATE (positional parameters i ADO for ACE/Jet)
    '    Rækkefølgen af .Parameters.Append SKAL matche rækkefølgen af ?-pladsholderne.
    sqlText = _
        "UPDATE t " & vbCrLf & _
        "SET " & vbCrLf & _
        "  t.FremskrivBeløb   = ISNULL(t.Takst,0) * (1 + ?), " & vbCrLf & _
        "  t.XtraTakstFremskr = ISNULL(t.[Xtra takst],0) * (1 + ?), " & vbCrLf & _
        "  t.TotalTakstMdr    = (ISNULL(t.Takst,0) * (1 + ?)) + (ISNULL(t.[Xtra takst],0) * (1 + ?)), " & vbCrLf & _
        "  t.TotalTakstDÅ     = ((ISNULL(t.Takst,0) * (1 + ?)) + (ISNULL(t.[Xtra takst],0) * (1 + ?))) " & vbCrLf & _
        "                       * (MONTH(t.DatoTil) - MONTH(t.DatoFra) + 1), " & vbCrLf & _
        "  t.FremskrivPct = ? " & vbCrLf & _
        "FROM dbo.tblTmpDebtor AS t " & vbCrLf & _
        "WHERE t.Afdeling = ? " & vbCrLf & _
        "  AND t.Year_    = ? " & vbCrLf & _
        "  AND t.Takst <> 0;"

    Set cmd = New ADODB.Command
    With cmd
        .ActiveConnection = conn
        .CommandType = adCmdText
        .NamedParameters = False
        .CommandText = sqlText

        ' ?1..?...6: faktor 0,05 gentages
        .Parameters.Append .CreateParameter("p1", adDouble, adParamInput, , dblFrmPct)
        .Parameters.Append .CreateParameter("p2", adDouble, adParamInput, , dblFrmPct)
        .Parameters.Append .CreateParameter("p3", adDouble, adParamInput, , dblFrmPct)
        .Parameters.Append .CreateParameter("p4", adDouble, adParamInput, , dblFrmPct)
        .Parameters.Append .CreateParameter("p5", adDouble, adParamInput, , dblFrmPct)
        .Parameters.Append .CreateParameter("p6", adDouble, adParamInput, , dblFrmPct)

        ' ?7: lagres som 0,05
        .Parameters.Append .CreateParameter("p7", adDouble, adParamInput, , dblFrmPct)

        ' ?8: Afdeling som NVARCHAR
        .Parameters.Append .CreateParameter("p8", adVarWChar, adParamInput, 255, CStr(afdelingVal))

        ' ?9: Year_ som INT
        .Parameters.Append .CreateParameter("p9", adInteger, adParamInput, , yearVal)

        .Execute , , adExecuteNoRecords
    End With
    conn.CommitTrans

    Call fncTempVarTilCurrent(False)
    Call fncTotalPrg
    Call FilterYearAfd
    Call fncBeboereOgBeløb

    MsgBox "Fremskrivningsprocent og afledte beløb er opdateret.", vbInformation

Cleanup:
    On Error Resume Next
    If Not cmd Is Nothing Then Set cmd = Nothing
    If Not conn Is Nothing Then
        If conn.State <> adStateClosed Then conn.Close
        Set conn = Nothing
    End If
    Exit Sub

ErrHandler:
    On Error Resume Next
    If Not conn Is Nothing Then
        If conn.State = adStateOpen Then conn.RollbackTrans
    End If
    MsgBox "Der opstod en fejl under opdateringen: " & Err.Description, vbCritical
    Resume Cleanup
End Sub

Private Sub cboAfdeling_AfterUpdate()

    Call fncTempVarTilCurrent(False)
    Call fncTotalPrg
    Call FilterYearAfd
    Call fncBeboereOgBeløb

  End Sub
Private Sub cboYearAfdDeb_AfterUpdate()
    Call fncTempVarTilCurrent(False)
    Call SetCboAfdelingRowSource
    Call fncTotalPrg
    Call FilterYearAfd
End Sub
Private Sub FilterYearAfd()
    Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))

    If IsNull(currentYear) Or (Not isFromPrisberegning And IsNull(currentAfdeling)) Then
        Me.frm_UnderTmpAfdDebitorBudget.Form.filter = "[Year_] = 0"
    Else
        If isFromPrisberegning Then
            Me.frm_UnderTmpAfdDebitorBudget.Form.filter = "[Year_] = " & currentYear & _
                                                           " AND Afdeling = '" & currentPrisberegningNavn & "'"
        Else
            Me.frm_UnderTmpAfdDebitorBudget.Form.filter = "[Year_] = " & currentYear & _
                                                           " AND Afdeling = '" & currentAfdeling & "'"
        End If
    End If
    Me.frm_UnderTmpAfdDebitorBudget.Form.FilterOn = True

    'Call fncTotalPrg

End Sub
Private Sub btnCreateLines_Click()
    'On Error GoTo ErrorHandler
Dim dB As DAO.Database
Dim rs1 As DAO.Recordset
Dim rs2 As DAO.Recordset
Dim dblFrmPct As Double
Dim str As String



Set dB = CurrentDb
    Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))

    '--- Håndter kopi når kaldt fra Prisberegning ---------------------
    If Nz(TempVars("isFromPrisberegning"), False) Then
        Dim qdfPT As DAO.QueryDef
        Dim strSQL As String
        Dim strKildeAfd As String

        strKildeAfd = currentPrisberegningAfd

        Set qdfPT = dB.CreateQueryDef("")
        qdfPT.Connect = dB.TableDefs("tblTmpDebtor").Connect
        qdfPT.ReturnsRecords = False

        strSQL = "INSERT INTO tblTmpDebtor (Afdeling, Year_, DatoFra, DatoTil, Paragraf, Takst, [Xtra takst], Konto, Kontonavn, [Adresse 1], [Adresse 2], [Adresse 3], " & _
                 "Bynavn, Postnummer, Land, Telefon, Bærer, Formål, FremskrivPct, Revision, [Status Dato], M2, TotalTakstMdr, TotalTakstDÅ) " & _
                 "SELECT '" & currentPrisberegningNavn & "' AS Afdeling, Year_, DatoFra, DatoTil, Paragraf, Takst, [Xtra takst], Konto, Kontonavn, [Adresse 1], [Adresse 2], [Adresse 3], " & _
                 "Bynavn, Postnummer, Land, Telefon, Bærer, Formål, FremskrivPct, Revision, [Status Dato], M2, TotalTakstMdr, TotalTakstDÅ " & _
                 "FROM tblTmpDebtor WHERE Afdeling = '" & strKildeAfd & "' AND Year_ = " & currentYear & ";"

        qdfPT.sql = strSQL
        qdfPT.Execute dbFailOnError Or dbSeeChanges
        Set qdfPT = Nothing

        Call FilterYearAfd
        Me.frm_UnderTmpAfdDebitorBudget.Form.Requery
        Exit Sub
    End If


    strAfd = Me.cboAfdeling.value
    intYear = Me.cboYearAfdDeb

    dblFrmPct = ELookup("Procent", "tblParm_ProcentSatser", "Konto = 'FremskrivPct' And BudgetYear = " & intYear)

    'Skal erstattes med opslag i nyt parameter kartotek med fremskrivningsprocenter pr. afdeling
    If strAfd = "EJD" Then
        dblFrmPct = 0
        str = "SELECT * FROM tblDebtorClientUser WHERE Afdeling = '" & strAfd & "'"
    Else
        str = "SELECT * FROM tblDebtorClientUser WHERE Afdeling = '" & strAfd & "' " & _
              "AND Paragraf IN (SELECT Paragraf FROM tblParm_ParagrafKonto) AND Status = 'Aktiv'"
    End If

    ' Create a recordset for the tblDebtorClientUser table
    Set rs1 = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    ' Create a recordset for the tblTmpDebtor table
    Set rs2 = dB.OpenRecordset("tblTmpDebtor", dbOpenDynaset, dbSeeChanges)

    ' Loop through the records in the tblDebtorClientUser table
    Do While Not rs1.EOF

        ' Create a new record in the tblTmpDebtor table
        If rs1!Afdeling = [strAfd] And (rs1!Status = "Aktiv" Or rs1!Paragraf <> "" Or rs1!AntalM2 <> 0) Then

            rs2.AddNew

            ' Set the values of the fields in the new record
            rs2!Takst = Nz(rs1!Takst, 0)
            rs2![Status Dato] = rs1![Status Dato]
            rs2!Paragraf = Nz(rs1!Paragraf, "")
            rs2![Xtra takst] = Nz(rs1![Xtra takst], 0)
            rs2!Konto = Nz(rs1!Konto, "")
            rs2!Kontonavn = Nz(rs1!Kontonavn, "")
            rs2![Adresse 1] = Nz(rs1![Adresse 1], "")
            rs2!Afdeling = Nz(rs1!Afdeling, "")
            rs2!Year_ = intYear
            rs2!FremskrivPct = dblFrmPct
            rs2!M2 = Nz(rs1!AntalM2, 0)

    '        ' Calculate the DatoFra and DatoTil fields
            If Year(Nz(rs1![Status Dato], 1900)) < intYear Then
                rs2!DatoFra = DateSerial(intYear, 1, 1)
            Else
                rs2!DatoFra = rs1![Status Dato]
            End If

            rs2!DatoTil = DateSerial(intYear, 12, 31)

            ' Calculate the XtraTakstFremskr, TotalTakstMdr, and TotalTakstDÅ fields
            rs2!FremskrivBeløb = Nz(rs1!Takst, 0) * (1 + dblFrmPct)
            rs2!XtraTakstFremskr = Nz(rs1![Xtra takst], 0) * (1 + dblFrmPct)
            rs2!TotalTakstMdr = (Nz(rs1!Takst, 0) * (1 + dblFrmPct)) + (Nz(rs1![Xtra takst], 0) * (1 + dblFrmPct))
            rs2!TotalTakstDÅ = Nz(rs2!TotalTakstMdr, 0) * ((Month(rs2!DatoTil) - Month(rs2!DatoFra) + 1))


            rs2.Update

        End If

        rs1.MoveNext

    Loop

' Close the recordsets
rs1.Close
rs2.Close

Call FilterYearAfd
Call fncTotalPrg
Me.Repaint


Exit Sub

ErrorHandler:
    MsgBox "Error: " & Err.Description, vbExclamation
End Sub

Private Sub Form_Load()
Dim arrArgs()               As String
Dim lngPrisID               As Long
Dim strPrisNavn             As String
Dim strPrisAfd              As String
Dim intPrisYear             As Integer
Dim rs                      As DAO.Recordset
Dim strSQL                  As String
Dim strUser                 As String

    strUser = Environ$("USERNAME")
    ' Hent tidligere værdier
    AssignValuesToFormObjects Me, strUser, Me.Name


    intYear = val(Nz(Me.cboYearAfdDeb, 0))
    If intYear = 0 Then
        intYear = Year(Date)
    End If

    isFromPrisberegning = False

   '--- Tjek om formularen er åbnet fra frmPrisberegning -------------
    If Not IsNull(Me.OpenArgs) Then
        arrArgs = Split(Me.OpenArgs, "|")
        If UBound(arrArgs) >= 3 And IsNumeric(arrArgs(0)) Then
            lngPrisID = CLng(arrArgs(0))
            strPrisNavn = arrArgs(1)
            intPrisYear = CInt(arrArgs(2))
            strPrisAfd = Nz(arrArgs(3), "")

            strSQL = "SELECT ID FROM tblPrisberegning WHERE ID = " & lngPrisID & _
                     " AND PrisberegningNavn = '" & Replace(strPrisNavn, "'", "''") & "'"
            Set rs = CurrentDb.OpenRecordset(strSQL, dbOpenSnapshot)
            If Not rs.EOF Then isFromPrisberegning = True
            rs.Close: Set rs = Nothing
        End If
    End If

    '--- Gem til TempVars så andre subrutiner kan tilgå værdierne ------
    TempVars("isFromPrisberegning") = isFromPrisberegning
    If isFromPrisberegning Then
        TempVars("currentID") = lngPrisID
        TempVars("currentPrisberegningNavn") = strPrisNavn
        TempVars("currentPrisberegningAfd") = strPrisAfd
        TempVars("currentAfdeling") = strPrisAfd
    End If
    TempVars("currentYear") = IIf(isFromPrisberegning, intPrisYear, 0)

    '--- Kald helper så modulvariabler sættes -------------------------
    Call fncTempVarTilCurrent(isFromPrisberegning)

    '--- UI-opsætning -------------------------------------------------
    If isFromPrisberegning Then
        Me.RecordSource = "tblPrisberegning"      ' gør formen letvægtet
        Me.cboYearAfdDeb = currentYear
        Me.cboAfdeling = strPrisNavn
    Else
        Me.cboYearAfdDeb = intYear
    End If

    Call SetCboAfdelingRowSource
    Call FilterYearAfd
    Call fncTotalPrg

End Sub
Public Function fncTotalPrg()
Dim dB As DAO.Database
Dim rsT As DAO.Recordset
Dim strSQL As String

   Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))
   intYear = Nz(Me.cboYearAfdDeb, 0)
   strAfd = Nz(Me.cboAfdeling, "1")

    Me.TextGodk_DIV = ""
    Me.TextGodk_043 = ""
    Me.TextGodk_085 = ""
    Me.TextGodk_101 = ""
    Me.TextGodk_104 = ""
    Me.TextGodk_107 = ""
    Me.TextGodk_108 = ""
    Me.TextGodk_110 = ""
    Me.TextGodkIalt = ""

    Me.TextAar_DIV = ""
    Me.TextAar_043 = ""
    Me.TextAar_085 = ""
    Me.TextAar_101 = ""
    Me.TextAar_104 = ""
    Me.TextAar_107 = ""
    Me.TextAar_108 = ""
    Me.TextAar_110 = ""
    Me.TextAarIalt = ""

    Me.TextBeb_DIV = ""
    Me.TextBeb_043 = ""
    Me.TextBeb_085 = ""
    Me.TextBeb_101 = ""
    Me.TextBeb_104 = ""
    Me.TextBeb_107 = ""
    Me.TextBeb_108 = ""
    Me.TextBeb_110 = ""
    Me.TextBebIalt = ""

    Me.TextBlb_DIV = ""
    Me.TextBlb_043 = ""
    Me.TextBlb_085 = ""
    Me.TextBlb_101 = ""
    Me.TextBlb_104 = ""
    Me.TextBlb_107 = ""
    Me.TextBlb_108 = ""
    Me.TextBlb_110 = ""
    Me.TextBlbIalt = ""

'Henter alle godkendte beboerantal pr. paragraf i tabellen tblFB_Totaler
    If intYear > 0 And strAfd <> "" Then

        Set dB = CurrentDb()

        strSQL = "SELECT * FROM tblFB_Totaler " & _
                 "WHERE Year_ = " & intYear & " AND Afdeling = '" & strAfd & "'"

        Set rsT = dB.OpenRecordset(strSQL, dbOpenDynaset, dbSeeChanges)

        If Not rsT.EOF Then
            Do While Not rsT.EOF
                With rsT
                    Me.TextGodk_DIV = Nz(!Godk_div, "")
                    Me.TextGodk_043 = Nz(!Godk_043, "")
                    Me.TextGodk_085 = Nz(!Godk_085, "")
                    Me.TextGodk_101 = Nz(!Godk_101, "")
                    Me.TextGodk_104 = Nz(!Godk_104, "")
                    Me.TextGodk_107 = Nz(!Godk_107, "")
                    Me.TextGodk_108 = Nz(!Godk_108, "")
                    Me.TextGodk_110 = Nz(!Godk_110, "")

                    Call SumGodkPrg
                End With
                rsT.MoveNext
            Loop
        End If
    End If

    Call fncBeboereOgBeløb

    DoEvents

End Function
Private Function SumGodkPrg()
    Dim sumFields As Variant
    Dim ctrlName As Variant
    Dim totalSum As Double

    sumFields = Array("TextGodk_DIV", "TextGodk_043", "TextGodk_085", "TextGodk_101", "TextGodk_104", "TextGodk_107", "TextGodk_108", "TextGodk_110")
    totalSum = 0

    For Each ctrlName In sumFields
        If Not IsNull(Me.Controls(ctrlName).value) And Me.Controls(ctrlName).value <> "" Then
            totalSum = totalSum + CDbl(Me.Controls(ctrlName).value)
            Me.Controls(ctrlName).Requery
        End If
    Next

    Me.TextGodkIalt = totalSum
    'Call SumBebPrg
End Function
Private Function SumBebPrg()
    Dim sumFields As Variant
    Dim ctrlName As Variant
    Dim totalSum As Double

    sumFields = Array("TextBeb_DIV", "TextBeb_043", "TextBeb_085", "TextBeb_101", "TextBeb_104", "TextBeb_107", "TextBeb_108", "TextBeb_110")
    totalSum = 0

    For Each ctrlName In sumFields
        If Not IsNull(Me.Controls(ctrlName).value) And Me.Controls(ctrlName).value <> "" Then
            totalSum = totalSum + CDbl(Me.Controls(ctrlName).value)
            Me.Controls(ctrlName).Requery
        End If
    Next

    Me.TextBebIalt = totalSum
    'Call SumBlbPrg
End Function
Private Function SumBlbPrg()
    Dim sumFields As Variant
    Dim ctrlName As Variant
    Dim totalSum As Double

    sumFields = Array("TextBlb_DIV", "TextBlb_043", "TextBlb_085", "TextBlb_101", "TextBlb_104", "TextBlb_107", "TextBlb_108", "TextBlb_110")
    totalSum = 0

    For Each ctrlName In sumFields
        If Not IsNull(Me.Controls(ctrlName).value) And Me.Controls(ctrlName).value <> "" Then
            totalSum = totalSum + CDbl(Me.Controls(ctrlName).value)
            Me.Controls(ctrlName).Requery
        End If
    Next

    Me.TextBlbIalt = totalSum
End Function
Public Function fncBeboereOgBeløb()
    Dim dB As DAO.Database
    Dim dblDivAmount As Double
    Dim dblDivBeboere As Double
    Dim str As String
    Dim rsT As DAO.Recordset
    Dim dblTotalBeboere As Double
    Dim dblTotalAmountYear As Double
    Dim intPrgNumber As Integer
    Dim strCode As String
    Dim ctlName As String
    Dim frm As Form
    Dim intCntPrg As Variant
    Dim dblTotalBebAar As Double

    Call fncTempVarTilCurrent(TempVars("isFromPrisberegning"))

    intYear = Me.cboYearAfdDeb
    strAfd = Nz(Me.cboAfdeling, "1")

    Set frm = Me

    str = "SELECT Sum(1) as TotalBeboere, Sum(TotalTakstDÅ) AS TotalYear, Sum(Month(DatoTil)-Month(DatoFra)+1) As TotalBebAar ,Paragraf " & _
            "FROM tblTmpDebtor " & _
            "WHERE Afdeling = '" & strAfd & "' And Year_ = " & intYear & " And Paragraf <> '' " & _
            "GROUP BY Paragraf"


            Set dB = CurrentDb()
            Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

                If rsT.RecordCount > 0 Then
                    Do While Not rsT.EOF


                        If rsT!Paragraf = "DIV" Or rsT!Paragraf = "TAKST" Or rsT!Paragraf = "Projekt Simon K. S." Or rsT!Paragraf = "EJD" Then

                            dblDivAmount = dblDivAmount + Nz(rsT!TotalBeboere, 0)
                            dblDivBeboere = dblDivBeboere + Nz(rsT!TotalBeboere, 0)

                            dblTotalBeboere = dblTotalBeboere + Nz(rsT!TotalBeboere, 0)
                            dblTotalAmountYear = dblTotalAmountYear + Nz(rsT!TotalYear, 0)

                        Else

                            intPrgNumber = CInt(Mid(rsT!Paragraf, 2, 3))
                            strCode = Format(intPrgNumber, "000")

                            ctlName = "TextBeb_" & strCode
                            frm.Controls(ctlName).value = Nz(rsT!TotalBeboere, 0)

                            ctlName = "TextBlb_" & strCode
                            frm.Controls(ctlName).value = Nz(rsT!TotalYear, 0)

                            ctlName = "TextAar_" & strCode
                            frm.Controls(ctlName).value = Nz(rsT!TotalBebAar, 0) / 12

                            dblTotalBeboere = dblTotalBeboere + Nz(rsT!TotalBeboere, 0)
                            dblTotalBebAar = dblTotalBebAar + Nz(rsT!TotalBebAar, 0)
                            dblTotalAmountYear = dblTotalAmountYear + Nz(rsT!TotalYear, 0)

                        End If

                        rsT.MoveNext
                        intCntPrg = intCntPrg + 1

                    Loop
                End If

        If dblDivAmount Or dblDivBeboere Then
            Me.TextBeb_DIV.value = dblDivAmount
            Me.TextBlb_DIV.value = dblDivBeboere
        End If

        frm.Controls("TextBebIalt").value = dblTotalBeboere
        frm.Controls("TextBebIalt").Requery
        frm.Controls("TextAarIalt").value = dblTotalBebAar / 12
        frm.Controls("TextAarIalt").Requery
        frm.Controls("TextBlbIalt").value = dblTotalAmountYear
        frm.Controls("TextBlbIalt").Requery

    'Kalder alle summeringskoder da de bliver kaldt i sekvens fra den første
    'Call SumGodkPrg

End Function

Private Sub Form_Unload(Cancel As Integer)
    Dim params As New Scripting.Dictionary
    Dim usr As String: usr = Environ$("USERNAME")

    On Error Resume Next
    params.Add "cboYearAfdDeb", Nz(Me.cboYearAfdDeb, "")
    params.Add "cboAfdeling", Nz(Me.cboAfdeling, "")
    On Error GoTo 0

    SaveFormParameters usr, Me.Name, "", "", params
End Sub

Private Sub frm_UnderTmpAfdDebitorBudget_Exit(Cancel As Integer)
'MsgBox "On Exit Frame"
End Sub
Private Sub TextGodk_043_AfterUpdate()
    Call UpdateGodkValue("043", Me)
End Sub
Public Function UpdateGodkValue(strCode As String, frm As Form)
    Dim strSQL As String
    Dim strValue As String
    Dim ctlName As String

    intYear = Me.cboYearAfdDeb.value
    strAfd = Me.cboAfdeling.value

    ctlName = "TextGodk_" & strCode

    If IsNull(frm.Controls(ctlName).value) Or frm.Controls(ctlName).value = "" Then
        strValue = "0"
    Else
        strValue = frm.Controls(ctlName).value
    End If

   strSQL = "UPDATE tblFB_Totaler SET Godk_" & strCode & " = " & strValue & _
             " WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear & ";"

    DoCmd.SetWarnings False
    DoCmd.RunSQL strSQL
    DoCmd.SetWarnings True

    Call SumGodkPrg

End Function

Private Sub TextGodk_085_AfterUpdate()
 Call UpdateGodkValue("085", Me)
End Sub

Private Sub TextGodk_101_AfterUpdate()
 Call UpdateGodkValue("101", Me)
End Sub

Private Sub TextGodk_104_AfterUpdate()
 Call UpdateGodkValue("104", Me)
End Sub

Private Sub TextGodk_107_AfterUpdate()
 Call UpdateGodkValue("107", Me)
End Sub

Private Sub TextGodk_108_AfterUpdate()
 Call UpdateGodkValue("108", Me)
End Sub

Private Sub TextGodk_110_AfterUpdate()
 Call UpdateGodkValue("110", Me)
End Sub

Private Sub TextGodk_DIV_AfterUpdate()
Call UpdateGodkValue("div", Me)
End Sub
Private Sub SetCboAfdelingRowSource()
    If isFromPrisberegning Then
        ' Åbnet fra Prisberegning: filtrér på BudgetAar = currentYear
        Me.cboAfdeling.RowSource = _
            "SELECT PrisberegningNavn FROM tblPrisberegning " & _
            "WHERE BudgetAar = " & Nz(currentYear, 0) & " ORDER BY PrisberegningNavn;"
        Me.cboAfdeling.BoundColumn = 1
        Me.cboAfdeling.ColumnCount = 1
        Me.cboAfdeling.ColumnWidths = "5cm"     ' gør det eksplicit
    Else
        ' Standard: filtrér på Year_ = Me.cboYearAfdDeb
        Dim y As Long: y = Nz(Me.cboYearAfdDeb, Nz(intYear, Year(Date)))
        Me.cboAfdeling.RowSource = _
            "SELECT [AfdNr Uniconta], AfdelingsNavn FROM tblAfdeling " & _
            "WHERE Year_ = " & y & " ORDER BY [AfdNr Uniconta];"
        Me.cboAfdeling.BoundColumn = 1
        Me.cboAfdeling.ColumnCount = 2
        Me.cboAfdeling.ColumnWidths = "0cm;5cm"
    End If

    Me.cboAfdeling.Requery   ' vigtigt ved årsskift!
End Sub
