Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Private Sub cmdOK_Click()

    Me.lblOverskrift.Visible = False
    Me.lblImportData.Visible = True
    Me.Repaint


    ' Kald funktionen.
    ' Hvis den returnerer False, betyder det, at brugeren trykkede Annuller.
    If DataFromVisma() = False Then

        ' Brugeren har annulleret, eller der opstod en fejl.
        ' Luk formen.
        DoCmd.Close acForm, Me.Name

    Else

        ' Importen var en succes!
        MsgBox "Import af løndata er fuldført.", vbInformation
        ' Du kan også vælge at lukke formen her, hvis det ønskes.
        DoCmd.Close acForm, Me.Name

    End If

End Sub
