Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOK_Click()

    Call HentData

End Sub
Private Function HentData()
    Dim strID As String
    Dim dB As DAO.Database
    Dim tbl As TableDef
    Dim tableExists As Boolean

    ' Sæt databasen til den nuværende database
    Set dB = CurrentDb

    ' Hent værdien fra kombinationsboksen
    strID = Me.cboUnicontaID

    ' Tjek om Me.cboUnicontaID er udfyldt
    If IsNull(strID) Or strID = "" Then
        MsgBox "Du skal vælge et Uniconta ID.", vbInformation, "Mangler ID"
        Exit Function
    End If

    ' Definer tabelnavnet
    Dim tableName As String
    tableName = "tmpDebitorClientUser_" & strID

    ' Tjek om den lokale tabel eksisterer og slet den i så fald
    tableExists = False
    For Each tbl In dB.TableDefs
        If tbl.Name = tableName Then
            tableExists = True
            Exit For
        End If
    Next tbl

    If tableExists Then
        DoCmd.DeleteObject acTable, tableName
    End If

    Me.lblOverskrift.Visible = False
    Me.lblImportData.Visible = True
    Me.Repaint

    ' Kald din eksisterende funktion til at oprette forbindelse og hente data
    Call ConnectToOData(tableName, "DebtorClientUser", strID, "")

    DoEvents

    ' Tjek om den nye tabel er oprettet og indeholder poster
    tableExists = False
    For Each tbl In dB.TableDefs
        If tbl.Name = tableName Then
            tableExists = True
            Exit For
        End If
    Next tbl

    If tableExists Then
        'tableName = "tmpDebitorClientUser_" & strID
        ' Tjek om der er records i tabellen ved hjælp af DCount
        If DCount("*", tableName) > 0 Then
            Call OpdaterKunderFraImport(strID)
        Else
            MsgBox "Tabellen '" & tableName & "' blev oprettet, men er tom.", vbExclamation, "Tom Tabel"
        End If
    Else
        MsgBox "Tabellen '" & tableName & "' blev ikke fundet efter import.", vbCritical, "Fejl"
    End If

    Me.lblOverskrift.Visible = True
    Me.lblImportData.Visible = False

    Me.Repaint
    ' Ryd op
    Set dB = Nothing

End Function
Private Sub testUpdateKFI()
Dim strID As String

    strID = "48928"

    Call OpdaterKunderFraImport(strID)


