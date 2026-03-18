Attribute VB_Name = "Tilsynsrapporter"
Option Compare Database
Option Explicit
Sub OutPutPrecessAfdData()
    Call PrecessAfdelingData(2025)
End Sub
Sub PrecessAfdelingData(Year_ As Integer)
    Dim conn As Object ' ADO Connection
    Dim rsAfdeling As Object, rsDistinct As Object, rsKonto As Object, rsKontVejl As Object, rsUdspecFB As Object
    Dim sqlAfdeling As String, sqlDistinct As String, sqlKonto As String, sqlKontVejl As String, sqlUdspecFB As String
    Dim xlApp As Object, xlBook As Object, xlSheet As Object, tocSheet As Object
    Dim savePath As String
    Dim rownumber As Long
    Dim rowNo_Omr As Integer
    Dim strActOmrNavn As String
    Dim dblKto1102 As Double, dblKto1103 As Double, dblKto1104 As Double
    Dim dataRange As range
    Dim strDiv As String
    Dim p As Integer
    Dim tocRow As Long ' For tracking TOC rows

    ' Initialize Excel application
    Set xlApp = CreateObject("Excel.Application")
    xlApp.Visible = True ' Set to False to hide Excel
    Set xlBook = xlApp.Workbooks.Add

    ' Add a "Table of Contents" sheet
    Set tocSheet = xlBook.sheets.Add
    tocSheet.Name = "Indholdsfortegnelse"
    tocSheet.Cells(3, 3).value = "INDHOLDSFORGEGNELSE - tryk på linket"
    tocSheet.Cells(3, 3).Font.Bold = True
    xlApp.ActiveWindow.DisplayGridlines = False

    tocRow = 4 ' Start listing links from row 4

    ' Initialize ADO connection
    Set conn = CreateObject("ADODB.Connection")
    conn.ConnectionString = fncConnString
    conn.Open

    'Konteringsvejledning
    ' Create and name a new worksheet
    Set xlSheet = xlBook.sheets.Add
    xlSheet.Name = "Konteringsvejl."

    ' Add a hyperlink in A1 of the new sheet to return to the TOC
    xlSheet.Hyperlinks.Add anchor:=xlSheet.Cells(1, 1), Address:="", SubAddress:="'Indholdsfortegnelse'!A1", TextToDisplay:="Tilbage til indholdsfortegnelse"
    xlSheet.Cells(1, 1).Font.Bold = True
    xlSheet.Cells(1, 1).Font.Italic = True

    xlApp.ActiveWindow.DisplayGridlines = False

    ' Add a link to this sheet in the TOC
    tocSheet.Hyperlinks.Add anchor:=tocSheet.Cells(tocRow, 3), Address:="", SubAddress:="'" & xlSheet.Name & "'!A1", TextToDisplay:=xlSheet.Name
    tocRow = tocRow + 1

    ' Write headers and process data as in your original code
    xlSheet.Cells(2, 2).value = "Konteringsvejledning for SUF"
    Set dataRange = xlSheet.range(xlSheet.Cells(2, 2), xlSheet.Cells(2, 4))
    With dataRange
        .Font.Size = 12
        .Font.Bold = True
        .Merge
        .HorizontalAlignment = xlCenter
    End With

    xlSheet.Rows("3:3").Select ' Select the row below the ones to freeze
    xlApp.ActiveWindow.FreezePanes = True
    xlSheet.Cells(1, 1).Select

    sqlKontVejl = "SELECT * FROM tblParm_Konteringsvejledning"
    Set rsKontVejl = CreateObject("ADODB.Recordset")
    rsKontVejl.Open sqlKontVejl, conn, 0, 1

    rownumber = 4

    xlSheet.Cells(rownumber, 2).value = "OMRÅDE"
    xlSheet.Cells(rownumber, 3).value = "BESKRIVELSE"
    xlSheet.Cells(rownumber, 4).value = "KONTONR."

    Set dataRange = xlSheet.range(xlSheet.Cells(rownumber, 2), xlSheet.Cells(rownumber, 4))
    With dataRange
        .Font.Size = 10
        .Font.Bold = True
        .HorizontalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
    End With

    rownumber = rownumber + 1

    Do While Not rsKontVejl.EOF
        Dim strKontName As String, strKontDesc As String, strKontAcc As String
        strKontName = Nz(rsKontVejl!Name, "")
        strKontDesc = Nz(rsKontVejl!Description, "")
        strKontAcc = Nz(rsKontVejl!account, "")

            xlSheet.Cells(rownumber, 2).value = strKontName
            xlSheet.Cells(rownumber, 3).value = strKontDesc
            xlSheet.Cells(rownumber, 4).value = strKontAcc

            Set dataRange = xlSheet.range(xlSheet.Cells(rownumber, 2), xlSheet.Cells(rownumber, 4))
            With dataRange
                .Borders.LineStyle = xlContinuous
            End With

        rownumber = rownumber + 1
        rsKontVejl.MoveNext
    Loop

    With xlSheet
            .Columns("B:B").AutoFit
            .Columns("D:D").AutoFit
    End With

    With xlSheet.Columns("C:C")
        .ColumnWidth = 60
        .WrapText = True  ' Enable text wrapping
    End With

    'Udspecificering af fællesbidrag
    ' Create and name a new worksheet
    Set xlSheet = xlBook.sheets.Add
    xlSheet.Name = "UdspecFB"

    ' Add a hyperlink in A1 of the new sheet to return to the TOC
    xlSheet.Hyperlinks.Add anchor:=xlSheet.Cells(1, 1), Address:="", SubAddress:="'Indholdsfortegnelse'!A1", TextToDisplay:="Tilbage til indholdsfortegnelse"
    xlSheet.Cells(1, 1).Font.Bold = True
    xlSheet.Cells(1, 1).Font.Italic = True

    xlApp.ActiveWindow.DisplayGridlines = False

    ' Add a link to this sheet in the TOC
    tocSheet.Hyperlinks.Add anchor:=tocSheet.Cells(tocRow, 3), Address:="", SubAddress:="'" & xlSheet.Name & "'!A1", TextToDisplay:=xlSheet.Name
    tocRow = tocRow + 1

    ' Write headers and process data as in your original code
    xlSheet.Cells(2, 2).value = "Udspecificering af fællesbidrag"
    Set dataRange = xlSheet.range(xlSheet.Cells(2, 2), xlSheet.Cells(2, 2))
    With dataRange
        .Font.Size = 12
        .Font.Bold = True
        .HorizontalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
    End With

    sqlUdspecFB = "SELECT * FROM tblParm_UdspecFællesbidrag"
    Set rsUdspecFB = CreateObject("ADODB.Recordset")
    rsUdspecFB.Open sqlUdspecFB, conn, 0, 1

    rownumber = 4

    Do While Not rsUdspecFB.EOF
        Dim strSpecText As String
        sqlUdspecFB = rsUdspecFB!text

            If sqlUdspecFB = "tom linje" Then
            Else
                xlSheet.Cells(rownumber, 2).value = sqlUdspecFB
            End If

        rownumber = rownumber + 1
        rsUdspecFB.MoveNext
    Loop
    With xlSheet.Columns("B:B")

        .ColumnWidth = 100
        .WrapText = True  ' Enable text wrapping

    End With

    xlSheet.Rows("3:3").Select ' Select the row below the ones to freeze
    xlApp.ActiveWindow.FreezePanes = True
    xlSheet.Cells(1, 1).Select

    ' SQL to retrieve active departments
    sqlAfdeling = "SELECT Afdeling FROM tblAfdeling WHERE FB_Aktiv = 1 AND Year_ = " & Year_ & " And Afdeling > '1'"
    Set rsAfdeling = CreateObject("ADODB.Recordset")
    rsAfdeling.Open sqlAfdeling, conn, 0, 1 ' adOpenKeyset, adLockReadOnly

    ' Loop through departments
    Do While Not rsAfdeling.EOF
        Dim Afdeling As String
        Dim AfdNavn As String

        Afdeling = rsAfdeling!Afdeling
        AfdNavn = Nz(ELookup("AfdelingsNavn", "tblAfdeling", "[AfdNr Uniconta] = '" & Afdeling & "' And Year_ = " & Year_ & " And Revision = 0"), "")

        p = Nz(InStr(1, Afdeling, "_"), 0)
        If p > 0 Then AfdNavn = AfdNavn & Mid(Afdeling, p, 99)

        ' Create and name a new worksheet
        Set xlSheet = xlBook.sheets.Add
        xlSheet.Name = IIf(AfdNavn = "", Afdeling, AfdNavn)

        ' Add a hyperlink in A1 of the new sheet to return to the TOC
        xlSheet.Hyperlinks.Add anchor:=xlSheet.Cells(1, 1), Address:="", SubAddress:="'Indholdsfortegnelse'!A1", TextToDisplay:="Tilbage til indholdsfortegnelse"
        xlSheet.Cells(1, 1).Font.Bold = True
        xlSheet.Cells(1, 1).Font.Italic = True

        xlSheet.Rows("3:3").Select ' Select the row below the ones to freeze
        xlApp.ActiveWindow.FreezePanes = True
        xlSheet.Cells(1, 1).Select
        xlApp.ActiveWindow.DisplayGridlines = False

        ' Add a link to this sheet in the TOC
        tocSheet.Hyperlinks.Add anchor:=tocSheet.Cells(tocRow, 3), Address:="", SubAddress:="'" & xlSheet.Name & "'!A1", TextToDisplay:=xlSheet.Name
        tocRow = tocRow + 1

        ' Write headers and process data as in your original code
        xlSheet.Cells(2, 2).value = "Kontooversigt for SUF afdeling " & IIf(AfdNavn = "", Afdeling, AfdNavn) & " for budgetåret " & Year_
        Set dataRange = xlSheet.range(xlSheet.Cells(2, 2), xlSheet.Cells(2, 6))
        With dataRange
            .Font.Size = 12
            .Font.Bold = True
            .Merge
            .HorizontalAlignment = xlCenter
        End With

        xlSheet.Cells(4, 5).value = "Beløb TP"
        xlSheet.Cells(4, 6).value = "Beløb IB"

        rownumber = 4 ' Start from row 4

        Set dataRange = xlSheet.range(xlSheet.Cells(rownumber, 5), xlSheet.Cells(rownumber, 6))
        With dataRange
            .Font.Bold = True
            .HorizontalAlignment = xlCenter
        End With

        ' SQL for DISTINCT selection
        sqlDistinct = "SELECT DISTINCT Beskrivelse, Områdenavn, Placering FROM tblKontoPlan_Tilbudsskabelon ORDER BY Placering"
        Set rsDistinct = CreateObject("ADODB.Recordset")
        rsDistinct.Open sqlDistinct, conn, 1, 1 ' adOpenKeyset, adLockReadOnly
                ' Loop through DISTINCT records
        Do While Not rsDistinct.EOF
            Dim Beskrivelse As String, omradenavn As String, placering As String
            Beskrivelse = rsDistinct!Beskrivelse
            omradenavn = rsDistinct!Områdenavn
            placering = rsDistinct!placering

            If omradenavn <> "PERSONALEOMKOSTNINGER" Then

                ' Write Områdenavn in column B
                If strActOmrNavn <> omradenavn Then
                    Set dataRange = xlSheet.range(xlSheet.Cells(rownumber, 2), xlSheet.Cells(rownumber, 2))
                    With dataRange
                        .Font.Bold = True
                        .value = omradenavn
                    End With
                    strActOmrNavn = omradenavn
                    rownumber = rownumber + 1
                End If

                ' SQL for tblTilbudsskabelon
                Dim rsTilbudsskabelon As Object, sqlTilbudsskabelon As String
                Dim fieldValue As Variant
                sqlTilbudsskabelon = "SELECT * FROM tblTilbudsskabelon WHERE Year_ = " & Year_ & " AND AfdU = '" & Afdeling & "'"
                Set rsTilbudsskabelon = CreateObject("ADODB.Recordset")
                rsTilbudsskabelon.Open sqlTilbudsskabelon, conn, 1, 1 ' adOpenKeyset, adLockReadOnly

                If Not rsTilbudsskabelon.EOF Then
                    fieldValue = Nz(rsTilbudsskabelon.Fields(placering).value, 0)
                End If

                ' Write Beskrivelse, FieldValue in columns C and E
                xlSheet.Cells(rownumber, 3).value = Beskrivelse
                xlSheet.Cells(rownumber, 3).Font.Bold = True
                xlSheet.Cells(rownumber, 5).value = fieldValue

                rowNo_Omr = rownumber
                rownumber = rownumber + 1

                ' SQL for LEFT JOIN with tblInterntBudget filtered by tblAfdeling and BudgetIalt <> 0
                sqlKonto = "SELECT k.Konto, i.BudgetIalt, i.KontoNavn, i.Konto AS ibKonto, k.Beskrivelse " & _
                           "FROM tblKontoPlan_Tilbudsskabelon AS k " & _
                           "JOIN tblInterntBudget AS i ON k.Konto = i.Konto " & _
                           "WHERE i.Afdeling = '" & Afdeling & "' AND i.BudgetIalt <> 0  AND i.Revision = 0 And k.Beskrivelse = '" & Beskrivelse & "' And i.Year_ = " & Year_ & _
                           "ORDER BY k.Konto"

                ''Debug.Print sqlKonto ' Verify the SQL query syntax

                Set rsKonto = CreateObject("ADODB.Recordset")

                ' Open recordset with supported cursor and lock type
                rsKonto.Open sqlKonto, conn, 0, 1 ' adOpenForwardOnly, adLockReadOnly

                If Not rsKonto.EOF Then
                    ' Process data
                    Do While Not rsKonto.EOF
                        Dim Konto As String, Kontonavn As String, BudgetIalt As Double
                        Konto = rsKonto!Konto
                        Kontonavn = rsKonto!Kontonavn
                        BudgetIalt = Nz(rsKonto!BudgetIalt, 0)

                        ''Debug.Print rsKonto!Konto, rsKonto!ibKonto, rsKonto!beskrivelse

                        ' Write Konto + KontoNavn and BudgetIalt in columns D and F
                        xlSheet.Cells(rownumber, 4).value = Konto & "  " & Kontonavn
                        xlSheet.Cells(rownumber, 6).value = BudgetIalt

                        If Konto = "1102" Then dblKto1102 = BudgetIalt
                        If Konto = "1103" Then dblKto1103 = BudgetIalt
                        If Konto = "1104" Then dblKto1104 = BudgetIalt

                        rownumber = rownumber + 1

                        rsKonto.MoveNext
                    Loop
                End If

                rsKonto.Close
                Set rsKonto = Nothing

                'SUM of row section
                xlSheet.Cells(rownumber, 4).value = "I alt for TP og IB"
                xlSheet.Cells(rownumber, 5).Formula = "=SUM(E" & rowNo_Omr & ":E" & rownumber - 1 & ")"
                xlSheet.Cells(rownumber, 6).Formula = "=SUM(F" & rowNo_Omr & ":F" & rownumber - 1 & ")"

                Set dataRange = xlSheet.range(xlSheet.Cells(rownumber, 4), xlSheet.Cells(rownumber, 6))
                With dataRange
                    .Font.Bold = True
                    .Borders(xlEdgeTop).LineStyle = xlContinuous
                    .Borders(xlEdgeBottom).LineStyle = xlContinuous
                End With

                rownumber = rownumber + 2
            End If


            rsDistinct.MoveNext
        Loop

        rsDistinct.Close
        Set rsDistinct = Nothing

        rownumber = rownumber + 1
        With xlSheet.Cells(rownumber, 4)
            .value = "I summen for 'Eksterne administrative medarbejdere' udgør:"
            .Font.Bold = True
            .Borders(xlEdgeBottom).LineStyle = xlContinuous
        End With

        rownumber = rownumber + 1
        xlSheet.Cells(rownumber, 4).value = "Samlet ledelse"
        xlSheet.Cells(rownumber, 6).value = dblKto1102
        rownumber = rownumber + 1
        xlSheet.Cells(rownumber, 4).value = "Administrativt og teknisk personale"
        xlSheet.Cells(rownumber, 6).value = dblKto1103 + dblKto1104
        rownumber = rownumber + 1
        xlSheet.Cells(rownumber, 4).value = "Ovenstående fordeling erstatter fordeling på tidligere uploads til tilbudsportalen. "

        Set dataRange = xlSheet.range(xlSheet.Cells(rownumber, 4), xlSheet.Cells(rownumber, 6))
                With dataRange
                    .Borders(xlEdgeBottom).LineStyle = xlContinuous
                End With

        dblKto1102 = 0
        dblKto1103 = 0
        dblKto1104 = 0

        With xlSheet
            .Columns("D:F").AutoFit
            .Columns("E").numberFormat = "#,##0;[Red]-#,##0"
            .Columns("F").numberFormat = "#,##0;[Red]-#,##0"
        End With

        ' The rest of your data processing code goes here (unchanged)...
        ' Use xlSheet for each specific worksheet, and continue processing data
        ' ...

        rsAfdeling.MoveNext
    Loop

    ' Finalize the TOC sheet formatting
    With tocSheet
        .Columns("C").AutoFit
        .Columns("C").HorizontalAlignment = xlLeft
        .Cells(1, 1).Font.Size = 14
    End With

    Dim sheetToDelete As Object
    Dim sheetName As String
    Dim found As Boolean

     ' Loop through all sheets to find one that matches a pattern
    For Each xlSheet In xlBook.sheets
        sheetName = xlSheet.Name
        If sheetName Like "Sheet*" Or sheetName Like "Ark*" Then
            Set sheetToDelete = xlSheet
            found = True
            Exit For
        End If
    Next xlSheet

    ' If a matching sheet was found, delete it
    If found Then
        xlApp.DisplayAlerts = False ' Disable confirmation alerts
        sheetToDelete.Delete
        xlApp.DisplayAlerts = True ' Re-enable alerts
    End If

    ' Move the TOC sheet to the first position
    tocSheet.Move Before:=xlBook.sheets(1)

    ' Activate the TOC sheet so the user sees it first
    tocSheet.Activate

    ' Cleanup
    rsAfdeling.Close
    conn.Close
    Set conn = Nothing
    Set xlApp = Nothing
End Sub
