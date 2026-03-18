Attribute VB_Name = "Functions Create New Budget Year 0"
Public Sub OpretTmpOpretBudgetTabeller_OLD()

    Dim dB As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.field
    Dim rel As DAO.Relation

    Set dB = CurrentDb

    '-------------------------------------
    ' Slet eksisterende tabeller hvis de findes
    '-------------------------------------
    On Error Resume Next
    dB.TableDefs.Delete "tblTmpOpretAfd"
    dB.TableDefs.Delete "tblTmpOpretUnderAfd"
    On Error GoTo 0

    '-------------------------------------
    ' Opret tblTmpOpretUnderAfd
    '-------------------------------------
    Set tdf = dB.CreateTableDef("tblTmpOpretUnderAfd")

    With tdf
        .Fields.Append .CreateField("UafdNr", dbText, 20)
        .Fields.Append .CreateField("UafdNavn", dbText, 100)
    End With

    dB.TableDefs.Append tdf
    Set tdf = Nothing

    '-------------------------------------
    ' Opret tblTmpOpretAfd
    '-------------------------------------
    Set tdf = dB.CreateTableDef("tblTmpOpretAfd")

    With tdf
        ' Primærnøgle ID (AutoNumber)
        .Fields.Append .CreateField("ID", dbLong)
        .Fields("ID").Attributes = dbAutoIncrField

        .Fields.Append .CreateField("AfdID", dbText, 20)
        .Fields.Append .CreateField("AfdNavn", dbText, 100)
        .Fields.Append .CreateField("UnderAfdID", dbText, 20)
        .Fields.Append .CreateField("FraStamdata", dbBoolean)
        .Fields.Append .CreateField("AfdVismaID", dbText, 20)
        .Fields.Append .CreateField("Adresse", dbText, 100)
        .Fields.Append .CreateField("PostBy", dbText, 100)
        .Fields.Append .CreateField("TlfMail", dbText, 100)
        .Fields.Append .CreateField("Leder", dbText, 100)
        .Fields.Append .CreateField("FBafdNr", dbText, 20)
        .Fields.Append .CreateField("FBaktiv", dbInteger)
    End With

    dB.TableDefs.Append tdf

    ' Tilføj primærnøgle til ID
    dB.Execute "ALTER TABLE tblTmpOpretAfd ADD CONSTRAINT pk_tblTmpOpretAfd PRIMARY KEY (ID);", dbFailOnError

    Set tdf = Nothing

    '-------------------------------------
    ' Opret relation UnderAfdID ? tblTmpOpretUnderAfd.UafdNr
    '-------------------------------------
    On Error Resume Next
    dB.Relations.Delete "rel_UnderAfd"
    On Error GoTo 0

    Set rel = dB.CreateRelation("rel_UnderAfd", "tblTmpOpretUnderAfd", "tblTmpOpretAfd", dbRelationLeft)

    With rel
        .Fields.Append .CreateField("UafdNr")
        .Fields("UafdNr").ForeignName = "UnderAfdID"
    End With
    ' Opret unikt indeks på UafdNr
    Dim idx As DAO.index
    Set idx = dB.TableDefs("tblTmpOpretUnderAfd").CreateIndex("idx_UafdNr")
    With idx
        .Fields.Append .CreateField("UafdNr")
        .Unique = True
    End With
    dB.TableDefs("tblTmpOpretUnderAfd").Indexes.Append idx

    dB.Relations.Append rel
    Set rel = Nothing

    'MsgBox "Tabellerne tblTmpOpretAfd og tblTmpOpretUnderAfd er nu oprettet.", vbInformation

End Sub

