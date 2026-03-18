Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Dim chkStates As Object

Private Sub btnImpAfd_Click()
    On Error GoTo Err_Handler

    Dim cn As Object ' ADODB.Connection
    Dim strSQL As String
    Dim intYear As Integer
    Dim lngRowsAffected As Long

    ' 1. Brugerbekræftelse
    If MsgBox("Vil du indlæse/opdatere afdelinger?", vbYesNo + vbQuestion, "Bekræftelse") = vbNo Then
        Exit Sub
    End If

    ' 2. Læs værdi fra komboboks cboYear
    If IsNull(Me.cboYear) Then
        MsgBox "Vælg venligst et årstal i cboYear.", vbExclamation, "Data mangler"
        Exit Sub
    End If
    intYear = Me.cboYear

    ' 3-5. Forbered T-SQL med Transferred = 0 (No)
    Set cn = CreateObject("ADODB.Connection")
    cn.Open fncConnString 'CurrentProject.Connection

    ' Vi tilføjer Transferred feltet med den konstante værdi 0
    strSQL = "INSERT INTO tblAfdelingRevision (Afdeling, Afdeling_Uniconta, Year_, Transferred) " & _
             "SELECT A.Afdeling, A.[AfdNr Uniconta], A.Year_, 0 " & _
             "FROM tblAfdeling AS A " & _
             "WHERE A.Year_ = " & intYear & " " & _
             "AND NOT EXISTS (" & _
             "    SELECT 1 FROM tblAfdelingRevision AS R " & _
             "    WHERE R.Afdeling = A.Afdeling AND R.Year_ = A.Year_" & _
             ");"

    ' Udfør kørsel
    cn.Execute strSQL, lngRowsAffected

    ' Succesmeddelelse
    If lngRowsAffected > 0 Then
        MsgBox "Processen er fuldført. " & lngRowsAffected & " afdelinger blev overført.", vbInformation, "Succes"
    Else
        MsgBox "Ingen nye afdelinger blev fundet eller alle findes allerede for det valgte år.", vbInformation, "Ingen ændringer"
    End If

    Me.Requery

Exit_Procedure:
    ' Ryd op
    If Not cn Is Nothing Then
        If cn.State = 1 Then cn.Close
    End If
    Set cn = Nothing
    Exit Sub

Err_Handler:
    ' Dansk fejlhåndtering i henhold til standard
    MsgBox "Der opstod en fejl i IndlaesAfdelingerADO:" & vbCrLf & _
           "Fejl: " & Err.Description, vbCritical, "Systemfejl"
    Resume Exit_Procedure
End Sub

Private Sub btnToUniconta_Click()
Dim intYear As Integer

intYear = Me.cboYear

If intYear >= Year(Date) Then
    Call fncBudgetTilUniconta(intYear)
End If

End Sub

Private Sub chkAll_Click()
    Dim dB As DAO.Database
    Dim strSQL As String
    Dim chkValue As Boolean

    ' Get the value of the checkbox, explicitly set it to 0 or -1 to avoid NULL
    chkValue = Nz(Me.chkAll.value, 0)

    ' Construct the SQL statement to update all records
    strSQL = "UPDATE tblAfdelingRevision SET Transferred = " & chkValue

    ' Execute the SQL statement
    Set dB = CurrentDb
    dB.Execute strSQL, dbFailOnError

    ' Refresh the form to show updated data
    Me.Requery

    ' Clean up
    Set dB = Nothing
End Sub
Private Sub chkSelect_AfterUpdate()
    On Error GoTo ErrorHandler
    Dim dB As DAO.Database
    Dim strSQL As String
    Dim chkValue As Boolean

     ' Gem eventuelle ændringer på den aktuelle post
    If Me.Dirty Then Me.Dirty = False

    ' Sørg for at checkboxens værdi aldrig er NULL
    chkValue = Nz(Me.chkSelect.value, 0)

    ' Opdater Transferred-feltet i den aktuelle post
    Set dB = CurrentDb
    strSQL = "UPDATE tblAfdelingRevision SET Transferred = " & chkValue & " WHERE ID = " & Me.ID
    dB.Execute strSQL, dbSeeChanges + dbFailOnError

    ' Opdater formens data
    Me.Requery

    ' Ryd op
    Set dB = Nothing
    Exit Sub

ErrorHandler:
    MsgBox "Der opstod en fejl ved opdatering af Transferred: " & Err.Description, vbExclamation
    Resume Next
End Sub

Private Sub Form_Load()
    Me.cboYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)
    Me.chkAll = 0

    Call FilterYear

End Sub
Private Sub FilterYear()
Dim intYear_ As Integer

    If IsNull(Me.cboYear.value) Then
        Me.filter = "[Year_] = 0"
        Me.FilterOn = True
    Else
        intYear_ = Me.cboYear.value
        Me.filter = "[Year_] = " & intYear_
        Me.FilterOn = True
    End If

End Sub
Private Sub cboYear_AfterUpdate()
    Call FilterYear
End Sub
