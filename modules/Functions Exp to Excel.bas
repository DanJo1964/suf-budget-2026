Attribute VB_Name = "Functions Exp to Excel"
Option Compare Database
Option Explicit
Function fncExpToExcel(strAfd As String, intYear As Integer)
    Dim objExcel As Object
    Dim wb As Object
    Dim ws As Object
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim copiedfilePath As String
    Dim templatePath As String
    Dim str As String
    Dim fld As DAO.field
    Dim strCellAdd As String
    Dim strAfdNavn As String

    ' Initialize
    Set dB = CurrentDb()
    templatePath = "https://dksuf.sharepoint.com/sites/ProjektBudget2024/Delte%20dokumenter/General/Budget%202025/Budgetskema%202025%20tilbudsportalen.xlsx"

    strAfdNavn = Nz(ELookup("AfdelingsNavn", "tblAfdeling", "[AfdNr Uniconta] = '" & strAfd & "'"), strAfd)

    copiedfilePath = "C:\temp\SUF\Afdeling " & strAfd & " " & strAfdNavn & " budgetår " & intYear & ".xlsx"

    ' Create Excel object and open workbook
    Set objExcel = CreateObject("Excel.Application")
    objExcel.Visible = True
    Set wb = objExcel.Workbooks.Open(templatePath)

    ' Save a copy of the template
    wb.SaveCopyAs copiedfilePath
    wb.Close SaveChanges:=False

    ' Open the copied workbook
    Set wb = objExcel.Workbooks.Open(copiedfilePath)

    ' =========================================================
    ' === HELE DIN EKSISTERENDE KODE TIL AT UDFYLDE DE TRE ARK ===
    ' ... (koden fra "Set ws = wb.Sheets("BUDGET PRIVATE TILBUD")" til slutningen af "KONCERNNOTE" loopet)
    ' =========================================================

    ' -- Update "BUDGET PRIVATE TILBUD" Sheet --
    Set ws = wb.sheets("BUDGET PRIVATE TILBUD")
    str = "SELECT * FROM tblTilbudsSkabelon " & _
          "WHERE AfdU = '" & strAfd & "' And Year_ = " & intYear
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    If Not rs.EOF Then
        For Each fld In rs.Fields
            strCellAdd = fld.Name
            If Len(strCellAdd) = 3 And Not IsValueEmpty(fld.value) Then
                If Mid(strCellAdd, 2, 1) = "0" Then
                    strCellAdd = Left(strCellAdd, 1) & Right(strCellAdd, 1)
                End If
                If Left(strCellAdd, 1) = "G" Then
                    ws.range(strCellAdd).value = fld.value * 0.01
                Else
                    ws.range(strCellAdd).value = fld.value
                End If
            End If
            If fld.Name = "Kommentar" Then
                ws.range("A99").value = fld.value
            End If
        Next fld
        ws.range("E9").value = Format(Date, "mm-dd-yyyy")
    End If
    rs.Close

    ' -- Update "+5 YDELSER PRIVAT" Sheet --
    Set ws = wb.sheets("+5 YDELSER PRIVAT")
    str = "SELECT * FROM tblEkstraYdelser " & _
          "WHERE AfdU = '" & strAfd & "' And Year_ = " & intYear & " "
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
    Dim i As Integer
    i = 6
    If Not rs.EOF Then
        Do Until rs.EOF
            ws.range("A" & CStr(i)).value = rs!Indtægter
            ws.range("B" & CStr(i)).value = rs!Antal
            ws.range("D" & CStr(i)).value = rs!Takst
            ws.range("E" & CStr(i)).value = rs!Antal * rs!Takst
            ws.range("G" & CStr(i)).value = rs!BelPct * 0.01
            i = i + 1
            rs.MoveNext
        Loop
    End If
    rs.Close

    ' -- Update "KONCERNNOTE" Sheet --
    Set ws = wb.sheets("KONCERNNOTE")
    str = "SELECT * FROM tblKoncernNote " & _
          "WHERE AfdU = '" & strAfd & "' And Year_ = " & intYear
    i = 9
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
    If Not rs.EOF Then
        Do Until rs.EOF
            ws.range("B" & CStr(i)).value = rs![Post]
            ws.range("D" & CStr(i)).value = CStr(Format(rs![Samhandels-beløb], "###0.00"))
            ws.range("E" & CStr(i)).value = rs!KoncernPart
            ws.range("F" & CStr(i)).value = rs![Type af omkostning]
            i = i + 1
            rs.MoveNext
        Loop
    End If
    rs.Close

    ' =========================================================
    ' === NYT AFNIT: Kald hjælpe-sub'en for at tilføje Fællesbidrags-arket ===
    ' =========================================================
    ' Vi skal angive en måned. Da det er et årsbudget, giver måned 12 (december) mening.
    Call PopulateFællesbidragSheet(wb, intYear, 12, strAfd)

    ' Tilføj et nyt ark til den medsendte projektmappe og navngiv det
    Set ws = wb.sheets.Add(After:=wb.sheets(wb.sheets.Count))
    ws.Name = "Kursusudgifter"


    ' Save and Close
    wb.Save
    MsgBox "Tilbudsskabelon er udfyldt!"

    str = "UPDATE tblDashboard SET TP_BudgetPrint = true where [AfdNr Uniconta] = '" & strAfd & "' And Year_ = " & intYear
    DoCmd.SetWarnings False
    DoCmd.RunSQL str
    DoCmd.SetWarnings True

    ' Cleanup
    Set rs = Nothing
    Set dB = Nothing
    Set ws = Nothing
    Set wb = Nothing
    Set objExcel = Nothing

