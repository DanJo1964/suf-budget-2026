Attribute VB_Name = "Functions Relink"
Option Compare Database
Option Explicit
Public Sub SkiftTilMiljo_og_SikrViews(ByVal serverType As String)
    Dim views As Variant
    ' Sæt dine views her (kan evt. hentes fra en tabel senere)
    views = Array("vwInterntBudget_SumByYearAfdKonto", "vwInterntBudget_SumByYearKonto", "vwInterntBudget_SumByYearKonto_KtoTypeSum", "vwInterntBudget_SumByYearAfdKonto_Kto2990")

    ' Brug den eksisterende motor til at relinke alt og sikre views
    RelinkAllAndEnsureViews serverType, views
End Sub
' --- 1) Central connection string pr. miljø ---
Private Function GetConnString(ByVal serverType As String) As String
    Select Case serverType
        Case "Local"
            GetConnString = "ODBC;DRIVER=ODBC Driver 18 for SQL Server;" & _
                            "SERVER=DESKTOP-IPUM25S\SQLEXPRESS;" & _
                            "Trusted_Connection=Yes;APP=Microsoft Office;" & _
                            "DATABASE=Budget_Backup_4;Encrypt=no;"
        Case "Azure"
            GetConnString = "ODBC;DRIVER=ODBC Driver 18 for SQL Server;" & _
                            "SERVER=tcp:budgetserver.database.windows.net,1433;" & _
                            "UID=CloudSA0f28f322;" & _
                            "PWD=8eqrG+XNr59fHJQ!S6JaVrtWy;" & _
                            "APP=Microsoft Office;DATABASE=Budget;" & _
                            "Encrypt=yes;TrustServerCertificate=no;"
        Case "ITF"
            GetConnString = "ODBC;DRIVER=ODBC Driver 18 for SQL Server;" & _
                            "SERVER=192.168.1.9\SQLEXPRESS;" & _
                            "UID=budget;PWD=budget;" & _
                            "APP=Microsoft Office;DATABASE=Budget;" & _
                            "Encrypt=no;TrustServerCertificate=yes;"
        Case "ITF_SandBox"
            GetConnString = "ODBC;DRIVER=ODBC Driver 18 for SQL Server;" & _
                            "SERVER=192.168.1.9\SQLEXPRESS;" & _
                            "UID=budget;PWD=budget;" & _
                            "APP=Microsoft Office;DATABASE=Budget_Restored;" & _
                            "Encrypt=no;TrustServerCertificate=yes;"
        Case "ITF_DJO_Test"
            GetConnString = "ODBC;DRIVER=ODBC Driver 18 for SQL Server;" & _
                            "SERVER=192.168.1.9\SQLEXPRESS;" & _
                            "UID=budget;PWD=budget;" & _
                            "APP=Microsoft Office;DATABASE=DJO_Test;" & _
                            "Encrypt=no;TrustServerCertificate=yes;"
        Case "ITF_Prisberegning"
            GetConnString = "ODBC;DRIVER=ODBC Driver 18 for SQL Server;" & _
                            "SERVER=192.168.1.9\SQLEXPRESS;" & _
                            "UID=budget;PWD=budget;" & _
                            "APP=Microsoft Office;DATABASE=Budget_Prisberegning;" & _
                            "Encrypt=no;TrustServerCertificate=yes;"
        Case Else
            Err.Raise vbObjectError + 42, "GetConnString", "Ukendt serverType: " & serverType
    End Select
End Function

' --- 2) Opretter eller relinker et VIEW-link ---
Public Sub EnsureLinkedView(ByVal serverType As String, _
                            ByVal viewName As String, _
                            Optional ByVal localName As String = "")
    Dim dB As DAO.Database
    Dim tdf As DAO.TableDef
    Dim tName As String
    Dim connString As String
    Dim exists As Boolean

    If Len(localName) = 0 Then
        tName = "dbo_" & viewName           ' lokalt navn i Access
    Else
        tName = localName
    End If

    connString = GetConnString(serverType)
    Set dB = CurrentDb

    ' --- findes linket allerede? ---
    On Error Resume Next
    Set tdf = dB.TableDefs(tName)
    exists = (Err.Number = 0)
    Err.Clear
    On Error GoTo 0

    If exists Then
        ' --- RELINK: kun Connect + RefreshLink ---
        On Error GoTo RelinkFail
        tdf.Connect = connString
        ' VIGTIGT: Lad SourceTableName være i eksisterende link
        tdf.RefreshLink
        GoTo Cleanup

RelinkFail:
        ' Hvis relink fejler (eller du ønsker at skifte view-navn),
        ' så slet og genskab linket:
        Err.Clear
        On Error Resume Next
        dB.TableDefs.Delete tName
        dB.TableDefs.Refresh
        On Error GoTo 0

        ' falder igennem og opretter på ny
    End If

    ' --- OPRET NYT LINK ---
    Set tdf = dB.CreateTableDef(tName)
    tdf.sourceTableName = "dbo." & viewName
    tdf.Connect = connString
    ' tdf.Attributes = tdf.Attributes Or dbAttachedODBC Or dbAttachSavePWD ' (valgfrit)
    dB.TableDefs.Append tdf
    tdf.RefreshLink

Cleanup:
    Set tdf = Nothing
    Set dB = Nothing
End Sub

