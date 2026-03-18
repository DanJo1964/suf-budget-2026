Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub btnKtiTilbudsPortal_Click()
    If IsNull(Me.cboYear) Then
            MsgBox ("Du skal udfylde budget år")
        Exit Sub
    End If

    Call PrecessAfdelingData(Me.cboYear)
End Sub

Private Sub Form_Load()

    Me.Move 10000, 0

    Me.cboYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)

    'Call fncCenterform

End Sub
