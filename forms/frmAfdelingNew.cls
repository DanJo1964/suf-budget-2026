Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strAfdExist As String

Sub UpdateTables()
    Dim strSQL As String
    Dim dB As DAO.Database

    Set dB = CurrentDb
    DBEngine.BeginTrans

    On Error GoTo ErrorHandler
    DoCmd.SetWarnings False

    ' Create the SQL statement
    strSQL = "INSERT INTO tblFB_Totaler (Afdeling, Revision, Year_) " & _
             "VALUES ('" & Me.AfdNr_Uniconta & "', 0, " & Me.Year_ & ")"



    'Run the SQL statement
    DoCmd.RunSQL strSQL, dbFailOnError

    strSQL = "INSERT INTO tblAfdeling (Adresse, Afdeling, Afdelingsleder, AfdelingsNavn, [AfdNr Uniconta], AfdStatus, PostBy, Tlf_Mail, Year_) " & _
             "VALUES ('" & Me.Adresse & "', '" & _
                            Me.Afdeling & "', '" & _
                            Me.Afdelingsleder & "', '" & _
                            Me.AfdelingsNavn & "', '" & _
                            Me.AfdNr_Uniconta & "', " & _
                            Me.AfdStatus & ", '" & _
                            Me.PostBy & "', '" & _
                            Me.Tlf_Mail & "', " & _
                            Me.Year_ & ")"

    'Debug.Print strSQL

    ' Run the SQL statement
    DoCmd.RunSQL strSQL, dbFailOnError

    strSQL = "INSERT INTO tblDashboard (Afdeling, [AfdNr Uniconta], Year_, UnicontaFirmaID, Debitor, Fordeling, GngMLeder, IB_SendtLeder, InterntBudget, KoncernNote, Medarbejder, Parametre, TilUnicontaBudget, TP_BudgetPrint, TP_BudgetSendtTilsyn)" & _
             "VALUES ('" & Me.Afdeling & "', '" & _
                        Me.AfdNr_Uniconta & "', " & _
                        Me.Year_ & ", '" & _
                        Me.UnicontaFirmaID & "', " & _
                        "false, false, false, false, false, false, false, false, false, false, false)"

    ' Run the SQL statement
    DoCmd.RunSQL strSQL, dbFailOnError

    DBEngine.CommitTrans

    MsgBox "Afdeling " & Me.AfdNr_Uniconta & " er oprettet!"

    Forms!frmAfdeling!txtHiddenControl = Me.AfdNr_Uniconta

    DoCmd.SetWarnings True

    DoCmd.Close acForm, Me.Name

    Exit Sub

ErrorHandler:
    dB.Execute "ROLLBACK;", dbFailOnError
    MsgBox "An error occurred: " & Err.Description
End Sub
Private Sub AfdNr_Uniconta_AfterUpdate()

    If strAfdExist <> "No" And strAfdExist <> "" Then
        Me.AfdNr_Uniconta.SetFocus
    Else
        Me.Afdeling = Me.AfdNr_Uniconta
    End If
End Sub

Private Sub AfdNr_Uniconta_BeforeUpdate(Cancel As Integer)
Dim strAfdExist As String
Dim intYear As Integer

    intYear = Me.cboYear

    strAfdExist = Nz(ELookup("Afdeling", "tblAfdeling", "[AfdNr Uniconta] = '" & Me.AfdNr_Uniconta & "' And Year_ = " & intYear), "No")

    If strAfdExist <> "No" Then

        MsgBox ("Afdeling eksisterer i forvejen for dette budgetår")
        Cancel = True
        Me.AfdNr_Uniconta.Undo
    Else
        AfdNr_Uniconta_AfterUpdate
    End If

End Sub

Private Sub btnAddRecord_Click()

    If IsNull(Me.Afdeling) Or _
       IsNull(Me.[AfdNr_Uniconta]) Or _
       IsNull(Me.[AfdStatus]) Or _
       IsNull(Me.AfdelingsNavn) Or _
       IsNull(Me.Year_) Then

        MsgBox "Udfyld alle felter med rød stjerne!"

        Exit Sub
    End If


    Call UpdateTables

End Sub

Private Sub Form_Load()
    Me.cboYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)

End Sub