' --- 3) Relinker alt + sikrer at bestemte views findes ---
Public Sub RelinkAllAndEnsureViews(ByVal serverType As String, ByVal viewList As Variant)
    Dim dB As DAO.Database
    Dim tdf As DAO.TableDef
    Dim connString As String
    Dim i As Long

    connString = GetConnString(serverType)
    Set dB = CurrentDb

    ' A) Relink alle eksisterende ODBC-links (tabeller + views)
    For Each tdf In dB.TableDefs
        ' spring system-objekter over og relink kun ODBC-links
        If tdf.Connect <> "" Then
            tdf.Connect = connString
            ' Hvis kilden er et view/tab i et andet schema, sæt evt. SourceTableName igen
            ' (typisk ikke nødvendigt, men har med for robusthed)
            ' tdf.SourceTableName = tdf.SourceTableName
            tdf.RefreshLink
        End If
    Next tdf

    ' B) Sørg for at nødvendige views findes (opret eller relink)
    If IsArray(viewList) Then
        For i = LBound(viewList) To UBound(viewList)
            EnsureLinkedView serverType, CStr(viewList(i))
        Next i
    End If

    Set tdf = Nothing
    Set dB = Nothing

    MsgBox "Relink OK til '" & serverType & "'. Views sikret.", vbInformation
End Sub


Public Function RelinkTables_OLD(serverType As String)
    Dim dB As DAO.Database
    Dim tdf As DAO.TableDef
    Dim connString As String

    ' Define the connection string based on the server type
    If serverType = "Local" Then
        connString = "DRIVER=ODBC Driver 17 for SQL Server;SERVER=DESKTOP-IPUM25S\SQLEXPRESS;Trusted_Connection=Yes;APP=Microsoft Office;DATABASE=Budget_Backup_4;"
    ElseIf serverType = "Azure" Then
        connString = "Description=Azure;DRIVER=ODBC Driver 18 for SQL Server;SERVER=budgetserver.database.windows.net;UID=CloudSA0f28f322;PWD=8eqrG+XNr59fHJQ!S6JaVrtWy;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget;"
    ElseIf serverType = "ITF" Then
        connString = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget;TrustServerCertificate=Yes;"
    ElseIf serverType = "ITF_SandBox" Then
        connString = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget_Restored;TrustServerCertificate=Yes;"
    ElseIf serverType = "ITF_DJO_Test" Then
        connString = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=DJO_Test;TrustServerCertificate=Yes;"
    ElseIf serverType = "ITF_Prisberegning" Then
        connString = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget_Prisberegning;TrustServerCertificate=Yes;"
    Else
        MsgBox "Invalid server type specified."
        Exit Function
    End If

    ' Get the current database
    Set dB = CurrentDb

    ' Loop through all the table definitions
    For Each tdf In dB.TableDefs
        ' Check if the table is a linked table
        ''Debug.Print tdf.Name
        If tdf.Connect <> "" Then
            'Debug.Print tdf.Name
            ' Update the connection string
            tdf.Connect = connString
            tdf.RefreshLink
        End If
    Next tdf

    ' Clean up
    Set tdf = Nothing
    Set dB = Nothing

    MsgBox "Tables relinked to " & serverType & " server."

End Function
Sub TestConnectionSwift()

    ''Debug.Print fncConnString

    'Call RelinkTables("ITF_Prisberegning")


End Sub
Public Function fncConnString() As String
    Dim dB As DAO.Database
    Dim tblDef As DAO.TableDef
    Dim connAzure As String
    Dim connSQL As String
    Dim connActual As String
    Dim connITF As String
    Dim connITF_Sandbox As String
    Dim connITF_DJO_Test As String
    Dim connITF_Prisberegning As String


    'connAzure = "Description=Azure;DRIVER=ODBC Driver 18 for SQL Server;SERVER=budgetserver.database.windows.net;UID=CloudSA0f28f322;PWD=8eqrG+XNr59fHJQ!S6JaVrtWy;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget;"
    connSQL = "DRIVER=ODBC Driver 17 for SQL Server;SERVER=DESKTOP-IPUM25S\SQLEXPRESS;Trusted_Connection=Yes;APP=Microsoft Office;DATABASE=Budget_Backup_4;"
    connITF = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget;TrustServerCertificate=Yes;"
    connITF_Sandbox = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget_Restored;TrustServerCertificate=Yes;"
    connITF_DJO_Test = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=DJO_Test;TrustServerCertificate=Yes;"
    connITF_Prisberegning = "Description=IT Forum;DRIVER=ODBC Driver 18 for SQL Server;SERVER=192.168.1.9\SQLEXPRESS;UID=budget;PWD=budget;Trusted_Connection=No;APP=Microsoft Office;DATABASE=Budget_Prisberegning;TrustServerCertificate=Yes;"

    ' Get the current database
    Set dB = CurrentDb()

    ' Loop through all the TableDefs
    For Each tblDef In dB.TableDefs
        ' Check if the table is linked (i.e., has a non-empty connection string)
        If Len(tblDef.Connect) > 0 And tblDef.Name = "tblAfdeling" Then

            connActual = tblDef.Connect

            ''Debug.Print "Table: " & tblDef.Name & vbCrLf & "Connection String: " & fncConnString

            If InStr(1, connActual, "DATABASE=Budget_Backup_4;") > 0 Then fncConnString = connSQL
            'If InStr(1, connActual, "Azure") > 0 Then fncConnString = connAzure
            If InStr(1, connActual, "DATABASE=Budget;") > 0 Then fncConnString = connITF
            If InStr(1, connActual, "DATABASE=Budget_Restored;") > 0 Then fncConnString = connITF_Sandbox
            If InStr(1, connActual, "DATABASE=DJO_Test;") > 0 Then fncConnString = connITF_DJO_Test
            If InStr(1, connActual, "DATABASE=Budget_Prisberegning;") > 0 Then fncConnString = connITF_Prisberegning


            ''Debug.Print "Table: " & tblDef.Name & vbCrLf & "Connection String: " & fncConnString


            Exit Function

        End If
    Next tblDef
End Function