End Function
Sub test()

    Call fncExpToExcel("12", 2024)

End Sub
Function ExportInterntBudgetToExcel(strAfd As String, intYear As Integer, intRev As Integer)

    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim xlApp As Object
    Dim xlWorkbook As Object
    Dim xlWorksheet As Object
    Dim filePath As String
    Dim strAfdNavn As String


    'Sti til afdelingsfiler
    filePath = "https://dksuf.sharepoint.com/sites/ProjektBudget2024/Delte%20dokumenter/General/Budget%20Afdelinger/"

    strAfdNavn = Nz(ELookup("AfdelingsNavn", "tblAfdeling", "[AfdNr Uniconta] = '" & strAfd & "'"), strAfd)


    ' Establish connection to Access database
    Set dB = CurrentDb

    ' Execute the SQL statement and capture the results in a recordset
    Set rs = dB.OpenRecordset("SELECT * FROM tblInterntBudget " & _
                                "WHERE Afdeling = '" & strAfd & "' " & _
                                "AND Year_ = " & intYear & " ORDER BY Konto", dbOpenDynaset, dbSeeChanges)

    ' Check if any records were retrieved
    If Not rs.EOF Then

        ' Set references to Excel objects
        Set xlApp = CreateObject("Excel.Application")
        Set xlWorkbook = xlApp.Workbooks.Add
        Set xlWorksheet = xlWorkbook.Worksheets.Add
        xlWorksheet.Name = strAfd

        ' Write the header row
        xlWorksheet.Cells(11, 2).value = "Konto"
        xlWorksheet.Cells(11, 3).value = "Budget 2023,gældende/revideret"
        xlWorksheet.Cells(11, 4).value = "Jan"
        xlWorksheet.Cells(11, 5).value = "Feb"
        xlWorksheet.Cells(11, 6).value = "Mar"
        xlWorksheet.Cells(11, 7).value = "Apr"
        xlWorksheet.Cells(11, 8).value = "Maj"
        xlWorksheet.Cells(11, 9).value = "Jun"
        xlWorksheet.Cells(11, 10).value = "Jul"
        xlWorksheet.Cells(11, 11).value = "Aug"
        xlWorksheet.Cells(11, 12).value = "Sep"
        xlWorksheet.Cells(11, 13).value = "Okt"
        xlWorksheet.Cells(11, 14).value = "Nov"
        xlWorksheet.Cells(11, 15).value = "Dec"

        ' Write the data rows
        Dim row As Integer
        row = 12
        Do While Not rs.EOF
            xlWorksheet.Cells(row, 2).value = rs!Konto
            xlWorksheet.Cells(row, 3).value = rs!BudgetIalt
            xlWorksheet.Cells(row, 4).value = rs![_1]
            xlWorksheet.Cells(row, 5).value = rs![_2]
            xlWorksheet.Cells(row, 6).value = rs![_3]
            xlWorksheet.Cells(row, 7).value = rs![_4]
            xlWorksheet.Cells(row, 8).value = rs![_5]
            xlWorksheet.Cells(row, 9).value = rs![_6]
            xlWorksheet.Cells(row, 10).value = rs![_7]
            xlWorksheet.Cells(row, 11).value = rs![_8]
            xlWorksheet.Cells(row, 12).value = rs![_9]
            xlWorksheet.Cells(row, 13).value = rs![_10]
            xlWorksheet.Cells(row, 14).value = rs![_11]
            xlWorksheet.Cells(row, 15).value = rs![_12]

            row = row + 1
            rs.MoveNext
        Loop

        ' Save the workbook to the specified path
        xlWorkbook.SaveAs filename:=filePath & Left(strAfd & " " & strAfdNavn, 25) & ".xlsx"

        ' Close the recordset, workbook, and Excel application
        rs.Close
        xlWorkbook.Close False
        xlApp.Quit
    End If

End Function
