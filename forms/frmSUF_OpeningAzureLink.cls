Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnAzureRelink_Click()

    Me.lblForbinder.Visible = True
    DoEvents

    MsgBox "Klik OK 1"

    'Call RelinkTables("ITF")
    SkiftTilMiljo_og_SikrViews "ITF"

    MsgBox "Klik OK 2"

    DoEvents

    Me.lblForbinder.Visible = False

'    MsgBox "3"
    Call ChangeAppTitle("DATABASE = DRIFT BUDGET")

    ' Close the form
    DoCmd.Close acForm, Me.Name

End Sub

Private Sub btnTilslutPrisberegning_Click()

    Me.lblPrisberegning.Visible = True

    Me.btnUpdPrisberegningDB.Visible = False

    DoEvents

    MsgBox "Klik OK 1"

    SkiftTilMiljo_og_SikrViews "ITF_Prisberegning"

    'Call RelinkTables("ITF_Prisberegning")

    MsgBox "Klik OK 2"

    DoEvents

    Me.lblSandkasse.Visible = False

    Me.btnTilslutPrisberegning.Visible = True

    Call ChangeAppTitle("DATABASE = PRISBEREGNING")


    ' Close the form
    DoCmd.Close acForm, Me.Name


End Sub

Private Sub btnTilslutSandkasse_Click()

    Me.lblSandkasse.Visible = True
    DoEvents

    MsgBox "Klik OK 1"

    SkiftTilMiljo_og_SikrViews "ITF_SandBox"

    MsgBox "Klik OK 2"

    'Call RelinkTables("ITF_SandBox")

    DoEvents

    Me.lblSandkasse.Visible = False

    Call ChangeAppTitle("DATABASE = SANDKASSE")

    ' Close the form
    DoCmd.Close acForm, Me.Name

End Sub

Private Sub btnUpdPrisberegningDB_Click()
Dim result As VbMsgBoxResult
result = MsgBox("Er du sikker på at du vil " & vbCrLf & "nulstille Prisberegnings database?", vbYesNo + vbQuestion, "Nulstilling af Prisberegnings databasen!")


If result = vbYes Then

    'Call RelinkTables("ITF_Prisberegning")

    DoEvents

    Call executeDropTables

    DoEvents

    'Call RelinkTables("ITF")

    DoEvents

    Call executeSPBackup("Budget", "Budget_Prisberegning")

End If
End Sub

Private Sub btnUpdSandkasse_Click()
Dim result As VbMsgBoxResult
result = MsgBox("Er du sikker på at du vil " & vbCrLf & "nulstille SANDKASSE databasen?", vbYesNo + vbQuestion, "Nulstilling af SANDKASSE databasen!")

If result = vbYes Then

    'Call RelinkTables("ITF_SandBox")

    DoEvents

    Call executeDropTables

    DoEvents

    'Call RelinkTables("ITF")

    DoEvents

    Call executeSPBackup("Budget", "Budget_Restored")

End If
End Sub
