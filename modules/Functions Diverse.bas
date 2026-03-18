Attribute VB_Name = "Functions Diverse"
Option Compare Database
Option Explicit
Public Function fncGetLastDayOfMonth(Year_ As Integer, Month_ As Integer) As String
    ' Calculate the last day of the given month and year
    Dim lastDay As Date
    lastDay = DateSerial(Year_, Month_ + 1, 0) ' Set day to 0 of next month
    fncGetLastDayOfMonth = Format(lastDay, "yyyy-mm-dd")
End Function

Public Function fncFileExists(filePath As String) As Boolean
    If Dir(filePath) <> "" Then
        fncFileExists = True
    Else
        fncFileExists = False
    End If
End Function
Public Function fncDeleteTableIfExists(tableName As String) As Boolean
    On Error GoTo ErrorHandler

    ' Check if the table exists
    If DCount("*", "MSysObjects", "Name='" & tableName & "' AND Type In (1, 4, 6)") > 0 Then
        ' If it exists, delete the table
        DoCmd.DeleteObject acTable, tableName
        fncDeleteTableIfExists = True
        Exit Function
    End If

    ' If the table does not exist
    fncDeleteTableIfExists = False
    Exit Function

ErrorHandler:
    MsgBox "Error: " & Err.Description
    fncDeleteTableIfExists = False
End Function

Public Function fncGetLastModifiedDate(filePath As String) As String
    Dim fso As Object
    Dim file As Object

    ' Create a FileSystemObject instance
    Set fso = CreateObject("Scripting.FileSystemObject")

    ' Check if the file exists
    If fso.FileExists(filePath) Then
        ' Get the file object and retrieve the DateLastModified property
        Set file = fso.GetFile(filePath)
        fncGetLastModifiedDate = file.DateLastModified
    Else
        ' If the file does not exist, return an error message or handle it
        fncGetLastModifiedDate = "X"
    End If

    ' Clean up
    Set file = Nothing
    Set fso = Nothing
End Function
Public Function fncIsFileOlderThan7Days(filePath As String) As Boolean
    Dim fso As Object
    Dim file As Object
    Dim lastModifiedDate As Date
    Dim currentDate As Date

    ' Create a FileSystemObject instance
    Set fso = CreateObject("Scripting.FileSystemObject")

    ' Check if the file exists
    If fso.FileExists(filePath) Then
        ' Get the file object and retrieve the DateLastModified property
        Set file = fso.GetFile(filePath)
        lastModifiedDate = file.DateLastModified
        currentDate = Date

        ' Check if the file is older than 7 days
        If DateDiff("d", lastModifiedDate, currentDate) > 7 Then
            fncIsFileOlderThan7Days = True
        Else
            fncIsFileOlderThan7Days = False
        End If
    Else
        ' If the file does not exist, return False
        fncIsFileOlderThan7Days = False
    End If

    ' Clean up
    Set file = Nothing
    Set fso = Nothing
End Function
Public Sub ChangeAppTitle(newTitle As String)
    ' Change the application title
    CurrentDb.Properties("AppTitle") = newTitle
    Application.RefreshTitleBar
End Sub
Public Function IsLoaded(strFormName As String) As Boolean
    IsLoaded = (SysCmd(acSysCmdGetObjectState, acForm, strFormName) <> 0)
    'kommentar

End Function
Public Function CopyRecordWithoutIdentityReturnID(lngIDToCopy As Long, Optional strTableName As String) As Long
    On Error GoTo ErrHandler

    Dim conn As Object
    Dim rs As Object
    Dim strSQL As String
    Dim strCols As String
    Dim strGetCols As String

    Set conn = CreateObject("ADODB.Connection")
    conn.Open fncConnString

    ' Hent kolonnenavne ekskl. IDENTITY
    strGetCols = "SELECT STRING_AGG(QUOTENAME(name), ', ') AS Cols " & vbCrLf & _
                 "FROM sys.columns " & vbCrLf & _
                 "WHERE object_id = OBJECT_ID('" & strTableName & "') AND is_identity = 0;"
    Set rs = conn.Execute(strGetCols)
    If Not rs.EOF Then
        strCols = rs!COLS
    Else
        MsgBox "Ingen kolonner fundet!", vbExclamation
        GoTo Cleanup
    End If
    rs.Close

    ' Brug direkte INSERT ... OUTPUT
    strSQL = _
        "INSERT INTO " & strTableName & " (" & strCols & ") " & _
        "OUTPUT INSERTED.ID " & _
        "SELECT " & strCols & " FROM " & strTableName & " WHERE ID = " & lngIDToCopy

    Set rs = conn.Execute(strSQL)
    If Not rs.EOF Then
        CopyRecordWithoutIdentityReturnID = rs.Fields(0).value
    Else
        CopyRecordWithoutIdentityReturnID = 0
    End If

Cleanup:
    If Not rs Is Nothing Then rs.Close: Set rs = Nothing
    If Not conn Is Nothing Then conn.Close: Set conn = Nothing
    Exit Function

ErrHandler:
    MsgBox "Fejl i CopyRecordWithoutIdentityReturnID: " & Err.Description, vbCritical
    CopyRecordWithoutIdentityReturnID = 0
    Resume Cleanup
End Function
