Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub Form_Close()

    DoCmd.SetWarnings False

End Sub

Private Sub Form_Load()
 Dim fld As DAO.field
  Dim frm As Form
    Set frm = Me.frmSub_DynamicTable.Form

    On Error Resume Next
    With frm
        For Each fld In .Recordset.Fields
          frm(fld.Name).ColumnWidth = -2   ' -2 = Best Fit
          .RecordSelectors = False
          .NavigationButtons = False
          .AllowAdditions = False
          .AllowDeletions = False
          .AllowEdits = False

        ' Hvis feltet er numerisk ? giv format og 0 decimaler
        Select Case fld.Type
            Case dbByte, dbInteger, dbLong, dbSingle, dbDouble, dbCurrency, dbDecimal
                With .Controls(fld.Name)
                    .Format = "#,##0"      ' tusindtalsseparator, 0 decimaler (bruger lokale tegn)
                    .DecimalPlaces = 0     ' må gerne stå, men Format klarer det alene
                    .TextAlign = 3         ' højrejustér tal (valgfrit)
                End With
        End Select

        Next fld

        .Requery
        On Error GoTo 0

    frm.Controls("ID").ColumnHidden = True


    End With

End Sub