Public Function fncChecktblTmpOpretAfdUdfyldt_OLD() As Boolean
    On Error GoTo Fejl

    Dim dB      As DAO.Database
    Dim rs      As DAO.Recordset
    Dim strSQL  As String
    Dim strWhere As String

    Set dB = CurrentDb

    ' Byg WHERE-betingelsen ved hjælp af Nz() for tekst og Is Null for tal/YesNo
    strWhere = _
        "Nz([AfdID],'')='' OR " & _
        "Nz([AfdNavn],'')='' OR " & _
        "Nz([AfdVismaID],'')='' OR " & _
        "Nz([Adresse],'')='' OR " & _
        "Nz([PostBy],'')='' OR " & _
        "Nz([TlfMail],'')='' OR " & _
        "Nz([Leder],'')='' OR " & _
        "Nz([FBafdNr],'')='' OR " & _
        "[FBaktiv] Is Null"

    strSQL = "SELECT * FROM tblTmpOpretAfd WHERE " & strWhere & ";"

    Set rs = dB.OpenRecordset(strSQL, dbOpenSnapshot)

    If Not rs.EOF Then
        MsgBox _
          "Der er " & rs.RecordCount & " rækker i tblTmpOpretAfd, " & _
          "hvor et eller flere felter ikke er udfyldt." & vbCrLf & vbCrLf & _
          "Bl.a. i afd. '" & rs!AfdID & "' " & vbCrLf & _
          "Kontrollér alle felter inden du går videre.", _
          vbExclamation, "Manglende data"
        'fncChecktblTmpOpretAfdUdfyldt = False
    Else
        'fncChecktblTmpOpretAfdUdfyldt = True
    End If

    rs.Close
    Set rs = Nothing
    Set dB = Nothing
    Exit Function

Fejl:
    MsgBox "Fejl " & Err.Number & ": " & Err.Description, vbCritical
    'fncChecktblTmpOpretAfdUdfyldt = False
End Function
'Public Function fncCheckFBafdNrDubletter_OLD() As Boolean
'    On Error GoTo Fejl
'
'    Dim db     As DAO.Database
'    Dim rs     As DAO.Recordset
'    Dim strSQL As String
'    Dim msg    As String
'
'    Set db = CurrentDb
'
'    strSQL = _
'      "SELECT FBafdNr, Count(*) AS Antal " & _
'      "FROM tblTmpOpretAfd " & _
'      "WHERE FBafdNr Is Not Null " & _
'      "GROUP BY FBafdNr " & _
'      "HAVING Count(*) > 1;"
'
'    Set rs = db.OpenRecordset(strSQL, dbOpenSnapshot)
'
'    If Not rs.EOF Then
'        msg = "Følgende FBafdNr forekommer mere end én gang:" & vbCrLf & vbCrLf
'        rs.MoveFirst
'        Do While Not rs.EOF
'            msg = msg & rs!FBafdNr & " (" & rs!Antal & " gange)" & vbCrLf
'            rs.MoveNext
'        Loop
'        MsgBox msg, vbExclamation, "Dubletter i FBafdNr"
'        fncCheckFBafdNrDubletter = False
'    Else
'        fncCheckFBafdNrDubletter = True
'    End If
'
'    rs.Close
'    Set rs = Nothing
'    Set db = Nothing
'    Exit Function
'
'Fejl:
'    MsgBox "Fejl " & Err.Number & ": " & Err.Description, vbCritical
'    fncCheckFBafdNrDubletter = False
'End Function

