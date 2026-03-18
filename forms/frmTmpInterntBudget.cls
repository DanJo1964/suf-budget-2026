Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Sub Delay(seconds As Single)
    Dim endTime As Date
    endTime = DateAdd("s", seconds, Now())
    Do While Now() < endTime
        DoEvents
    Loop
End Sub
Private Sub Kommentarer_Click()
    Me.Parent.tbxKommentarer.value = Me.Kommentarer
End Sub

Private Sub Regulering_DblClick(Cancel As Integer)
   Dim currentID As Long
    Dim recordOffset As Long
    Dim intYear As Integer


'    If Me.Konto = "1105" Then
'        MsgBox ("Regulering foregår fra medarbejdervinduet " & vbCrLf & " under 'Kalkuler beløb'")
'        Exit Sub
'    End If

    ' Check if we are on a valid record
    If Me.NewRecord Then
        MsgBox "Please save this new budget line before adding a regulation.", vbInformation
        Exit Sub
    End If

    Me.Parent.lblArbejder.Caption = "Åbner Regulering..."
    Me.Parent.lblArbejder.Visible = True

    ' --- KEY CHANGES START HERE ---

    ' Store the ID and current position of the record we are on
    currentID = Me.ID
    recordOffset = Me.SelTop

    ' Clear the hidden textbox that will receive the new ID
    Me.tbxHiddenRegID.value = Null

    ' Open the regulation form in Dialog mode. This pauses the code here until frmRegulering is closed.
    ' Pass the current budget ID using OpenArgs for a robust connection.
    DoCmd.OpenForm "frmRegulering", WindowMode:=acDialog, OpenArgs:=currentID

    ' --- After frmRegulering is closed, the code continues here ---

    intYear = Me.Parent.cboYearIntBud.value

    Call fncUpdateSumKti(Me.Afdeling, intYear)

    ' Check if the hidden textbox was filled with a new ID from frmRegulering
    If IsNumeric(Me.tbxHiddenRegID.value) And Me.tbxHiddenRegID.value > 0 Then

        ' Update the ReguleringID on the current record
        Me.ReguleringID = Me.tbxHiddenRegID.value

        ' Set focus to the next field as requested
        Me.Kommentarer.SetFocus

    End If

    ' Clean the hidden textbox
    Me.tbxHiddenRegID.value = Null

    ' Requery the form to show updated data
    Me.Requery

    ' Restore the record position using its bookmark
    If Not IsNull(currentID) Then
        With Me.RecordsetClone
            .FindFirst "ID = " & currentID
            If Not .NoMatch Then
                Me.Bookmark = .Bookmark
            End If
        End With
    End If

    ' Restore the scroll position
    Me.SelTop = recordOffset

    Me.Parent.lblArbejder.Visible = False
    Me.Parent.lblArbejder.Caption = "Arbejder..."

End Sub
Private Function FormatNumberDot(num As Double) As String
    Dim s As String
    s = Format(num, "0.00")
    s = Replace(s, ",", ".")
    FormatNumberDot = s
End Function
