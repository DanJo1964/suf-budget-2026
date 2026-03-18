Attribute VB_Name = "Functions FB Budget to Excel"
Option Compare Database
Option Explicit
Sub testCallExc()
    Call ExportTblFBBudgetToExcel(2026, 12, "61")
End Sub
' =========================================================
'  ENTRYPOINT (OPRINDELIG FUNKTION)
'  Denne fungerer nu som en "wrapper", der starter Excel og kalder hjælpe-sub'en
' =========================================================
Public Sub ExportTblFBBudgetToExcel(ByVal intYear As Integer, ByVal intMonth As Integer, Optional ByVal sDeptField As String = "")
    Dim xlApp As Object, xlBook As Object

    ' Start en ny Excel-instans og opret en tom projektmappe
    Set xlApp = CreateObject("Excel.Application")
    Set xlBook = xlApp.Workbooks.Add
    xlApp.Visible = True

    ' Slet det overflødige standard-ark, da vores hjælpefunktion selv opretter et
    On Error Resume Next
    xlApp.DisplayAlerts = False
    xlBook.sheets("Sheet1").Delete 'Eller "Ark1" afhængigt af sprog
    xlApp.DisplayAlerts = True
    On Error GoTo 0

    ' Kald den centrale logik til at udfylde arket
    PopulateFællesbidragSheet xlBook, intYear, intMonth, sDeptField

    ' Ryd op
    Set xlBook = Nothing
    Set xlApp = Nothing
