Attribute VB_Name = "Functions Call of Stored Procedures"
Option Compare Database

Option Explicit
Sub executeSP_UpdateIB_EstimatForrigeAar_FromGLtransSum(Year_ As Integer, Month_ As Integer, Pct_ As String)
    Dim conn As Object
    Dim cmd As Object
    Dim connStr As String
    Dim str As String

    ' Opret forbindelse til SQL Server
    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString

    'On Error GoTo ErrorHandler
    conn.Open connStr

    ' Opret og udfør kommandoen
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = conn

    Debug.Print "Pct_", Pct_

    cmd.CommandType = 1 ' adCmdText
    cmd.CommandText = "EXEC [dbo].[usp_UpdateIB_EstimatForrigeAar_FromGLtransSum] @pYear=" & Year_ & ", @pMonth=" & Month_ & ", @pPct=" & Pct_
    cmd.Execute


    ' Cleanup
    conn.Close
    Set cmd = Nothing
    Set conn = Nothing

    MsgBox "Estimat er opdateret med succes!", vbInformation
    Exit Sub

ErrorHandler:
    MsgBox "Fejl: " & Err.Number & " - " & Err.Description, vbCritical
    If Not conn Is Nothing Then conn.Close
    Set cmd = Nothing
    Set conn = Nothing

End Sub
Sub execute_usp_TmpOpretAfd_CopyPlainAndSync(NewYear As Integer, OldYear As Integer)
    Dim conn As Object
    Dim cmd As Object
    Dim connStr As String
    Dim str As String

    ' Opret forbindelse til SQL Server
    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString

    'On Error GoTo ErrorHandler
    conn.Open connStr

    ' Opret og udfør kommandoen
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = conn

    cmd.CommandType = 1 ' adCmdText
    cmd.CommandText = "EXEC [dbo].[usp_TmpOpretAfd_CopyPlainAndSync] @NewYear=" & NewYear & ", @OldYear=" & OldYear
    cmd.Execute


    ' Cleanup
    conn.Close
    Set cmd = Nothing
    Set conn = Nothing

    Exit Sub

ErrorHandler:
    MsgBox "Fejl: " & Err.Number & " - " & Err.Description, vbCritical
    If Not conn Is Nothing Then conn.Close
    Set cmd = Nothing
    Set conn = Nothing

End Sub
Sub TestUpdateIBEst()
    Call executeSP_UpdateIB_EstimatForrigeAar_FromGLtransSum(2026, 8, "0.04")
End Sub


Sub executeSP(strSPName As String, Year_ As Integer, Month_ As Integer, Optional strSourceDB As String, Optional strBackupDB As String)
    Dim conn As Object
    Dim cmd As Object
    Dim connStr As String
    Dim strLastDate As String

    strLastDate = Format(DateSerial(Year_, Month_ + 1, 0), "yyyy-mm-dd")


    ' Opret forbindelse til SQL Server
    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString

    'On Error GoTo ErrorHandler
    conn.Open connStr

    ' Opret og udfør kommandoen
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = conn
    'cmd.CommandText = strSPName
    'cmd.CommandType = 4 ' adCmdStoredProc

    cmd.CommandType = 1 ' adCmdText

    cmd.CommandText = "EXEC [dbo].[usp_CreateFBRealTable] @Year=" & Year_
    cmd.Execute

    DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_InsertNormtid] @pYear=" & Year_ & ", @pMonth=" & Month_ & ", @pDate='" & strLastDate & "'"
    cmd.Execute

    DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_CalculateAndInsertAarsvaerkAndPct] @Aar=" & Year_ & ", @Maaned=" & Month_
    cmd.Execute

    DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_CalculateAndInsertOmsAndPct] @Aar=" & Year_ & ", @Maaned=" & Month_
    cmd.Execute

    DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_InsertAccAndCostDept1] @Aar=" & Year_ & ", @Maaned=" & Month_
    cmd.Execute

    DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_CalculateDebtFB]  @Aar=" & Year_ & ", @Maaned=" & Month_
    cmd.Execute

    DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_CalculatePaidFB]  @Aar=" & Year_ & ", @Maaned=" & Month_
    cmd.Execute

        DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_InsertFBRealSummary]  @Aar=" & Year_ & ", @Maaned=" & Month_
    cmd.Execute

        DoEvents

    cmd.CommandText = "EXEC dbo.usp_CopyRegTblFBRealToTblFBRegKladde"
    cmd.Execute

        DoEvents

    cmd.CommandText = "EXEC [dbo].[usp_CalculateRevPct]  @Aar=" & Year_ & ", @Maaned=" & Month_
    cmd.Execute

        DoEvents

    'cmd.CommandText = "EXEC dbo.usp_RunAllProcedures @Aar=" & Year_ & ", @Maaned=" & Month_ & ", @Date='" & Format(DateSerial(Year_, Month_ + 1, 0), "yyyy-mm-dd") & "'"
    'cmd.Execute

    ' Tilføj parametre
    'Debug.Print "Connection String: " & connStr

    ' Cleanup
    conn.Close
    Set cmd = Nothing
    Set conn = Nothing

    MsgBox "Stored procedure udført med succes!", vbInformation
    Exit Sub

