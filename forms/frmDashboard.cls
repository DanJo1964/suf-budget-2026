Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub Form_Load()
    Dim strSQL As String
    Dim strAfdeling As String
    Dim intRev As Integer
    Dim intYear As Integer

    intYear = Nz(Me.Parent.cbxChooseYear, 0)


    If intYear = 0 Then
        intYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)
    End If

    strSQL = "UPDATE tblDashboard AS d " & _
            "INNER JOIN tblFB_Totaler AS t " & _
            "ON d.[AfdNr Uniconta] = t.Afdeling " & _
            "AND d.Year_ = t.Year_ " & _
            "Set d.[OverskudsGrad] = t.OverskudsGrad " & _
            "WHERE t.Overskudsgrad <> 0 AND d.Year_ = " & intYear & " And d.Revision = " & intRev


    DoCmd.SetWarnings False

        DoCmd.RunSQL strSQL

    DoCmd.SetWarnings True

End Sub
