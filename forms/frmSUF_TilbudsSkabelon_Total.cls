Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub btnExpExcel_Click()
    Dim strAfd As String
    Dim intYear As Integer
    Dim intYearFB As Integer

    strAfd = Nz(Me.cboAfdeling.value, "")
    intYear = Nz(Me.cboYear.value, 0)

    If Not Nz(ELookup("Year_", "tblFBBudget", "Konto_1 = '9900'"), 0) = intYear Then
        MsgBox ("Du skal lave Fællesbidragsberegning for år: " & intYear & vbCrLf & "inden du kan gå videre.")
        Exit Sub
    End If

    If Len(strAfd) = 0 Or intYear = 0 Then
        MsgBox "Indtast Afdeling og År"
        Exit Sub
    Else
        Call fncExpToExcel(strAfd, intYear)
    End If

End Sub

Private Sub btnOpretAfd_Click()
    Dim strAfd As String
    Dim intYear As Integer

    strAfd = Nz(Me.cboAfdeling.value, "")
    intYear = Nz(Me.cboYear.value, 0)

    If Len(strAfd) = 0 Or intYear = 0 Then
        MsgBox "Indtast Afdeling, År og Revision"
        Exit Sub
    End If

    If Nz(ELookup("Year_", "tblFBBudget", "Year_ = " & intYear), -1) = -1 Then
        MsgBox "Fællesbidrag er ikke beregnet for dette år: " & intYear
        Exit Sub
    End If

    Call fncInitTilbud(strAfd, intYear)

    DoEvents

    Me.Requery
    Me.Refresh
    Me.Repaint

End Sub

Private Sub cboAfdeling_AfterUpdate()
    Call FilterYearAfd
End Sub

Private Sub cboAfdeling_GotFocus()
Dim strYear As String
Dim str As String

'get the selected year from the other combobox
strYear = Nz(Me.cboYear.value, 0)

'set the data source to a query that filters by year
str = "SELECT [AfdNr Uniconta], AfdelingsNavn FROM tblAfdeling WHERE Year_ = " & CInt(strYear) & " ORDER BY [AfdNr Uniconta]"

Me.cboAfdeling.RowSource = str
Me.cboAfdeling.Requery 'refresh the combobox to show the updated data

End Sub

Private Sub cboYear_AfterUpdate()
Call FilterYearAfd
End Sub

Private Sub Form_Load()
    Me.cboYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)
    Me.cboAfdeling = Nz(ELookup("[AfdNr Uniconta]", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), "")

    Call FilterYearAfd
End Sub
Private Sub FilterYearAfd()
Dim intYear_ As Integer
Dim strFilter As String

    ' Collect filter criteria
    If Not IsNull(Me.cboAfdeling.value) Then
        strFilter = strFilter & "[AfdU]= '" & Me.cboAfdeling.value & "' AND "
    End If
    If Not IsNull(Me.cboYear.value) Then
        strFilter = strFilter & "[Year_]= " & Me.cboYear.value & " AND "
    End If
    ' Remove trailing "AND "
    If Len(strFilter) > 0 Then
        strFilter = Left(strFilter, Len(strFilter) - 5)
    End If
'    'Debug.Print 1
    ' Apply filter to subform within TabControl
    Me.TabCtl3.Pages("tabBudget").Controls("frmSUF_TilbudsSkabelon").Form.filter = strFilter
    Me.TabCtl3.Pages("tabBudget").Controls("frmSUF_TilbudsSkabelon").Form.FilterOn = True
'    'Debug.Print 2
    Me.TabCtl3.Pages("tabEconomy").Controls("frmSUF_TilbudsSkabelon_NoegleTal").Form.filter = strFilter
    Me.TabCtl3.Pages("tabEconomy").Controls("frmSUF_TilbudsSkabelon_NoegleTal").Form.FilterOn = True
''Debug.Print 3
    Me.TabCtl3.Pages("tabKoncern").Controls("frmSUF_TilbudsSkabelon_Koncernnote").Form.filter = strFilter
    Me.TabCtl3.Pages("tabKoncern").Controls("frmSUF_TilbudsSkabelon_Koncernnote").Form.FilterOn = True
''Debug.Print 4
    Me.TabCtl3.Pages("tabFive").Controls("frmSUF_TilbudsSkabelon_FemPlus").Form.filter = strFilter
    Me.TabCtl3.Pages("tabFive").Controls("frmSUF_TilbudsSkabelon_FemPlus").Form.FilterOn = True
''Debug.Print 5
End Sub
