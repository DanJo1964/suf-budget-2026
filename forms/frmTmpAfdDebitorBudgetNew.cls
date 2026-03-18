Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private mandatoryFields As Variant

Private Sub Form_Load()
    Me.Afdeling = Me.Afdeling
    Me.BudgetAar = Me.BudgetAar
    mandatoryFields = Array("txtKontoNavn", "txtStatusDato", "txtDatoFra", "txtDatoTil", "txtParagraf", "txtFremskrivBeløb")

End Sub

Private Sub btnAccept_Click()
   If Not ValidateAndMarkRequiredFields() Then Exit Sub

    Dim sql As String

    sql = "INSERT INTO tblTmpDebtor " & _
      "([Konto], [KontoNavn], [Adresse 1], [Status Dato], [DatoFra], [DatoTil], [Paragraf], " & _
      "[FremskrivBeløb], [Xtra takst (grund)], [XtraTakstFremskr], [TotalTakstMdr], [TotalTakstDÅ], [Afdeling], [Year_]) " & _
      "VALUES (" & _
      SqlSafeText(Me.txtKonto) & ", " & _
      SqlSafeText(Me.txtKontoNavn) & ", " & _
      SqlSafeText(Me.txtAdresse1) & ", " & _
      "'" & Format(Me.txtStatusDato, "yyyy-mm-dd") & "', " & _
      "'" & Format(Me.txtDatoFra, "yyyy-mm-dd") & "', " & _
      "'" & Format(Me.txtDatoTil, "yyyy-mm-dd") & "', " & _
      SqlSafeText(Me.txtParagraf) & ", " & _
      SqlSafeNumber(Me.txtFremskrivBeløb) & ", " & _
      SqlSafeNumber(Me.txtXtraTakstGrund) & ", " & _
      SqlSafeNumber(Me.txtXtraTakstFremsk) & ", " & _
      SqlSafeNumber(Me.txtTotalTakstMdr) & ", " & _
      SqlSafeNumber(Me.txtTotalTakstDAar) & ", " & _
      SqlSafeText(Me.Afdeling) & ", " & _
      Me.BudgetAar & ");"


    CurrentDb.Execute sql, dbFailOnError

    Dim rsT As DAO.Recordset
    Set rsT = CurrentDb.OpenRecordset("SELECT @@IDENTITY AS NewID")
        If Not rsT.EOF Then
            Dim newID As Long: newID = rsT!newID
            Me.NewDebtorID = newID

            ' Fjern evt. eksisterende værdi uden fejl
            On Error Resume Next
            TempVars.Remove "NewDebtorID"
            On Error GoTo 0

            TempVars.Add "NewDebtorID", newID
        End If

    rsT.Close


    DoCmd.Close acForm, Me.Name
End Sub
Private Function SqlSafeText(txt As Variant) As String
    If IsNull(txt) Or Trim(txt) = "" Then
        SqlSafeText = "NULL"
    Else
        SqlSafeText = "'" & Replace(txt, "'", "''") & "'"
    End If
End Function
Private Function SqlSafeNumber(num As Variant) As String
    If IsNull(num) Or num = "" Then
        SqlSafeNumber = "NULL"
    Else
        SqlSafeNumber = CStr(num)
    End If
End Function

Private Sub btnCancel_Click()
    DoCmd.Close acForm, Me.Name
End Sub
Private Sub Form_Open(Cancel As Integer)
    If Not IsNull(Me.OpenArgs) Then
        Dim args As Variant
        args = Split(Me.OpenArgs, ";")
        Dim kv As Variant
        For Each kv In args
            If InStr(kv, "Afdeling=") = 1 Then Me.Afdeling = Mid(kv, 10)
            If InStr(kv, "BudgetAar=") = 1 Then Me.BudgetAar = CLng(Mid(kv, 11))
        Next
    End If
End Sub
Private Sub txtFremskrivBeløb_AfterUpdate()

    If Not IsNull(Me.txtFremskrivBeløb) Then
        If Me.txtFremskrivBeløb < 500 Or Me.txtFremskrivBeløb > 1000000 Then
            MsgBox "FremskrivBeløb skal være mellem 500 og 1.000.000.", vbExclamation
            Exit Sub
        End If
    End If


    Call UpdateTotalFields