ErrorHandler:
    MsgBox "Fejl: " & Err.Number & " - " & Err.Description, vbCritical
    If Not conn Is Nothing Then conn.Close
    Set cmd = Nothing
    Set conn = Nothing
End Sub
Sub executeSPBackup(strSourceDB As String, strBackupDB As String)
    Dim conn As Object
    Dim cmd As Object
    Dim connStr As String
    Dim strPath As String

    ' Opret forbindelse til SQL Server
    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString

    On Error GoTo ErrorHandler
    conn.Open connStr

    ' Opret og udfør kommandoen
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = conn

    cmd.CommandType = 1 ' adCmdText

    ' Tilføj parametre
        cmd.Parameters.Append cmd.CreateParameter("@SourceDB", 200, 1, 50, strSourceDB)
        cmd.Parameters.Append cmd.CreateParameter("@TargetDB", 200, 1, 50, strBackupDB)

    cmd.CommandText = "EXEC dbo.usp_RunSyncBackupDatabase @pSourceDB='" & strSourceDB & "', @pBackupDB='" & strBackupDB & "'"
    cmd.Execute

    ' Cleanup
    conn.Close
    Set cmd = Nothing
    Set conn = Nothing

    MsgBox "Data overført med succes!", vbInformation
    Exit Sub

ErrorHandler:
    MsgBox "Fejl: " & Err.Number & " - " & Err.Description, vbCritical
    If Not conn Is Nothing Then conn.Close
    Set cmd = Nothing
    Set conn = Nothing
End Sub
Sub executeDropTables()
    Dim conn As Object
    Dim cmd As Object
    Dim connStr As String
    Dim strPath As String

    ' Opret forbindelse til SQL Server
    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString

    On Error GoTo ErrorHandler
    conn.Open connStr

    ' Opret og udfør kommandoen
    Set cmd = CreateObject("ADODB.Command")
    cmd.ActiveConnection = conn

    cmd.CommandType = 1 ' adCmdText

    cmd.CommandText = "EXEC dbo.usp_DropAllTables"
    cmd.Execute

    ' Cleanup
    conn.Close
    Set cmd = Nothing
    Set conn = Nothing

    MsgBox "Tabeller er OK!", vbInformation
    Exit Sub

ErrorHandler:
    MsgBox "Fejl: " & Err.Number & " - " & Err.Description, vbCritical
    If Not conn Is Nothing Then conn.Close
    Set cmd = Nothing
    Set conn = Nothing
End Sub

Sub textExecute()
    'Call executeSP("usp_RunAllProcedures", 2024, 10)

End Sub
Public Sub RefreshLinkedTable(tableName As String)
    Dim dB As DAO.Database
    Dim tdf As DAO.TableDef

    Set dB = CurrentDb
    Set tdf = dB.TableDefs(tableName)

    If Len(tdf.Connect) > 0 Then
        tdf.RefreshLink
    End If

    Set tdf = Nothing
    Set dB = Nothing
End Sub
Public Sub CallSP_Year(intYear As Integer, procName As String, strMsg As String)
    Const adCmdStoredProc As Long = 4
    Const adInteger As Long = 3
    Const adParamInput As Long = 1
    Const adParamOutput As Long = 2
    Const adExecuteNoRecords As Long = &H80

    Dim conn As Object, cmd As Object, pYear As Object, pOut As Object
    Dim connStr As String, rowsFromOut As Variant

    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString
    conn.Open connStr

    Set cmd = CreateObject("ADODB.Command")
    Set cmd.ActiveConnection = conn
    cmd.CommandType = adCmdStoredProc
    cmd.CommandText = "[dbo].[" & procName & "]"

    ' @Year (INPUT)
    Set pYear = cmd.CreateParameter("@Year", adInteger, adParamInput)
    pYear.value = intYear
    cmd.Parameters.Append pYear

    ' @RowsAffected (OUTPUT) -> ingen værdi sættes her!
    Set pOut = cmd.CreateParameter("@RowsAffected", adInteger, adParamOutput)
    cmd.Parameters.Append pOut
'Debug.Print procName
'Debug.Print intYear
    ' Kør SP (ingen resultatsæt forventet)
    cmd.Execute , , adExecuteNoRecords

    ' Læs OUTPUT-værdien
    rowsFromOut = pOut.value
    Debug.Print "RowsAffected (OUTPUT): "; rowsFromOut

    conn.Close
    Set cmd = Nothing
    Set conn = Nothing

    MsgBox strMsg, vbInformation
End Sub
Private Function ExecScalar(conn As Object, ByVal sql As String) As String
    Dim rs As Object
    Set rs = conn.Execute(sql)
    If Not (rs Is Nothing) Then
        If Not rs.EOF Then ExecScalar = rs.Fields(0).value & ""
        rs.Close
    End If
    Set rs = Nothing
End Function
Public Sub DebugLinkedConnect(tableName As String)
    Dim tdf As DAO.TableDef
    Set tdf = CurrentDb.TableDefs(tableName)
    'Debug.Print "Linked table '" & tableName & "' Connect: " & tdf.Connect
End Sub
