Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnExpToExcel_Click()
    Dim intYear As Integer
    intYear = Nz(Me.cboYear, 0)
    If intYear = 0 Then
        MsgBox "Vælg år først.", vbExclamation
        Exit Sub
    End If

    Call ExportTblFBBudgetToExcel(intYear, 12)

End Sub

Private Sub btnGenberegn_Click()
    Dim intYear As Integer
    intYear = Nz(Me.cboYear, 0)
    If intYear = 0 Then
        MsgBox "Vælg år først.", vbExclamation
        Exit Sub
    End If

    ' Kør SP (robust version)
    Call CallSP_Year(intYear, "usp_FBBudget_Exec__1-3", "Genberegning er gennemført")

End Sub

Private Sub btnOpdater_Click()
    Dim intYear As Integer
    intYear = Nz(Me.cboYear, 0)
    If intYear = 0 Then
        MsgBox "Vælg år først.", vbExclamation
        Exit Sub
    End If

    Call CallSP_Year(intYear, "usp_FBBudget_Exec__4-5", "Internt Budget er opdateret")

End Sub

Private Sub btnVisFB_Click()
    On Error GoTo EH

    Dim intYear As Long
    Dim lngCnt  As Long

    intYear = Nz(Me.cboYear, 0)  ' håndterer Null fra comboen

    If intYear > 0 Then
            DoCmd.OpenForm "frmFBBudget", , , "[Year_] = " & intYear
    Else
        MsgBox "Vælg venligst et år i listen først.", vbExclamation, "Manglende år"
    End If

    Exit Sub


EH:
    MsgBox "Der opstod en fejl: " & Err.Number & " - " & Err.Description, vbCritical, "Fejl"
End Sub
Private Sub Form_Load()
    Dim strUser As String
    strUser = Environ$("USERNAME")

    ' Hent tidligere værdier
    AssignValuesToFormObjects Me, strUser, Me.Name

    Dim strSQL As String

    ' Fyld cboYear med årstal fra tblAfdeling
    strSQL = "SELECT DISTINCT Year_ " & _
             "FROM tblAfdeling " & _
             "WHERE Year_ IS NOT NULL " & _
             "ORDER BY Year_ DESC;"

    With Me.cboYear
        .RowSourceType = "Table/Query"
        .RowSource = strSQL
        .LimitToList = True   ' Brugeren kan kun vælge fra listen
    End With

End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim params As New Scripting.Dictionary
    Dim usr As String: usr = Environ$("USERNAME")

    On Error Resume Next
    params.Add "cboYear", Nz(Me.cboYear, 0)

    On Error GoTo 0
        SaveFormParameters usr, Me.Name, "", "", params

End Sub
