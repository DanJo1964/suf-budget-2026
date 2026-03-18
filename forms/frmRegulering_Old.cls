Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit


Private Sub Beløb_AfterUpdate()

    DoCmd.Save

    fncSumBeløb

    DoCmd.Save

End Sub

Private Sub btnClose_Click()

    Forms("frmSUF_InterntBudget").tbxRegRecID = Null
    Forms("frmSUF_InterntBudget").tbxIBRecId = Null

    DoCmd.Close

End Sub

Private Sub btnSaveExit_Click()
Dim dbl As Double
Dim i As Integer
Dim str As String

    For i = 1 To 12
        str = "[_" & CStr(i) & "]"
        dbl = dbl + Nz(Me.Controls(str).value, 0)
    Next i

    If dbl <> Me.Beløb And (Me.Beløb - dbl) > 10 Then
        MsgBox ("Der er forskel på Beløb og Måneder!")
        Exit Sub
    End If

    Forms("frmSUF_InterntBudget").tbxRegRecID = Me.ID

    DoCmd.Save
    DoCmd.Close

End Sub

Private Sub Ctl_1_AfterUpdate()
    'Debug.Print "Ctl_1"
    fncSumBeløb
End Sub

Private Sub Ctl_10_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_11_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_12_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_2_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_3_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_4_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_5_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_6_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_7_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_8_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_9_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Fordeles12_AfterUpdate()

    If Fordeles12.value = True Then

            fncEnableMdr

    Else
            fncEnableBeløb
    End If

End Sub
Private Function fncSumBeløb()
Dim i As Integer
Dim str As String
Dim dbl As Double

    If Me.Fordeles12 = False Then
        Me.Beløb.Enabled = False
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            dbl = dbl + Nz(Me.Controls(str).value, 0)
        Next i

        Me.Beløb = dbl
    Else
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            Me.Controls(str).value = Nz(Me.Beløb / 12, 0)
        Next i

    End If

'    DoCmd.Save acTable, "tblRegulering"


End Function
Private Function fncEnableMdr()
Dim i As Integer
Dim str As String

             For i = 1 To 12
                str = "[_" & CStr(i) & "]"
                Me.Controls(str).value = Null
                Me.Controls(str).Enabled = False
            Next i
            Me.Beløb.Enabled = True
            Me.Beløb.value = Null

End Function
Private Function fncEnableBeløb()
Dim i As Integer
Dim str As String

             For i = 1 To 12
                str = "[_" & CStr(i) & "]"
                Me.Controls(str).value = Null
                Me.Controls(str).Enabled = True
            Next i
            Me.Beløb.Enabled = False
            Me.Beløb.value = Null

End Function

Private Sub Form_Load()
Dim i As Integer
Dim str As String
Dim dbl As Double

    Me.Requery


    If Me.Fordeles12 = False Then
        Me.Beløb.Enabled = False
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            dbl = dbl + Nz(Me.Controls(str).value, 0)
        Next i

        Me.Beløb = dbl

    Else
        Me.Beløb.Enabled = True
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            Me.Controls(str).Enabled = False
        Next i

    End If


End Sub
