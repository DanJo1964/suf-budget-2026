Attribute VB_Name = "Functions Form Parameters"
Option Compare Database
Option Explicit
Public Function GetFormParameters(CurrentUser As String, FormName As String, SubFormName As String, TabName As String, fieldName As String) As Scripting.Dictionary
    Dim rs As ADODB.Recordset
    Dim dict As New Scripting.Dictionary
    Dim strSQL As String
    Dim connStr As String
    Dim conn As ADODB.Connection

   ' Opret forbindelse til SQL Server
    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString
    conn.Open connStr

    strSQL = "SELECT FieldName, FieldValueText, FieldValueDate, FieldValueInt, FieldValueDbl " & _
             "FROM tblCurrentFormParameters " & _
             "WHERE CurrentUser = '" & CurrentUser & "' " & _
             "AND FormName = '" & FormName & "' " & _
             "AND SubFormName = '" & SubFormName & "' " & _
             "AND TabName = '" & TabName & "'" & _
             "AND FieldName = '" & fieldName & "'"

    Set rs = New ADODB.Recordset
    rs.Open strSQL, conn, adOpenForwardOnly, adLockReadOnly, adCmdText

    While Not rs.EOF
        If Not IsNull(rs!FieldValueText) Then
            dict(rs!fieldName) = rs!FieldValueText
        ElseIf Not IsNull(rs!FieldValueDate) Then
            dict(rs!fieldName) = rs!FieldValueDate
        ElseIf Not IsNull(rs!FieldValueInt) Then
            dict(rs!fieldName) = rs!FieldValueInt
        ElseIf Not IsNull(rs!FieldValueDbl) Then
            dict(rs!fieldName) = rs!FieldValueDbl
        Else
            dict(rs!fieldName) = Null
        End If
        rs.MoveNext
    Wend

    rs.Close
    Set rs = Nothing
    Set conn = Nothing

    ' Return the dictionary or Null if it's not properly set
    If Not dict Is Nothing Then
        Set GetFormParameters = dict
    Else
        Set GetFormParameters = Nothing
    End If

End Function

Public Sub SaveFormParameters(CurrentUser As String, FormName As String, SubFormName As String, TabName As String, params As Scripting.Dictionary)
    Dim rs As ADODB.Recordset
    Dim key As Variant
    Dim strSQL As String
    Dim connStr As String
    Dim conn As ADODB.Connection

   ' Opret forbindelse til SQL Server
    Set conn = CreateObject("ADODB.Connection")
    connStr = fncConnString
    conn.Open connStr

    ' Loop through all parameters in the dictionary
    For Each key In params.Keys
        ' Check if the record exists
        strSQL = "SELECT ID FROM tblCurrentFormParameters " & _
                 "WHERE CurrentUser = '" & CurrentUser & "' " & _
                 "AND FormName = '" & FormName & "' " & _
                 "AND SubFormName = '" & SubFormName & "' " & _
                 "AND TabName = '" & TabName & "' " & _
                 "AND FieldName = '" & key & "'"

        Set rs = New ADODB.Recordset
        rs.Open strSQL, conn, adOpenForwardOnly, adLockReadOnly, adCmdText

        If rs.EOF Then
            ' Record doesn't exist, INSERT a new one
            strSQL = "INSERT INTO tblCurrentFormParameters (CurrentUser, FormName, SubFormName, TabName, FieldName, FieldValueText, FieldValueDate, FieldValueInt, FieldValueDbl) " & _
                     BuildInsertValues(params(key), CurrentUser, FormName, SubFormName, TabName, CStr(key))
        Else
            ' Record exists, UPDATE it
            strSQL = "UPDATE tblCurrentFormParameters SET " & BuildUpdateValues(params(key)) & " WHERE ID=" & rs!ID
        End If

        rs.Close

        ''Debug.Print strSQL


        conn.Execute strSQL, , adCmdText
    Next key

    Set rs = Nothing
    Set conn = Nothing
End Sub
Private Function BuildInsertValues(value As Variant, CurrentUser As String, FormName As String, SubFormName As String, TabName As String, fieldName As String) As String
    BuildInsertValues = "VALUES ('" & CurrentUser & "','" & FormName & "','" & SubFormName & "','" & TabName & "','" & fieldName & "'," & BuildValueList(value) & ")"
End Function
Private Function BuildUpdateValues(value As Variant) As String
    BuildUpdateValues = BuildValueAssignments(value)
