Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub btnExcel_Click()
Dim str As String
Dim strAfd As String
Dim intYear As Integer
Dim intRev As Integer
Dim strFrom As String

    strAfd = Me.txtPrisberegningNavn
    intYear = Me.cboBudgetår
    strFrom = "Prisberegning"

    Call printIB(strAfd, intYear, strFrom)

    MsgBox "Overførsel til Excel er færdig"

End Sub

Private Sub btnHelp_Click()
    Application.FollowHyperlink "https://www.it-regnskab.dk/suf/prisberegning/"
End Sub

Private Sub btnRedigerBudget_Click()
    ' Formål: Åbn formen for medarbejderbudget for den valgte prisberegning
    Dim intYear As Integer
    Dim intYearGrund As Integer
    Dim lngPrisberegningID As Long
    Dim strPrisberegningNavn As String
    Dim strPrisberegningAfd As String
    Dim strAfdeling As String
    Dim intAntalPladser As Integer
    Dim intKM As Integer
    Dim intOgrad As Double
    Dim intBeregnType As Integer

    intYearGrund = Nz(Me.frmPrisberegning_subform.Form("Year_").value, 0)

    If intYearGrund = 0 Then
            MsgBox "Vælg År grundlag ", vbExclamation
        Exit Sub
    End If

    intYear = Nz(Me.cboBudgetår, 0)
    lngPrisberegningID = Nz(Me.frmPrisberegning_subform.Form("ID").value, 0)
    intBeregnType = Nz(Me.frmPrisberegning_subform.Form("BeregnType").value, 0)

    If intYear = 0 Or lngPrisberegningID = 0 Then
        MsgBox "Vælg både år og prisberegning først.", vbExclamation
        Exit Sub
    End If

    ' Send både ID og navn via OpenArgs - adskilt med |
    DoCmd.OpenForm "frmSUF_InterntBudget", acNormal, , , acFormEdit, acDialog, lngPrisberegningID & "|" & intYear & "|" & intBeregnType

End Sub

Private Sub btnRedigerDebitor_Click()
    ' Formål: Åbn formen for medarbejderbudget for den valgte prisberegning
    Dim intYear As Integer
    Dim lngPrisberegningID As Long
    Dim strPrisberegningNavn As String
    Dim strPrisberegningAfd As String
    Dim strAfdeling As String

    If Me.frmPrisberegning_subform.Form("BeregnType").value = 2 Then
        MsgBox "Du kan ikke oprette debitorer til en beregningstype 3"
        Exit Sub
    End If

    intYear = Nz(Me.cboBudgetår, 0)
    lngPrisberegningID = Nz(Me.frmPrisberegning_subform.Form("ID").value, 0)
    strPrisberegningNavn = Nz(Me.frmPrisberegning_subform.Form("PrisberegningNavn").value, "")
    strPrisberegningAfd = Nz(ELookup("Afdeling", "tblPrisberegning", "PrisberegningNavn = '" & strPrisberegningNavn & "'"), "")

    'Finder ud af om afdelingen i tblPrisberegning eksisterer som en rigtig afdeling eller ej
    If strPrisberegningAfd <> "" Then
        strAfdeling = Nz(ELookup("[AfdNr Uniconta]", "tblAfdeling", "Afdeling = '" & strPrisberegningAfd & "'"), "")

        If strAfdeling = "" Then
            strAfdeling = strPrisberegningAfd
        End If
    End If

    If intYear = 0 Or lngPrisberegningID = 0 Then
        MsgBox "Vælg både år og prisberegning først.", vbExclamation
        Exit Sub
    End If

    TempVars("isFromPrisberegning").value = True
    TempVars("currentAfdeling").value = strAfdeling
    TempVars("currentPrisberegningNavn").value = strPrisberegningNavn

    ' Send både ID og navn via OpenArgs - adskilt med |
    DoCmd.OpenForm "frmAfdDebitorBudget", acNormal, , , acFormEdit, acDialog, lngPrisberegningID & "|" & strPrisberegningNavn & "|" & intYear & "|" & strAfdeling
End Sub

Private Sub btnRedigerMedarbejder_Click()
    ' Formål: Åbn formen for medarbejderbudget for den valgte prisberegning
    Dim intYear As Integer
    Dim intYearGrund As Integer
    Dim lngPrisberegningID As Long
    Dim strPrisberegningNavn As String
    Dim strPrisberegningAfd As String
    Dim strAfdeling As String


    intYearGrund = Nz(Me.frmPrisberegning_subform.Form("Year_").value, 0)

    If intYearGrund = 0 Then
            MsgBox "Vælg År grundlag ", vbExclamation
        Exit Sub
    End If

    intYear = Nz(Me.cboBudgetår, 0)
    lngPrisberegningID = Nz(Me.frmPrisberegning_subform.Form("ID").value, 0)
    strPrisberegningNavn = Nz(Me.frmPrisberegning_subform.Form("PrisberegningNavn").value, "")
    strPrisberegningAfd = Nz(Me.frmPrisberegning_subform.Form("Afdeling").value, "")

    'Finder ud af om afdelingen i tblPrisberegning eksisterer som en rigtig afdeling eller ej og hvis ikke, så er det en kopi af eksist. prisberegning.
    If strPrisberegningAfd <> "" Then

        strAfdeling = Nz(ELookup("[AfdNr Uniconta]", "tblAfdeling", "Afdeling = '" & strPrisberegningAfd & "'"), "")

        If strAfdeling = "" Then
            strAfdeling = strPrisberegningAfd
        End If

    End If

    If intYear = 0 Or lngPrisberegningID = 0 Then
        MsgBox "Vælg både år og prisberegning først.", vbExclamation
        Exit Sub
    End If

    TempVars("isFromPrisberegning").value = True
    TempVars("currentAfdeling").value = strAfdeling
    TempVars("currentPrisberegningNavn").value = strPrisberegningNavn
    TempVars("intYearGrund").value = intYearGrund
    TempVars("currentYear").value = intYear

    ' Send både ID og navn via OpenArgs - adskilt med |
    DoCmd.OpenForm "frmAfdMedarbBudget", acNormal, , , acFormEdit, acDialog, lngPrisberegningID & "|" & strPrisberegningNavn & "|" & intYear & "|" & strAfdeling & "|" & intYearGrund