End Sub
Private Function OpdaterKunderFraImport(ByVal strID As String)
    Dim dB As DAO.Database
    Dim rsMap As DAO.Recordset
    Dim strSQL As String
    Dim str As String

    Dim sourceTableName As String
    Dim sourceFieldNameColumn As String
    Dim destFieldName As String
    Dim sourceFieldName As String

    'strID = Uniconta FirmaID
    On Error GoTo ErrorHandler

    Set dB = CurrentDb

    sourceTableName = "tmpDebitorClientUser_" & strID
    sourceFieldNameColumn = "Feltnavn_" & strID

    '----------------------------------------------------------------------------------
    ' DEL 1: OPDATERING AF EKSISTERENDE KUNDER
    ' Vi løber igennem oversigtstabellen og bygger en UPDATE statement for hvert felt.
    '----------------------------------------------------------------------------------
    'Debug.Print "--- Starter opdatering for ID: " & strID & " ---"

    ' Åbn et recordset med de relevante felt-mappings for det givne strID
    ' Vi springer de felter over, hvor der ikke er angivet et kilde-feltnavn (er NULL eller '-')
    str = ("SELECT FeltNavn, [" & sourceFieldNameColumn & "] FROM tblDebtorImpFeltnavnOversigt " & _
                                "WHERE [" & sourceFieldNameColumn & "] IS NOT NULL AND [" & sourceFieldNameColumn & "] <> '-'")

    'Debug.Print str

    Set rsMap = dB.OpenRecordset(str)

    If rsMap.RecordCount > 0 Then
        rsMap.MoveFirst
        Do While Not rsMap.EOF
            destFieldName = rsMap!FeltNavn
            sourceFieldName = rsMap.Fields(sourceFieldNameColumn).value

            ' Spring over "Konto", da det er vores join-nøgle og ikke skal opdateres
            If destFieldName <> "Konto" Then
                Dim setClause As String
                Dim whereClause As String

                ' Byg den korrekte konvertering baseret på feltnavnet i destinationstabellen
                ' Dette er baseret på datatyperne fra dit billede.
                Select Case destFieldName
                     Case "Afdeling"
                        If strID <> "49782" Then
                            setClause = "IIf(Nz(S.Dimension4, '0') <> '0', S.Dimension1 & '_' & S.Dimension4, S.Dimension1) "
                            whereClause = ""
                        Else
                            setClause = "'EJD'"
                            whereClause = " OR T.[" & destFieldName & "] IS NULL"
                        End If
                    Case "Paragraf"
                        If strID <> "49782" Then
                            setClause = "S.[" & sourceFieldName & "]"
                            whereClause = "OR T.[" & destFieldName & "] IS NULL"
                        Else
                            setClause = "'EJD'"
                            whereClause = "OR T.[" & destFieldName & "] IS NULL"
                        End If
                    Case "Status Dato"
                        setClause = "CDate(S.[" & sourceFieldName & "])"
                        whereClause = " AND IsDate(S.[" & sourceFieldName & "]) = True"
                    Case "Blokeret", "ID"
                        setClause = "CInt(Nz(S.[" & sourceFieldName & "], 0))"
                        whereClause = " AND IsNumeric(S.[" & sourceFieldName & "]) = True"
                    Case "Takst", "Xtra takst", "Xtra takst (grund)", "AntalM2" 'AntalM2 er nchar(10), men behandles som tal
                        setClause = "CDbl(Nz(S.[" & sourceFieldName & "], 0))"
                        whereClause = " AND IsNumeric(S.[" & sourceFieldName & "]) = True"
                    Case Else ' Dette er for alle nvarchar/tekst felter
                        setClause = "S.[" & sourceFieldName & "]"
                        whereClause = ""
                End Select

                ' Byg og eksekver den dynamiske SQL UPDATE statement
                strSQL = "UPDATE tblDebtorClientUser AS T " & _
                         "INNER JOIN [" & sourceTableName & "] AS S ON T.Konto = S.Account " & _
                         "SET T.[" & destFieldName & "] = " & setClause & " " & _
                         "WHERE T.[" & destFieldName & "] <> " & setClause & whereClause

                'Debug.Print strSQL ' Printer SQL til Immediate Window (Ctrl+G) til fejlfinding
                dB.Execute strSQL, dbFailOnError
            End If

            rsMap.MoveNext
        Loop
    End If
    rsMap.Close

    '----------------------------------------------------------------------------------
    ' DEL 2: INDSÆTTELSE AF NYE KUNDER
    ' Vi finder de kunder i kildetabellen, som ikke allerede eksisterer i måltabellen.
    '----------------------------------------------------------------------------------
    Dim destFieldList As String
    'Dim sourceFieldList As String

    ' Genåbn recordset for at bygge feltlisterne
    Set rsMap = dB.OpenRecordset("SELECT FeltNavn, [" & sourceFieldNameColumn & "] FROM tblDebtorImpFeltnavnOversigt " & _
                                "WHERE [" & sourceFieldNameColumn & "] IS NOT NULL AND [" & sourceFieldNameColumn & "] <> '-'")

    If rsMap.RecordCount > 0 Then
        rsMap.MoveFirst
        Do While Not rsMap.EOF
            destFieldName = rsMap!FeltNavn
            sourceFieldName = rsMap.Fields(sourceFieldNameColumn).value

            ' Byg listerne med komma-separerede feltnavne
            destFieldList = destFieldList & ", [" & destFieldName & "]"

            ' Byg kilde-listen med de nødvendige konverteringer
            Select Case destFieldName
                Case "Afdeling"
                    If strID <> "49782" Then
                        sourceFieldList = sourceFieldList & ", IIf(Nz(Dimension4,'0') <> '0', Dimension1+'_'+Dimension4, Dimension1)"
                    Else
                        sourceFieldList = sourceFieldList & ", 'EJD'"
                    End If
                Case "Paragraf"
                    If strID <> "49782" Then
                        sourceFieldList = sourceFieldList & ", [" & sourceFieldName & "]"
                    Else
                        sourceFieldList = sourceFieldList & ", 'EJD'"
                    End If
                Case "Status Dato"
                    sourceFieldList = sourceFieldList & ", IIf(IsDate([mlbStatusDato]), CDate([mlbStatusDato]), Null)"
                Case "Blokeret", "ID"
                    sourceFieldList = sourceFieldList & ", CInt(Nz([" & sourceFieldName & "], 0))"
                Case "Takst", "Xtra takst", "Xtra takst (grund)", "AntalM2"
                    sourceFieldList = sourceFieldList & ", CDbl(Nz([" & sourceFieldName & "], 0))"
                Case Else ' Tekst
                    sourceFieldList = sourceFieldList & ", [" & sourceFieldName & "]"
            End Select
            rsMap.MoveNext
        Loop

        ' Fjern det første komma fra listerne
        destFieldList = Mid(destFieldList, 3)
        sourceFieldList = Mid(sourceFieldList, 3)

        ' Byg den endelige INSERT INTO statement
        strSQL = "INSERT INTO tblDebtorClientUser (" & destFieldList & ") " & _
                 "SELECT " & sourceFieldList & " FROM [" & sourceTableName & "] AS S " & _
                 "WHERE S.Account NOT IN (SELECT T.Konto FROM tblDebtorClientUser AS T)"

        'Debug.Print "--- INSERT STATEMENT ---"
        'Debug.Print strSQL
        dB.Execute strSQL, dbFailOnError
    End If

    MsgBox "Kunder fra " & sourceTableName & " er nu opdateret i tblDebtorClientUser.", vbInformation, "Opdatering Fuldført"

Cleanup:
    On Error Resume Next
    rsMap.Close
    Set rsMap = Nothing
    Set dB = Nothing
    Exit Function

ErrorHandler:
    MsgBox "Der opstod en fejl." & vbCrLf & vbCrLf & _
           "Fejlnummer: " & Err.Number & vbCrLf & _
           "Beskrivelse: " & Err.Description & vbCrLf & _
           "SQL: " & strSQL, vbCritical, "Fejl i opdatering"
    Resume Cleanup
End Function
