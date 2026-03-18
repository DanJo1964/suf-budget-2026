Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub btnOpret_Click()
Dim strYear As String

    strYear = Me.lblYear.Caption

    If strYear = "XXXX" Then strYear = "0"

    If IsNumeric(Nz(strYear, 0)) And CInt(Nz(strYear, 0)) > 2024 And CInt(Nz(strYear, 0)) < 2065 Then
        If fncChecktblTmpOpretAfdUdfyldt = False Then Exit Sub
        If fncCheckFBafdNrDubletter = False Then Exit Sub

        Call fncCreateNewYear(strYear)
    Else
        MsgBox ("Dette er ikke et rigtigt årstal: " & strYear)
    End If

End Sub
Private Sub Form_Load()
Dim vYear As Variant
    vYear = DLookup("Year_", "tblTmpOpretAfd")   ' alle rækker har samme år
    If Not IsNull(vYear) Then
        Me.lblYear.Caption = vYear
    Else
        Me.lblYear.Caption = "Ukendt"
    End If
End Sub

'===========================================================================
' HELPER-FUNKTIONER
'===========================================================================

'Returnerer TRUE hvis alle tabeller findes og indeholder mindst én række.
'Viser selv en MsgBox med detaljeret oversigt, hvis noget er galt.
Private Function ValidateTables(tblList As Variant) As Boolean
    Dim dB          As DAO.Database
    Dim tblName     As Variant
    Dim missingStr  As String
    Dim emptyStr    As String

    Set dB = CurrentDb

    For Each tblName In tblList
        If Not tableExists(dB, CStr(tblName)) Then
            missingStr = missingStr & vbCrLf & "  - " & tblName
        ElseIf DCount("*", CStr(tblName)) = 0 Then
            emptyStr = emptyStr & vbCrLf & "  - " & tblName
        End If
    Next tblName

    If Len(missingStr) > 0 Or Len(emptyStr) > 0 Then
        Dim msg As String
        If Len(missingStr) > 0 Then _
            msg = msg & "Følgende tabel(ler) mangler:" & missingStr & vbCrLf & vbCrLf
        If Len(emptyStr) > 0 Then _
            msg = msg & "Følgende tabel(ler) indeholder ingen data:" & emptyStr
        MsgBox msg, vbCritical, "Tabel-tjek fejlede"
        ValidateTables = False
    Else
        ValidateTables = True
    End If
End Function
'Returnerer TRUE hvis tabellen findes i databasen (også linked/OData-tabeller)
Private Function tableExists(dB As DAO.Database, tblName As String) As Boolean
    On Error Resume Next
    Dim tmp As DAO.TableDef
    Set tmp = dB.TableDefs(tblName)
    tableExists = (Err.Number = 0)
    Err.Clear
    On Error GoTo 0
End Function
Private Sub UnderAfdID_AfterUpdate()
    Dim svar        As VbMsgBoxResult
    Dim dB          As DAO.Database
    Dim rsSrc       As DAO.Recordset
    Dim rsDest      As DAO.Recordset
    Dim fld         As DAO.field
    Dim strAfdID    As String
    Dim strUnderID  As String
    Dim rstFind     As DAO.Recordset
    Dim strInput    As String

    ' 1) Spørg om kopi
    svar = MsgBox( _
        "Vil du oprette en kopi af denne afdeling?", _
        vbYesNo + vbQuestion, "Kopiér afdeling" _
    )
    If svar <> vbYes Then Exit Sub

    strInput = InputBox( _
        "Angiv et nyt Fællsbidrags AfdNr:" & vbNewLine & _
        "Typisk med afdelingsnr. og et ekstra tal, " & vbNewLine & _
        "f.eks. 16 bliver til 161 og næste underafd. " & vbNewLine & _
        "bliver til 162", _
        Me!AfdID)

    If strInput = "" Then
        Exit Sub       ' bruger annullerede
    Else
        Me.FBafdNr = CInt(strInput)
    End If

    If Not IsNumeric(strInput) Then
        MsgBox "Du skal indtaste et tal for årstallet.", vbExclamation
        Exit Sub
    End If

    ' 2) Gem nøgleværdier fra den post, brugeren redigerer
    strAfdID = Me!AfdID
    strUnderID = Me!UnderAfdID

    Set dB = CurrentDb
    Set rsSrc = Me.RecordsetClone
    rsSrc.Bookmark = Me.Bookmark

    ' 3) Indsæt kopi i tblTmpOpretAfd
    Set rsDest = dB.OpenRecordset("tblTmpOpretAfd", dbOpenDynaset)
    rsDest.AddNew
    For Each fld In rsSrc.Fields
        ' Spring evt. Autonumber-felt (hvis det hedder f.eks. "ID")
        If fld.Name <> "ID" Then
            On Error Resume Next
            rsDest.Fields(fld.Name).value = fld.value
            On Error GoTo 0
        End If
    Next fld
    rsDest.Update

    rsDest.Close
    rsSrc.Close
    Set rsDest = Nothing
    Set rsSrc = Nothing
    Set dB = Nothing

    ' 4) Requery formen
    Me.Requery

    ' 5) Navigér tilbage til posten med samme AfdID+UnderAfdID
    Set rstFind = Me.RecordsetClone
    rstFind.FindFirst "AfdID = '" & strAfdID & "' AND UnderAfdID = '" & strUnderID & "'"
    If Not rstFind.NoMatch Then
        Me.Bookmark = rstFind.Bookmark
    End If
    rstFind.Close
    Set rstFind = Nothing
End Sub
