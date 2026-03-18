Attribute VB_Name = "FunctionElookup"
Option Compare Database
Option Explicit
Public Function ELookup(expr As String, domain As String, Optional criteria As Variant, _
    Optional OrderClause As Variant) As Variant
'On Error GoTo Err_ELookup
    'Purpose:   Faster and more flexible replacement for DLookup()
    'Arguments: Same as DLookup, with additional Order By option.
    'Return:    Value of the Expr if found, else Null.
    '           Delimited list for multi-value field.
    'Author:    Allen Browne. allen@allenbrowne.com
    'Updated:   December 2006, to handle multi-value fields (Access 2007 and later.)
    'Examples:
    '           1. To find the last value, include DESC in the OrderClause, e.g.:
    '               ELookup("[Surname] & [FirstName]", "tblClient", , "ClientID DESC")
    '           2. To find the lowest non-null value of a field, use the Criteria, e.g.:
    '               ELookup("ClientID", "tblClient", "Surname Is Not Null" , "Surname")
    'Note:      Requires a reference to the DAO library.
    Dim dB As DAO.Database          'This database.
    Dim rs As DAO.Recordset         'To retrieve the value to find.
    Dim rsMVF As DAO.Recordset      'Child recordset to use for multi-value fields.
    Dim varResult As Variant        'Return value for function.
    Dim strSQL As String            'SQL statement.
    Dim strOut As String            'Output string to build up (multi-value field.)
    Dim lngLen As Long              'Length of string.
    Const strcSep = ","             'Separator between items in multi-value list.

    'Initialize to null.
    varResult = Null

    'Build the SQL string.
    strSQL = "SELECT TOP 1 " & expr & " FROM " & domain
    If Not IsMissing(criteria) Then
        strSQL = strSQL & " WHERE " & criteria
    End If
    If Not IsMissing(OrderClause) Then
        strSQL = strSQL & " ORDER BY " & OrderClause
    End If
    strSQL = strSQL & ";"

    ''Debug.Print strSQL

    'Lookup the value.
    Set dB = DBEngine(0)(0)
    'Debug.Print strSQL
    Set rs = dB.OpenRecordset(strSQL, dbOpenForwardOnly)
    If rs.RecordCount > 0 Then
        'Will be an object if multi-value field.
        If VarType(rs(0)) = vbObject Then
            Set rsMVF = rs(0).value
            Do While Not rsMVF.EOF
                If rs(0).Type = 101 Then        'dbAttachment
                    strOut = strOut & rsMVF!filename & strcSep
                Else
                    strOut = strOut & rsMVF![value].value & strcSep
                End If
                rsMVF.MoveNext
            Loop
            'Remove trailing separator.
            lngLen = Len(strOut) - Len(strcSep)
            If lngLen > 0& Then
                varResult = Left(strOut, lngLen)
            End If
            Set rsMVF = Nothing
        Else
            'Not a multi-value field: just return the value.
            varResult = rs(0)
        End If
    End If
    rs.Close

    'Assign the return value.
    ELookup = varResult

Exit_ELookup:
    Set rs = Nothing
    Set dB = Nothing
    Exit Function

Err_ELookup:
    MsgBox Err.Description, vbExclamation, "ELookup Error " & Err.Number
    Resume Exit_ELookup
End Function
Function fncLookupKtoBeløb(intYear As Integer, strKonto As String) As Double
fncLookupKtoBeløb = ELookup("Beløb", "tblParm_BeløbPctMedKonti", "BudgetYear = " & intYear & " AND Konto = '" & strKonto & "'")
End Function
Function fncLookupKtoPct(intYear As Integer, strKonto As String) As Double
    fncLookupKtoPct = ELookup("Procent", "tblParm_BeløbPctMedKonti", "BudgetYear = " & intYear & " AND Konto = '" & strKonto & "'")
End Function