'
'' --- ÉN samlet entrypoint der kører 1?4 ---
' ------- Gammel kode -> -> ->
Public Function StartOpretNytBudgetår_OLD()
    On Error GoTo Fejl

    Dim svar        As VbMsgBoxResult
    Dim intNytÅr    As Integer
    Dim strInput    As String

    ' 1) Spørg om Fortsæt eller Nyt
    svar = MsgBox( _
        "Vil du fortsætte hvor du slap sidst?" & vbCrLf & _
        "Ja = Fortsæt med eksisterende data" & vbCrLf & _
        "Nej = Start nyt budget fra et nyt år", _
        vbYesNo + vbQuestion, _
        "Fortsæt eller Nyt" _
    )

    ' 2) Hvis Fortsæt: åbn blot formen (den er bundet til tblTmpOpretAfd i design)
    If svar = vbYes Then
        DoCmd.OpenForm "frmSUF_OpretNytBudgetår", acNormal
        Exit Function
    End If

    ' 3) Hvis Nyt: bed om årstal
    strInput = InputBox( _
        "Angiv det år budgettet skal oprettes for (f.eks. 2026):", _
        "Opret nyt budgetår", _
        Year(Date) + 1 _
    )
    If strInput = "" Then Exit Function  ' bruger annullerede
    If Not IsNumeric(strInput) Then
        MsgBox "Du skal indtaste et tal for årstallet.", vbExclamation
        Exit Function
    End If

    intNytÅr = CInt(strInput)
    If intNytÅr < 2025 Or intNytÅr > 2075 Then
        MsgBox "Årstallet skal være mellem 2025 og 2075.", vbCritical
        Exit Function
    End If

    ' 4) Kør dine setup-rutiner i rækkefølge

    'Call OpretTmpOpretBudgetTabeller
    Call ConnectToOData("tmpAfdeling_48928", "GLDimType1Client", "48928", "")
    Call ConnectToOData("tmpAfdUnder_48928", "GLDimType4Client", "48928", "")
    Call KopierOgOpdaterAfdelinger(intNytÅr)

    ' 5) Åbn formen og vis det nye budgetår
    DoCmd.OpenForm "frmSUF_OpretNytBudgetår", acNormal
    With Forms!frmSUF_OpretNytBudgetår
        .lblYear.Caption = intNytÅr
        .Form.RecordSource = "SELECT * FROM tblTmpOpretAfd"
        .Requery
    End With

    Exit Function

Fejl:
    MsgBox "Fejl " & Err.Number & ": " & Err.Description, vbCritical
End Function


 ''=== Module: modBudgetAar_RunAll ===
