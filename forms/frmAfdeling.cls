Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub btnAddRecord_Click()
DoCmd.OpenForm "frmAfdelingNew", WindowMode:=acDialog

Dim rs As DAO.Recordset
    If Not IsNull(Me.txtHiddenControl) Then
        Set rs = Me.RecordsetClone
        Me.Requery
        rs.FindFirst "[AfdNr Uniconta] = '" & Me.txtHiddenControl & "'"
        If Not rs.NoMatch Then
            Me.Bookmark = rs.Bookmark
            Me.txtHiddenControl = Null
        End If
    End If
End Sub

Private Sub btnCreateRevision_Click()
'Spørg om du vil oprette en revision nr. (Revision + 1)
'Hvis, så indtast ordet Revision
'Tabeller der skal laves kopi af:
'
End Sub

Private Sub btnUpdateFromUniconta_Click()
    Me.lblArbejder.Visible = True
    Call fncUpdateAfd("tmpAfdeling", "GLDimType1Client")
    Call UpdateAfdFromFirmaID
    Me.Repaint
    Me.lblArbejder.Visible = False

End Sub

Sub UpdateTables(intYear As Integer, strFirmaID As String)
    Dim dB As DAO.Database
    Dim rs1 As DAO.Recordset
    Dim rs2 As DAO.Recordset
    Dim sql1 As String
    Dim sql2 As String
    Dim found As Boolean

    Set dB = CurrentDb

    sql1 = "SELECT * FROM tblAfdeling WHERE Year_ = " & intYear
    sql2 = "SELECT * FROM tmpAfdeling_" & strFirmaID & " Where Blocked = '0'"



    Set rs1 = dB.OpenRecordset(sql1, dbOpenDynaset, dbSeeChanges)
    Set rs2 = dB.OpenRecordset(sql2, dbOpenDynaset, dbSeeChanges)

    'Loop through the records in tmpAfdeling
    Do While Not rs2.EOF
        'Initialize found flag
        found = False
        'Move to the first record in tblAfdeling
        rs1.MoveFirst
        'Loop through the records in tblAfdeling
        Do While Not rs1.EOF
            'Check if the Dimension matches the AfdNr Uniconta
            ''Debug.Print rs1![AfdNr Uniconta]
            If rs2!Dimension = rs1![AfdNr Uniconta] Then
                'Set the found flag to true
                found = True
                'Update the UnicontaFirmaNavn with the Name
                rs1.Edit
                rs1!UnicontaFirmanavn = rs2!Name
                rs1!UnicontaFirmaID = strFirmaID
                rs1!AfdelingsNavn = rs2!Name
                rs1![OprettetUnicontaNejJa] = True
                rs1.Update
                'Exit the inner loop
                Exit Do
            End If
            'Move to the next record in tblAfdeling
            rs1.MoveNext
        Loop
        'If the record is not found in tblAfdeling
        If Not found Then
            'Add a new record in tblAfdeling with the values from tmpAfdeling
            rs1.AddNew
            rs1![AfdNr Uniconta] = rs2!Dimension
            rs1!Afdeling = rs2!Dimension
            rs1!UnicontaFirmanavn = rs2!Name
            rs1!UnicontaFirmaID = strFirmaID
            rs1!Year_ = intYear
            rs1!Revision = 0
            rs1.Update
        End If
        'Move to the next record in tmpAfdeling
        rs2.MoveNext
    Loop

    'Close recordsets
    rs1.Close
    rs2.Close

    'Release objects
    Set rs1 = Nothing
    Set rs2 = Nothing
    Set dB = Nothing
End Sub


Private Sub cboYear_AfterUpdate()
    Call FilterYear
End Sub


Private Sub Form_AfterInsert()
    Me.Revision = 0
    Me.Year_ = Me.cboYear

    Me.AfdNr_Uniconta.Locked = False
End Sub

Private Sub Form_BeforeInsert(Cancel As Integer)
        Me.Year_ = Me.cboYear
End Sub

Private Sub Form_Load()
    Me.cboYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)
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
Private Sub UpdateAfdFromFirmaID()
Dim dB As DAO.Database
Dim str As String
Dim rs As DAO.Recordset

    Set dB = CurrentDb()
    str = "SELECT FirmaID, FirmaNavn FROM tblUnicontaFirmaID "
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    With rs
        If Not .EOF Then
            Do Until .EOF

                Call UpdateTables(Me.cboYear, CStr(!FirmaID))

                .MoveNext
            Loop

        End If

    End With

dB.Close
'rs.Close
Set rs = Nothing

End Sub

Private Sub Form_Open(Cancel As Integer)
 ' Set the position of the form
    ' Move (Left, Top, Width, Height)
    Me.Move 1440, 1440 ' Move the form to 1 inch from the top and left of the screen
End Sub
