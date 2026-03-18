Attribute VB_Name = "Uniconta Odata"
Option Compare Database
Option Explicit
Dim lngID As Long
Public Sub ConnectOdata_PostBudget( _
    ByVal intYear As Integer, _
    ByVal strFromAfd As String, _
    ByVal strToAfd As String, _
    ByVal intAllAfd As Integer, _
    ByVal intFirmaID As Long, _
    Optional ByVal strAfdUniconta As String)

    Dim conn As ADODB.Connection
    Dim rsAfd As ADODB.Recordset
    Dim rsIB As ADODB.Recordset

    Dim sql As String
    Dim strFromDate As String, strToDate As String
    Dim strAfd As String, strAfdNo As String, strUAfd As String
    Dim strAfdName As String, strBudgetNameID As String
    Dim strDate As String, strAmount As String
    Dim i As Integer

    Dim strCurrentUser As String, strCurrentDate As String

    Dim filePath As String, fileNumber As Integer
    Dim respHead As String, respLine As String
    Dim okAllLines As Boolean

    ' Tællere til monitor
    Static AntalSucces As Integer
    Static AntalFejl As Integer
    Static ErsteKald As Boolean

    strCurrentUser = Environ$("USERNAME")
    strCurrentDate = Format$(Date, "yyyy-mm-dd")

    ' Reset tællere ved første kald
    If Not ErsteKald Then
        AntalSucces = 0
        AntalFejl = 0
        ErsteKald = True
    End If

    ' ADO connection
    Set conn = New ADODB.Connection
    conn.ConnectionString = fncConnString
    conn.Open

    ' Afdelinger
    sql = "SELECT * FROM tblAfdeling " & _
          "WHERE Year_=" & intYear & " AND UnicontaFirmaID=" & intFirmaID

    If intAllAfd = 0 Then
        sql = sql & " AND Afdeling >= '" & Replace(strFromAfd, "'", "''") & "'" & _
                    " AND Afdeling <= '" & Replace(strToAfd, "'", "''") & "'"
    End If

    Set rsAfd = New ADODB.Recordset
    rsAfd.Open sql, conn, adOpenForwardOnly, adLockReadOnly

    strFromDate = Format$(DateSerial(intYear, 1, 1), "yyyy-mm-dd")
    strToDate = Format$(DateSerial(intYear, 12, 31), "yyyy-mm-dd")

    ' Log - opret mappe hvis den ikke findes
    Dim LogMappe As String
    LogMappe = CurrentProject.Path & "\Logs\"
    If Dir(LogMappe, vbDirectory) = "" Then
        MkDir LogMappe
    End If

    filePath = LogMappe & "log_budget_til_Uniconta_" & Format$(Now, "yyyymmdd_hhnnss") & ".txt"
    fileNumber = FreeFile
    Open filePath For Output As #fileNumber

    If Not rsAfd.EOF Then
        Do Until rsAfd.EOF

            ' Brug evt. input-afdeling til Uniconta – ellers brug afdeling fra rs
            If Len(Trim$(strAfdUniconta & "")) > 0 Then
                strAfd = Trim$(strAfdUniconta)
            Else
                strAfd = Nz(rsAfd!Afdeling, vbNullString)
            End If

            SplitAfdToNoAndUAfd strAfd, strAfdNo, strUAfd

            strAfdName = Nz(rsAfd!AfdelingsNavn, "Mangler_Navn")
            strBudgetNameID = CStr(intYear) & "-" & strAfdNo & " " & strAfdName
            If Len(strUAfd) > 0 Then strBudgetNameID = strBudgetNameID & " " & strUAfd
            strBudgetNameID = Trim$(Left(strBudgetNameID, 40))

            ' 1) Opret budget head
            Dim jsonHead As String
            jsonHead = "{""FromDate"":""" & strFromDate & """,""ToDate"":""" & strToDate & """,""Name"":""" & JsonEscape(strBudgetNameID) & """}"

            Print #fileNumber, "=== AFDELING: " & Nz(rsAfd!Afdeling, "") & " ==="
            Print #fileNumber, jsonHead
            respHead = Post_Uniconta("GLBudgetClient", jsonHead, CStr(intFirmaID))
            Print #fileNumber, respHead

            ' Log i revision (head)
            sql = "UPDATE tblAfdelingRevision SET MsgBudgHead='" & Replace(Left$(respHead, 250), "'", "''") & "', " & _
                  "Date_='" & strCurrentDate & "', User_='" & Replace(strCurrentUser, "'", "''") & "' " & _
                  "WHERE Afdeling='" & Replace(Nz(rsAfd!Afdeling, ""), "'", "''") & "' AND Year_=" & intYear
            conn.Execute sql

            ' 2) Hent budgetlinjer fra tblInterntBudget
            sql = "SELECT * FROM tblInterntBudget " & _
                  "WHERE Year_=" & intYear & _
                  " AND BudgetIalt <> 0" & _
                  " AND Afdeling='" & Replace(Nz(rsAfd!Afdeling, ""), "'", "''") & "'" & _
                  " AND KontoType <> 'Overskrift' AND KontoType <> 'Sum' " & _
                  "ORDER BY Afdeling, Konto"

            Set rsIB = New ADODB.Recordset
            rsIB.Open sql, conn, adOpenForwardOnly, adLockReadOnly

            okAllLines = True

            If Not rsIB.EOF Then
                Do Until rsIB.EOF
                    For i = 1 To 12

                        ' Dato i ISO Z-format
                        strDate = Format$(DateSerial(intYear, i, 1), "yyyy-mm-dd") & "T00:00:00Z"

                        ' Beløb -> numerisk JSON (spring 0 over)
                        If IsNull(rsIB.Fields("_" & CStr(i)).value) Then
                            GoTo NextMonth
                        End If

                        Dim dblAmount As Double
                        dblAmount = CDbl(rsIB.Fields("_" & CStr(i)).value)

                        If Round(dblAmount, 2) = 0 Then GoTo NextMonth

                        strAmount = Replace(Format$(Round(dblAmount, 2), "0.00"), ",", ".")

                        ' Byg 1 JSON-objekt (IKKE array)
                        Dim jsonLine As String
                        jsonLine = BuildBudgetLineJson( _
                            strDate:=strDate, _
                            budgetId:=strBudgetNameID, _
                            account:=Nz(rsIB!Konto, vbNullString), _
                            dimension1:=strAfdNo, _
                            amountNumeric:=strAmount, _
                            dimension4:=strUAfd)

                        Print #fileNumber, jsonLine

                        respLine = Post_Uniconta("GLBudgetLineClient", jsonLine, CStr(intFirmaID))
                        Print #fileNumber, respLine

                        ' Hvis der kommer 4xx/5xx i teksten, så marker fejl
                        If Left$(respLine, 6) = "Error:" Then okAllLines = False

NextMonth:
                    Next i
                    rsIB.MoveNext
                Loop
            End If

            rsIB.Close
            Set rsIB = Nothing

            ' Log i revision (lines)
            sql = "UPDATE tblAfdelingRevision SET MsgBudgLine='" & Replace(Left$(IIf(okAllLines, "OK", respLine), 250), "'", "''") & "', " & _
                  "Date_='" & strCurrentDate & "', User_='" & Replace(strCurrentUser, "'", "''") & "' " & _
                  "WHERE Afdeling='" & Replace(Nz(rsAfd!Afdeling, ""), "'", "''") & "' AND Year_=" & intYear
            conn.Execute sql

            ' Marker transferred hvis alt gik OK
            If okAllLines Then
                sql = "UPDATE tblAfdelingRevision SET Transferred=0 " & _
                      "WHERE Afdeling='" & Replace(Nz(rsAfd!Afdeling, ""), "'", "''") & "' AND Year_=" & intYear
                conn.Execute sql
                AntalSucces = AntalSucces + 1
            Else
                AntalFejl = AntalFejl + 1
            End If

            ' OPDATER MONITOR
            If CurrentProject.AllForms("frmOverfoerselMonitor").IsLoaded Then
                Forms!frmOverfoerselMonitor.OpdaterProgress _
                    Nz(rsAfd!Afdeling, ""), respHead, IIf(okAllLines, "OK", respLine)
            End If

            rsAfd.MoveNext
        Loop

        ' AFSLUT MONITOR
        If CurrentProject.AllForms("frmOverfoerselMonitor").IsLoaded Then
            Forms!frmOverfoerselMonitor.AfslutProgress AntalSucces, AntalFejl
        End If

        ' Reset static variable
        ErsteKald = False
    End If

Cleanup:
    On Error Resume Next
    Close #fileNumber
    If Not rsIB Is Nothing Then If rsIB.State <> 0 Then rsIB.Close
    If Not rsAfd Is Nothing Then If rsAfd.State <> 0 Then rsAfd.Close
    If Not conn Is Nothing Then If conn.State <> 0 Then conn.Close
    Set rsIB = Nothing
    Set rsAfd = Nothing
    Set conn = Nothing
End Sub
Public Function Post_Uniconta(ByVal strTbl As String, ByVal json As String, ByVal strFirmaID As String) As String
    Dim http As Object
    Set http = CreateObject("MSXML2.ServerXMLHTTP.6.0")

    On Error GoTo EH

    http.Open "POST", "https://odata.uniconta.com/api/Entities/Insert/" & strTbl, False
    http.SetTimeouts 5000, 8000, 15000, 60000
    http.SetRequestHeader "Authorization", SetAuthorizationHeader(strFirmaID)
    http.SetRequestHeader "Content-Type", "application/json"
    http.SetRequestHeader "Accept", "application/json"
    http.Send json

    ' Uniconta kan returnere 200 (med JSON) eller 204 (uden body) på OK
    If http.Status = 200 Or http.Status = 204 Then
        Post_Uniconta = "OK: " & http.Status & " - " & Nz(http.ResponseText, "")
    Else
        Post_Uniconta = "Error: " & http.Status & " - " & Nz(http.ResponseText, "")
    End If
    Exit Function

EH:
    Post_Uniconta = "Error: VBA/COM -" & Err.Number & " - " & Err.Description
End Function
' =========================
' Helpers
' =========================
Private Sub SplitAfdToNoAndUAfd(ByVal afd As String, ByRef afdNo As String, ByRef uAfd As String)
    Dim p As Long
    p = InStr(1, afd, "_")
    If p > 0 Then
        afdNo = Left$(afd, p - 1)
        uAfd = Mid$(afd, p + 1)
    Else
        afdNo = afd
        uAfd = vbNullString
    End If
    afdNo = Trim$(afdNo)
    uAfd = Trim$(uAfd)
End Sub

Private Function BuildBudgetLineJson( _
    ByVal strDate As String, _
    ByVal budgetId As String, _
    ByVal account As String, _
    ByVal dimension1 As String, _
    ByVal amountNumeric As String, _
    ByVal dimension4 As String) As String

    Dim j As String
    j = "{""Date"":""" & strDate & """," & _
        """BudgetId"":""" & JsonEscape(Trim$(budgetId)) & """," & _
        """Account"":""" & JsonEscape(Trim$(account)) & """," & _
        """Dimension1"":""" & JsonEscape(Trim$(dimension1)) & """," & _
        """Amount"":" & amountNumeric

    If Len(Trim$(dimension4 & "")) > 0 Then
        j = j & ",""Dimension4"":""" & JsonEscape(Trim$(dimension4)) & """"
    End If

    j = j & "}"
    BuildBudgetLineJson = j
End Function

Private Function JsonEscape(ByVal s As String) As String
    ' Minimal JSON escape til strings
    s = Replace(s, "\", "\\")
    s = Replace(s, """", "\""")
    s = Replace(s, vbCrLf, "\n")
    s = Replace(s, vbCr, "\n")
    s = Replace(s, vbLf, "\n")
    JsonEscape = s
End Function
Function fncLngID(intCnt As Integer)
    lngID = lngID + intCnt
End Function
Sub testPostBudget()
    Call ConnectOdata_PostBudget(2025, "60_ØSTERGADE", "60_ØSTERGADE", 0, 48928)
End Sub
Function fncBudgetTilUniconta(intYear As Integer)
    Dim conn As ADODB.Connection
    Dim rsAfd As ADODB.Recordset
    Dim str As String, strAfd As String, strAfdUniconta As String
    Dim lngFirmaID As Long
    Dim AntalAfdelinger As Integer

    ' Åbn monitor-formen
    DoCmd.OpenForm "frmOverfoerselMonitor", acNormal

    ' Initialize ADO connection
    Set conn = New ADODB.Connection
    conn.ConnectionString = fncConnString
    conn.Open

    str = "SELECT * FROM tblAfdelingRevision " & _
          "WHERE Transferred = 1 And Year_ = " & intYear

    ' Execute query for afdeling
    Set rsAfd = New ADODB.Recordset
    rsAfd.Open str, conn, adOpenStatic, adLockReadOnly

    ' Tæl antal afdelinger
    If Not rsAfd.EOF Then
        rsAfd.MoveLast
        AntalAfdelinger = rsAfd.RecordCount
        rsAfd.MoveFirst

        ' Initialiser progress
        Forms!frmOverfoerselMonitor.InitialiserProgress AntalAfdelinger
    Else
        MsgBox "Ingen afdelinger markeret til overførsel.", vbInformation
        GoTo Cleanup
    End If

    If Not rsAfd.EOF Then
        Do Until rsAfd.EOF
            strAfd = rsAfd!Afdeling
            strAfdUniconta = IIf(Nz(rsAfd!Afdeling_Uniconta, "") <> "", Nz(rsAfd!Afdeling_Uniconta, ""), rsAfd!Afdeling)

            lngFirmaID = Nz(DLookup("UnicontaFirmaID", "tblAfdeling", "Afdeling = '" & rsAfd!Afdeling & "' And Year_ = " & intYear), 0)

            If lngFirmaID = 0 Then
                MsgBox "FirmaID til Uniconta mangler for afdeling: " & strAfd
            Else
                Call ConnectOdata_PostBudget(intYear, strAfd, strAfd, 0, lngFirmaID, strAfdUniconta)
            End If

            rsAfd.MoveNext
        Loop
    End If

Cleanup:
    ' Cleanup
    If Not rsAfd Is Nothing Then
        If rsAfd.State <> 0 Then rsAfd.Close
    End If
    Set rsAfd = Nothing

    If Not conn Is Nothing Then
        If conn.State <> 0 Then conn.Close
    End If
    Set conn = Nothing
End Function

Sub IndsætFBRegKladde_Uniconta(intYear As Integer, intMth As Integer)
    Dim rs As DAO.Recordset
    Dim http As Object
    Dim strKladdeNavn As String
    Dim json As String
    Dim strFirmaID As String
    Dim strDebit As String
    Dim strCredit As String
    Dim dteLastDayMth As Date
    Dim jsonArray As String

    dteLastDayMth = DateSerial(intYear, intMth + 1, 0)
    strFirmaID = 48928
    strKladdeNavn = DLookup("strPath", "tblParm_FB_Excel_Path", "Description = 'Uniconta kladde reg.'")

    Set http = CreateObject("MSXML2.XMLHTTP")

    Set rs = CurrentDb.OpenRecordset("SELECT * FROM tblFBRegKladde ORDER BY Afdeling, Konto", dbOpenDynaset, dbSeeChanges)

    If Not rs.EOF Then
        jsonArray = "["
        Do Until rs.EOF
            strDebit = Replace(CStr(Nz(rs!Debet, "")), ",", ".")
            strCredit = Replace(CStr(Nz(rs!Kredit, "")), ",", ".")

            json = "{""Journal"":""" & strKladdeNavn & _
            """, ""Date"":""" & Format(dteLastDayMth, "yyyy-MM-dd") & _
            """, ""Account"":""" & rs!Konto & _
            """, ""Text"":""" & rs!Tekst & _
            """, ""Debit"":""" & strDebit & _
            """, ""Credit"":""" & strCredit & _
            """, ""Dimension1"":""" & rs!Afdeling & _
            """, ""Dimension2"":""" & rs!Bærer & _
            """, ""Dimension4"":""" & rs!Underafdelinger & _
            """}"

            ' Tilføj JSON-objektet til arrayet
            jsonArray = jsonArray & json & ","

            rs.MoveNext
        Loop
        rs.Close
        Set rs = Nothing

        ' Fjern sidste komma og afslut JSON array
        jsonArray = Left(jsonArray, Len(jsonArray) - 1) & "]"

        ''Debug.Print jsonArray


        ' Send hele JSON-arrayet i ét API-kald
        http.Open "POST", "https://odata.uniconta.com/api/Entities/InsertList/GLDailyJournalLineClient", False
        http.SetRequestHeader "Authorization", SetAuthorizationHeader(strFirmaID)
        http.SetRequestHeader "Content-Type", "application/json"
        http.Send jsonArray

        If http.Status = 200 Then
            MsgBox "Data inserted successfully!"
        Else
            'Debug.Print http.ResponseText
            MsgBox "Error: " & http.Status & " - " & http.ResponseText
        End If
    End If
End Sub

Function SetAuthorizationHeader(strFirmaID As String) As String
    Dim username As String, password As String
    username = strFirmaID & "/dan@consona.biz"
    password = "Phillippa1968"
    SetAuthorizationHeader = "Basic " & Base64Encode(username & ":" & password)
End Function
Sub ConnectToOData(strAccessTable As String, strUnicontaTable As String, strFirmaID As String, strFilter As String)
    Dim objHTTP As Object
    Dim json As Object
    Dim strURL As String
    Dim jsonString As Variant
    Dim parsedData As Object
    Dim strTableName As String
    Dim fieldCreateSQL As String
    Dim fieldInsertSQL As String
    Dim fieldValues As String
    Dim i As Integer
    Dim record As Variant, uniqueFieldName As Variant, key As Variant ' Declare loop variables
    Dim strUsername As String
    Dim strPassword As String
    Dim dataDict As Object
    Dim strDataDict As String
    Dim ParsedJSON As Object
        Dim Item As Variant
    Dim dB As DAO.Database
    Dim tblDef As DAO.TableDef
    Dim fld As DAO.field

    ' Set temporary table name
    strTableName = strAccessTable

    ' Create an XMLHTTP object
    Set objHTTP = CreateObject("MSXML2.ServerXMLHTTP")

    ' Define OData service URL
    If strFilter <> "" Then
        strURL = "https://odata.uniconta.com/odata/" & strFirmaID & "/" & strUnicontaTable & "?$filter=" & strFilter
    Else
        strURL = "https://odata.uniconta.com/odata/" & strFirmaID & "/" & strUnicontaTable
    End If

    ''Debug.Print strURL


    ' Define credentials
    strUsername = "dan@consona.biz" ' Replace with your username
    strPassword = "Phillippa1968" ' Replace with your password

    ' Open a connection to the OData service
    objHTTP.Open "GET", strURL, False

    ' Set Authorization header
    objHTTP.SetRequestHeader "Authorization", "Basic " & Base64Encode(strUsername & ":" & strPassword)

    ' Send the request and wait for the response
    objHTTP.Send


    ' Check for HTTP errors
    If objHTTP.Status <> 200 Then
        'Debug.Print "Error: HTTP status code " & objHTTP.Status
        Exit Sub
    End If

    ' Parse the JSON response
    jsonString = objHTTP.ResponseText

    Debug.Print jsonString

       ' Parse the JSON string
    Set ParsedJSON = JsonConverter.ParseJson(jsonString)

    ' Initialize database object
    Set dB = CurrentDb

    ' Check if the table exists and delete if necessary
    On Error Resume Next
    dB.TableDefs.Delete strTableName
    On Error GoTo 0

    ' Create a new table
    Set tblDef = dB.CreateTableDef(strTableName)

    ' Inspect the first item to determine field names from JSON
    If ParsedJSON("value").Count > 0 Then
        For Each key In ParsedJSON("value")(1).Keys
            Set fld = tblDef.CreateField(key, dbText, 255)  ' Assuming all fields are text
            tblDef.Fields.Append fld
        Next key
    End If

    ' Add extra fields: Year_, Date_, User_
    Set fld = tblDef.CreateField("Year_", dbInteger)
    tblDef.Fields.Append fld
    Set fld = tblDef.CreateField("Date_", dbDate)
    tblDef.Fields.Append fld
    Set fld = tblDef.CreateField("User_", dbText, 255)
    tblDef.Fields.Append fld

    ' Append the table definition
    dB.TableDefs.Append tblDef

    ' Open the newly created table and insert data
    Dim tbl As DAO.Recordset
    Set tbl = dB.OpenRecordset(strTableName, dbOpenDynaset, dbSeeChanges)

    ' Loop through each item in the JSON array
    For Each Item In ParsedJSON("value")
        tbl.AddNew
        For Each key In Item.Keys
            If key <> "Image" And key <> "mlbFaktOplys" And Not IsNull(key) Then
                ' Check if the value is a zero-length string and set to Null if necessary
                If Item(key) = "" Then
                    tbl(key).value = Null
                Else
                    tbl(key) = Item(key)
                End If
            End If
        Next key

        ' Add values for extra fields
        tbl("Year_") = Year(Date)
        tbl("Date_") = Date
        tbl("User_") = Environ("USERNAME")

        tbl.Update
    Next Item

    'MsgBox "Data transport færdig"

    ' Cleanup
    tbl.Close
    Set tbl = Nothing
    Set dB = Nothing

End Sub
Sub runUnicontaGLTransSumClient()

    'Call ConnectToOData("tmpGLTransSumClient_48928", "GLTransSumClient", "48928", "Date ge datetime'2024-01-01T00:00:00' and Date le datetime'2024-10-31T00:00:00' and Account le '3000'")
    'Call ConnectToOData("tmpGLTransSumClient_49782_1", "GLTransClient", "49782", "$top=1000&$skip=1000")
    'Call ConnectToOData("tmpGLTransClient_48928", "GLTransClient", "48928", "Date ge datetime'2024-01-01T00:00:00' and Date le datetime'2024-10-31T00:00:00' and Account ge '1100' and Account le '1198' and Dimension1 eq '1'")

    '
    'Call ConnectToOData("tmpGLTransSumClient_49782_EJD", "GLTransSumClient", "49782", "Date ge datetime'2024-01-01T00:00:00' and Date le datetime'2024-08-30T00:00:00' and Account le '3000'")
    'Call ConnectToOData("tmpGLTransClient_49782_EJD", "GLTransClient", "49782", "Date ge datetime'2024-01-01T00:00:00' and Date le datetime'2024-10-31T00:00:00' and Account le '3000'")
    'Call ConnectToOData("tmpGLBudgetLineClient_49782_EJD", "GLBudgetLineClient", "49782", "Date ge datetime'2024-01-01T00:00:00' and Date le datetime'2024-12-31T00:00:00' and Account le '3000'")



End Sub

Sub runUnicontaOdata()

'    Call ConnectToOData("tmpAfdeling_49783", "GLDimType1Client", "49783")
'    Call ConnectToOData("tmpAfdeling_49782", "GLDimType1Client", "49782")
'    Call ConnectToOData("tmpAfdeling_49780", "GLDimType1Client", "49780")
    'Call ConnectToOData("tmpAfdeling_48928", "GLDimType1Client", "48928", "")



    Call ConnectToOData("tmpDebitorClientUser_EJD_1", "DebtorClientUser", "49782", "")


End Sub
Function Base64Encode(strData)
    Dim objXML As MSXML2.DOMDocument60
    Dim objNode As MSXML2.IXMLDOMElement
    Dim arrData() As Byte
    arrData = StrConv(strData, vbFromUnicode)

    ' Create a DOMDocument60 object
    Set objXML = New MSXML2.DOMDocument60

    ' Create a text node and append it to the document
    Set objNode = objXML.createElement("b64")
    objNode.dataType = "bin.base64"
    ''Debug.Print StrConv(strData, vbFromUnicode)
    objNode.nodeTypedValue = arrData

    objXML.appendChild objNode

    ' Return the encoded text
    Base64Encode = objNode.text

    ' Clean up
    Set objNode = Nothing
    Set objXML = Nothing
End Function
Sub BudgetLine()
    'Call ConnectToOData("tmpBudgetLine_48928", "GLBudgetLineClient", "48928")
End Sub
Public Function fncUpdateAfd(strTmpTableName As String, strUnicontaTable As String)
Dim dB As DAO.Database
Dim str As String
Dim rs As DAO.Recordset
Dim intFirmaID As Long

    Set dB = CurrentDb()

    str = "SELECT FirmaID, FirmaNavn FROM tblUnicontaFirmaID "

    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    With rs
        If Not .EOF Then
            Do Until .EOF

                intFirmaID = !FirmaID
                strTmpTableName = "tmpAfdeling_" & CStr(intFirmaID)

                'Call ConnectToOData(strTmpTableName, strUnicontaTable, CStr(intFirmaID))

                .MoveNext
            Loop

        End If

    End With

dB.Close
'rs.Close
Set rs = Nothing


End Function
Sub UniTest()
    Call fncUpdateAfd("tmpAfdeling", "GLDimType1Client")
End Sub