'Option Compare Database
'Option Explicit
'
'' Brug de felter der matcher dine tabeller 1:1
'Private Const FIELDS_TARGET As String = _
'  "(Year_, AfdID, UnderAfdID, AfdNavn, Adresse, PostBy, TlfMail, Leder, FBafdNr, FBaktiv)"
'
'' --- Hjælpere (samme helpers som tidligere, hvis ikke allerede i et fælles modul) ---
'Private Function GetBase(ByVal s As String) As String
'    Dim p As Long: p = InStr(1, s, "_")
'    GetBase = IIf(p > 0, Left$(s, p - 1), s)
'End Function
'
'Private Function GetUnder(ByVal s As String) As String
'    Dim p As Long: p = InStr(1, s, "_")
'    GetUnder = IIf(p > 0, Mid$(s, p + 1), vbNullString)
'End Function
'
'' --- Opslagsbygger til Del 2A ---
'Private Sub BuildLookups(ByVal OldYear As Long, _
'                         ByRef HasUnder As Object, _
'                         ByRef HasBasis As Object)
'    Set HasUnder = CreateObject("Scripting.Dictionary")
'    Set HasBasis = CreateObject("Scripting.Dictionary")
'
'    Dim rs As DAO.Recordset, sql As String
'    sql = "SELECT AfdID, UnderAfdID, Year_ FROM tblAfdeling WHERE Year_=" & OldYear
'    Set rs = CurrentDb.OpenRecordset(sql, dbOpenSnapshot)
'
'    Dim base As String, under As String
'    Do While Not rs.EOF
'        base = CStr(rs!AfdID)
'        under = Nz(rs!UnderAfdID & "", "")
'        If Len(under) > 0 Then
'            If Not HasUnder.exists(base) Then HasUnder.Add base, CreateObject("Scripting.Dictionary")
'            If Not HasUnder(base).exists(under) Then HasUnder(base).Add under, True
'        Else
'            If Not HasBasis.exists(base) Then HasBasis.Add base, True
'        End If
'        rs.MoveNext
'    Loop
'    rs.Close
'End Sub
'
'' --- Del 2A: spørg 1 gang pr. basisafdeling og indsæt under/ren ---
'Public Sub Step2A_HandleUnderAndPlain(ByVal NewYear As Long, ByVal OldYear As Long)
'    Dim HasUnder As Object, HasBasis As Object
'    BuildLookups OldYear, HasUnder, HasBasis
'
'    Dim WantUnder As Object, WantPlain As Object
'    Set WantUnder = CreateObject("Scripting.Dictionary")
'    Set WantPlain = CreateObject("Scripting.Dictionary")
'
'    Dim ws As DAO.Workspace: Set ws = DBEngine.Workspaces(0)
'    Dim rs As DAO.Recordset, sql As String
'
'    sql = "SELECT DISTINCT AfdID " & _
'          "FROM tblTmpOpretAfd " & _
'          "WHERE Year_=" & NewYear & " AND (UnderAfdID Is Null OR UnderAfdID='') " & _
'          "ORDER BY AfdID"
'    Set rs = CurrentDb.OpenRecordset(sql, dbOpenSnapshot)
'
'    On Error GoTo EH
'    ws.BeginTrans
'
'    Do While Not rs.EOF
'        Dim base As String: base = CStr(rs!AfdID)
'
'        ' (a) Underafdelinger?
'        If HasUnder.exists(base) Then
'            If Not WantUnder.exists(base) Then
'                If MsgBox("Vil du oprette underafdelinger for afdeling " & base & "?", _
'                          vbQuestion + vbYesNo, "Underafdelinger " & base) = vbYes Then
'                    WantUnder.Add base, True
'                    Dim insUnder As String
'                    insUnder = _
'                      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
'                      "SELECT " & NewYear & ", A.AfdID, A.UnderAfdID, A.AfdNavn, A.Adresse, A.PostBy, A.TlfMail, A.Leder, A.FBafdNr, A.FBaktiv " & _
'                      "FROM tblAfdeling AS A " & _
'                      "WHERE A.Year_=" & OldYear & " AND A.AfdID=" & base & " AND A.UnderAfdID Is Not Null " & _
'                      "  AND NOT EXISTS (SELECT 1 FROM tblTmpOpretAfd T " & _
'                      "                  WHERE T.Year_=" & NewYear & " AND T.AfdID=A.AfdID AND Nz(T.UnderAfdID,'')=Nz(A.UnderAfdID,''))"
'                    CurrentDb.Execute insUnder, dbFailOnError
'                Else
'                    WantUnder.Add base, False
'                End If
'            End If
'        End If
'
'        ' (b) Ren afdeling uden under?
'        If Not WantPlain.exists(base) Then
'            If MsgBox("Vil du også oprette afdeling " & base & " UDEN underafdeling?", _
'                      vbQuestion + vbYesNo, "Ren afdeling " & base) = vbYes Then
'                WantPlain.Add base, True
'                Dim insPlain As String
'                If HasBasis.exists(base) Then
'                    insPlain = _
'                      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
'                      "SELECT " & NewYear & ", A.AfdID, Null, A.AfdNavn, A.Adresse, A.PostBy, A.TlfMail, A.Leder, A.FBafdNr, A.FBaktiv " & _
'                      "FROM tblAfdeling AS A " & _
'                      "WHERE A.Year_=" & OldYear & " AND A.AfdID=" & base & " AND A.UnderAfdID Is Null " & _
'                      "  AND NOT EXISTS (SELECT 1 FROM tblTmpOpretAfd T " & _
'                      "                  WHERE T.Year_=" & NewYear & " AND T.AfdID=A.AfdID AND T.UnderAfdID Is Null)"
'                Else
'                    insPlain = _
'                      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
'                      "SELECT " & NewYear & ", U.AfdID, Null, U.AfdNavn, U.Adresse, U.PostBy, U.TlfMail, U.Leder, U.FBafdNr, U.FBaktiv " & _
'                      "FROM tblTmpOpretAfd AS U " & _
'                      "WHERE U.Year_=" & NewYear & " AND U.AfdID=" & base & " AND (U.UnderAfdID Is Null OR U.UnderAfdID='') " & _
'                      "  AND NOT EXISTS (SELECT 1 FROM tblTmpOpretAfd T " & _
'                      "                  WHERE T.Year_=" & NewYear & " AND T.AfdID=U.AfdID AND T.UnderAfdID Is Null)"
'                End If
'                CurrentDb.Execute insPlain, dbFailOnError
'            Else
'                WantPlain.Add base, False
'            End If
'        End If
'
'        rs.MoveNext
'    Loop
'
'    ws.CommitTrans
'    rs.Close
'    Exit Sub
'
'EH:
'    On Error Resume Next
'    ws.Rollback
'    If Not rs Is Nothing Then rs.Close
'    MsgBox "Fejl i Step2A: " & Err.Description, vbExclamation
'End Sub
'
'' --- Del 3 + 4: kopiér rene + slut-synk ---
'Public Sub Step3_4_CopyPlainAndSync(ByVal NewYear As Long, ByVal OldYear As Long)
'    Dim ws As DAO.Workspace: Set ws = DBEngine.Workspaces(0)
'    On Error GoTo EH
'
'    ws.BeginTrans
'
'    ' Del 3: Kopiér alle rene (uden under) fra sidste år som ikke findes
'    Dim sql3 As String
'    sql3 = _
'      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
'      "SELECT " & NewYear & ", A.AfdID, Null, A.AfdNavn, A.Adresse, A.PostBy, A.TlfMail, A.Leder, A.FBafdNr, A.FBaktiv " & _
'      "FROM tblAfdeling AS A " & _
'      "WHERE A.Year_=" & OldYear & " AND A.UnderAfdID Is Null " & _
'      "  AND NOT EXISTS (SELECT 1 FROM tblTmpOpretAfd T " & _
'      "                  WHERE T.Year_=" & NewYear & " AND T.AfdID=A.AfdID AND T.UnderAfdID Is Null)"
'    CurrentDb.Execute sql3, dbFailOnError
'
'    ' Del 4: Slut-synk – alt resterende (basis + under) fra sidste år der mangler
'    Dim sql4 As String
'    sql4 = _
'      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
'      "SELECT " & NewYear & ", A.AfdID, A.UnderAfdID, A.AfdNavn, A.Adresse, A.PostBy, A.TlfMail, A.Leder, A.FBafdNr, A.FBaktiv " & _
'      "FROM tblAfdeling AS A " & _
'      "LEFT JOIN tblTmpOpretAfd AS T " & _
'      "  ON T.Year_=" & NewYear & " AND T.AfdID=A.AfdID AND Nz(T.UnderAfdID,'')=Nz(A.UnderAfdID,'') " & _
'      "WHERE A.Year_=" & OldYear & " AND T.AfdID Is Null"
'    CurrentDb.Execute sql4, dbFailOnError
'
'    ws.CommitTrans
'    Exit Sub
'
'EH:
'    On Error Resume Next
'    ws.Rollback
'    MsgBox "Fejl i Step3_4_CopyPlainAndSync: " & Err.Description, vbExclamation
'End Sub
'
'' --- ÉN samlet entrypoint der kører 1?4 ---
'Public Sub Run_NewYearSetup(ByVal NewYear As Long, ByVal OldYear As Long)
'    ' Forudsætninger (trin 1): koden bruger allerede tblTmpOpretAfd/UnderAfd:
'    ' - Linked tabeller skal eksistere og være tomme/klargjort til NewYear-feed fra Uniconta.
'
'    ' Trin 2A: spørgelogik + indsæt under/ren pr. basisafdeling
'    Step2A_HandleUnderAndPlain NewYear, OldYear
'
'    ' Trin 3 + 4: set-baseret kopi + slut-synk, så intet mangler
'    Step3_4_CopyPlainAndSync NewYear, OldYear
'
'    MsgBox "Nyt budgetår klargjort: " & NewYear & " (kilde: " & OldYear & ").", vbInformation
'End Sub
'
'
