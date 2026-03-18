Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub cmdOK_Click()
Dim intYear As Integer

    intYear = Me.cboYear
    If Not IsNull(intYear) And intYear > 0 Then
        Call PrecessAfdelingData(intYear)
    Else
        MsgBox ("Vælg årstal!")
    End If

End Sub
