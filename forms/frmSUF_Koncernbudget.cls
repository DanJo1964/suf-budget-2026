Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub btnWriteToExcel_Click()
Dim intYear As Integer

    intYear = Me.cboYear
    Me.lblArbejder.Visible = True
    Call ExportBudget5Sheets_Hardcoded(intYear)
    DoEvents
    Me.lblArbejder.Visible = False

End Sub

Private Sub cboYear_AfterUpdate()
    Call ReloadBudget
End Sub

Private Sub Form_Load()
Dim strFormName As String
Dim strUser As String

Call SetupDynamicFormatting

    strFormName = Me.Name
    strUser = Environ("USERNAME") ' Get current Windows user

    ' Call the function to assign values to form objects
    AssignValuesToFormObjects Me, strUser, strFormName

    Call ReloadBudget


End Sub
Private Sub SetupDynamicFormatting()

    Dim ctl As Control
    Dim fc As FormatCondition
    Dim expr As String

    ' Udtryk der afgør om linjen skal være fed
    expr = "[Kontotype]='Overskrift' OR [Kontotype]='Sum'"

    ' Loop gennem alle kontroller i detaljesektionen
    For Each ctl In Me.Section(acDetail).Controls
        ' Kun tekstfelter og talfelter skal formateres
        If ctl.ControlType = acTextBox Then
            ' Fjern gamle regler
            ctl.FormatConditions.Delete

            ' Opret ny regel
            Set fc = ctl.FormatConditions.Add(acExpression, , expr)
            fc.FontBold = True
        End If
    Next ctl

End Sub

Private Sub ReloadBudget()
    Dim y As Long
    Dim sql As String

    If IsNull(Me.cboYear) Then
        Me.RecordSource = "SELECT * FROM dbo_vwInterntBudget_SumByYearKonto WHERE Year_ = 0"
        Exit Sub
    End If

    y = Me.cboYear

    sql = "SELECT * FROM dbo_vwInterntBudget_SumByYearKonto WHERE Year_ = " & y

    Me.RecordSource = sql
    Me.Requery
End Sub

Private Sub Form_Unload(Cancel As Integer)
Dim params As New Scripting.Dictionary
Dim strCurrUser As String

strCurrUser = Environ("USERNAME")

params.Add "cboYear", Me.cboYear.value

Call SaveFormParameters(strCurrUser, "frmSUF_Koncernbudget", "", "", params)
End Sub