End Sub

Private Sub txtXtraTakstGrund_AfterUpdate()

    If Not IsNull(Me.txtXtraTakstGrund) Then
        If Me.txtXtraTakstGrund < 0 Or Me.txtXtraTakstGrund > 1000000 Then
            MsgBox "XtraTakstGrund skal være mellem 0 og 1.000.000.", vbExclamation
            Exit Sub
        End If
    End If

    Call UpdateTotalFields
End Sub

Private Sub txtXtraTakstFremsk_AfterUpdate()

    If Not IsNull(Me.txtXtraTakstFremsk) Then
        If Me.txtXtraTakstFremsk < 0 Or Me.txtXtraTakstFremsk > 1000000 Then
            MsgBox "XtraTakstFremsk skal være mellem 0 og 1.000.000.", vbExclamation
            Exit Sub
        End If
    End If

    Call UpdateTotalFields
End Sub

Private Sub txtStatusDato_AfterUpdate()
    If Not IsNull(Me.txtDatoFra) And Me.txtStatusDato >= Me.txtDatoFra Then
        MsgBox "StatusDato skal være før DatoFra.", vbExclamation
    End If
End Sub
Private Sub txtDatoFra_BeforeUpdate(Cancel As Integer)
    If Not IsNull(Me.txtDatoTil) And Me.txtDatoFra >= Me.txtDatoTil Then
        MsgBox "DatoFra skal være før DatoTil.", vbExclamation
        Me.txtDatoFra.BackColor = RGB(255, 220, 220)
        Cancel = True
    Else
        Me.txtDatoFra.BackColor = vbWhite
    End If
End Sub
Private Sub txtDatoTil_BeforeUpdate(Cancel As Integer)
    If Not IsNull(Me.txtDatoFra) And Me.txtDatoTil <= Me.txtDatoFra Then
        MsgBox "DatoTil skal være efter DatoFra.", vbExclamation
        Me.txtDatoTil.BackColor = RGB(255, 220, 220)
        Cancel = True
    Else
        Me.txtDatoTil.BackColor = vbWhite
    End If
End Sub
Private Function ValidateAndMarkRequiredFields() As Boolean
    Dim ctlName As Variant
    Dim isValid As Boolean
    isValid = True

    For Each ctlName In mandatoryFields
        With Me.Controls(ctlName)
            If IsNull(.value) Or .value = "" Then
                .BackColor = RGB(255, 220, 220)
                isValid = False

                ' Sæt fokus på første fejl
                If Not Me.ActiveControl.Name = .Name Then
                    .SetFocus
                End If

                ' Sæt fokus på første fejl
                If Not Me.ActiveControl.Name = .Name Then
                    .SetFocus
                End If

                Exit For ' Break på første fejl
            Else
                .BackColor = vbWhite
                If HasControl(ctlName & "Star") Then
                    Me.Controls(ctlName & "Star").Visible = False
                End If
            End If
        End With
    Next ctlName

    If Not isValid Then
        MsgBox "Udfyld venligst alle obligatoriske felter.", vbExclamation
    End If

    ValidateAndMarkRequiredFields = isValid
End Function

Private Sub UpdateTotalFields()
    Dim Beløb As Double, grund As Double, fremsk As Double

    Beløb = Nz(Me.txtFremskrivBeløb, 0)
    grund = Nz(Me.txtXtraTakstGrund, 0)
    fremsk = Nz(Me.txtXtraTakstFremsk, 0)

    Me.txtTotalTakstMdr = Beløb + grund + fremsk
    'Me.txtTotalTakstDAar = Me.txtTotalTakstMdr * 12

    Me.txtTotalTakstDAar = (Me.txtTotalTakstMdr * ((Month(Me.[txtDatoTil]) - Month(Me.[txtDatoFra])) + 1))

End Sub
Private Function HasControl(ctrlName As String) As Boolean
    On Error Resume Next
    HasControl = Not Me.Controls(ctrlName) Is Nothing
    On Error GoTo 0
End Function
