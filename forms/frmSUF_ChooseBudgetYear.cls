Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub btnCreateLines_Click()

    Call fncCreateNewYear(Me.tbxNewestYear)

    DoEvents

    Me.tbxNewestYear = fncFindLastYear

    Call fncUpdateCurrentYear(CInt(Me.tbxNewestYear.value))

    Me.cbxChooseYear = Me.tbxNewestYear.value

    fncFilterDashboard

    Me.Refresh

    MsgBox ("Nyt år er oprettet!")

End Sub

Private Sub btnExpCsv_Click()
Dim intYear As Integer

    intYear = Me.cbxChooseYear

    'Call ConnectToOData("tmpAfdeling_49783", "GLDimType1Client", "49783")
    'Call ConnectToOData("tmpAfdeling_49782", "GLDimType1Client", "49782")
    'Call ConnectToOData("tmpAfdeling_49780", "GLDimType1Client", "49780")
    'Call ConnectToOData("tmpAfdeling_48928", "GLDimType1Client", "48928")

    'Call BudgetModelExportTableToCSV(intYear, "49783")
    'Call BudgetModelExportTableToCSV(intYear, "49782")
    'Call BudgetModelExportTableToCSV(intYear, "49780")
    'Call BudgetModelExportTableToCSV(intYear, "48928")



End Sub

Private Sub btnPrintIB_Click()
Dim str As String
Dim strAfd As String
Dim intYear As Integer
Dim intRev As Integer
Dim strFrom As String

    strAfd = Me.cboAfdelingUni
    intYear = Me.cbxChooseYear
    strFrom = "Afdeling"

    Call printIB(strAfd, intYear, strFrom)

    MsgBox "Overførsel til Excel er færdig"

    str = "UPDATE tblDashboard SET IB_SendtLeder = true where [AfdNr Uniconta] = '" & strAfd & "' And Year_ = " & intYear

    DoCmd.SetWarnings False
    DoCmd.RunSQL str

    Me.frmDashboard.Form.Requery

    DoCmd.SetWarnings True


End Sub

Private Sub cboAfdelingUni_AfterUpdate()
Dim strAfd As String
    strAfd = ELookup("Afdeling", "tblAfdeling", "[AfdNr Uniconta] = '" & Me.cboAfdelingUni & "' And Year_ = " & Me.cbxChooseYear)
    'Call cboRevision_GotFocus

    Call fncUpdateCurrentDept(strAfd, Me.cboAfdelingUni, 0)

End Sub

Private Sub cboAfdelingUni_GotFocus()
Dim strYear As String
Dim str As String

'get the selected year from the other combobox
strYear = Nz(Me.cbxChooseYear.value, Me.tbxNewestYear.value)

'set the data source to a query that filters by year
str = "SELECT [AfdNr Uniconta], AfdelingsNavn FROM tblAfdeling WHERE Year_ = " & CInt(strYear) & " ORDER BY [AfdNr Uniconta]"

Me.cboAfdelingUni.RowSource = str
Me.cboAfdelingUni.Requery 'refresh the combobox to show the updated data

End Sub
Private Sub cbxChooseYear_AfterUpdate()

    ' Opdater den gemte værdi for brugerens valgte år
    Call fncUpdateCurrentYear(CInt(Me.cbxChooseYear))

    ' Kald filter- og opdateringsfunktionen
    fncFilterDashboard

End Sub

Function fncFilterDashboard()
    ' *** ÆNDRING HER: Sørg for at referere til subform-kontrollen ved navn ***
    Me.frmDashboard.Form.filter = "Year_ = " & Me.cbxChooseYear
    Me.frmDashboard.Form.FilterOn = True
    Me.frmDashboard.Form.OrderBy = "[AfdNr Uniconta]" ' Ofte unødvendig hvis subformens RecordSource allerede er sorteret

    ' *** VIGTIGT: Kald opdateringen EFTER filteret er sat ***
    Call UpdateOverskudsgrad

End Function
Public Sub UpdateOverskudsgrad()
    'On Error GoTo Err_UpdateOverskudsgrad

    ' Definer subform-objektet for at gøre koden lettere at læse
    Dim frmSub As Form
    Set frmSub = Me.frmDashboard.Form ' *** ÆNDRING HER ***

    ' Tjek om der er valgt et år
    If IsNull(Me.cbxChooseYear.value) Then Exit Sub

    ' *** ÆNDRING HER: Tjek recordcount på subformen ***
    If frmSub.Recordset.RecordCount = 0 Then
        Exit Sub ' Der er ingen poster at behandle
    End If

    ' Definer variable
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim selectedYear As Long
    Dim currentAfdeling As String
    Dim foundOverskudsgrad As Double

    Set dB = CurrentDb
    ' *** ÆNDRING HER: Klon subformens recordset ***
    Set rs = frmSub.RecordsetClone
    selectedYear = Me.cbxChooseYear.value

    If rs.RecordCount > 0 Then
        rs.MoveFirst
        Do While Not rs.EOF
            currentAfdeling = rs![AfdNr Uniconta]

            foundOverskudsgrad = Nz(DLookup("Overskudsgrad", "tblFB_Totaler", "Afdeling = '" & currentAfdeling & "' AND Year_ = " & selectedYear), 0)
            If foundOverskudsgrad <> 0 Then
                foundOverskudsgrad = foundOverskudsgrad * 0.01
            End If
            rs.Edit
            rs!OverskudsGrad = foundOverskudsgrad
            rs.Update

            rs.MoveNext
        Loop
    End If

    ' Opdater subformen for at vise de nye værdier
    frmSub.Requery

Exit_UpdateOverskudsgrad:
    Set rs = Nothing
    Set dB = Nothing
    Set frmSub = Nothing
    Exit Sub

Err_UpdateOverskudsgrad:
    MsgBox "Der opstod en fejl i UpdateOverskudsgrad: " & vbCrLf & Err.Description, vbCritical, "Fejl i opdatering"
    Resume Exit_UpdateOverskudsgrad

End Sub

Private Sub Form_Open(Cancel As Integer)
' Denne sub kører ÉN gang, når formen åbner. Perfekt til setup.

    ' Find det nyeste år og gem det i en tekstboks
    Me.tbxNewestYear = fncFindLastYear

    ' Sæt komboboksens værdi til brugerens sidst valgte år, ellers det nyeste år
    Me.cbxChooseYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), Me.tbxNewestYear)

    ' Sæt afdelings-komboboksens værdi
    Me.cboAfdelingUni = Nz(ELookup("[AfdNr Uniconta]", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), "")

    ' Kald filterfunktionen for at anvende filter og starte databeregning
    Call fncFilterDashboard

End Sub

Private Sub Form_Undo(Cancel As Integer)

    DoCmd.Maximize

End Sub