End Function
Private Function BuildValueList(value As Variant) As String
    If IsNull(value) Then
        BuildValueList = "Null, Null, Null, Null"
    ElseIf IsDate(value) Then
        BuildValueList = "Null, '" & Format(value, "yyyy-mm-dd hh:mm:ss") & "', Null, Null"
    ElseIf IsNumeric(value) Then
        If InStr(CStr(value), ".") > 0 Then
            BuildValueList = "Null, Null, Null, " & CStr(value)
        Else
            BuildValueList = "Null, Null, " & CLng(value) & ", Null"
        End If
    Else
        BuildValueList = "'" & Replace(value, "'", "''") & "', Null, Null, Null"
    End If
End Function
Private Function BuildValueAssignments(value As Variant) As String
    If IsNull(value) Then
        BuildValueAssignments = "FieldValueText=Null, FieldValueDate=Null, FieldValueInt=Null, FieldValueDbl=Null"
    ElseIf IsDate(value) Then
        BuildValueAssignments = "FieldValueText=Null, FieldValueDate='" & Format(value, "yyyy-mm-dd hh:mm:ss") & "', FieldValueInt=Null, FieldValueDbl=Null"
    ElseIf IsNumeric(value) Then
        If InStr(CStr(value), ".") > 0 Then
            BuildValueAssignments = "FieldValueText=Null, FieldValueDate=Null, FieldValueInt=Null, FieldValueDbl=" & CStr(value)
        Else
            BuildValueAssignments = "FieldValueText=Null, FieldValueDate=Null, FieldValueInt=" & CLng(value) & ", FieldValueDbl=Null"
        End If
    Else
        BuildValueAssignments = "FieldValueText='" & Replace(value, "'", "''") & "', FieldValueDate=Null, FieldValueInt=Null, FieldValueDbl=Null"
    End If
End Function
Public Function AssignValuesToFormObjects(frm As Form, strUser As String, strFormName As String, Optional dte As Date = 0)
    Dim rs As ADODB.Recordset
    Dim conn As ADODB.Connection
    Dim strSQL As String
    Dim connStr As String
    Dim defaultDate As Date

    If dte = 0 Then
        defaultDate = Date ' Default to today's date if not provided
    Else
        defaultDate = dte
    End If

    ' Open connection to SQL Server
    Set conn = New ADODB.Connection
    connStr = fncConnString ' Your connection string function
    conn.Open connStr

    ' Query to fetch relevant records
    strSQL = "SELECT FieldName, FieldValueText, FieldValueDate, FieldValueInt, FieldValueDbl " & _
             "FROM tblCurrentFormParameters " & _
             "WHERE CurrentUser = '" & strUser & "' " & _
             "AND FormName = '" & strFormName & "'"

    Set rs = New ADODB.Recordset
    rs.Open strSQL, conn, adOpenForwardOnly, adLockReadOnly, adCmdText

    ' Loop through the records and assign values to form objects
    Do While Not rs.EOF
        Dim fieldName As String
        fieldName = rs!fieldName

        If Not IsNull(rs!FieldValueText) And Trim(rs!FieldValueText) <> "" Then
            frm.Controls(fieldName).value = rs!FieldValueText
        ElseIf Not IsNull(rs!FieldValueDate) Then
            frm.Controls(fieldName).value = Format(rs!FieldValueDate, "dd-mm-yyyy hh:mm:ss")
        ElseIf Not IsNull(rs!FieldValueInt) Then
            frm.Controls(fieldName).value = rs!FieldValueInt
        ElseIf Not IsNull(rs!FieldValueDbl) Then
            frm.Controls(fieldName).value = rs!FieldValueDbl
        Else
            ' Assign default values based on control type
            Select Case TypeName(frm.Controls(fieldName))
                Case "TextBox"
                    frm.Controls(fieldName).value = "" ' Default to empty string
                Case "ComboBox"
                    frm.Controls(fieldName).value = "" ' Default to empty string
                Case "DatePicker", "DateTimePicker"
                    frm.Controls(fieldName).value = defaultDate ' Default to provided or today's date
                Case "NumericUpDown"
                    frm.Controls(fieldName).value = 0 ' Default to zero
                Case Else
                    frm.Controls(fieldName).value = Null ' Default to Null for unrecognized types
            End Select
        End If
        rs.MoveNext
    Loop

    ' Clean up
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
End Function
