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
    ' Hvis åbnet fra Prisberegning – behold prisberegnings-listen
    If Nz(TempVars("tsFromPrisberegning").value, False) = True Then
        Exit Sub
    End If

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
    ' Tjek om formen er åbnet fra Prisberegning via OpenArgs
    If Not IsNull(Me.OpenArgs) And Me.OpenArgs <> "" Then
        ' Format: PrisberegningID|PrisberegningNavn|BudgetAar
        Dim arrArgs() As String
        arrArgs = Split(Me.OpenArgs, "|")

        If UBound(arrArgs) >= 2 Then
            TempVars("tsFromPrisberegning").value = True
            TempVars("tsPrisberegningID").value = CLng(arrArgs(0))
            TempVars("tsPrisberegningNavn").value = arrArgs(1)
            TempVars("tsYear").value = CInt(arrArgs(2))

            ' Skift label og udfyld combobox med prisberegninger
            Me.Label37.Caption = "Vælg prisberegning"
            Me.cboYear.value = CInt(arrArgs(2))

            ' Sæt RowSource til prisberegninger for det valgte år
            Dim strSQL As String
            strSQL = "SELECT ID, PrisberegningNavn FROM tblPrisberegning " & _
                     "WHERE BudgetAar = " & arrArgs(2) & " ORDER BY PrisberegningNavn"
            Me.cboAfdeling.RowSource = strSQL
            Me.cboAfdeling.BoundColumn = 2
            Me.cboAfdeling.Requery
            Me.cboAfdeling.value = arrArgs(1)
        End If
    Else
        ' Normal åbning – hent senest brugte afdeling og år
        TempVars("tsFromPrisberegning").value = False
        Me.cboYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)
        Me.cboAfdeling = Nz(ELookup("[AfdNr Uniconta]", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), "")
        Me.cboAfdeling.BoundColumn = 1
    End If

    Call FilterYearAfd
End Sub
Private Sub FilterYearAfd()
    Dim strFilter As String

    If Nz(TempVars("tsFromPrisberegning").value, False) = True Then
        ' -- Åbnet fra Prisberegning: filtrer på PrisberegningNavn --
        Dim strNavn As String
        Dim intYear As Integer
        strNavn = Nz(TempVars("tsPrisberegningNavn").value, "")
        intYear = Nz(TempVars("tsYear").value, 0)

        If strNavn <> "" Then
            strFilter = "[AfdU] = '" & strNavn & "'"
            If intYear > 0 Then
                strFilter = strFilter & " AND [Year_] = " & intYear
            End If
        End If
    Else
        ' -- Normal åbning: filtrer på AfdU og Year_ --
        If Not IsNull(Me.cboAfdeling.value) Then
            strFilter = strFilter & "[AfdU]= '" & Me.cboAfdeling.value & "' AND "
        End If
        If Not IsNull(Me.cboYear.value) Then
            strFilter = strFilter & "[Year_]= " & Me.cboYear.value & " AND "
        End If
        ' Fjern afsluttende "AND "
        If Len(strFilter) > 0 Then
            strFilter = Left(strFilter, Len(strFilter) - 5)
        End If
    End If

    ' Anvend filter på alle subforms i TabControl
    Me.TabCtl3.Pages("tabBudget").Controls("frmSUF_TilbudsSkabelon").Form.filter = strFilter
    Me.TabCtl3.Pages("tabBudget").Controls("frmSUF_TilbudsSkabelon").Form.FilterOn = True

    Me.TabCtl3.Pages("tabEconomy").Controls("frmSUF_TilbudsSkabelon_NoegleTal").Form.filter = strFilter
    Me.TabCtl3.Pages("tabEconomy").Controls("frmSUF_TilbudsSkabelon_NoegleTal").Form.FilterOn = True

    Me.TabCtl3.Pages("tabKoncern").Controls("frmSUF_TilbudsSkabelon_Koncernnote").Form.filter = strFilter
    Me.TabCtl3.Pages("tabKoncern").Controls("frmSUF_TilbudsSkabelon_Koncernnote").Form.FilterOn = True

    Me.TabCtl3.Pages("tabFive").Controls("frmSUF_TilbudsSkabelon_FemPlus").Form.filter = strFilter
    Me.TabCtl3.Pages("tabFive").Controls("frmSUF_TilbudsSkabelon_FemPlus").Form.FilterOn = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' Ryd TempVars sat af Prisberegning-integration
    TempVars.Remove ("tsFromPrisberegning")
    TempVars.Remove ("tsPrisberegningID")
    TempVars.Remove ("tsPrisberegningNavn")
    TempVars.Remove ("tsYear")
End Sub
