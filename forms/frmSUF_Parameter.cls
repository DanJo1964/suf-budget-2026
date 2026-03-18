Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub cboYear_AfterUpdate()
    Call FilterForYear

End Sub
Private Sub Form_Load()
Dim intYear As Integer

    Dim strUser As String
    strUser = Environ$("USERNAME")

    ' Hent tidligere værdier
    AssignValuesToFormObjects Me, strUser, Me.Name

    Call FilterForYear

End Sub
Private Sub FilterForYear()
Dim intYear As Integer

    intYear = Nz(Me.cboYear, 0)

    If intYear = 0 Then
        Me.cboYear = 2025
        intYear = 2025
    End If

    Me.frmParm_Løntrin.Form.filter = "[BudgetYear] = " & intYear
    Me.frmParm_Løntrin.Form.FilterOn = True

    Me.frmParm_Timeløn.Form.filter = "[BudgetYear] = " & intYear
    Me.frmParm_Timeløn.Form.FilterOn = True

    Me.Pensionsafsavnstillæg.Form.filter = "[BudgetYear] = " & intYear
    Me.Pensionsafsavnstillæg.Form.filter = "[BudgetYear] = " & intYear

    Me.frmParm_BeløbUdenKonti.Form.filter = "[BudgetYear] = " & intYear
    Me.frmParm_BeløbUdenKonti.Form.FilterOn = True

    Me.frmParm_PctUdenKonti.Form.filter = "[BudgetYear] = " & intYear
    Me.frmParm_PctUdenKonti.Form.FilterOn = True

    Me.frmParm_BeløbPctMedKonti.Form.filter = "[BudgetYear] = " & intYear
    Me.frmParm_BeløbPctMedKonti.Form.FilterOn = True

    Me.frmParm_FB_Excel_Kti.Form.filter = "Year_ = " & intYear
    Me.frmParm_FB_Excel_Kti.Form.FilterOn = True

End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim params As New Scripting.Dictionary
    Dim usr As String: usr = Environ$("USERNAME")

    On Error Resume Next
    params.Add "cboYear", Nz(Me.cboYear, "")
    On Error GoTo 0

    SaveFormParameters usr, Me.Name, "", "", params


End Sub
