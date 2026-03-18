Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim intYearGrund As Integer
Private Sub Beløb_GotFocus()
'    Me.Dirty = False
End Sub

Private Sub Form_Current()
    ' Udfyld år og afdeling hvis det er en ny post
    If Me.NewRecord Then
        Me.Year_ = Forms!frmTmpMedarbVikar!tbxYear_
        Me.Afdeling = Forms!frmTmpMedarbVikar!tbxAfdeling
    End If

    Call SetupLøntrinRowSource
End Sub

Private Sub Form_AfterInsert()
    Me!Afdeling = Forms!frmTmpMedarbVikar!tbxAfdeling
    Me!Year_ = Forms!frmTmpMedarbVikar!tbxYear_
    'Forms!frmTmpMedarbVikar.SumAntalOgBeloeb
End Sub

Private Sub Form_AfterUpdate()
    Me.Dirty = False
    Forms!frmTmpMedarbVikar.SumAntalOgBeloeb
End Sub

Private Sub Antal_AfterUpdate()
    On Error GoTo AntalUpdate_Err

    If IsNumeric(Me.Antal) And IsNumeric(Me.Beløb) Then
        Call BeregnBeloeb
    Else
        Me.Beløb = Null
    End If

    Exit Sub

AntalUpdate_Err:
    MsgBox "Fejl ved opdatering af Antal: " & Err.Description, vbExclamation
End Sub

Private Sub Beløb_AfterUpdate()
    Forms!frmTmpMedarbVikar.SumAntalOgBeloeb
End Sub

Private Sub Form_Load()

        If Nz(TempVars("intYearGrund").value, 0) > 0 Then
            intYearGrund = Nz(TempVars("intYearGrund").value, 0)
        Else
            intYearGrund = 0
        End If

End Sub

Private Sub Løntrin_AfterUpdate()

    If Not IsNull(Me.Løntrin) Then
        Call BeregnBeloeb
        On Error Resume Next
            If Me.Dirty Then Me.Dirty = False
        On Error GoTo 0
        Forms!frmTmpMedarbVikar.SumAntalOgBeloeb
    Else
        Me.Beløb = Null
    End If

End Sub

Private Sub SetupLøntrinRowSource()
Dim intYearOpslag As Integer

    If intYearGrund > 0 Then
        intYearOpslag = intYearGrund
    Else
        intYearOpslag = Nz(Me.Year_, 0)
    End If

        Me.Løntrin.RowSource = _
            "SELECT Navn FROM tblParm_Timeløn WHERE BudgetYear = " & intYearOpslag & " ORDER BY Navn"
        Me.Løntrin.BoundColumn = 1
        Me.Løntrin.ColumnCount = 1
        Me.Løntrin.ColumnWidths = "3cm"
        Me.Løntrin.Requery

End Sub
Private Sub BeregnBeloeb()
    Dim valBeløb As Currency
    Dim valAntal As Double
    Dim intYearOpslag As Integer

    On Error GoTo BeregnFejl

        If Nz(intYearGrund, 0) > 0 Then
            intYearOpslag = intYearGrund
        Else
            intYearOpslag = Me.Year_
        End If

        If Not IsNull(Me.Løntrin) And Not IsNull(intYearOpslag) Then
            valBeløb = Nz(DLookup("Beløb", "tblParm_Timeløn", _
                "Navn = '" & Me.Løntrin & "' AND BudgetYear = " & intYearOpslag), 0)
            valAntal = Nz(Me.Antal, 0)
            Me.Beløb = valBeløb * valAntal
            Forms!frmTmpMedarbVikar.SumAntalOgBeloeb
        End If

    Exit Sub

BeregnFejl:
    MsgBox "Fejl i BeregnBeloeb: " & Err.Description, vbCritical
End Sub