End Sub

'============================================================
'  FORM  –  LOAD / UNLOAD
'============================================================
Private Sub Form_Load()
    Dim strUser As String
    strUser = Environ$("USERNAME")

    ' Hent tidligere værdier
    AssignValuesToFormObjects Me, strUser, Me.Name


    ' Deaktiver felter og knapper indtil Budgetår er valgt
    EnableControls False

    ' Hvis Budgetår allerede er valgt fra sidste session – enable igen
    If Not IsNull(Me.cboBudgetår) Then
        EnableControls True
    End If

    SyncSubformToID


End Sub
Private Sub SyncSubformToID()
    Dim rsT As DAO.Recordset
    If IsNull(Me.ID) Then Exit Sub

    With Me.frmPrisberegning_subform.Form   ' <-- navnet på underformular-controlen
        Set rsT = .RecordsetClone
        rsT.FindFirst "[ID]=" & Me.ID
        If Not rsT.NoMatch Then .Bookmark = rsT.Bookmark
        rsT.Close
    End With
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Dim params As New Scripting.Dictionary
    Dim usr As String: usr = Environ$("USERNAME")

    On Error Resume Next
    params.Add "cboBudgetår", Nz(Me.cboBudgetår, "")
    params.Add "txtPrisberegningNavn", Nz(Me.frmPrisberegning_subform.Form("txtPrisberegningNavn").value, "")
    params.Add "txtVersion", Nz(Me.txtVersion, Null)
    params.Add "txtAntalPladser", IIf(Nz(Me.frmPrisberegning_subform.Form("AntalPladser").value, 0) = 0, 1, Me.frmPrisberegning_subform.Form("AntalPladser").value)
    params.Add "ID", Nz(Me.frmPrisberegning_subform.Form("ID").value, 0)
    On Error GoTo 0

    SaveFormParameters usr, Me.Name, "", "", params

    TempVars.Remove ("isFromPrisberegning")
    TempVars.Remove ("currentAfdeling")
    TempVars.Remove ("currentPrisberegningNavn")
    TempVars.Remove ("intYearGrund")
    TempVars.Remove ("currentYear")

End Sub

'============================================================
'  AKTIVER / DEAKTIVER FELTER OG KNAPPER
'============================================================
Private Sub EnableControls(blnEnable As Boolean)
    Me.txtBeskrivelse.Enabled = blnEnable
    Me.txtPrisberegningNavn.Enabled = blnEnable
    Me.txtVersion.Enabled = blnEnable
    Me.txtAntalPladser.Enabled = blnEnable

    Me.btnRedigerBudget.Enabled = blnEnable
    Me.btnRedigerMedarbejder.Enabled = blnEnable
    Me.btnOpretNyPrisberegning.Enabled = True ' denne er ALTID aktiv
End Sub
'============================================================
'  NY PRISBEREGNING – ÅBNER FORMEN OG INDSÆTTER VALG EFTERFØLGENDE
'============================================================
Private Sub btnOpretNyPrisberegning_Click()
    On Error GoTo Fejl

    DoCmd.OpenForm "frmPrisberegningOpret", , , , , acDialog
    Exit Sub

Fejl:
    MsgBox "Fejl i opret ny prisberegning: " & Err.Description, vbCritical
End Sub

'============================================================
'  TILBUDSSKABELON – ÅBNER FORMEN MED VALGT PRISBEREGNING
'============================================================
Private Sub btnTilbudsskabelon_Click()
    On Error GoTo Fejl

    Dim lngPrisberegningID As Long
    Dim strPrisberegningNavn As String
    Dim intYear As Integer

    lngPrisberegningID = Nz(Me.frmPrisberegning_subform.Form("ID").value, 0)
    strPrisberegningNavn = Nz(Me.frmPrisberegning_subform.Form("PrisberegningNavn").value, "")
    intYear = Nz(Me.cboBudgetår, 0)

    If lngPrisberegningID = 0 Or intYear = 0 Then
        MsgBox "Vælg en prisberegning og et budgetår først.", vbExclamation
        Exit Sub
    End If

    ' Åbn TilbudsSkabelon og send PrisberegningID|Navn|År via OpenArgs
    DoCmd.OpenForm "frmSUF_TilbudsSkabelon_Total", acNormal, , , acFormEdit, acDialog, _
        lngPrisberegningID & "|" & strPrisberegningNavn & "|" & intYear

    Exit Sub
Fejl:
    MsgBox "Fejl i Tilbudsskabelon: " & Err.Description, vbCritical
End Sub