End Sub
' =========================================================
'  NY HJÆLPE-SUBRUTINE (PRIVAT)
'  Udfylder et ark i en eksisterende Excel projektmappe med Fællesbidragsdata.
' =========================================================
Public Sub PopulateFællesbidragSheet(ByVal xlBook As Object, ByVal intYear As Integer, ByVal intMonth As Integer, ByVal sDeptField As String)
    On Error GoTo EH

    Dim rs As DAO.Recordset
    Dim xlSheet As Object
    Dim arrFields() As String
    Dim headerRow As Long, firstDataRow As Long, lastCol As Long
    Dim col As Long, i As Long, row_ As Long
    Dim lastDate As Date

    ' Tilføj et nyt ark til den medsendte projektmappe og navngiv det
    Set xlSheet = xlBook.sheets.Add(After:=xlBook.sheets(xlBook.sheets.Count))
    xlSheet.Name = "Fællesbidrag opg."

    ' --- Byg afdelingsliste fra tabeldefinition + sorter ---
    If sDeptField <> "" Then
        ReDim arrFields(1)
        arrFields(0) = "01" ' Altid medsende "01" som reference
        arrFields(1) = sDeptField
    Else
        GetDeptFieldArrayFromTable "tblFBBudget", arrFields
        SortDeptFields arrFields
    End If

    ' --- Åbn recordset hvor ALLE beløbsfelter er Double og NULL->0 ---
    Set rs = OpenBudgetRS_AsDouble(intYear, arrFields)
    If (rs.BOF And rs.EOF) Then GoTo TidyUp

    headerRow = 4
    firstDataRow = headerRow + 1
    lastDate = DateSerial(intYear, intMonth + 1, 0)

    xlSheet.range("D2").value = "Fællesbidrag opgørelse pr. " & Format$(lastDate, "dd-mm-yyyy")
    xlSheet.range("D2").Font.Size = 14
    xlSheet.range("D2").Font.Bold = True

    xlSheet.Cells(headerRow, 4).value = "Beskrivelse"
    xlSheet.Cells(headerRow, 5).value = "Totaler"

    If sDeptField <> "" Then
        xlSheet.Cells(headerRow, 6).value = DeptHeaderText("01")
        xlSheet.Cells(headerRow, 6).WrapText = True
        xlSheet.Cells(headerRow, 6).Font.Size = 9
        xlSheet.Columns(6).AutoFit
        xlSheet.Cells(headerRow, 7).value = DeptHeaderText(sDeptField)
        xlSheet.Cells(headerRow, 7).WrapText = True
        xlSheet.Cells(headerRow, 7).Font.Size = 9
        xlSheet.Columns(7).AutoFit
        lastCol = 7
    Else
        col = 6
        For i = LBound(arrFields) To UBound(arrFields)
            xlSheet.Cells(headerRow, col).value = DeptHeaderText(arrFields(i))
            xlSheet.Cells(headerRow, col).WrapText = True
            xlSheet.Cells(headerRow, col).Font.Size = 9
            xlSheet.Columns(col).AutoFit
            col = col + 1
        Next
        lastCol = col - 1
    End If

    ' Header styling
    Const xlEdgeBottom As Long = 9
    Const xlContinuous As Long = 1
    Const xlCenter As Long = -4108
    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(headerRow, lastCol)).Font.Bold = True
    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(headerRow, lastCol)).HorizontalAlignment = xlCenter
    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(headerRow, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous

    ' --- DATA BLOK 1 ---
    row_ = firstDataRow
    WriteRowFromID rs, 2, row_, arrFields, xlSheet, lastCol, _
                   totalMode:="value", scale_:=1#, numberFormat:="#,##0.0;[Red]-#,##0.0"
    row_ = row_ + 1
    WriteRowFromID rs, 3, row_, arrFields, xlSheet, lastCol, _
                   totalMode:="sum", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00", shade:=True
    row_ = row_ + 1
    WriteRowFromID rs, 4, row_, arrFields, xlSheet, lastCol, _
                   totalMode:="value", scale_:=0.001, numberFormat:="#,##0;[Red]-#,##0"
    row_ = row_ + 1
    WriteRowFromID rs, 5, row_, arrFields, xlSheet, lastCol, _
                   totalMode:="sum", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00", shade:=True
    row_ = row_ + 2
    Const xlThick As Long = 4
    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(row_ - 1, lastCol)).BorderAround xlContinuous, xlThick

    ' --- BLOK 2: ID 6-7 ---
    row_ = 11
    WriteRowFromID rs, 6, row_, arrFields, xlSheet, lastCol, _
                   totalMode:="value", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00"
    row_ = row_ + 1
    WriteRowFromID rs, 7, row_, arrFields, xlSheet, lastCol, _
                   totalMode:="value", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00", shade:=True
    xlSheet.range(xlSheet.Cells(11, 3), xlSheet.Cells(12, lastCol)).BorderAround xlContinuous, xlThick

    ' --- BLOK 3: ID 8..21 ---
    row_ = 14
    For i = 8 To 21
        WriteRowFromID rs, i, row_, arrFields, xlSheet, lastCol, _
                       totalMode:="value", scale_:=1#, numberFormat:="#,##0;[Red]-#,##0", _
                       shade:=(((i - 8) Mod 2) = 1)
        xlSheet.Cells(row_, 3).value = Nz(rs.Fields("Konto_2").value, "")
        row_ = row_ + 1
    Next
    xlSheet.range(xlSheet.Cells(14, 3), xlSheet.Cells(row_ - 1, lastCol)).BorderAround xlContinuous, xlThick

    If sDeptField = "" Then
        xlSheet.range("F5:F12").ClearContents
    End If

    ' === EKSTRA RÆKKER ===
    row_ = row_ + 1
    xlSheet.Cells(row_, 4).value = "Totaler"
    xlSheet.Cells(row_, 5).Formula = "=SUM(E14:E27)"
    Dim c As Long
    If sDeptField <> "" Then
        xlSheet.Cells(row_, 6).Formula = "=SUM(" & xlSheet.Cells(14, 6).Address & ":" & xlSheet.Cells(27, 6).Address & ")"
        xlSheet.Cells(row_, 7).Formula = "=SUM(" & xlSheet.Cells(14, 7).Address & ":" & xlSheet.Cells(27, 7).Address & ")"
    Else
        For c = 6 To lastCol
            xlSheet.Cells(row_, c).Formula = "=SUM(" & xlSheet.Cells(14, c).Address & ":" & xlSheet.Cells(27, c).Address & ")"
        Next c
    End If

    row_ = row_ + 1
    xlSheet.Cells(row_, 4).value = "Totaler uden bidrag fra Special Minds"
    xlSheet.Cells(row_, 5).Formula = "=" & xlSheet.Cells(row_ - 1, 5).Address & "-E17-E21-E24"
    If sDeptField <> "" Then
        xlSheet.Cells(row_, 6).Formula = "=" & xlSheet.Cells(row_ - 1, 6).Address & "-" & xlSheet.Cells(17, 6).Address & "-" & xlSheet.Cells(21, 6).Address & "-" & xlSheet.Cells(24, 6).Address
        xlSheet.Cells(row_, 7).Formula = "=" & xlSheet.Cells(row_ - 1, 7).Address & "-" & xlSheet.Cells(17, 7).Address & "-" & xlSheet.Cells(21, 7).Address & "-" & xlSheet.Cells(24, 7).Address
    Else
        For c = 6 To lastCol
            xlSheet.Cells(row_, c).Formula = "=" & xlSheet.Cells(row_ - 1, c).Address & "-" & xlSheet.Cells(17, c).Address & "-" & xlSheet.Cells(21, c).Address & "-" & xlSheet.Cells(24, c).Address
        Next c
    End If

    xlSheet.range(xlSheet.Cells(row_ - 1, 3), xlSheet.Cells(row_, lastCol)).Font.Bold = True
    xlSheet.range(xlSheet.Cells(row_ - 1, 3), xlSheet.Cells(row_, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous
    xlSheet.range(xlSheet.Cells(row_ - 1, 3), xlSheet.Cells(row_, lastCol)).numberFormat = "#,##0;[Red]-#,##0"

    xlSheet.Columns().AutoFit

TidyUp:
    On Error Resume Next
    If Not rs Is Nothing Then rs.Close
    Set rs = Nothing
    Exit Sub
EH:
    MsgBox "Fejl i PopulateFællesbidragSheet: " & Err.Number & " - " & Err.Description, vbExclamation
    Resume TidyUp
End Sub


' =========================================================
'  DATA & FELTLISTER
' =========================================================

' Find rigtigt TableDef-navn (fx håndterer dbo_tblFBBudget)
Private Function ResolveLinkedName(ByVal requestedName As String) As String
    Dim tdf As DAO.TableDef, nm As String, base As String
    For Each tdf In CurrentDb.TableDefs
        nm = tdf.Name
        If StrComp(nm, requestedName, vbTextCompare) = 0 Then ResolveLinkedName = nm: Exit Function
    Next
    For Each tdf In CurrentDb.TableDefs
        nm = tdf.Name: base = Right$(nm, Len(requestedName))
        If StrComp(base, requestedName, vbTextCompare) = 0 Then ResolveLinkedName = nm: Exit Function
    Next
    ResolveLinkedName = ""
End Function

' Sikker udgave: henter alle afdelingsfelter ("01","10","60_...") – også fra linked ODBC
Private Sub GetDeptFieldArrayFromTable(ByVal tableName As String, ByRef arr() As String)
    Dim dB As DAO.Database: Set dB = CurrentDb()
    Dim tdf As DAO.TableDef, rs As DAO.Recordset, f As DAO.field
    Dim col As New Collection, pref As String, n As Long, realName As String, i As Long

    realName = ResolveLinkedName(tableName)
    If realName = "" Then Err.Raise vbObjectError + 513, , "Tabel ikke fundet: " & tableName

    Set tdf = dB.TableDefs(realName)
    On Error Resume Next
    If (tdf.Attributes And 536870912) <> 0 Then tdf.RefreshLink ' dbAttachedODBC
    On Error GoTo 0

    On Error GoTo Fallback
    For Each f In tdf.Fields
        pref = Left$(f.Name, 2)
        If IsNumeric(pref) Then n = CLng(pref): If n >= 1 And n <= 99 Then col.Add f.Name
    Next
    GoTo BuildArray

Fallback:
    On Error GoTo 0
    Set rs = dB.OpenRecordset("SELECT * FROM [" & realName & "] WHERE 1=0;", dbOpenSnapshot)
    For Each f In rs.Fields
        pref = Left$(f.Name, 2)
        If IsNumeric(pref) Then n = CLng(pref): If n >= 1 And n <= 99 Then col.Add f.Name
    Next
    rs.Close

BuildArray:
    ReDim arr(1 To col.Count)
    For i = 1 To col.Count
        arr(i) = CStr(col(i))
    Next
End Sub

' Recordset hvor ALLE beløbsfelter er Double og NULL->0 (via Nz)
Private Function OpenBudgetRS_AsDouble(ByVal intYear As Integer, ByRef arrFields() As String) As DAO.Recordset
    Dim dB As DAO.Database: Set dB = CurrentDb()
    Dim sb As String, i As Long

    ' ydre SELECT over subquery for at undgå alias-konflikt (3103)
    sb = "SELECT src.ID, src.Konto_1, src.Konto_2, src.KontoNavn, CDbl(Nz(src.[Totaler],0)) AS [Totaler]"
    For i = LBound(arrFields) To UBound(arrFields)
        sb = sb & ", CDbl(Nz(src.[" & arrFields(i) & "],0)) AS [" & arrFields(i) & "]"
    Next
    sb = sb & " FROM (SELECT * FROM tblFBBudget WHERE Year_=" & intYear & ") AS src"
    sb = sb & " ORDER BY src.ID"

    Set OpenBudgetRS_AsDouble = dB.OpenRecordset(sb, dbOpenDynaset, dbSeeChanges)
End Function


' =========================================================
'  SORTERING / NAVNE
' =========================================================
Private Sub SortDeptFields(ByRef arr() As String)
    Dim i As Long, j As Long, a As String, b As String
    For i = LBound(arr) To UBound(arr) - 1
        For j = i + 1 To UBound(arr)
            a = arr(i): b = arr(j)
            If DeptCompare(a, b) > 0 Then arr(i) = b: arr(j) = a
        Next
    Next
End Sub

Private Function DeptCompare(ByVal a As String, ByVal b As String) As Long
    Dim na As Long, nb As Long, sa As String, sb As String
    ParseDept a, na, sa: ParseDept b, nb, sb
    If na <> nb Then DeptCompare = Sgn(na - nb) Else DeptCompare = StrComp(sa, sb, vbTextCompare)
End Function

Private Sub ParseDept(ByVal fldName As String, ByRef numPart As Long, ByRef subPart As String)
    Dim p As Long: p = InStr(1, fldName, "_")
    If p > 0 Then numPart = CLng(Left$(fldName, p - 1)): subPart = Mid$(fldName, p + 1) _
            Else numPart = CLng(fldName): subPart = ""
End Sub

Private Function DeptHeaderText(ByVal fldName As String) As String
    Dim p As Long, numPart As String, subPart As String, crit As String
    Dim AfdNavn As String, spacePos As Long, n1 As String, n2 As String
    p = InStr(1, fldName, "_")
    If p > 0 Then
        numPart = Left$(fldName, p - 1): subPart = Mid$(fldName, p + 1)
        crit = "AFD='" & numPart & "' AND VALGFRI2='" & Replace(subPart, "'", "''") & "'"
    Else
        numPart = fldName: crit = "AFD='" & val(numPart) & "'"
    End If
    AfdNavn = Nz(DLookup("AFD_BETEGN", "tblFBNormtid", crit), "Ingen medarb. endnu")
    spacePos = InStr(1, AfdNavn, " ")
    If spacePos > 0 Then
        n1 = Left$(AfdNavn, spacePos - 1): n2 = Mid$(AfdNavn, spacePos + 1)
        DeptHeaderText = "Afd " & fldName & vbLf & n1 & vbLf & n2
    Else
        DeptHeaderText = "Afd " & fldName & vbLf & AfdNavn
    End If
End Function


' =========================================================
'  SKRIV ÉN RÆKKE TIL EXCEL
' =========================================================
Private Sub WriteRowFromID(ByRef rs As DAO.Recordset, ByVal wantedID As Long, _
                           ByVal row_ As Long, ByRef arrFields() As String, _
                           ByRef xlSheet As Object, ByVal lastCol As Long, _
                           Optional ByVal totalMode As String = "value", _
                           Optional ByVal scale_ As Double = 1#, _
                           Optional ByVal numberFormat As String = "#,##0.00;[Red]-#,##0.00", _
                           Optional ByVal shade As Boolean = False)
    Const xlEdgeBottom As Long = 9
    Const xlContinuous As Long = 1

    rs.FindFirst "ID=" & wantedID
    If rs.NoMatch Then Exit Sub

    xlSheet.Cells(row_, 4).value = Nz(rs.Fields("KontoNavn").value, "")
    If wantedID >= 8 And wantedID <= 21 Then
        xlSheet.Cells(row_, 3).value = Nz(rs.Fields("Konto_2").value, "")
    End If

    If LCase$(totalMode) = "sum" Then
        xlSheet.Cells(row_, 5).Formula = "=SUM(" & _
            xlSheet.Cells(row_, 6).Address(False, False) & ":" & _
            xlSheet.Cells(row_, lastCol).Address(False, False) & ")"
    Else
        ' rs.Fields("Totaler") er allerede Double og NULL->0 i SELECT
        xlSheet.Cells(row_, 5).Value2 = CDbl(rs.Fields("Totaler").value) * scale_
    End If

    Dim i As Long, c As Long: c = 6
    For i = LBound(arrFields) To UBound(arrFields)
        ' Alle afd.-felter er også Double og NULL->0 i SELECT
        xlSheet.Cells(row_, c).Value2 = CDbl(rs.Fields(arrFields(i)).value) * IIf(scale_ <> 1#, scale_, 1#)
        c = c + 1
    Next

    xlSheet.range(xlSheet.Cells(row_, 6), xlSheet.Cells(row_, lastCol)).numberFormat = numberFormat
    xlSheet.Cells(row_, 5).numberFormat = numberFormat

    If shade Then
        With xlSheet.range(xlSheet.Cells(row_, 6), xlSheet.Cells(row_, lastCol))
            .Font.Size = 10
            .Interior.Color = RGB(247, 226, 217)
        End With
    End If

    If wantedID >= 8 And wantedID <= 21 Then
        xlSheet.range(xlSheet.Cells(row_, 3), xlSheet.Cells(row_, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous
    Else
        xlSheet.range(xlSheet.Cells(row_, 4), xlSheet.Cells(row_, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous
    End If
End Sub


' =========================================================
'  (Valgfri) konverteringshelper – beholdes hvis du skulle bruge den andre steder
' =========================================================
Private Function AsDouble(ByVal v As Variant, Optional ByVal def As Double = 0#) As Double
    On Error GoTo Fallback
    If IsNull(v) Then
        AsDouble = def
    Else
        AsDouble = CDbl(v * 1#)
    End If
    Exit Function

Fallback:
    Err.Clear
    If VarType(v) = vbString Then
        Dim s As String: s = Trim$(CStr(v))
        If s = "" Or s = "." Or s = "," Then
            AsDouble = def
        ElseIf IsNumeric(s) Then
            AsDouble = CDbl(s)
        Else
            AsDouble = def
        End If
    ElseIf VarType(v) = vbDecimal Then
        AsDouble = CDbl(CDec(v))
    ElseIf IsNumeric(v) Then
        AsDouble = CDbl(v)
    Else
        AsDouble = def
    End If
End Function





'' =========================================================
''  ENTRYPOINT
'' =========================================================
'Public Sub ExportTblFBBudgetToExcel(ByVal intYear As Integer, ByVal intMonth As Integer, Optional ByVal sDeptField As String = "")
'    Dim rs As DAO.Recordset
'    Dim xlApp As Object, xlBook As Object, xlSheet As Object
'    Dim arrFields() As String
'    Dim headerRow As Long, firstDataRow As Long, lastCol As Long
'    Dim col As Long, i As Long, row_ As Long
'    Dim lastDate As Date
'
'    ' --- Byg afdelingsliste fra tabeldefinition + sorter ---
'    If sDeptField <> "" Then
'        ReDim arrFields(1)
'        arrFields(0) = "01"
'        arrFields(1) = sDeptField
'    Else
'        GetDeptFieldArrayFromTable "tblFBBudget", arrFields
'        SortDeptFields arrFields
'    End If
'
'    ' --- Åbn recordset hvor ALLE beløbsfelter er Double og NULL->0 ---
'    Set rs = OpenBudgetRS_AsDouble(intYear, arrFields)
'    If (rs.BOF And rs.EOF) Then GoTo TidyUp
'
'    ' --- Excel ---
'    Set xlApp = CreateObject("Excel.Application")
'    Set xlBook = xlApp.Workbooks.Add
'    Set xlSheet = xlBook.Sheets(1)
'    xlApp.Visible = True
'
'    headerRow = 4
'    firstDataRow = headerRow + 1
'    lastDate = DateSerial(intYear, intMonth + 1, 0)
'
'    xlSheet.range("D2").value = "Fællesbidrag opgørelse pr. " & Format$(lastDate, "dd-mm-yyyy")
'    xlSheet.range("D2").Font.Size = 14
'    xlSheet.range("D2").Font.Bold = True
'
'    'xlSheet.Cells(headerRow, 3).value = "Konto_2"
'    xlSheet.Cells(headerRow, 4).value = "Beskrivelse"
'    xlSheet.Cells(headerRow, 5).value = "Totaler"
'
'    If sDeptField <> "" Then
'        xlSheet.Cells(headerRow, 6).value = DeptHeaderText("01")
'        xlSheet.Cells(headerRow, 6).WrapText = True
'        xlSheet.Cells(headerRow, 6).Font.Size = 9
'        xlSheet.Columns(6).AutoFit
'        xlSheet.Cells(headerRow, 7).value = DeptHeaderText(sDeptField)
'        xlSheet.Cells(headerRow, 7).WrapText = True
'        xlSheet.Cells(headerRow, 7).Font.Size = 9
'        xlSheet.Columns(7).AutoFit
'        lastCol = 7
'    Else
'        col = 6 ' F-kolonne = første afd.
'        For i = LBound(arrFields) To UBound(arrFields)
'            xlSheet.Cells(headerRow, col).value = DeptHeaderText(arrFields(i))
'            xlSheet.Cells(headerRow, col).WrapText = True
'            xlSheet.Cells(headerRow, col).Font.Size = 9
'            xlSheet.Columns(col).AutoFit
'            col = col + 1
'        Next
'        lastCol = col - 1
'    End If
'
'    ' Header styling
'    Const xlEdgeBottom As Long = 9
'    Const xlContinuous As Long = 1
'    Const xlCenter As Long = -4108
'    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(headerRow, lastCol)).Font.Bold = True
'    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(headerRow, lastCol)).HorizontalAlignment = xlCenter
'    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(headerRow, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous
'
'    ' --- DATA BLOK 1 ---
'    row_ = firstDataRow
'    WriteRowFromID rs, 2, row_, arrFields, xlSheet, lastCol, _
'                   totalMode:="value", scale_:=1#, numberFormat:="#,##0.0;[Red]-#,##0.0"
'    row_ = row_ + 1
'
'    WriteRowFromID rs, 3, row_, arrFields, xlSheet, lastCol, _
'                   totalMode:="sum", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00", shade:=True
'    row_ = row_ + 1
'
'    WriteRowFromID rs, 4, row_, arrFields, xlSheet, lastCol, _
'                   totalMode:="value", scale_:=0.001, numberFormat:="#,##0;[Red]-#,##0"
'    row_ = row_ + 1
'
'    WriteRowFromID rs, 5, row_, arrFields, xlSheet, lastCol, _
'                   totalMode:="sum", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00", shade:=True
'    row_ = row_ + 2
'    Const xlThick As Long = 4
'    xlSheet.range(xlSheet.Cells(headerRow, 3), xlSheet.Cells(row_ - 1, lastCol)).BorderAround xlContinuous, xlThick
'
'    ' --- BLOK 2: ID 6-7 ---
'    row_ = 11
'    WriteRowFromID rs, 6, row_, arrFields, xlSheet, lastCol, _
'                   totalMode:="value", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00"
'    row_ = row_ + 1
'    WriteRowFromID rs, 7, row_, arrFields, xlSheet, lastCol, _
'                   totalMode:="value", scale_:=1#, numberFormat:="#,##0.00;[Red]-#,##0.00", shade:=True
'    xlSheet.range(xlSheet.Cells(11, 3), xlSheet.Cells(12, lastCol)).BorderAround xlContinuous, xlThick
'
'    ' --- BLOK 3: ID 8..21 ---
'    row_ = 14
'    For i = 8 To 21
'        WriteRowFromID rs, i, row_, arrFields, xlSheet, lastCol, _
'                       totalMode:="value", scale_:=1#, numberFormat:="#,##0;[Red]-#,##0", _
'                       shade:=(((i - 8) Mod 2) = 1)
'        xlSheet.Cells(row_, 3).value = Nz(rs.Fields("Konto_2").value, "")
'        row_ = row_ + 1
'    Next
'    xlSheet.range(xlSheet.Cells(14, 3), xlSheet.Cells(row_ - 1, lastCol)).BorderAround xlContinuous, xlThick
'
'    If sDeptField = "" Then
'        xlSheet.range("F5:F12").ClearContents
'    End If
'
'    ' === EKSTRA RÆKKER ===
'    ' Række A: SUM af rækker 8–21 (kolonne F..lastCol)
'    row_ = row_ + 1
'    xlSheet.Cells(row_, 4).value = "Totaler"
'    xlSheet.Cells(row_, 5).Formula = "=SUM(E14:E27)"  ' total-kolonne
'
'    Dim c As Long
'    If sDeptField <> "" Then
'        xlSheet.Cells(row_, 6).Formula = "=SUM(" & xlSheet.Cells(14, 6).Address & ":" & xlSheet.Cells(27, 6).Address & ")"
'        xlSheet.Cells(row_, 7).Formula = "=SUM(" & xlSheet.Cells(14, 7).Address & ":" & xlSheet.Cells(27, 7).Address & ")"
'    Else
'        For c = 6 To lastCol
'            xlSheet.Cells(row_, c).Formula = "=SUM(" & xlSheet.Cells(14, c).Address & ":" & xlSheet.Cells(27, c).Address & ")"
'        Next c
'    End If
'
'    ' Række B: SUM (ovenfor) minus rækker 17,21,24
'    row_ = row_ + 1
'    xlSheet.Cells(row_, 4).value = "Totaler uden bidrag fra Special Minds"
'    ' total-kolonnen
'    xlSheet.Cells(row_, 5).Formula = "=" & xlSheet.Cells(row_ - 1, 5).Address & _
'                                     "-E17-E21-E24"
'
'    If sDeptField <> "" Then
'        xlSheet.Cells(row_, 6).Formula = "=" & xlSheet.Cells(row_ - 1, 6).Address & _
'                                         "-" & xlSheet.Cells(17, 6).Address & _
'                                         "-" & xlSheet.Cells(21, 6).Address & _
'                                         "-" & xlSheet.Cells(24, 6).Address
'        xlSheet.Cells(row_, 7).Formula = "=" & xlSheet.Cells(row_ - 1, 7).Address & _
'                                         "-" & xlSheet.Cells(17, 7).Address & _
'                                         "-" & xlSheet.Cells(21, 7).Address & _
'                                         "-" & xlSheet.Cells(24, 7).Address
'    Else
'        For c = 6 To lastCol
'            xlSheet.Cells(row_, c).Formula = "=" & xlSheet.Cells(row_ - 1, c).Address & _
'                                             "-" & xlSheet.Cells(17, c).Address & _
'                                             "-" & xlSheet.Cells(21, c).Address & _
'                                             "-" & xlSheet.Cells(24, c).Address
'        Next c
'    End If
'
'
'    ' Fremhæv de to ekstra rækker
'    xlSheet.range(xlSheet.Cells(row_ - 1, 3), xlSheet.Cells(row_, lastCol)).Font.Bold = True
'    xlSheet.range(xlSheet.Cells(row_ - 1, 3), xlSheet.Cells(row_, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous
'    xlSheet.range(xlSheet.Cells(row_ - 1, 3), xlSheet.Cells(row_, lastCol)).numberFormat = "#,##0;[Red]-#,##0"
'
'    xlSheet.Columns().AutoFit
'
'TidyUp:
'
'
'    On Error Resume Next
'    If Not rs Is Nothing Then rs.Close
'    Set rs = Nothing
'    Exit Sub
'EH:
'    MsgBox "Fejl i ExportTblFBBudgetToExcel: " & Err.Number & " - " & Err.Description, vbExclamation
'    Resume TidyUp
'End Sub

'
'' =========================================================
''  DATA & FELTLISTER
'' =========================================================
'
'' Find rigtigt TableDef-navn (fx håndterer dbo_tblFBBudget)
'Private Function ResolveLinkedName(ByVal requestedName As String) As String
'    Dim tdf As DAO.TableDef, nm As String, base As String
'    For Each tdf In CurrentDb.TableDefs
'        nm = tdf.Name
'        If StrComp(nm, requestedName, vbTextCompare) = 0 Then ResolveLinkedName = nm: Exit Function
'    Next
'    For Each tdf In CurrentDb.TableDefs
'        nm = tdf.Name: base = Right$(nm, Len(requestedName))
'        If StrComp(base, requestedName, vbTextCompare) = 0 Then ResolveLinkedName = nm: Exit Function
'    Next
'    ResolveLinkedName = ""
'End Function
'
'' Sikker udgave: henter alle afdelingsfelter ("01","10","60_...") – også fra linked ODBC
'Private Sub GetDeptFieldArrayFromTable(ByVal tableName As String, ByRef arr() As String)
'    Dim db As DAO.Database: Set db = CurrentDb()
'    Dim tdf As DAO.TableDef, rs As DAO.Recordset, f As DAO.field
'    Dim col As New Collection, pref As String, n As Long, realName As String, i As Long
'
'    realName = ResolveLinkedName(tableName)
'    If realName = "" Then Err.Raise vbObjectError + 513, , "Tabel ikke fundet: " & tableName
'
'    Set tdf = db.TableDefs(realName)
'    On Error Resume Next
'    If (tdf.Attributes And 536870912) <> 0 Then tdf.RefreshLink ' dbAttachedODBC
'    On Error GoTo 0
'
'    On Error GoTo Fallback
'    For Each f In tdf.Fields
'        pref = Left$(f.Name, 2)
'        If IsNumeric(pref) Then n = CLng(pref): If n >= 1 And n <= 99 Then col.Add f.Name
'    Next
'    GoTo BuildArray
'
'Fallback:
'    On Error GoTo 0
'    Set rs = db.OpenRecordset("SELECT * FROM [" & realName & "] WHERE 1=0;", dbOpenSnapshot)
'    For Each f In rs.Fields
'        pref = Left$(f.Name, 2)
'        If IsNumeric(pref) Then n = CLng(pref): If n >= 1 And n <= 99 Then col.Add f.Name
'    Next
'    rs.Close
'
'BuildArray:
'    ReDim arr(1 To col.Count)
'    For i = 1 To col.Count
'        arr(i) = CStr(col(i))
'    Next
'End Sub
'
'' Recordset hvor ALLE beløbsfelter er Double og NULL->0 (via Nz)
'Private Function OpenBudgetRS_AsDouble(ByVal intYear As Integer, ByRef arrFields() As String) As DAO.Recordset
'    Dim db As DAO.Database: Set db = CurrentDb()
'    Dim sb As String, i As Long
'
'    ' ydre SELECT over subquery for at undgå alias-konflikt (3103)
'    sb = "SELECT src.ID, src.Konto_1, src.Konto_2, src.KontoNavn, CDbl(Nz(src.[Totaler],0)) AS [Totaler]"
'    For i = LBound(arrFields) To UBound(arrFields)
'        sb = sb & ", CDbl(Nz(src.[" & arrFields(i) & "],0)) AS [" & arrFields(i) & "]"
'    Next
'    sb = sb & " FROM (SELECT * FROM tblFBBudget WHERE Year_=" & intYear & ") AS src"
'    sb = sb & " ORDER BY src.ID"
'
'    Set OpenBudgetRS_AsDouble = db.OpenRecordset(sb, dbOpenDynaset, dbSeeChanges)
'End Function
'
'
'' =========================================================
''  SORTERING / NAVNE
'' =========================================================
'Private Sub SortDeptFields(ByRef arr() As String)
'    Dim i As Long, j As Long, a As String, b As String
'    For i = LBound(arr) To UBound(arr) - 1
'        For j = i + 1 To UBound(arr)
'            a = arr(i): b = arr(j)
'            If DeptCompare(a, b) > 0 Then arr(i) = b: arr(j) = a
'        Next
'    Next
'End Sub
'
'Private Function DeptCompare(ByVal a As String, ByVal b As String) As Long
'    Dim na As Long, nb As Long, sa As String, sb As String
'    ParseDept a, na, sa: ParseDept b, nb, sb
'    If na <> nb Then DeptCompare = Sgn(na - nb) Else DeptCompare = StrComp(sa, sb, vbTextCompare)
'End Function
'
'Private Sub ParseDept(ByVal fldName As String, ByRef numPart As Long, ByRef subPart As String)
'    Dim p As Long: p = InStr(1, fldName, "_")
'    If p > 0 Then numPart = CLng(Left$(fldName, p - 1)): subPart = Mid$(fldName, p + 1) _
'            Else numPart = CLng(fldName): subPart = ""
'End Sub
'
'Private Function DeptHeaderText(ByVal fldName As String) As String
'    Dim p As Long, numPart As String, subPart As String, crit As String
'    Dim AfdNavn As String, spacePos As Long, n1 As String, n2 As String
'    p = InStr(1, fldName, "_")
'    If p > 0 Then
'        numPart = Left$(fldName, p - 1): subPart = Mid$(fldName, p + 1)
'        crit = "AFD='" & numPart & "' AND VALGFRI2='" & Replace(subPart, "'", "''") & "'"
'    Else
'        numPart = fldName: crit = "AFD='" & val(numPart) & "'"
'    End If
'    AfdNavn = Nz(DLookup("AFD_BETEGN", "tblFBNormtid", crit), "Ingen medarb. endnu")
'    spacePos = InStr(1, AfdNavn, " ")
'    If spacePos > 0 Then
'        n1 = Left$(AfdNavn, spacePos - 1): n2 = Mid$(AfdNavn, spacePos + 1)
'        DeptHeaderText = "Afd " & fldName & vbLf & n1 & vbLf & n2
'    Else
'        DeptHeaderText = "Afd " & fldName & vbLf & AfdNavn
'    End If
'End Function
'
'
'' =========================================================
''  SKRIV ÉN RÆKKE TIL EXCEL
'' =========================================================
'Private Sub WriteRowFromID(ByRef rs As DAO.Recordset, ByVal wantedID As Long, _
'                           ByVal row_ As Long, ByRef arrFields() As String, _
'                           ByRef xlSheet As Object, ByVal lastCol As Long, _
'                           Optional ByVal totalMode As String = "value", _
'                           Optional ByVal scale_ As Double = 1#, _
'                           Optional ByVal numberFormat As String = "#,##0.00;[Red]-#,##0.00", _
'                           Optional ByVal shade As Boolean = False)
'    Const xlEdgeBottom As Long = 9
'    Const xlContinuous As Long = 1
'
'    rs.FindFirst "ID=" & wantedID
'    If rs.NoMatch Then Exit Sub
'
'    xlSheet.Cells(row_, 4).value = Nz(rs.Fields("KontoNavn").value, "")
'    If wantedID >= 8 And wantedID <= 21 Then
'        xlSheet.Cells(row_, 3).value = Nz(rs.Fields("Konto_2").value, "")
'    End If
'
'    If LCase$(totalMode) = "sum" Then
'        xlSheet.Cells(row_, 5).Formula = "=SUM(" & _
'            xlSheet.Cells(row_, 6).Address(False, False) & ":" & _
'            xlSheet.Cells(row_, lastCol).Address(False, False) & ")"
'    Else
'        ' rs.Fields("Totaler") er allerede Double og NULL->0 i SELECT
'        xlSheet.Cells(row_, 5).Value2 = CDbl(rs.Fields("Totaler").value) * scale_
'    End If
'
'    Dim i As Long, c As Long: c = 6
'    For i = LBound(arrFields) To UBound(arrFields)
'        ' Alle afd.-felter er også Double og NULL->0 i SELECT
'        xlSheet.Cells(row_, c).Value2 = CDbl(rs.Fields(arrFields(i)).value) * IIf(scale_ <> 1#, scale_, 1#)
'        c = c + 1
'    Next
'
'    xlSheet.range(xlSheet.Cells(row_, 6), xlSheet.Cells(row_, lastCol)).numberFormat = numberFormat
'    xlSheet.Cells(row_, 5).numberFormat = numberFormat
'
'    If shade Then
'        With xlSheet.range(xlSheet.Cells(row_, 6), xlSheet.Cells(row_, lastCol))
'            .Font.Size = 10
'            .Interior.Color = RGB(247, 226, 217)
'        End With
'    End If
'
'    If wantedID >= 8 And wantedID <= 21 Then
'        xlSheet.range(xlSheet.Cells(row_, 3), xlSheet.Cells(row_, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous
'    Else
'        xlSheet.range(xlSheet.Cells(row_, 4), xlSheet.Cells(row_, lastCol)).Borders(xlEdgeBottom).LineStyle = xlContinuous
'    End If
'End Sub
'
'
'' =========================================================
''  (Valgfri) konverteringshelper – beholdes hvis du skulle bruge den andre steder
'' =========================================================
'Private Function AsDouble(ByVal v As Variant, Optional ByVal def As Double = 0#) As Double
'    On Error GoTo Fallback
'    If IsNull(v) Then
'        AsDouble = def
'    Else
'        AsDouble = CDbl(v * 1#)
'    End If
'    Exit Function
'
'Fallback:
'    Err.Clear
'    If VarType(v) = vbString Then
'        Dim s As String: s = Trim$(CStr(v))
'        If s = "" Or s = "." Or s = "," Then
'            AsDouble = def
'        ElseIf IsNumeric(s) Then
'            AsDouble = CDbl(s)
'        Else
'            AsDouble = def
'        End If
'    ElseIf VarType(v) = vbDecimal Then
'        AsDouble = CDbl(CDec(v))
'    ElseIf IsNumeric(v) Then
'        AsDouble = CDbl(v)
'    Else
'        AsDouble = def
'    End If
'End Function
'
'
