Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
' --- FUNKTION: Opdater totaler ---
Private Function fncUpdateTotal()
Dim ctlCur As Control
    Set ctlCur = Screen.ActiveControl

    Me.TotalTakstMdr = Nz(Me.FremskrivBeløb, 0) + Nz(Me.Xtra_takst__grund_, 0) + Nz(Me.XtraTakstFremskr, 0)
    Me.TotalTakstDÅ = Nz(Me.TotalTakstMdr, 0) * ((Month(Me.DatoTil) - Month(Me.DatoFra)) + 1)

    If Me.Dirty Then Me.Dirty = False

    Me.Parent.fncBeboereOgBeløb
    ctlCur.SetFocus

End Function
' --- FUNKTION: Tjek og opdater total hvis DatoFra ikke er tom ---
Private Function fncCheckOk()
If Not IsNull(Me.DatoFra) Then
Call fncUpdateTotal
End If
End Function

' --- DatoFelter: Opdater total ved ændring ---
Private Sub DatoFra_AfterUpdate()
Call fncUpdateTotal
End Sub

Private Sub DatoTil_AfterUpdate()
Call fncCheckOk
End Sub


' --- Fremskriv/ekstra felter: Opdater total ved ændring ---
Private Sub FremskrivBeløb_AfterUpdate()
    Call fncUpdateTotal
End Sub

Private Sub Xtratakstgrund_AfterUpdate()
Call fncUpdateTotal
End Sub

Private Sub FremskrivPct_AfterUpdate()
Dim dblPct As Double

    dblPct = (1 + Nz(Me.FremskrivPct, 0))

    If Me.FremskrivPct <> 0 Then
        Me.FremskrivBeløb = Me.Takst * dblPct
        Me.[XtraTakstFremskr] = Me.[Xtra takst] * dblPct
    Else
        Me.FremskrivBeløb = Me.Takst
        Me.[XtraTakstFremskr] = Me.[Xtra takst]
    End If

    Call fncUpdateTotal

End Sub

Private Sub TotalTakstMdr_AfterUpdate()
    Call fncUpdateTotal
End Sub

Private Sub Xtra_takst__grund__AfterUpdate()
Call fncUpdateTotal
End Sub

Private Sub XtraTakstFremskr_AfterUpdate()
Call fncUpdateTotal
End Sub
