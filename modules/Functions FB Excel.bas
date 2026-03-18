Attribute VB_Name = "Functions FB Excel"
Option Compare Database
Option Explicit
Private Sub testOpen()
If CurrentDb.Properties("AccessMode") = 1 Then

    MsgBox "The database is opened in Exclusive mode. Please reopen in Shared mode.", vbExclamation
    'Application.Quit
End If

End Sub
Public Sub InsertUnicontaToSQLPython(Filter_ As String, Year_ As Integer, Month_ As Integer, UnicontaID As String)
Dim AccessPath As String
Dim ExecutablePath As String
Dim command As String
Dim ShellObj As Object

  ' Define variables for JSON values
    Dim strYear As String
    Dim strMonth As String
    Dim strDate As String
    Dim unic_username As String
    Dim unic_password As String
    Dim filter As String
    Dim sql_connection_string As String
    Dim pythonExe As String
    Dim pythonScript As String

    ' Assign values to variables
    strYear = CStr(Year_)
    strMonth = CStr(Month_)
    strDate = fncGetLastDayOfMonth(Year_, Month_)
    unic_username = "dan@consona.biz"
    unic_password = "Phillippa1968"
    filter = "Date ge datetime'" & Year_ & "-01-01T00:00:00' and Date le datetime'" & strDate & "T00:00:00' and Account le '3000'"

    sql_connection_string = Replace(fncConnString, "\", "\\")

    Call CreateJSONFile(strYear, strMonth, strDate, unic_username, unic_password, filter, UnicontaID, sql_connection_string)

     ' Full path to python.exe
    pythonExe = "C:\Users\" & Environ("UserName") & "\AppData\Local\Programs\Python\Python313\python.exe"

    ' Full path to your Python script
    pythonScript = "C:\Temp\SUF\Python\pyodataunicGLtrans.py"

    ' Build the command string
    ExecutablePath = pythonExe & " " & pythonScript

    ' Use WScript.Shell to execute the command

    Set ShellObj = CreateObject("WScript.Shell")
    ShellObj.Run ExecutablePath, 1, True ' Wait for the script to finish
    Set ShellObj = Nothing
    Shell "taskkill /f /im python.exe", vbHide
    Exit Sub


ErrorHandler:
    MsgBox "Failed to run the executable. Ensure the file exists at: " & ExecutablePath, vbCritical, "Error"
End Sub
Function CreateJSONFile(Year_ As String, Month_ As String, _
                        Date_ As String, unic_username As String, unic_password As String, _
                        filter As String, company As String, sql_connection_string As String)

    Dim fso As Object
    Dim file As Object
    Dim jsonContent As String
    Dim filePath As String
    Dim odata_base_url As String

    odata_base_url = "https://odata.uniconta.com/odata/"

    ' Construct JSON content
    jsonContent = "{""odata_base_url"": """ & odata_base_url & """," & vbCrLf
    jsonContent = jsonContent & """Year_"": """ & Year_ & """," & vbCrLf
    jsonContent = jsonContent & """Month_"": """ & Month_ & """," & vbCrLf
    jsonContent = jsonContent & """Date_"": """ & Date_ & """," & vbCrLf
    jsonContent = jsonContent & """unic_username"": """ & unic_username & """," & vbCrLf
    jsonContent = jsonContent & """unic_password"": """ & unic_password & """," & vbCrLf
    jsonContent = jsonContent & """filter"": """ & filter & """," & vbCrLf
    jsonContent = jsonContent & """company"": """ & company & """," & vbCrLf
    jsonContent = jsonContent & """sql_connection_string"": """ & sql_connection_string & """}" & vbCrLf

    ' Define the file path
    filePath = "C:\Temp\SUF\Python\pyodataunictrans.json"

    ' Create and write to the file
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.CreateTextFile(filePath, True)
    file.Write jsonContent
    file.Close

    'MsgBox "JSON file created successfully at " & filePath, vbInformation
End Function
Public Sub ImportVismaToNewTable(strMth As String, strYear As String)
    Dim strTableName As String
    Dim blnHasFieldNames As Boolean
    Dim strLocalFilePath As String
    Dim strFileName As String
    Dim conn As ADODB.Connection
    Dim cmd As ADODB.command
    Dim strPeriodeTil As String

    strPeriodeTil = Format(DateSerial(CInt(strYear), CInt(strMth) + 1, 0), "yyyymmdd")
    strYear = Mid(strYear, 3, 2)

    strMth = Format(strMth, "00")

    strLocalFilePath = ELookup("strPath", "tblParm_FB_Excel_Path", "Description = 'VISMA Lokal'")
    strFileName = "Stamkort" & strMth & strYear & ".csv"
    strLocalFilePath = strLocalFilePath & strFileName

    If Not fncFileExists(strLocalFilePath) Then
        MsgBox "Filen " & strFileName & " eksisterer ikke! " & vbCrLf & "Den skal ligge i mappen: " & vbCrLf & strLocalFilePath
        Exit Sub
    End If

    ' Specify the name for the new Access table
    strTableName = "StamkortVisma" & strMth & strYear

    If fncDeleteTableIfExists(strTableName) Then
    End If

    ' Set to True if the first row contains field names
    blnHasFieldNames = True

    Call ImportCSVToTable(strTableName, strLocalFilePath, blnHasFieldNames)

    ' Delete existing records in tblTmpStamkortFB and insert new data
    Set conn = New ADODB.Connection
    Set cmd = New ADODB.command

    conn.ConnectionString = fncConnString ' Replace with your connection string function
    conn.Open

    ' Delete existing records
    cmd.ActiveConnection = conn
    cmd.CommandText = "DELETE FROM tblTmpStamkortFB"
    cmd.Execute

    Call AppendStamkort(strTableName, strPeriodeTil)

    MsgBox "CSV data successfully imported into table: " & strTableName, vbInformation

    ' Clean up
    conn.Close
    Set cmd = Nothing
    Set conn = Nothing
End Sub
Private Sub AppendStamkort(strTableName As String, strPeriodeTil As String)
Dim dB As DAO.Database
Dim rsSQL As DAO.Recordset
Dim rsLoc As DAO.Recordset
Dim str As String

Set dB = CurrentDb

str = "SELECT * FROM " & strTableName & " " & _
      "WHERE [ANS_PERIODE TIL] >= '" & strPeriodeTil & "' AND ARBEJDSGIVER >= '000001' AND ARBEJDSGIVER <= '000009' AND LEN(ARBEJDSGIVER) = 6"

Set rsLoc = dB.OpenRecordset(str)

DoCmd.SetWarnings False

With rsLoc
    Do Until .EOF

         str = "INSERT INTO tblTmpStamkortFB (MEDARBEJDER, MEDARBEJDERNAVN, FRA, TIL, ANS_BETEGN, [FØRSTE ANS], TILTRÅDT, FRATRÅDT, AFD, AFD_BETEGN, Valgfri1, Valgfri2, Valgfri3, Valgfri4, Valgfri5, Valgfri6, LØNGRUPPE, NORMTID) " & _
              "VALUES(" & _
              "" & !Medarbejder & ", " & _
              "'" & !MEDARBEJDERNAVN & "', " & _
              "'" & Nz(![ANS_PERIODE FRA], 0) & "', " & _
              "'" & Nz(Mid(![ANS_PERIODE TIL], 7, 2) & "-" & Mid(![ANS_PERIODE TIL], 5, 2) & "-" & Mid(![ANS_PERIODE TIL], 1, 4), 0) & "', " & _
              "'" & !ANS_BETEGN & "', " & _
              "'" & Nz(![FØRSTE ANS_], 0) & "', " & _
              "'" & Nz(!TILTRÅDT, 0) & "', " & _
              "'" & IIf(IsNull(!FRATRÅDT) Or Trim(!FRATRÅDT) = "", "31-12-2050", !FRATRÅDT) & "', " & _
              "'" & !AFD_ & "', " & _
              "'" & !AFD_BETEGN_ & "', " & _
              "'" & !Valgfri1 & "', " & _
              "'" & IIf(!Valgfri2 = "BREMERH09", "BREMERHO9", !Valgfri2) & "', " & _
              "'" & !Valgfri3 & "', " & _
              "'" & !Valgfri4 & "', " & _
              "'" & !Valgfri5 & "', " & _
              "'" & !Valgfri6 & "', " & _
              "'" & !LØNGRUPPE & "', " & _
              "" & Replace(![NORMTID MEDARB_], ",", ".") & _
              ")"

        DoCmd.RunSQL str
    .MoveNext

Loop
End With

DoCmd.SetWarnings False

Set dB = Nothing
Set rsLoc = Nothing

End Sub

Public Function ImportCSVToTable(strTableName As String, strLocalFilePath As String, Optional blnHasFieldNames As Boolean = True)
    ' Import semicolon-delimited CSV files with handling for fixed-width fields
    Dim fileNumber As Integer
    Dim lineData As String
    Dim fieldData() As String
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim rsSV As DAO.Recordset
    Dim fieldNames() As String
    Dim i As Integer
    Dim firstLine As Boolean
    Dim str As String


    On Error GoTo ErrorHandler

    ' Open the file for reading
    fileNumber = FreeFile
    Open strLocalFilePath For Input As #fileNumber

    ' Get database reference
    Set dB = CurrentDb

    ' Create the table dynamically
    dB.Execute "CREATE TABLE " & strTableName & " (ID COUNTER PRIMARY KEY)"

    firstLine = True

    ' Read the file line by line
    Do While Not EOF(fileNumber)
        Line Input #fileNumber, lineData

        ' Split the line into fields based on semicolons
        fieldData = Split(lineData, ";")

        If firstLine And blnHasFieldNames Then
            ' Use the first line to define field names
            ReDim fieldNames(LBound(fieldData) To UBound(fieldData))

            For i = LBound(fieldData) To UBound(fieldData)
                fieldNames(i) = Trim(fieldData(i))
                fieldNames(i) = Replace(fieldNames(i), ".", "_")

                If fieldNames(i) <> "" Then
                    dB.Execute "ALTER TABLE " & strTableName & " ADD COLUMN [" & fieldNames(i) & "] TEXT(255)"
                End If

            Next i

            firstLine = False
        Else
            ' Insert data into the table
            If rs Is Nothing Then Set rs = dB.OpenRecordset(strTableName)

            rs.AddNew
            For i = LBound(fieldData) To UBound(fieldData)
                If i <= UBound(fieldNames) And fieldNames(i) <> "NOTAT" Then
                    rs.Fields(fieldNames(i)).value = Trim(fieldData(i))
                End If
            Next i
            rs.Update
        End If
    Loop

    ' Close the file
    Close #fileNumber

    DoCmd.SetWarnings False

        str = "UPDATE " & strTableName & " " & _
              "Set [ANS_PERIODE TIL] = Mid([ANS_PERIODE TIL], 7, 4) & Mid([ANS_PERIODE TIL], 4, 2) & Mid([ANS_PERIODE TIL], 1, 2) "

        DoCmd.RunSQL str

    DoCmd.SetWarnings True

    ' Cleanup
    If Not rs Is Nothing Then rs.Close
    Set rs = Nothing
    Set dB = Nothing


    Exit Function

ErrorHandler:
    If Err.Number <> 0 Then MsgBox "Error " & Err.Number & ": " & Err.Description, vbCritical
    If Not rs Is Nothing Then rs.Close
    Close #fileNumber
    Set rs = Nothing
    Set dB = Nothing
End Function
Sub UpdateNormtid()
    Call CreateLederTillægExcel(2024, 10)
End Sub
Sub CreateLederTillægExcel(pYear As Integer, pMonth As Integer)
    ' Declare Excel objects
    Dim xlApp As Object
    Dim xlBook As Object
    Dim xlSheet1 As Object
    Dim xlSheet2 As Object
    Dim xlSheet3 As Object
    Dim savePath As String

    ' Create new Excel instance
    Set xlApp = CreateObject("Excel.Application")
    xlApp.Visible = True  ' Set to False if you don't want to show Excel during the process

    ' Add a new workbook
    Set xlBook = xlApp.Workbooks.Add

    ' Add three sheets
    Set xlSheet1 = xlBook.sheets(1)
    xlSheet1.Name = "Størrelse ledertillæg"  ' Rename as desired

    ' Add and name Sheet2
    Set xlSheet2 = xlBook.sheets.Add(After:=xlBook.sheets(1))
    xlSheet2.Name = "Stamkort"

    ' Add and name Sheet3
    Set xlSheet3 = xlBook.sheets.Add(After:=xlBook.sheets(2))
    xlSheet3.Name = "Faste lønarter"

    ' Insert provided text into xlSheet1 using a variable for the row number
    Dim currentRow As Long
    currentRow = 2

    Call InsertMergedText(xlSheet1, currentRow, "§ 5.         STILLINGSTILLÆG TIL AFDELINGSLEDERE")
    xlSheet1.range("B2").Font.Size = 12
    xlSheet1.range("B2").Font.Bold = True

    currentRow = currentRow + 2
    Call InsertMergedText(xlSheet1, currentRow, "")
    currentRow = currentRow + 2
    Call InsertMergedText(xlSheet1, currentRow, "Stk. 1. Til en afdelingsleder ydes følgende tillæg afhængig af antal årsværk i afdelingen:")
    currentRow = currentRow + 2
    Call InsertMergedText(xlSheet1, currentRow, "· Ved 0-4 årsværk ydes et tillæg på kr.   6.000,00 per måned.")
    currentRow = currentRow + 2
    Call InsertMergedText(xlSheet1, currentRow, "· Ved 5-8 årsværk ydes et tillæg på kr.   9.000,00 per måned.")
    currentRow = currentRow + 2
    Call InsertMergedText(xlSheet1, currentRow, "· Ved 9-15 årsværk ydes et tillæg på kr. 12.000,00 per måned.")
    currentRow = currentRow + 2
    Call InsertMergedText(xlSheet1, currentRow, "· Ved 16+ årsværk ydes et tillæg på kr.  15.000,00 per måned.")
    currentRow = currentRow + 2
    Call InsertMergedText(xlSheet1, currentRow, "Opgørelsen af antal årsværk tælles således: Afdelingslederen tæller selv med.")
    currentRow = currentRow + 1
    Call InsertMergedText(xlSheet1, currentRow, "Timelønnede tælles ikke med. Alle fastansatte tælles med, med den grad de arbejder.")

    ' Insert the additional header text in xlSheet2
    xlSheet2.range("A1").value = "Afdeling"
    xlSheet2.range("B1").value = "Medarbejder"
    xlSheet2.range("C1").value = "Medarbejdernavn"
    xlSheet2.range("D1").value = "Ans. Periode FRA"
    xlSheet2.range("E1").value = "Ans.Periode TIL"
    xlSheet2.range("F1").value = "Normtid medarb."
    xlSheet2.range("G1").value = "Årsværk"
    xlSheet2.range("A1:G1").Font.Size = 12
    xlSheet2.range("A1:G1").Font.Bold = True


    xlSheet3.range("A1").value = "Afdeling"
    xlSheet3.range("B1").value = "Medarbejder"
    xlSheet3.range("C1").value = "Medarbejdernavn"
    xlSheet3.range("D1").value = "Lønart"
    xlSheet3.range("E1").value = "Lønart beskrivelse"
    xlSheet3.range("F1").value = "Ledertillæg kr. "
    xlSheet3.range("G1").value = "Antal medarbejdere"
    xlSheet3.range("A1:G1").Font.Size = 12
    xlSheet3.range("A1:G1").Font.Bold = True


    ' Insert data from the tblFBNormtid table into xlSheet2 and xlSheet3
    Dim rs As Object
    Dim str As String
    Dim conn As Object ' ADODB.Connection
    Dim dteLastDayInMonth As Date
    Dim strLastDayInMonth As String

    ' Initialize the ADO connection
    Set conn = CreateObject("ADODB.Connection")
    conn.Open fncConnString

    dteLastDayInMonth = DateSerial(pYear, pMonth + 1, 1)

    dteLastDayInMonth = dteLastDayInMonth - 1

    strLastDayInMonth = Format(dteLastDayInMonth, "yyyy-mm-dd")

    Set rs = CreateObject("ADODB.Recordset")
     str = "SELECT * FROM tblFBNormtid WHERE ÅR = " & pYear & " AND MÅNED = " & pMonth & _
      " AND (FRATRÅDT IS NULL OR FRATRÅDT >= '" & strLastDayInMonth & "') ORDER BY AFD"

    ''Debug.Print str

    rs.Open str, conn, adOpenKeyset, adLockOptimistic

    Dim dataRow As Long
    dataRow = 2
    Dim sheet3Row As Long
    sheet3Row = 2
    Dim currentAFD As String
    Dim lastAFD As String
    Dim startRow As Long
    startRow = 2
    Dim strAfdLedNavn As String
    Dim strAfdLedNr As String



    Do While Not rs.EOF
        currentAFD = Nz(rs.Fields("AFD").value, "")

        ' Check if we're moving to a new "AFD" group and handle the previous group
        If lastAFD <> "" And lastAFD <> currentAFD Then
            ' Insert SUM row for the previous group
            xlSheet2.Cells(dataRow, 2).value = "I alt for afdeling: "
            xlSheet2.Cells(dataRow, 3).value = lastAFD
            xlSheet2.Cells(dataRow, 6).Formula = "=SUM(F" & startRow & ":F" & dataRow - 1 & ")"
            xlSheet2.Cells(dataRow, 7).Formula = "=SUM(G" & startRow & ":G" & dataRow - 1 & ")"
            xlSheet2.range("A" & dataRow & ":G" & dataRow).Font.Bold = True
            xlSheet2.range("A" & dataRow & ":G" & dataRow).Borders(xlEdgeTop).LineStyle = xlContinuous

                ' Insert calculated value into xlSheet3 based on column G
                Dim gValue As Double
                gValue = xlSheet2.Cells(dataRow, 7).value
                Dim lederTillæg As Long

                xlSheet3.Cells(sheet3Row, 1).value = lastAFD
                If strAfdLedNavn <> "" Then
                    xlSheet3.Cells(sheet3Row, 2).value = strAfdLedNr
                    xlSheet3.Cells(sheet3Row, 3).value = strAfdLedNavn
                Else
                    xlSheet3.Cells(sheet3Row, 2).value = "0"
                    xlSheet3.Cells(sheet3Row, 3).value = "Leder mangler i afd.: " & lastAFD
                End If

                xlSheet3.Cells(sheet3Row, 4).value = "1562"
                xlSheet3.Cells(sheet3Row, 5).value = "Ledertillæg"

                'Susanne har ikke alle i afd. 1 under sig, jeg trækker 9 personer fra fast
                If lastAFD = "1" Then
                    gValue = gValue - 9
                End If

                If gValue > 0 And gValue < 5 Then
                    lederTillæg = 6000
                ElseIf gValue >= 5 And gValue < 9 Then
                    lederTillæg = 9000
                ElseIf gValue >= 9 And gValue < 16 Then
                    lederTillæg = 12000
                ElseIf gValue >= 16 Then
                    lederTillæg = 15000
                End If

                xlSheet3.Cells(sheet3Row, 6).value = lederTillæg
                xlSheet3.Cells(sheet3Row, 7).value = gValue

                sheet3Row = sheet3Row + 1
                strAfdLedNr = ""
                strAfdLedNavn = ""
                lederTillæg = 0

            ' Update startRow for the next group
            startRow = dataRow + 1
            dataRow = dataRow + 1
        End If

        ' Insert the current row's data into xlSheet2
        xlSheet2.Cells(dataRow, 1).value = rs.Fields("AFD").value
        xlSheet2.Cells(dataRow, 2).value = rs.Fields("MEDARBEJDER").value
        xlSheet2.Cells(dataRow, 3).value = rs.Fields("MEDARBEJDERNAVN").value
        xlSheet2.Cells(dataRow, 4).value = rs.Fields("TILTRÅDT").value
        xlSheet2.Cells(dataRow, 5).value = rs.Fields("FRATRÅDT").value
        xlSheet2.Cells(dataRow, 6).value = rs.Fields("NORMTID").value
        xlSheet2.Cells(dataRow, 7).value = rs.Fields("ÅRSVÆRK_MD").value

        ' Insert data into xlSheet3 if ANS_BETEGN starts with "Afdelingsleder"
        If Left(rs.Fields("ANS_BETEGN").value, 14) = "Afdelingsleder" Then
           strAfdLedNavn = rs.Fields("MEDARBEJDERNAVN").value
           strAfdLedNr = rs.Fields("MEDARBEJDER").value
        End If

        lastAFD = currentAFD
        dataRow = dataRow + 1
        rs.MoveNext
    Loop

    ' Insert final SUM row for the last group after the loop
    If lastAFD <> "" Then
        xlSheet2.Cells(dataRow, 2).value = "I alt for afdeling: "
        xlSheet2.Cells(dataRow, 3).value = lastAFD
        xlSheet2.Cells(dataRow, 7).Formula = "=SUM(G" & startRow & ":G" & dataRow - 1 & ")"
        xlSheet2.range("A" & dataRow & ":G" & dataRow).Font.Bold = True
        xlSheet2.range("A" & dataRow & ":G" & dataRow).Borders(xlEdgeTop).LineStyle = xlContinuous

        ' Insert calculated value into xlSheet3 based on column G
        Dim finalGValue As Double
        finalGValue = xlSheet2.Cells(dataRow, 7).value
        Dim finalLederTillæg As Long

                finalGValue = xlSheet2.Cells(dataRow, 7).value
                xlSheet3.Cells(sheet3Row, 1).value = lastAFD

                If strAfdLedNavn <> "" Then
                    xlSheet3.Cells(sheet3Row, 2).value = strAfdLedNr
                    xlSheet3.Cells(sheet3Row, 3).value = strAfdLedNavn
                Else
                    xlSheet3.Cells(sheet3Row, 2).value = "0"
                    xlSheet3.Cells(sheet3Row, 3).value = "Leder mangler i afd.: " & lastAFD
                End If

                xlSheet3.Cells(sheet3Row, 4).value = "1562"
                xlSheet3.Cells(sheet3Row, 5).value = "Ledertillæg"

                If finalGValue > 0 And gValue < 5 Then
                    finalLederTillæg = 6000
                ElseIf finalGValue >= 5 And gValue < 9 Then
                    finalLederTillæg = 9000
                ElseIf finalGValue >= 9 And gValue < 16 Then
                    finalLederTillæg = 12000
                ElseIf finalGValue >= 16 Then
                    finalLederTillæg = 15000
                End If

                xlSheet3.Cells(sheet3Row, 6).value = finalLederTillæg
                xlSheet3.Cells(sheet3Row, 7).value = finalGValue

    End If

    rs.Close
    Set rs = Nothing

    ' Autosize columns A through G and format columns F and G
    xlSheet2.Columns("A:G").AutoFit
    xlSheet2.Columns("F:G").numberFormat = "#,##0.0"

    xlSheet3.Columns("A:G").AutoFit
    xlSheet3.Columns("F:F").numberFormat = "#,##0"
    xlSheet3.Columns("G:G").numberFormat = "#,##0.0"

    ' Save the workbook to user-specified path
'    xlBook.SaveAs savePath

    ' Clean up
'    xlBook.Close
'    xlApp.Quit
    Set xlSheet1 = Nothing
    Set xlSheet2 = Nothing
    Set xlSheet3 = Nothing
    Set xlBook = Nothing
    Set xlApp = Nothing

'    MsgBox "Excel workbook with 3 sheets created successfully at " & savePath
End Sub

Sub InsertMergedText(sheet As Object, rowNum As Long, text As String)
    With sheet
        .range("B" & rowNum & ":M" & rowNum).Merge
        .range("B" & rowNum & ":M" & rowNum).HorizontalAlignment = xlCenter
        .range("B" & rowNum).value = text
    End With
End Sub

Sub ExportTblFBRegKladdeToExcel()
    Dim savePath As String
    Dim tableName As String

    ' Set table name
    tableName = "tblFBRegKladde"

    ' Prompt user for file path and name
    With Application.FileDialog(2) ' 2 = msoFileDialogSaveAs
        .title = "Save Excel Workbook As"

        ' Show the dialog box
        If .Show = -1 Then ' If user selects "Save"
            savePath = .SelectedItems(1)
            ' Ensure the file has an .xlsx extension
            If InStr(savePath, ".xlsx") = 0 Then
                savePath = savePath & ".xlsx"
            End If
        Else
            MsgBox "Export cancelled.", vbInformation
            Exit Sub
        End If
    End With

    ' Use TransferSpreadsheet to export the Access table to the specified Excel file
    DoCmd.TransferSpreadsheet acExport, acSpreadsheetTypeExcel12Xml, _
        tableName, savePath, True

    ' Inform the user that the export was successful
    MsgBox "Table '" & tableName & "' has been successfully exported to " & savePath, vbInformation
End Sub
Sub ExportTblFBRealToExcel(intYear As Integer, intMonth As Integer)
    ' Define variables
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim xlApp As Object
    Dim xlBook As Object
    Dim xlSheet As Object
    Dim fld As DAO.field
    Dim lastColumn As String
    Dim colIndex As Integer
    Dim fieldList As Collection
    Dim savePath As String
    Dim monthValue As Integer
    Dim yearValue As Integer
    Dim lastDate As Date
    Dim i As Integer
    Dim fldName As Variant
    Dim lastColNumber As Integer
    Dim dataRange As range
    Dim rowNo As Integer
    Dim strSQL As String


    Call executeSP("dbo.usp_RunAllProcedures", intYear, intMonth)

    DoEvents

    Call RefreshLinkedTable("tblFBReal")

    ' Set up database and recordset
    Set dB = CurrentDb()
    strSQL = "SELECT * FROM tblFBReal ORDER BY ID"
    Set rs = dB.OpenRecordset(strSQL, dbOpenDynaset, dbSeeChanges)

    ' Set up Excel application
    Set xlApp = CreateObject("Excel.Application")
    xlApp.Visible = True
    Set xlBook = xlApp.Workbooks.Add
    Set xlSheet = xlBook.sheets(1)

    ' Initialize a collection to store fields starting with underscore
    Set fieldList = New Collection

    Dim n As Long
    Dim prefix As String

    For Each fld In rs.Fields
        '–– Tag de første to tegn
        prefix = Left(fld.Name, 2)

        '–– Er de to tegn numeriske (01-99)?
        If IsNumeric(prefix) Then
            n = CLng(prefix)          ' "01" ? 1, "60" ? 60

            '–– Vi vil have 01 og opefter – evt. kan du begrænse øvre grænse hér
            If n >= 1 And n <= 99 Then
                fieldList.Add fld.Name
            End If
        End If
    Next fld

    ' Extract Month_ and Year_ values
    rs.MoveFirst
    monthValue = rs.Fields("Month_").value
    yearValue = rs.Fields("Year_").value
    lastDate = DateSerial(yearValue, monthValue + 1, 0)

    ' Record 1
    rowNo = 2
    xlSheet.range("B2").value = "Fællesbidrag opgørelse pr. " & Format(lastDate, "dd-mm-yyyy")
    xlSheet.range("B2").Font.Size = 14
    xlSheet.range("B2").Font.Bold = True
    xlSheet.Rows(2).Font.Size = 14
    xlSheet.Rows(2).Font.Bold = True

    rowNo = rowNo + 2

    ' Record 4 Header Setup
    xlSheet.range("D4").value = "Beskrivelse"
    xlSheet.range("E4").value = "Totaler"
    colIndex = 6

    Dim strAfdNavn As String
    Dim strAfdNavn_1 As String
    Dim strAfdNavn_2 As String
    Dim intAfdNavn_Space As Integer

    For Each fldName In fieldList

        Dim crit As String, numPart As String, subPart As String

        If InStr(fldName, "_") > 0 Then
            numPart = Left(fldName, InStr(fldName, "_") - 1)          'fx "60"
            subPart = Mid(fldName, InStr(fldName, "_") + 1)           'fx "NØRREGADE"
            crit = "AFD = '" & numPart & "' AND VALGFRI2 = '" & _
                      Replace(subPart, "'", "''") & "'"               'escape '
        Else
            numPart = fldName                                         'fx "10"
            crit = "AFD = '" & val(numPart) & "'"
        End If

        'Debug.Print val(numPart)
        'Debug.Print crit


        strAfdNavn = Nz(DLookup("AFD_BETEGN", "tblFBNormtid", crit), "Ingen medarb. endnu")

        'strAfdNavn = Nz(ELookup("AfdelingsNavn", "tblAfdeling", "FB_AfdNr = " & fldName), "Mangler_navn")
        intAfdNavn_Space = Nz(InStr(1, strAfdNavn, " "), 0)

        xlSheet.Cells(rowNo, colIndex).Font.Size = 9

        If intAfdNavn_Space > 0 Then
            strAfdNavn_1 = Left(strAfdNavn, intAfdNavn_Space - 1)
            strAfdNavn_2 = Mid(strAfdNavn, intAfdNavn_Space + 1, 99)
            xlSheet.Cells(rowNo, colIndex).value = "Afd " & fldName & vbNewLine & strAfdNavn_1 & vbNewLine & strAfdNavn_2
            xlSheet.Columns(colIndex).ColumnWidth = Len(strAfdNavn_2) * 1.08
        Else
            xlSheet.Cells(rowNo, colIndex).value = "Afd " & fldName & vbNewLine & strAfdNavn
            xlSheet.Columns(colIndex).ColumnWidth = Len(strAfdNavn) * 1.08
        End If

        colIndex = colIndex + 1
    Next fldName

    lastColumn = xlSheet.Cells(rowNo, colIndex - 1).Address(False, False)
    lastColNumber = xlSheet.Cells(rowNo, colIndex - 1).Column

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 2), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.Font.Bold = True

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 4), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.Borders(xlEdgeBottom).LineStyle = xlContinuous


    rowNo = rowNo + 1

    ' Record 1 Data Transfer Årsværker i antal - gennemsnit pr. aktuel måned
    xlSheet.range("D5").value = rs.Fields("KontoNavn").value
    xlSheet.range("E5").value = rs.Fields("TotalÅrsværkAfd").value
    xlSheet.range("E5").numberFormat = "#,##0.00;[Red]-#,##0.0"
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).value = rs.Fields(fldName).value
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 6), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.numberFormat = "#,##0.0;[Red]-#,##0.0"

    rowNo = rowNo + 1

    ' Record 2 Årsværker i procent
    rs.MoveNext
    xlSheet.range("D6").value = rs.Fields("KontoNavn").value
    xlSheet.range("E6").Formula = "=SUM(" & xlSheet.Cells(rowNo, 6).Address & ":" & xlSheet.Cells(rowNo, lastColNumber).Address & ")"
    xlSheet.range("E6").numberFormat = "#,##0;[Red]-#,##0"
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(6, colIndex).value = rs.Fields(fldName).value
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 7), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .numberFormat = "#,##0.00;[Red]-#,##0.00"
        .Font.Italic = True
        .Font.Bold = True
        .Font.Size = 10
        .Interior.Color = RGB(247, 226, 217)

    End With

    rowNo = rowNo + 1

    ' Record 3 Omsætning i tkr.
    rs.MoveNext
    xlSheet.range("D7").value = "Kalkuleret omsætning ÅTD i tkr." 'rs.Fields("KontoNavn").Value
    xlSheet.range("E7").value = rs.Fields("TotalOmsAfd").value * 0.001
    xlSheet.range("E7").numberFormat = "#,##0;[Red]-#,##0"
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(7, colIndex).value = rs.Fields(fldName).value * 0.001
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 6), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.numberFormat = "#,##0;[Red]-#,##0"

    rowNo = rowNo + 1
    ' Record 4 Omsætning i procent
    rs.MoveNext
    xlSheet.range("D8").value = rs.Fields("KontoNavn").value
    xlSheet.range("E8").Formula = "=SUM(" & xlSheet.Cells(rowNo, 6).Address & ":" & xlSheet.Cells(rowNo, lastColNumber).Address & ")"
    xlSheet.range("E8").numberFormat = "#,##0;[Red]-#,##0"
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(8, colIndex).value = rs.Fields(fldName).value
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 7), xlSheet.Cells(rowNo, lastColNumber))

    With dataRange
        .numberFormat = "#,##0.00;[Red]-#,##0.00"
        .Font.Italic = True
        .Font.Bold = True
        .Font.Size = 10
        .Interior.Color = RGB(247, 226, 217)
    End With

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 3, 5), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.HorizontalAlignment = xlCenter

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 4, 4), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.BorderAround LineStyle:=xlContinuous, Weight:=xlThick

    rowNo = rowNo + 2

    ' Records 5 - 18 Realiserede udgifter
    xlSheet.Cells(rowNo, 2).value = "Konto Adm"
    xlSheet.Cells(rowNo, 3).value = "Konto Afd"
    xlSheet.Cells(rowNo, 4).value = "Realiserede udgifter"

    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).value = "Afd " & fldName
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 2), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Font.Bold = True
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeBottom).Weight = xlThick
    End With

    rowNo = rowNo + 1

    For i = 5 To 18
        rs.MoveNext
        xlSheet.Cells(rowNo, 2).value = rs.Fields("Konto_1").value
        xlSheet.Cells(rowNo, 3).value = rs.Fields("Konto_2").value
        xlSheet.Cells(rowNo, 4).value = rs.Fields("KontoNavn").value
        colIndex = 6
        For Each fldName In fieldList
            xlSheet.Cells(rowNo, colIndex).value = rs.Fields(fldName).value
            colIndex = colIndex + 1
        Next fldName
        rowNo = rowNo + 1
    Next i

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 14, 6), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.numberFormat = "#,##0;[Red]-#,##0"
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 2), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeTop).LineStyle = xlContinuous
        .Font.Bold = True
    End With

       ' Alternating row colors
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 14, 2), xlSheet.Cells(rowNo - 1, lastColNumber))
    For i = 1 To dataRange.Rows.Count Step 2
        dataRange.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for alternating rows
    Next i

    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).Formula = "=SUM(" & xlSheet.Cells(rowNo - 14, colIndex).Address & ":" & xlSheet.Cells(rowNo - 1, colIndex).Address & ")"
        colIndex = colIndex + 1
    Next fldName
    xlSheet.Cells(rowNo, 4).value = "Realiserede udgifter i alt"
    rowNo = rowNo + 2

    ' Record 20
    'rs.MoveNext
    xlSheet.Cells(rowNo, 4).value = "Beskrivelse"
    xlSheet.Cells(rowNo, 3).value = "Konto"

    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).value = "Afd " & fldName
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeBottom).Weight = xlThick
        .Font.Bold = True
    End With

    rowNo = rowNo + 1

    ' Records 21 - 26 Betalt FB ÅTD
    For i = 21 To 27
        rs.MoveNext
        xlSheet.Cells(rowNo, 3).value = rs.Fields("Konto_2").value
        xlSheet.Cells(rowNo, 4).value = rs.Fields("KontoNavn").value
        colIndex = 6
        For Each fldName In fieldList
            xlSheet.Cells(rowNo, colIndex).value = rs.Fields(fldName).value
            colIndex = colIndex + 1
        Next fldName
        xlSheet.Cells(rowNo, 6).Formula = "=SUM(" & xlSheet.Cells(rowNo, 7).Address & ":" & xlSheet.Cells(rowNo, lastColNumber).Address & ")"
        rowNo = rowNo + 1
    Next i

    xlSheet.Cells(rowNo, 4).value = "I alt betalt"

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 7, 6), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.numberFormat = "#,##0;[Red]-#,##0"

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Font.Bold = True
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeTop).LineStyle = xlContinuous
    End With

    ' Alternating row colors
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 6, 3), xlSheet.Cells(rowNo - 1, lastColNumber))
    For i = 1 To dataRange.Rows.Count Step 2
        dataRange.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for alternating rows
    Next i
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 1, 3), xlSheet.Cells(rowNo - 1, lastColNumber))

    'SUM formel under Betalt FB ÅTD
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).Formula = "=SUM(" & xlSheet.Cells(rowNo - 7, colIndex).Address & ":" & xlSheet.Cells(rowNo - 1, colIndex).Address & ")"
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
    End With

    rowNo = rowNo + 2

    ' Record 27 Regulering
    'rs.MoveNext
    xlSheet.Cells(rowNo, 3).value = "Konto"
    xlSheet.Cells(rowNo, 4).value = "Beskrivelse"

    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).value = "Afd " & fldName
        colIndex = colIndex + 1
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeBottom).Weight = xlThick
        .Font.Bold = True
    End With

    rowNo = rowNo + 1

    ' Records 28 - 34 Regulering
    For i = 28 To 34
        rs.MoveNext
        xlSheet.Cells(rowNo, 3).value = rs.Fields("Konto_2").value
        xlSheet.Cells(rowNo, 4).value = rs.Fields("KontoNavn").value
        colIndex = 6
        For Each fldName In fieldList
            xlSheet.Cells(rowNo, colIndex).value = rs.Fields(fldName).value
            colIndex = colIndex + 1
        Next fldName
        xlSheet.Cells(rowNo, 6).Formula = "=SUM(" & xlSheet.Cells(rowNo, 7).Address & ":" & xlSheet.Cells(rowNo, lastColNumber).Address & ") * - 1"

        rowNo = rowNo + 1
    Next i
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 7, 6), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.numberFormat = "#,##0;[Red]-#,##0"

    'Sum af Regulering
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeTop).LineStyle = xlContinuous
        .Font.Bold = True
    End With

    ' Regulering FB i alt:
    xlSheet.Cells(rowNo, 4).value = "Regulering i alt (afd. 1 med omvendt fortegn):"
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).Formula = "=SUM(" & xlSheet.Cells(rowNo - 9, colIndex).Address & ":" & xlSheet.Cells(rowNo - 1, colIndex).Address & ")"
        colIndex = colIndex + 1

    Next fldName

    ' Alternating row colors
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 6, 3), xlSheet.Cells(rowNo - 1, lastColNumber))
    For i = 1 To dataRange.Rows.Count Step 2
        dataRange.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for alternating rows
    Next i

    rowNo = rowNo + 2
    'Record 35 indsætter omsætning
    rs.MoveNext
    xlSheet.Cells(rowNo, 4).value = "Samlet omsætning ÅTD"
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).value = rs.Fields(fldName).value
        colIndex = colIndex + 1
    Next fldName

    rowNo = rowNo + 1

    'Record 36 indsætter omkostninger
    rs.MoveNext
    xlSheet.Cells(rowNo, 4).value = "Samlede omkostninger ÅTD"
    colIndex = 6
    For Each fldName In fieldList
        xlSheet.Cells(rowNo, colIndex).value = rs.Fields(fldName).value
        colIndex = colIndex + 1
    Next fldName

    rowNo = rowNo + 1

    'Indsætter over/underskud
    rs.MoveNext

    xlSheet.Cells(rowNo, 4).value = "Over/underskud ÅTD"
    colIndex = 7
    For Each fldName In fieldList
        If fldName <> "01" Then
            xlSheet.Cells(rowNo, colIndex).Formula = "=SUM(" & xlSheet.Cells(rowNo - 2, colIndex).Address & ":" & xlSheet.Cells(rowNo - 1, colIndex).Address & ")"
                colIndex = colIndex + 1
        End If
    Next fldName


    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 2, 6), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.numberFormat = "#,##0;[Red]-#,##0"

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeTop).LineStyle = xlContinuous
        .Font.Bold = True
    End With

    rowNo = rowNo + 1

    'Indsætter overskudsgrad
    xlSheet.Cells(rowNo, 4).value = "Overskudsgrad før regulering"
    colIndex = 7
    For Each fldName In fieldList
        If fldName <> "01" Then
            xlSheet.Cells(rowNo, colIndex).Formula = "=IFERROR(" & xlSheet.Cells(rowNo - 1, colIndex).Address & "/(" & xlSheet.Cells(rowNo - 3, colIndex).Address & " * 0.01),0)"
                colIndex = colIndex + 1
        End If
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
        dataRange.numberFormat = "#,##0.00;[Red]-#,##0.00"

    ' Alternating row colors
    i = 1
    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo - 3, 3), xlSheet.Cells(rowNo - 2, lastColNumber))
    For i = 1 To dataRange.Rows.Count Step 2
        dataRange.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for alternating rows
    Next i


    rowNo = rowNo + 2

    'Indsætter overskud efter regulering
    xlSheet.Cells(rowNo, 4).value = "Overskud efter regulering"
    colIndex = 7
    For Each fldName In fieldList
        If fldName <> "01" Then
            xlSheet.Cells(rowNo, colIndex).Formula = "=" & xlSheet.Cells(rowNo - 3, colIndex).Address & " - " & xlSheet.Cells(rowNo - 7, colIndex).Address & ""
                colIndex = colIndex + 1
        End If
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 3), xlSheet.Cells(rowNo, lastColNumber))
    With dataRange
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
        .Borders(xlEdgeTop).LineStyle = xlContinuous
        .Font.Bold = True
        .numberFormat = "#,##0;[Red]-#,##0"
    End With


    rowNo = rowNo + 1

    'Indsætter overskudsgrad efter regulering
    xlSheet.Cells(rowNo, 4).value = "Overskud efter regulering"
    colIndex = 7
    For Each fldName In fieldList
        If fldName <> "01" Then
        xlSheet.Cells(rowNo, colIndex).Formula = "=IFERROR(" & xlSheet.Cells(rowNo - 1, colIndex).Address & "/(" & xlSheet.Cells(rowNo - 6, colIndex).Address & " * 0.01),0)"
            colIndex = colIndex + 1
        End If
    Next fldName

    Set dataRange = xlSheet.range(xlSheet.Cells(rowNo, 7), xlSheet.Cells(rowNo, lastColNumber))
    dataRange.numberFormat = "#,##0.00;[Red]-#,##0.00"

    rowNo = rowNo + 1


    With xlSheet
        .Columns.AutoFit
        .Columns("B").ColumnWidth = 9.5
        .Columns("B").HorizontalAlignment = xlLeft
    End With

    ' Save and clean up
    'xlBook.SaveAs savePath

    'xlBook.Close True

    'xlApp.Quit

    Set xlSheet = Nothing
    Set xlBook = Nothing
    Set xlApp = Nothing
    rs.Close
    Set rs = Nothing
    Set dB = Nothing
End Sub
