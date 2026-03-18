Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private m_intFilterYear As Integer   'gemt lokalt

Private Sub cmdOK_Click()
    If IsNull(Me.cboSrcAfd) Then
        MsgBox "Vælg en afdeling først.", vbExclamation: Exit Sub
    End If
    TempVars("SrcAfd") = Me.cboSrcAfd.value
    DoCmd.Close acForm, Me.Name
End Sub

Private Sub Form_Open(Cancel As Integer)
    Dim a() As String

    If Len(Nz(Me.OpenArgs, "")) > 0 Then
        a = Split(Me.OpenArgs, "|")          '0 = default-afd, 1 = år
        If UBound(a) >= 0 Then Me.cboSrcAfd = a(0)
        If UBound(a) >= 1 Then m_intFilterYear = val(a(1))
    End If
    If m_intFilterYear = 0 Then m_intFilterYear = Year(Date)

    '----------- R O W S O U R C E -------------
    Me.cboSrcAfd.RowSource = _
        "SELECT DISTINCT [AfdNr Uniconta], AfdelingsNavn " & _
        "FROM tblAfdeling " & _
        "WHERE Year_ = " & m_intFilterYear & " OR Year_ = " & m_intFilterYear - 1 & " " & _
        "ORDER BY [AfdNr Uniconta];"


    Me.cboSrcAfd.ColumnCount = 2
    Me.cboSrcAfd.ColumnWidths = "3cm;5cm"
    Me.cboSrcAfd.BoundColumn = 1
End Sub
Private Sub cmdCancel_Click()
    TempVars("SrcAfd") = ""
    DoCmd.Close acForm, Me.Name
End Sub
