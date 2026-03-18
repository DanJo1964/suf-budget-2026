Attribute VB_Name = "Functions Hovedbudget 1"
'================= modBudgetExport_Hardcoded (MERGED) =================
Option Compare Database
Option Explicit

' ---------- KONFIG (ret disse tre view-navne og evt. ankre) ----------
Private Const VIEW_SAMLET   As String = "dbo_vwInterntBudget_SumByYearKonto"                 ' <- RET til dit faktiske view-navn
Private Const VIEW_HOVED    As String = "dbo_vwInterntBudget_SumByYearKonto_KtoTypeSum"      ' <- RET til dit faktiske view-navn
Private Const VIEW_RESULTAT As String = "dbo_vwInterntBudget_SumByYearAfdKonto_Kto2990"      ' <- RET til dit faktiske view-navn

' Hvor skal data starte i hvert ark?
Private Const ANCHOR_SAMLET   As String = "B4"
Private Const ANCHOR_HOVED    As String = "B4"
Private Const ANCHOR_RESULTAT As String = "B4"
Private Const ANCHOR_LIKVIDITET As String = "B4"
Private Const ANCHOR_BALANCE    As String = "B4"

' (Valgfrit) Kontotype-filter, fx "('INDT','UDG')" eller "='INDT'"
Private Const KONTOTYPE_FILTER As String = ""

' Excel-konstanter (late-binding sikre)
Private Const xlUp As Long = -4162
Private Const xlContinuous As Long = 1
Private Const xlThin As Long = 2
Private Const xlThick As Long = 4
Private Const xlCenter As Long = -4108
Private Const xlFillDefault As Long = 0

Public Sub aaaRun_Exp()
    Call ExportBudget5Sheets_Hardcoded(2026)
End Sub

' ---------- PUBLIC ENTRY ----------
' Kør fx: ExportBudget5Sheets_Hardcoded 2025
Public Sub ExportBudget5Sheets_Hardcoded(ByVal BudgetYear As Long)
    Dim outFolder As String, outFile As String
    outFolder = "C:\Temp\SUF\"
    EnsureFolder outFolder
    outFile = outFolder & "SUF_Budget_" & CStr(BudgetYear) & ".xlsx"
    SafeKill outFile

    ' Excel (late binding)
    Dim xl As Object, wb As Object, ws As Object
    Set xl = CreateObject("Excel.Application")
    xl.Visible = False
    xl.DisplayAlerts = False
    Set wb = xl.Workbooks.Add

    ' Opret/ryd de fem faner i rækkefølge
    Dim sheets As Variant, i As Long
    sheets = Array("Samlet Budget", "Hovedposter", "Likviditet", "Balance", "Resultat")
    For i = LBound(sheets) To UBound(sheets)
        EnsureExactSheet wb, CStr(sheets(i))
    Next

    ' --- SAMLET BUDGET ---
    Set ws = wb.Worksheets("Samlet Budget")
    Write_SamletBudget wb, ws, BudgetYear
    ApplyNumericFormats ws, "Samlet Budget"

    ' --- HOVEDPOSTER ---
    Set ws = wb.Worksheets("Hovedposter")
    Write_Hovedposter ws, BudgetYear
    ApplyNumericFormats ws, "Hovedposter"

    ' --- LIKVIDITET ---
    Set ws = wb.Worksheets("Likviditet")
    Write_Likviditet ws, BudgetYear                 ' udfylder B2:O34 (labels+formler)
    ApplyNumericFormats ws, "Likviditet"

    ' --- BALANCE ---
    Set ws = wb.Worksheets("Balance")
    Write_Balance ws, BudgetYear
    ApplyNumericFormats ws, "Balance"

    ' --- RESULTAT ---
    Set ws = wb.Worksheets("Resultat")
    Write_Resultat ws, BudgetYear
    ApplyNumericFormats ws, "Resultat"

    ' --- Investering/Forbedring ejendomme inklusiv skødeomk. ---
'    Set ws = wb.Worksheets("Inv. forbedring ejendomme")
'    Write_InvEjendom ws, budgetYear
'    ApplyNumericFormats ws, "InvEjendom"

    Call Write_AllInvestmentSheets(wb, BudgetYear)

    On Error Resume Next
    ws.Parent.Worksheets("Sheet1").Delete
    ws.Parent.Worksheets("Ark1").Delete

    ' Gem som .xlsx og åbn Excel til brugeren
    wb.SaveAs filename:=outFile, FileFormat:=51   ' xlOpenXMLWorkbook (.xlsx)
    xl.Visible = True
    ws.Parent.Worksheets("Samlet Budget").Activate


    MsgBox "Budget genereret og åbnet i Excel: " & outFile, vbInformation
End Sub

'==========================================================
'                 S A M L E T  B U D G E T
'----------------------------------------------------------
Private Sub Write_SamletBudget(ByVal wb As Object, ByVal ws As Object, ByVal BudgetYear As Long)
    Dim headers As Variant, selectList As String, anchor As String
    anchor = ANCHOR_SAMLET

    headers = Array( _
        "Nr.", "Konto", "År", "%", _
        "JAN", "FEB", "MAR", "APR", "MAJ", "JUN", "JUL", "AUG", "SEP", "OKT", "NOV", "DEC" _
    )

    ' SELECT-liste: MED Kontotype (til formatering)
    selectList = Join(Array( _
        "[Konto]", _
        "[KontoNavn]", _
        "[BudgetIalt_Sum]", _
        "[_1_Sum]", "[_2_Sum]", "[_3_Sum]", "[_4_Sum]", "[_5_Sum]", "[_6_Sum]", _
        "[_7_Sum]", "[_8_Sum]", "[_9_Sum]", "[_10_Sum]", "[_11_Sum]", "[_12_Sum]", _
        "[Kontotype]" _
    ), ",")

    Dim where_ As String
    where_ = " WHERE [Year_]=" & BudgetYear & " AND Konto > '0998'"
    If Len(Trim$(KONTOTYPE_FILTER)) > 0 Then
        where_ = where_ & " AND [Kontotype] " & KONTOTYPE_FILTER
    End If

    Dim dB As DAO.Database, rs As DAO.Recordset, sql As String
    Set dB = CurrentDb
    sql = "SELECT " & selectList & " FROM [" & VIEW_SAMLET & "]" & where_
    Set rs = dB.OpenRecordset(sql, dbOpenSnapshot)

    Dim tgt As Object, i As Long
    Set tgt = ws.range(anchor)
    For i = 0 To UBound(headers)
        tgt.Offset(0, i).value = headers(i)
        tgt.Offset(0, i).Font.Bold = True
    Next i

    ws.Cells(2, 2).value = "Budget " & BudgetYear & " - Samlet"

    Dim rowStart As Long: rowStart = ws.range(anchor).row + 2
    Dim colStart As Long: colStart = ws.range(anchor).Column
    Dim intFortegn As Integer

    If Not (rs.BOF And rs.EOF) Then
        rs.MoveFirst
        Dim r As Long: r = rowStart
        Do While Not rs.EOF
            Dim ktype As String
            ktype = Nz(rs.Fields("Kontotype").value, "")

            ws.Cells(r, colStart + 0).value = Nz(rs.Fields("Konto").value, "")
            ws.Cells(r, colStart + 1).value = Nz(rs.Fields("KontoNavn").value, "")

            Dim strKonto As String
            ' Sikrer at vi håndterer Null værdier fra databasen
            strKonto = Nz(rs.Fields("Konto").value, "")

            ' Select Case struktur for bedre håndtering af flere intervaller
            Select Case strKonto

                'Konti mindre end 1100 (Typisk indtægter)
                Case Is < "1100"
                    intFortegn = -1

                 Case "1898", "1996", "1997", "2097", "2098", "2980", "2990"
                     intFortegn = -1

                Case Else
                    intFortegn = 1

            End Select

            If UCase$(ktype) <> "OVERSKRIFT" Then
                ws.Cells(r, colStart + 2).value = Nz(rs.Fields("BudgetIalt_Sum").value * intFortegn, 0)

                Dim m As Long
                For m = 1 To 12
                    ws.Cells(r, colStart + 3 + m).value = Nz(rs.Fields("_" & m & "_Sum").value * intFortegn, 0)
                Next
            End If

            Dim rowRange As Object
            Set rowRange = ws.range(ws.Cells(r, colStart), ws.Cells(r, colStart + 15))

            Select Case UCase$(ktype)
                Case "SUM"
                    rowRange.Font.Bold = True
                    rowRange.Interior.Color = RGB(216, 216, 216)
                    r = r + 1  ' tom skillerække
                Case "OVERSKRIFT"
                    rowRange.Font.Color = RGB(255, 255, 255)
                    rowRange.Font.Bold = True
                    rowRange.Interior.Color = RGB(165, 165, 165)
                    ws.Cells(r, colStart + 0).value = ""
                Case Else
                    ' normal
            End Select

            r = r + 1
            rs.MoveNext
        Loop
    End If

    Call EnsureSamletNamedRanges(wb, ws)
    Call EnsureNamedLambdas_Local(wb)

    rs.Close: Set rs = Nothing
End Sub

'==========================================================
'                 H O V E D P O S T E R
'----------------------------------------------------------
Private Sub Write_Hovedposter(ByVal ws As Object, ByVal BudgetYear As Long)
    Dim headers As Variant, selectList As String, anchor As String
    anchor = ANCHOR_HOVED

    headers = Array( _
        "Kto", "Hovedpost", "Total", _
        "JAN", "FEB", "MAR", "APR", "MAJ", "JUN", "JUL", "AUG", "SEP", "OKT", "NOV", "DEC" _
    )

    selectList = Join(Array( _
        "[Konto]", _
        "[KontoNavn]", _
        "[BudgetIalt_Sum]", _
        "[_1_Sum]", "[_2_Sum]", "[_3_Sum]", "[_4_Sum]", "[_5_Sum]", "[_6_Sum]", _
        "[_7_Sum]", "[_8_Sum]", "[_9_Sum]", "[_10_Sum]", "[_11_Sum]", "[_12_Sum]" _
    ), ",")

    Dim where_ As String
    where_ = " WHERE [Year_]=" & BudgetYear
    If Len(Trim$(KONTOTYPE_FILTER)) > 0 Then
        where_ = where_ & " AND [Kontotype] " & KONTOTYPE_FILTER
    End If

    Dim dB As DAO.Database, rs As DAO.Recordset, sql As String
    Set dB = CurrentDb
    sql = "SELECT " & selectList & " FROM [" & VIEW_HOVED & "]" & where_ & " ORDER BY [Konto];"
    Set rs = dB.OpenRecordset(sql, dbOpenSnapshot)

    Dim tgt As Object, i As Long
    Set tgt = ws.range(anchor)
    For i = 0 To UBound(headers)
        tgt.Offset(0, i).value = headers(i)
        tgt.Offset(0, i).Font.Bold = True
    Next i

    ws.Cells(2, 2).value = "Budget " & BudgetYear & " - Hovedposter"

    Dim rowStart As Long: rowStart = ws.range(anchor).row + 1
    Dim colStart As Long: colStart = ws.range(anchor).Column
    Dim r As Long
    Dim intFortegn As Integer

    intFortegn = -1

    If Not (rs.BOF And rs.EOF) Then
        rs.MoveFirst
        r = rowStart
        Do While Not rs.EOF
            ws.Cells(r, colStart + 0).value = Nz(rs.Fields("Konto").value, "")
            ws.Cells(r, colStart + 1).value = Nz(rs.Fields("KontoNavn").value, "")
            ws.Cells(r, colStart + 2).value = Nz(rs.Fields("BudgetIalt_Sum").value * intFortegn, 0)

            Dim m As Long
            For m = 1 To 12
                ws.Cells(r, colStart + 2 + m).value = Nz(rs.Fields("_" & m & "_Sum").value * intFortegn, 0)
            Next

            r = r + 1
            rs.MoveNext
        Loop
    End If

    ws.range(ws.Cells(5, "B"), ws.Cells(r - 1, "Q")).Font.Bold = True

    ShadeRowsByKonto ws, Array("1898", "2980", "2990"), _
                     startRow:=rowStart, _
                     kontoCol:="B", firstCol:="B", lastCol:="P"

    rs.Close: Set rs = Nothing
End Sub
Private Sub Write_Likviditet(ByVal ws As Object, ByVal BudgetYear As Long)
    On Error GoTo Err_Handler

    ' --- VARIABLER ---
    Dim anchor As String, hdrTopLeft As Object
    Dim headers As Variant, i As Long, curRow As Long
    Dim cIdx As Long, mNum As Long
    Dim rStart_Afskr As Long, rSum_Afskr As Long
    Dim rLikvBidrag As Long, rInvAlt As Long, rFinansAlt As Long
    Dim rNettoBev As Long, rBankPrimo As Long, rBankUltimo As Long

    ' Variabler til de rækker vi skal huske til senere brug (Formel-indsættelse)
    Dim rInvEjd As Long, rInvLej As Long, rInvDrift As Long, rInvVaer As Long
    Dim rLaanOpt As Long, rAfdrag As Long

    ' Konfiguration
    anchor = "B4" ' Eller brug din konstant ANCHOR_RESULTAT
    Set hdrTopLeft = ws.range(anchor)

    ' 1. OVERSKRIFTER OG HEADER
    ws.Cells(2, 2).value = "Likviditetsbudget " & BudgetYear
    headers = Array("Post", "Total", "JAN", "FEB", "MAR", "APR", "MAJ", "JUN", "JUL", "AUG", "SEP", "OKT", "NOV", "DEC")
    ws.range(hdrTopLeft, hdrTopLeft.Offset(0, UBound(headers))).value = headers
    ws.range(hdrTopLeft, hdrTopLeft.Offset(0, UBound(headers))).Font.Bold = True

    ' Start skrivning fra rækken under header
    curRow = hdrTopLeft.row + 1

    ' Ryd hele området først (sikkerhedsforanstaltning)
    ws.range(ws.Cells(curRow, 2), ws.Cells(100, 15)).ClearContents
    ws.range(ws.Cells(curRow, 2), ws.Cells(100, 15)).ClearFormats

    ' =========================================================
    ' SEKTION: DRIFT OG AFSKRIVNINGER
    ' =========================================================

    ' R: Resultat af virksomhed
    ws.Cells(curRow, 2).value = "Resultat af virksomhed"
    Call Populate_Likviditet_Row(ws, 2980, curRow)
    curRow = curRow + 1

    ' Start Afskrivninger sektion (til SUM formel)
    rStart_Afskr = curRow

    ws.Cells(curRow, 2).value = "Afskr. indretning lejet lokaler"
    Call Populate_Likviditet_Row(ws, 1821, curRow)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Afskr. driftsmidler"
    Call Populate_Likviditet_Row(ws, 1820, curRow)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Afskr. ejendomme"
    Call Populate_Likviditet_Row(ws, 1970, curRow)
    curRow = curRow + 1

   ' --- NYT: Afskrivning fondsmidler ---
    ws.Cells(curRow, 2).value = "Afskrivning fondsmidler"
    ' Formel: Find kto. 1824 (typisk række 215 i Samlet Budget).
    For i = 4 To 15 ' JAN-DEC
        ' FEJLEN VAR HERUNDER: "Cells" manglede "ws." foran
        ws.Cells(curRow, i).Formula = "='Samlet Budget'!" & ws.Cells(215, i + 2).Address(False, False)
    Next i
    curRow = curRow + 1


    ' --- SUM RÆKKE ---
    rSum_Afskr = curRow ' Tom label i original, men vi kalder den for sum-rækken
    ' Formel: SUM(Resultat : Afskrivning fondsmidler)
    ' Astrids note: "Opdater Sum formlen... så den har C5:C9" (dvs. inkl. Resultat og alle afskr.)
    ' Vi summerer fra toppen (Resultat) til rækken før denne.
    For i = 3 To 15
        ws.Cells(curRow, i).FormulaR1C1 = "=SUM(R[" & (rStart_Afskr - 1 - curRow) & "]C:R[-1]C)"
    Next i
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: DRIFTSKAPITAL ÆNDRINGER
    ' =========================================================
    ws.Cells(curRow, 2).value = "Tilgodehavender (termin Regnbuehuset)"
    ' Logik fra original: Kto 1120:1124? Nej, det var vist længere nede.
    ' Original brugte Populate på række 16 (Hensættelse?). Tjekker posterne.
    ' "Tilgodehavender..." var label indeks 5 i original. Ingen Populate kaldt for denne i original kode.
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Kasseudlæg og kassebeh. i øvrigt"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Betaling uopsigelig lejekontrakt"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Kreditorer og sk. omkostninger"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Anden gæld"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "A-Skat, AM-bidrag mv"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Feriepengeforpligtelser"
    ' Original kode: Call Populate_Likviditet_Row(ws, "1120:1124", 16) -> Det passer med Feriepenge label
    Call Populate_Likviditet_Row(ws, "1120:1124", curRow)
    curRow = curRow + 1

    ' --- Række: Udbetaling ferietillæg og feriefondsbinding ---
    ws.Cells(curRow, 2).value = "Udbetaling ferietillæg og feriefondsbinding"
    ' Astrids specielle formler for MAJ og AUG
    ' MAJ (Col 8 / H)
    ws.Cells(curRow, 8).Formula = "=-(Balance!C42+'Samlet Budget'!F53+'Samlet Budget'!G53+'Samlet Budget'!H53+'Samlet Budget'!I53+'Samlet Budget'!J53)"
    ' AUG (Col 11 / K)
    ws.Cells(curRow, 11).Formula = "=-('Samlet Budget'!K53+'Samlet Budget'!L53+'Samlet Budget'!M53)"

    ' Original kode havde Populate kald for række 17 ("+1121;+1123" i col H og L)
    ' Vi antager Astrids formler erstatter/supplerer dette.
    ' Hvis du vil bevare Populate for de andre måneder, kan du indsætte det her, men Astrids note var specifik.
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Hensættelse til udviklingsprojekter"
    Call Populate_Likviditet_Row(ws, 2100, curRow)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Overførsel til skattekonto"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Ændring i pengebindinger i alt"
    ' Formel: SUM(Tilgodehavender : Overførsel) -> Fra rSum_Afskr + 1 til curRow - 1
    Dim rStart_DriftKap As Long: rStart_DriftKap = rSum_Afskr + 1
    For i = 3 To 15
        ws.Cells(curRow, i).FormulaR1C1 = "=SUM(R[" & (rStart_DriftKap - curRow) & "]C:R[-1]C)"
    Next i
    curRow = curRow + 1

    ' --- LIKVIDITETSBIDRAG FRA DRIFTEN ---
    rLikvBidrag = curRow
    ws.Cells(curRow, 2).value = "Likviditetsbidrag fra driften"
    ' Formel: SumRække (rSum_Afskr) + Ændring iPengebindinger (curRow - 1)
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(rSum_Afskr, i).Address(False, False) & "+" & ws.Cells(curRow - 1, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: INVESTERINGER
    ' =========================================================
    rInvEjd = curRow ' Gemmes til Named Range loop
    ws.Cells(curRow, 2).value = "Investering/Forbedring ejendomme inklusiv skødeomk."
    curRow = curRow + 1

    rInvLej = curRow
    ws.Cells(curRow, 2).value = "Investering i indretning af lejede lokaler"
    curRow = curRow + 1

    rInvDrift = curRow
    ws.Cells(curRow, 2).value = "Investeringer i driftsmidler"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Ændring i huslejedespositaer"
    curRow = curRow + 1

    rInvVaer = curRow
    ws.Cells(curRow, 2).value = "Investeringer i værdipapirer"
    curRow = curRow + 1

    ' --- INVESTERINGER I ALT ---
    rInvAlt = curRow
    ws.Cells(curRow, 2).value = "Investeringer i alt"
    ' Formel: Sum fra rInvEjd til rækken før denne
    For i = 3 To 15
        ws.Cells(curRow, i).FormulaR1C1 = "=SUM(R[" & (rInvEjd - curRow) & "]C:R[-1]C)"
    Next i
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: FINANSIERING
    ' =========================================================
    ws.Cells(curRow, 2).value = "Udbetaling fra AP Møller Fonden"
    curRow = curRow + 1

    rLaanOpt = curRow
    ws.Cells(curRow, 2).value = "Låneoptagelse"
    curRow = curRow + 1

    rAfdrag = curRow
    ws.Cells(curRow, 2).value = "Afdrag kreditforeningslån og banklån"
    ' Note fra Astrid: "Formler skal være minus foran".
    ' Dette håndteres i Named Range loopet nedenfor ved at sikre logikken der eller i kildedata.
    curRow = curRow + 1

    ' --- FINANSIERING I ALT ---
    rFinansAlt = curRow
    ws.Cells(curRow, 2).value = "Finansiering i alt"
    ' Formel: Sum af de 3 finansieringsposter (Udbetaling + Lånoptag + Afdrag)
    ' Det er rækkerne (curRow-3) til (curRow-1)
    For i = 3 To 15
        ws.Cells(curRow, i).FormulaR1C1 = "=SUM(R[-3]C:R[-1]C)"
    Next i
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: BANKBEVÆGELSER
    ' =========================================================
    rNettoBev = curRow
    ws.Cells(curRow, 2).value = "Periodens nettobevægelse bank i alt"
    ' Astrid/Original: Likviditetsbidrag - Investeringer + Finansiering
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(rLikvBidrag, i).Address(False, False) & "-" & _
                                            ws.Cells(rInvAlt, i).Address(False, False) & "+" & _
                                            ws.Cells(rFinansAlt, i).Address(False, False)
    Next i
    curRow = curRow + 1

    rBankPrimo = curRow
    ws.Cells(curRow, 2).value = "Bankindestående Primo"
    ' JAN (Col 4): Balance!C17
    ws.Cells(curRow, 4).Formula = "=Balance!C17"
    curRow = curRow + 1

    rBankUltimo = curRow
    ws.Cells(curRow, 2).value = "Bankindestående Ultimo"
    ' Formel: Primo + Bevægelse
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(rBankPrimo, i).Address(False, False) & "+" & _
                                            ws.Cells(rNettoBev, i).Address(False, False)
    Next i

    ' Opdater BankPrimo (Feb-Dec) til at henvise til forrige måneds Ultimo
    ' E(rBankPrimo) = D(rBankUltimo)
    For i = 5 To 15
        ws.Cells(rBankPrimo, i).Formula = "=" & ws.Cells(rBankUltimo, i - 1).Address(False, False)
    Next i

    ' =========================================================
    ' INDSÆT FORMLER FRA NAMED RANGES (Dynamisk placeret)
    ' =========================================================
    For cIdx = 4 To 15 ' Col D to O
        mNum = cIdx - 3

        ws.Cells(rInvEjd, cIdx).Formula = "=InvEjn_" & mNum
        ws.Cells(rInvLej, cIdx).Formula = "=InvLej_" & mNum
        ws.Cells(rInvDrift, cIdx).Formula = "=InvDrf_" & mNum
        ws.Cells(rInvVaer, cIdx).Formula = "=InvVær_" & mNum
        ws.Cells(rLaanOpt, cIdx).Formula = "=LånOpt_" & mNum

        ' Kvartalsvise afdrag
        If (mNum Mod 3 = 0) And (mNum > 0) Then
            ws.Cells(rAfdrag, cIdx).Formula = "=-LånAfdr_" & (mNum / 3)
        End If
    Next cIdx

    ws.range("C34").Formula = "='Balance'!C17"

    ' =========================================================
    ' FORMATERING
    ' =========================================================
    ' C-kolonne Totaler (SUM vandret) - hvis ikke allerede sat
    For i = 5 To curRow ' Loop fra start data til slut
        If ws.Cells(i, 2).value <> "" And ws.Cells(i, 3).Formula = "" Then
             ' Hvis label findes men ingen formel i Total -> Indsæt SUM
             ws.Cells(i, 3).FormulaR1C1 = "=SUM(RC[1]:RC[12])"
        End If
    Next i

    ' Formateringer fra original kode
    ws.Columns("B").ColumnWidth = 34
    ws.Columns("C").ColumnWidth = 14
    ws.Columns("D:O").ColumnWidth = 12
    ws.range(ws.Cells(5, 3), ws.Cells(curRow, 15)).numberFormat = "#,##0;[Red]-#,##0"

    ' Zebra & Rammer
    Dim r As Long
    For r = 5 To curRow
        If (r Mod 2) = 0 Then
            ws.range(ws.Cells(r, 2), ws.Cells(r, 15)).Interior.Color = RGB(242, 242, 242)
        End If
    Next r

    With ws.range(ws.Cells(7, 2), ws.Cells(curRow, 15)).Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .Color = RGB(200, 200, 200)
    End With
    ws.range(ws.Cells(5, 2), ws.Cells(curRow, 15)).BorderAround xlContinuous, xlThick


    'MsgBox "Likviditetsbudget opdateret dynamisk.", vbInformation

Exit_Handler:
    Set hdrTopLeft = Nothing
    Exit Sub
Err_Handler:
    MsgBox "Fejl " & Err.Number & " i Write_Likviditet: " & Err.Description, vbCritical
    Resume Exit_Handler
End Sub
Private Sub Write_Balance(ByVal ws As Object, ByVal BudgetYear As Long)
    On Error GoTo Err_Handler

    ' --- VARIABLER ---
    Dim anchor As String, hdrTopLeft As Object
    Dim headers As Variant, i As Long
    Dim curRow As Long, colDeptStart As Long, colDeptEnd As Long

    ' Sektions-start variabler
    Dim rStart_Anl As Long, rStart_Oms As Long, rRow_AktiverIAlt As Long
    Dim rStart_EK As Long, rStart_Hens As Long, rStart_Gaeld As Long
    Dim rRow_PassiverIAlt As Long, rRow_Kontrol As Long

    ' --- KONFIGURATION ---
    colDeptStart = 19 ' Kolonne S
    colDeptEnd = 32   ' Kolonne AF

    anchor = "B2"
    Set hdrTopLeft = ws.range(anchor)

    ' 1. OVERSKRIFTER OG HEADER
    ws.Cells(2, 2).value = "Balancebudget " & BudgetYear
    headers = Array("Post", "Primo", "Jan", "Feb", "Mar", "Apr", "Maj", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dec")
    ws.range(hdrTopLeft.Offset(2, 0), hdrTopLeft.Offset(2, UBound(headers))).value = headers

    ' Ryd dataområde (fra række 5 og ned)
    ws.range(ws.Cells(5, 2), ws.Cells(100, colDeptEnd)).ClearContents

    curRow = 5

    ' =========================================================
    ' SEKTION: ANLÆGSAKTIVER
    ' =========================================================
    rStart_Anl = curRow

    ' R5: Ejendomme (Linker nu til Likviditet!D23 med + fortegn jf. Astrid)
    ws.Cells(curRow, 2).value = "Ejendomme"
    Call Bal_PrimoFromSum(ws, curRow)
    ' Formel: =C5 - 'Samlet Budget'!F240 + Likviditet!D23
    For i = 4 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(curRow, i - 1).Address(False, False) & _
            "-'Samlet Budget'!" & ws.Cells(240, i + 2).Address(False, False) & "+Likviditet!" & ws.Cells(23, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' R6: Driftsmateriel (Linker nu til Likviditet!D25)
    ws.Cells(curRow, 2).value = "Driftsmateriel"
    Call Bal_PrimoFromSum(ws, curRow)
    ' Formel: =C6 - 'Samlet Budget'!F212 + Likviditet!D25
    For i = 4 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(curRow, i - 1).Address(False, False) & _
            "-'Samlet Budget'!" & ws.Cells(212, i + 2).Address(False, False) & "+Likviditet!" & ws.Cells(25, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' R7: Indretning af lejede lokaler (Linker nu til Likviditet!D24 med + fortegn)
    ws.Cells(curRow, 2).value = "Indretning af lejede lokaler"
    Call Bal_PrimoFromSum(ws, curRow)
    ' Formel: =C7 - 'Samlet Budget'!F213 + Likviditet!D24
    For i = 4 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(curRow, i - 1).Address(False, False) & _
            "-'Samlet Budget'!" & ws.Cells(213, i + 2).Address(False, False) & "+Likviditet!" & ws.Cells(24, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' --- NY POST: R8: Passiverede fondsmidler ---
    ws.Cells(curRow, 2).value = "Passiverede fondsmidler"
    Call Bal_PrimoFromSum(ws, curRow)
    ' Formel jf. Astrid: =C8 - 'Samlet Budget'!F215 (konto 1824)
    ' Vi bruger en custom loop her da den er specifik
    For i = 4 To 15 ' D til O (Jan-Dec)
        ' F215 svarer til kolonne F for Jan. I loopet er i=4 (D). SamletBudget start er F (6).
        ' Offset i forhold til i: i+2. (4+2=6=F).
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(curRow, i - 1).Address(False, False) & _
            "-'Samlet Budget'!" & ws.Cells(215, i + 2).Address(False, False)
    Next i
    curRow = curRow + 1

    ' R9: Husleje og andre depositater
    ws.Cells(curRow, 2).value = "Husleje og andre depositater"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_CopyForward(ws, curRow)
    curRow = curRow + 1

    ' R10: Skagen klit/Traneklit
    ws.Cells(curRow, 2).value = "Skagen klit/Traneklit"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_CopyForward(ws, curRow)
    curRow = curRow + 1

    ' R11: Kapitalandel Hunderupvej, 50%
    ws.Cells(curRow, 2).value = "Kapitalandel Hunderupvej, 50%"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_CopyForward(ws, curRow)
    curRow = curRow + 1

    ' R12: Obligationsbeholdninger
    ws.Cells(curRow, 2).value = "Obligationsbeholdninger"
    Call Bal_PrimoFromSum(ws, curRow)
    curRow = curRow + 1

    ' --- SUM: Anlægsaktiver i alt ---
    ws.Cells(curRow, 2).value = "Anlægsaktiver i alt"
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Anl, i), ws.Cells(curRow - 1, i)).Address(False, False) & ")"
    Next i
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: OMSÆTNINGSAKTIVER
    ' =========================================================
    rStart_Oms = curRow

    ' R14: Varebeholdninger butikker
    ws.Cells(curRow, 2).value = "Varebeholdninger butikker"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_CopyForward(ws, curRow)
    curRow = curRow + 1

    ' R15: Tilgodehavender inkl. Hunderupvej
    ws.Cells(curRow, 2).value = "Tilgodehavender inkl. Hunderupvej"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunMinusLikv(ws, curRow, 11) ' Likviditet row 10 (Husk at tjekke om Likviditet række 10 har flyttet sig - men her bruger vi standard logik)
    curRow = curRow + 1

    ' R16: Kasseudlæg og kassebeh. medarb.
    ws.Cells(curRow, 2).value = "Kasseudlæg og kassebeh. medarb."
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunMinusLikv(ws, curRow, 12)
    curRow = curRow + 1

    ' R17: Bankindestående Nordea (Linker til Likviditet!D35 jf. Astrid)
    ws.Cells(curRow, 2).value = "Bankindestående Nordea"
    Call Bal_PrimoFromSum(ws, curRow)
    ' Direkte link til Likviditet!D35 og frem
    For i = 4 To 15
        ws.Cells(curRow, i).Formula = "=Likviditet!" & ws.Cells(35, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' R18: Indestående skattekonto
    ws.Cells(curRow, 2).value = "Indestående skattekonto"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunMinusLikv(ws, curRow, 20)

    curRow = curRow + 1

    ' R19: Mellemregning
    ws.Cells(curRow, 2).value = "Mellemregning"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_CopyForward(ws, curRow)
    curRow = curRow + 1

    ' --- SUM: Omsætningsaktiver i alt ---
    ws.Cells(curRow, 2).value = "Omsætningsaktiver i alt"
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Oms, i), ws.Cells(curRow - 1, i)).Address(False, False) & ")"
    Next i
    curRow = curRow + 1

    ' --- TOTAL: Aktiver i alt ---
    rRow_AktiverIAlt = curRow
    ws.Cells(curRow, 2).value = "Aktiver i alt"
    Dim rSum_Anl As Long: rSum_Anl = rStart_Oms - 1
    Dim rSum_Oms As Long: rSum_Oms = curRow - 1
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(rSum_Oms, i).Address(False, False) & "+" & ws.Cells(rSum_Anl, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: EGENKAPITAL
    ' =========================================================
    rStart_EK = curRow

    ws.Cells(curRow, 2).value = "Egenkapital Primo"
    ws.Cells(curRow, 3).Formula = "=SUM(" & ws.range(ws.Cells(curRow, colDeptStart), ws.Cells(curRow, colDeptEnd)).Address(False, False) & ")"
    For i = 4 To 15
         ws.Cells(curRow, i).Formula = "=" & ws.Cells(curRow, 3).Address(False, False)
    Next i
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Årets resultat akkumuleret"
    Call Bal_AccumFromBudget(ws, curRow, 2990)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Egenkapital i alt"
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=SUM(" & ws.range(ws.Cells(rStart_EK, i), ws.Cells(curRow - 1, i)).Address(False, False) & ")"
    Next i
    Dim rSum_EK As Long: rSum_EK = curRow
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: HENSÆTTELSER
    ' =========================================================
    rStart_Hens = curRow

    ws.Cells(curRow, 2).value = "Hensættelse til Udviklingsprojekter"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunPlusLikv(ws, curRow, 19)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Hensættelser i øvrigt "
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunPlusLikv(ws, curRow, 12)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Hensættelser i alt"
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Hens, i), ws.Cells(curRow - 1, i)).Address(False, False) & ")"
    Next i
    Dim rSum_Hens As Long: rSum_Hens = curRow
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: GÆLD
    ' =========================================================
    rStart_Gaeld = curRow

    ws.Cells(curRow, 2).value = "Kreditorer og sk. omkostninger"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunPlusLikv(ws, curRow, 13)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Anden gæld"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunPlusLikv(ws, curRow, 14)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "A-Skat, AM-bidrag og andre soc."
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_RunPlusLikv(ws, curRow, 15)
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Feriepengeforpligtelser"
    Call Bal_PrimoFromSum(ws, curRow)
    ' OBS: Linker til Likviditet række 16 og 17. Tjek om disse er rykket.
    ' Med indsættelse af række 9 i Likviditet, er gamle 16/17 nok blevet til 17/18?
    ' Men Astrid har specifikke formler i Likviditet række 18.
    ' Vi beholder standard logikken her, men vær OBS.
    Call Bal_RunPlusTwoLikv(ws, curRow, 17, 18)
    curRow = curRow + 1

    ' R32: Proritetsgæld ejendomme
    ' Rettelse: Skal være +Likviditet!D30+Likviditet!D31
    ws.Cells(curRow, 2).value = "Proritetsgæld ejendomme"
    Call Bal_PrimoFromSum(ws, curRow)
    For i = 4 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(curRow, i - 1).Address(False, False) & _
            "+Likviditet!" & ws.Cells(30, i).Address(False, False) & _
            "+Likviditet!" & ws.Cells(31, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Modtagne depositaer"
    Call Bal_PrimoFromSum(ws, curRow)
    Call Bal_CopyForward(ws, curRow)
    curRow = curRow + 1

    ' --- SUM: Gæld i alt ---
    ws.Cells(curRow, 2).value = "Gæld i alt"
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Gaeld, i), ws.Cells(curRow - 1, i)).Address(False, False) & ")"
    Next i
    Dim rSum_Gaeld As Long: rSum_Gaeld = curRow
    curRow = curRow + 1

    ' --- TOTAL: Passiver i alt ---
    rRow_PassiverIAlt = curRow
    ws.Cells(curRow, 2).value = "Pasiver i alt"
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(rSum_EK, i).Address(False, False) & "+" & _
                                            ws.Cells(rSum_Hens, i).Address(False, False) & "+" & _
                                            ws.Cells(rSum_Gaeld, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' Tom linje
    curRow = curRow + 1

    ' =========================================================
    ' SEKTION: KONTROL
    ' =========================================================
    rRow_Kontrol = curRow
    ws.Cells(curRow, 2).value = "Kontrol"
    For i = 3 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(rRow_PassiverIAlt, i).Address(False, False) & "-" & _
                                            ws.Cells(rRow_AktiverIAlt, i).Address(False, False)
    Next i
    curRow = curRow + 1

    ' Tomme linjer
    curRow = curRow + 1

    ' Afledt kontrol
    For i = 5 To 15
        ws.Cells(curRow, i).Formula = "=" & ws.Cells(rRow_Kontrol, i).Address(False, False) & "-" & _
                                            ws.Cells(rRow_Kontrol, i - 1).Address(False, False)
    Next i
    curRow = curRow + 3

    ' =========================================================
    ' SEKTION: FERIEPENGE / EKSTRA
    ' =========================================================
    ws.Cells(curRow, 2).value = "Ferietillæg"
    ws.Cells(curRow, 3).Formula = "=SUM(" & ws.range(ws.Cells(curRow, colDeptStart), ws.Cells(curRow, colDeptEnd)).Address(False, False) & ")"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Feriepenge til indefrysning"
    ws.Cells(curRow, 3).Formula = "=SUM(" & ws.range(ws.Cells(curRow, colDeptStart), ws.Cells(curRow, colDeptEnd)).Address(False, False) & ")"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "Feriepenge forpligtelse øvrig"
    ws.Cells(curRow, 3).Formula = "=SUM(" & ws.range(ws.Cells(curRow, colDeptStart), ws.Cells(curRow, colDeptEnd)).Address(False, False) & ")"
    curRow = curRow + 1

    ws.Cells(curRow, 2).value = "I ALT"
    ws.Cells(curRow, 3).Formula = "=SUM(" & ws.range(ws.Cells(curRow - 3, 3), ws.Cells(curRow - 1, 3)).Address(False, False) & ")"

    ' =========================================================
    ' FORMATERING OG AFDELINGER (S:AF)
    ' =========================================================
    ' Ramme
    With ws.range(ws.Cells(4, 2), ws.Cells(curRow, 15)).Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .Color = RGB(220, 220, 220)
    End With

    ' OVERSKRIFTER TIL AFDELINGER (S)
    ws.Cells(2, colDeptStart).value = "Primosaldi fordelt på afdelinger"
    ws.Cells(4, colDeptStart).value = "Post"
    Dim arrDeptNames As Variant
    arrDeptNames = Array("SUF", "Specialminds", "Ejd", "Vækstpark")
    For i = 0 To UBound(arrDeptNames)
        If (colDeptStart + 1 + i) <= colDeptEnd Then
            ws.Cells(4, colDeptStart + 1 + i).value = arrDeptNames(i)
        End If
    Next i

    ' Kopier tekster til S
    For i = 5 To curRow
        If ws.Cells(i, 2).value <> "" Then
            ws.Cells(i, colDeptStart).Formula = "=" & ws.Cells(i, 2).Address(False, False)
        End If
    Next i

    ' Indsæt SUM formler i afdelingskolonnerne for de gemte total-rækker
    Dim colD As Long
    For colD = colDeptStart + 1 To colDeptEnd
        ws.Cells(rSum_Anl, colD).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Anl, colD), ws.Cells(rSum_Anl - 1, colD)).Address(False, False) & ")"
        ws.Cells(rSum_Oms, colD).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Oms, colD), ws.Cells(rSum_Oms - 1, colD)).Address(False, False) & ")"
        ws.Cells(rRow_AktiverIAlt, colD).Formula = "=" & ws.Cells(rSum_Oms, colD).Address(False, False) & "+" & ws.Cells(rSum_Anl, colD).Address(False, False)
        ws.Cells(rSum_EK, colD).Formula = "=SUM(" & ws.range(ws.Cells(rStart_EK, colD), ws.Cells(rSum_EK - 1, colD)).Address(False, False) & ")"
        ws.Cells(rSum_Hens, colD).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Hens, colD), ws.Cells(rSum_Hens - 1, colD)).Address(False, False) & ")"
        ws.Cells(rSum_Gaeld, colD).Formula = "=SUM(" & ws.range(ws.Cells(rStart_Gaeld, colD), ws.Cells(rSum_Gaeld - 1, colD)).Address(False, False) & ")"
        ws.Cells(rRow_PassiverIAlt, colD).Formula = "=" & ws.Cells(rSum_EK, colD).Address(False, False) & "+" & _
                                                          ws.Cells(rSum_Hens, colD).Address(False, False) & "+" & _
                                                          ws.Cells(rSum_Gaeld, colD).Address(False, False)
        ws.Cells(rRow_Kontrol, colD).Formula = "=" & ws.Cells(rRow_PassiverIAlt, colD).Address(False, False) & "-" & _
                                                     ws.Cells(rRow_AktiverIAlt, colD).Address(False, False)
    Next colD

    'MsgBox "Balance opdateret med nye poster.", vbInformation, "Succes"

Exit_Handler:
    Set hdrTopLeft = Nothing
    Exit Sub

Err_Handler:
    MsgBox "Fejl " & Err.Number & " i Write_Balance: " & Err.Description, vbCritical
    Resume Exit_Handler
End Sub
Private Sub Write_Resultat(ByVal ws As Object, ByVal BudgetYear As Long)
    On Error GoTo Err_Handler

    Dim headers As Variant, selectList As String, anchor As String
    anchor = ANCHOR_RESULTAT ' Antages at være B4

    headers = Array( _
        "Afdeling", "Total", _
        "JAN", "FEB", "MAR", "APR", "MAJ", "JUN", "JUL", "AUG", "SEP", "OKT", "NOV", "DEC" _
    )

    selectList = Join(Array( _
        "[AfdelingsNavn]", _
        "[BudgetIalt_Sum]", _
        "[_1_Sum]", "[_2_Sum]", "[_3_Sum]", "[_4_Sum]", "[_5_Sum]", "[_6_Sum]", _
        "[_7_Sum]", "[_8_Sum]", "[_9_Sum]", "[_10_Sum]", "[_11_Sum]", "[_12_Sum]" _
    ), ",")

    Dim where_ As String
    where_ = " WHERE [Year_]=" & BudgetYear

    Dim dB As DAO.Database, rs As DAO.Recordset, sql As String
    Set dB = CurrentDb
    sql = "SELECT " & selectList & " FROM [" & VIEW_RESULTAT & "]" & where_
    Set rs = dB.OpenRecordset(sql, dbOpenSnapshot)

    Dim tgt As Object, i As Long
    Set tgt = ws.range(anchor)
    For i = 0 To UBound(headers)
        tgt.Offset(0, i).value = headers(i)
        tgt.Offset(0, i).Font.Bold = True
    Next i

    ws.Cells(2, 2).value = "Internt Resultatbudget " & BudgetYear

    Dim rowStart As Long: rowStart = ws.range(anchor).row + 1
    Dim colStart As Long: colStart = ws.range(anchor).Column
    Dim r As Long

    If Not (rs.BOF And rs.EOF) Then
        rs.MoveFirst
        r = rowStart
        Do While Not rs.EOF
            ws.Cells(r, colStart + 0).value = Nz(rs.Fields("AfdelingsNavn").value, "")
            ws.Cells(r, colStart + 1).value = Nz(rs.Fields("BudgetIalt_Sum").value, 0)

            Dim m As Long
            For m = 1 To 12
                ws.Cells(r, colStart + 1 + m).value = Nz(rs.Fields("_" & m & "_Sum").value, 0)
            Next

            r = r + 1
            rs.MoveNext
        Loop
    End If

    ' Fed skrift på dataområdet (B5 til O_Slut)
    ws.range(ws.Cells(5, "B"), ws.Cells(r - 1, "O")).Font.Bold = True

    ' =========================================================
    ' NYT: TOTAL LINJE I RÆKKE 48
    ' =========================================================
    Dim sumRow As Long
    sumRow = 48

    ' 1. Label i B48
    ws.Cells(sumRow, 2).value = "I ALT"
    ws.Cells(sumRow, 2).Font.Bold = True

    ' 2. Sum formler for C48 til O48 (Summerer række 5 til 47)
    Dim cSum As Long
    For cSum = 3 To 15 ' 3=C, 15=O
        ' Formel: =SUM(C5:C47) dynamisk bygget
        ws.Cells(sumRow, cSum).Formula = "=SUM(" & ws.range(ws.Cells(5, cSum), ws.Cells(47, cSum)).Address(False, False) & ")"
        ws.Cells(sumRow, cSum).Font.Bold = True

    Next cSum

    ' 3. Sum formel i P48 (Summerer C48 til O48)
    ws.Cells(sumRow, 16).Formula = "=SUM(D" & sumRow & ":O" & sumRow & ")"
    'ws.Cells(sumRow, 16).Font.Bold = True

    ws.range("B48:O48").Interior.Color = RGB(232, 232, 232)

    rs.Close: Set rs = Nothing
    Exit Sub

Err_Handler:
    MsgBox "Fejl i Write_Resultat: " & Err.Description, vbCritical
    If Not rs Is Nothing Then rs.Close
End Sub
'==========================================================
'                   F O R M A T T E R I N G
'----------------------------------------------------------
Private Sub ApplyNumericFormats(ByVal ws As Object, ByVal sheetName As String)
    Select Case sheetName
        Case "Samlet Budget"
            ws.range("D:S").numberFormat = "#,##0;-#,##0"

            ws.Columns("A:B").ColumnWidth = 12
            ws.Columns("C").ColumnWidth = 14
            ws.Columns("E").ColumnWidth = 6
            ws.Columns("F:P").ColumnWidth = 9

            Dim hdr As Object
            Set hdr = ws.range("B2:Q2")
            With hdr
                .Font.Bold = True: .Font.Size = 18
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(0, 0, 0)
                .Borders.Weight = 2
            End With

            Set hdr = ws.range("B4:Q4")
            With hdr
                .Font.Bold = True: .Font.Size = 14
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(89, 89, 89)
                .Borders.Weight = 2
                .HorizontalAlignment = xlCenter
            End With

            Dim lastRow As Long
            lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).row
            With ws.range("A1:S" & lastRow).Borders
                .LineStyle = xlContinuous
                .Weight = xlThin
                .Color = RGB(220, 220, 220)
            End With

            ws.Columns("C:S").AutoFit
            ApplySectionBordersSamletBudget ws, 7, "B", "Q"

        Case "Hovedposter"
            ws.range("D:P").numberFormat = "#,##0;-#,##0"

            ws.Columns("B").ColumnWidth = 4
            ws.Columns("D").ColumnWidth = 14
            ws.Columns("E:P").ColumnWidth = 9

            Dim hdr2 As Object
            Set hdr2 = ws.range("B2:Q2")
            With hdr2
                .Font.Bold = True: .Font.Size = 18
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(0, 0, 0)
                .Borders.Weight = 2
            End With

            Set hdr2 = ws.range("B4:Q4")
            With hdr2
                .Font.Bold = True: .Font.Size = 14
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(89, 89, 89)
                .Borders.Weight = 2
                .HorizontalAlignment = xlCenter
            End With

            ws.Columns("C:S").AutoFit
            ApplySectionBordersSamletBudget ws, 5, "B", "P"

        Case "Resultat"
            ws.range("C:O").numberFormat = "#,##0;-#,##0"

            Dim hdr3 As Object
            Set hdr3 = ws.range("B2:O2")
            With hdr3
                .Font.Bold = True: .Font.Size = 18
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(0, 0, 0)
                .Borders.Weight = 2
            End With

            Set hdr3 = ws.range("B4:O4")
            With hdr3
                .Font.Bold = True: .Font.Size = 14
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(89, 89, 89)
                .Borders.Weight = 2
                .HorizontalAlignment = xlCenter
            End With

            ws.Columns("B:O").AutoFit
            ApplySectionBordersSamletBudget ws, 5, "B", "O"

        Case "Likviditet"
            ws.Columns("A:B").ColumnWidth = 12
            ws.Columns("C").ColumnWidth = 14
            ws.Columns("E").ColumnWidth = 6
            ws.Columns("F:O").ColumnWidth = 9

            Dim hdrLik As Object
            Set hdrLik = ws.range("B2:O2")
            With hdrLik
                .Font.Bold = True: .Font.Size = 18
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(0, 0, 0)
                .Borders.Weight = 2
            End With

            Set hdrLik = ws.range("B4:O4")
            With hdrLik
                .Font.Bold = True: .Font.Size = 14
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(89, 89, 89)
                .Borders.Weight = 2
                .HorizontalAlignment = xlCenter
            End With

            ' Samme stil som i din standalone-builder
            ws.range("C5:O34").numberFormat = "#,##0;-#,##0"
            ws.Columns("B").ColumnWidth = 34
            ws.Columns("C").ColumnWidth = 14
            ws.Columns("D:O").ColumnWidth = 12

            With ws.range("B2:O35").Borders
                .LineStyle = xlContinuous
                .Weight = xlThin
                .Color = RGB(200, 200, 200)
            End With
            ws.range("B2:O35").BorderAround xlContinuous, xlThick
            ws.range("C10:O10").Font.Bold = True
            ws.range("C21:O22").Font.Bold = True
            ws.range("C28:O28").Font.Bold = True
            ws.range("C32:O35").Font.Bold = True
            ws.range("B5:B35").Font.Bold = True

        Case "Balance"
            ' Balance: samme valutaformat som Resultat/Likviditet, plus højre sektion (S:W)
            ws.range("C5:O44").numberFormat = "#,##0;-#,##0"
            ws.range("T5:W34").numberFormat = "#,##0;-#,##0"

            ws.Columns("B").ColumnWidth = 34
            ws.Columns("C").ColumnWidth = 14
            ws.Columns("D:O").ColumnWidth = 12

            ws.Columns("S").ColumnWidth = 34
            ws.Columns("T:W").ColumnWidth = 12

            Dim hdrBal As Object
            Dim hdrBalRight As Object

            ' Hovedtitel til venstre (B2:O2)
            Set hdrBal = ws.range("B2:O2")
            With hdrBal
                .Font.Bold = True
                .Font.Size = 18
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(0, 0, 0)
                .Borders.Weight = 2
            End With

            ' Titel for primosaldi-sektionen (S2:W2)
            Set hdrBalRight = ws.range("S2:W2")
            With hdrBalRight
                .Font.Bold = True
                .Font.Size = 14
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(0, 0, 0)
                .Borders.Weight = 2
            End With

            ' Header-række venstre (B4:O4)
            Set hdrBal = ws.range("B4:O4")
            With hdrBal
                .Font.Bold = True
                .Font.Size = 14
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(89, 89, 89)
                .Borders.Weight = 2
                .HorizontalAlignment = xlCenter
            End With

            ' Header-række højre (S4:W4)
            Set hdrBalRight = ws.range("S4:W4")
            With hdrBalRight
                .Font.Bold = True
                .Font.Size = 12
                .Font.Color = RGB(255, 255, 255)
                .Interior.Color = RGB(89, 89, 89)
                .Borders.Weight = 2
                .HorizontalAlignment = xlCenter
            End With

            ' Rammer omkring hovedområdet B4:O44
            With ws.range("B4:O45").Borders
                .LineStyle = xlContinuous
                .Weight = xlThin
                .Color = RGB(200, 200, 200)
            End With
            ws.range("B4:O45").BorderAround xlContinuous, xlThick

            ' Rammer omkring højre sektion S4:W34
            With ws.range("S4:W35").Borders
                .LineStyle = xlContinuous
                .Weight = xlThin
                .Color = RGB(200, 200, 200)
            End With
            ws.range("S4:W35").BorderAround xlContinuous, xlThick

            With ws
                .range("B13:W13").Font.Bold = True
                .range("B21:W21").Font.Bold = True
                .range("B24:W24").Font.Bold = True
                .range("B35:W35").Font.Bold = True
            End With


        Case Else
            ' Balance eller andre: ingen særregel endnu
    End Select
End Sub
Private Sub ApplySectionBordersSamletBudget(ByVal ws As Object, _
                                           Optional ByVal startRow As Long, _
                                           Optional ByVal colStart As String, _
                                           Optional ByVal colEnd As String)
    Dim lastDataRow As Long
    Dim r As Long, secStart As Long, secEnd As Long
    Dim i As Long

    lastDataRow = ws.Cells(ws.Rows.Count, "B").End(xlUp).row
    If lastDataRow < startRow Then Exit Sub

    r = startRow
    Do While r <= lastDataRow
        Do While r <= lastDataRow And Len(Trim$(CStr(ws.Cells(r, "B").value))) = 0
            r = r + 1
        Loop
        If r > lastDataRow Then Exit Do

        secStart = r
        For i = r To lastDataRow + 1
            If i > lastDataRow Or Len(Trim$(CStr(ws.Cells(i, "B").value))) = 0 Then
                secEnd = i - 1
                Exit For
            End If
        Next i

        If secEnd >= secStart Then
            With ws.range(colStart & secStart & ":" & colEnd & secEnd).Borders
                .LineStyle = xlContinuous
                .Weight = xlThin
            End With
        End If

        r = secEnd + 1
        Do While r <= lastDataRow And Len(Trim$(CStr(ws.Cells(r, "B").value))) = 0
            r = r + 1
        Loop
    Loop
End Sub

Private Sub ShadeRowsByKonto(ByVal ws As Object, _
                             ByVal konti As Variant, _
                             Optional ByVal startRow As Long = 5, _
                             Optional ByVal kontoCol As Variant = "B", _
                             Optional ByVal firstCol As Variant = "B", _
                             Optional ByVal lastCol As Variant = "P")

    Dim lastRow As Long, r As Long
    Dim dict As Object, k As Variant
    Dim rngAll As Object, rngRow As Object
    Dim v As String
    Dim app As Object

    Set app = ws.Application
    Set dict = CreateObject("Scripting.Dictionary")
    For Each k In konti
        dict(Trim$(CStr(k))) = True
    Next

    lastRow = ws.Cells(ws.Rows.Count, kontoCol).End(xlUp).row
    If lastRow < startRow Then Exit Sub

    For r = startRow To lastRow
        v = Trim$(CStr(ws.Cells(r, kontoCol).value))
        If dict.exists(v) Then
            Set rngRow = ws.range(ws.Cells(r, firstCol), ws.Cells(r, lastCol))
            If rngAll Is Nothing Then
                Set rngAll = rngRow
            Else
                Set rngAll = app.Union(rngAll, rngRow)
            End If
        End If
    Next

    If Not rngAll Is Nothing Then
        rngAll.Interior.Color = RGB(216, 216, 216)
    End If
End Sub

'========================== Hjælp ==========================
Private Function HasFormulaCell(ByVal cell As Object) As Boolean
    On Error Resume Next
    HasFormulaCell = cell.HasFormula
    On Error GoTo 0
End Function

'================= U T I L S =================
Private Sub EnsureExactSheet(ByVal wb As Object, ByVal sheetName As String)
    Dim ws As Object
    On Error Resume Next
    Set ws = wb.Worksheets(sheetName)
    On Error GoTo 0
    If ws Is Nothing Then
        Set ws = wb.Worksheets.Add(After:=wb.Worksheets(wb.Worksheets.Count))
        ws.Name = sheetName
    Else
        ws.Cells.Clear
    End If
End Sub

Private Sub EnsureFolder(ByVal path_ As String)
    If Len(Dir(path_, vbDirectory)) = 0 Then
        Dim fso As Object: Set fso = CreateObject("Scripting.FileSystemObject")
        fso.CreateFolder path_
    End If
End Sub

Private Sub SafeKill(ByVal filePath As String)
    If Len(Dir(filePath, vbNormal)) > 0 Then Kill filePath
End Sub
'================= /modBudgetExport_Hardcoded =================
Private Sub EnsureSamletNamedRanges(wb As Object, ws As Worksheet)
Dim addrKonto As String, addrHdr As String, addrData As String

    On Error Resume Next
    wb.names("NB_KontoCol").Delete
    wb.names("NB_Header").Delete
    wb.names("NB_Data").Delete
    On Error GoTo 0

    wb.names.Add Name:="NB_KontoCol", RefersToR1C1:="='" & ws.Name & "'!R1C2:R500C2"   ' B1:B500
    wb.names.Add Name:="NB_Header", RefersToR1C1:="='" & ws.Name & "'!R4C4:R4C15"       ' D4:O4
    wb.names.Add Name:="NB_Data", RefersToR1C1:="='" & ws.Name & "'!R1C4:R1000C15"      ' D1:O1000

End Sub

Private Sub EnsureNamedLambdas_Local(wb As Object)
    Dim sep As String: sep = ";" 'Application.International(xlListSeparator)  ' på DK er det ";"

    Dim fK As String, fKSUM As String
    ' Byg formlerne med lokal separator
    fK = "=LAMBDA(konto" & sep & " maaned" & _
         sep & " LET(r" & sep & "MATCH(konto" & sep & " NB_KontoCol" & sep & "0)" & _
         sep & "     c" & sep & "MATCH(maaned" & sep & " NB_Header" & sep & "0)" & _
         sep & "     INDEX(NB_Data" & sep & " r" & sep & " c)))"

    ' Kræver 365 pga. TEXTSPLIT. Hvis du ikke har 365, se metode 2/3.
    fKSUM = "=LAMBDA(maaned" & sep & " kontostr" & _
            sep & " LET(k" & sep & "TRIM(TEXTSPLIT(kontostr" & sep & """,""))" & _
            sep & "     r" & sep & "MATCH(k" & sep & " NB_KontoCol" & sep & "0)" & _
            sep & "     c" & sep & "MATCH(maaned" & sep & " NB_Header" & sep & "0)" & _
            sep & "     SUM(INDEX(NB_Data" & sep & " r" & sep & " c))))"

    On Error Resume Next
    wb.names("K").Delete
    wb.names("KSUM").Delete
    On Error GoTo 0

    wb.names.Add Name:="K", RefersToLocal:=fK
    wb.names.Add Name:="KSUM", RefersToLocal:=fKSUM
End Sub
Private Function MShort(m As Long) As String
    MShort = Choose(m, "Jan", "Feb", "Mar", "Apr", "Maj", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dec")
End Function

' Én konto
Private Sub FillRow_K_365(wsLik As Object, ByVal rowNo As Long, ByVal Konto As String)
    Dim m As Long, col As Long
    For m = 1 To 12
        col = wsLik.Columns("C").Column + m   ' D=Jan ... O=Dec
        wsLik.Cells(rowNo, col).Formula = "=K(""" & Konto & """,""" & MShort(m) & """)"
    Next
    wsLik.Cells(rowNo, "C").FormulaR1C1 = "=SUM(RC[1]:RC[13])"
End Sub

' Flere konti (CSV)
Private Sub FillRow_KSUM_365(wsLik As Object, ByVal rowNo As Long, ByVal kontoCSV As String)
    Dim m As Long, col As Long
    For m = 1 To 12
        col = wsLik.Columns("C").Column + m
        wsLik.Cells(rowNo, col).Formula = "=KSUM(""" & MShort(m) & """,""" & kontoCSV & """)"
    Next
    wsLik.Cells(rowNo, "C").FormulaR1C1 = "=SUM(RC[1]:RC[13])"
End Sub
Private Sub Populate_Likviditet_Row(ByVal wsLikviditet As Object, ByVal account As String, ByVal LikviditetRow As Long, Optional ByVal ColNames As String = "", Optional ByVal DestColLetter As String = "")
    On Error GoTo Err_Handler

    Dim wsBudget As Object           ' Worksheet-objekt for "Samlet Budget"
    Dim BudgetRow As Long, BudgetRowStart As Long, BudgetRowEnd As Long
    Dim FormulaString As String
    Dim AccountToFind As Long
    Dim rngFind As Object

    Set wsBudget = wsLikviditet.Parent.Worksheets("Samlet Budget")

    ' --- Vælg Handlings-Logik ---

    If ColNames <> "" Then
        ' SCENARIE 3 eller 4: Vi bygger en enkelt formel baseret på ColNames.

        Dim DestCol As String
        If DestColLetter = "" Then
            DestCol = "D" ' Standard til kolonne D (Total)
        Else
            DestCol = UCase(DestColLetter)
        End If

        Dim ColParts As Variant
        Dim ColPart As Variant
        Dim SubOperator As String
        Dim ColLetter As String

        If InStr(account, ";") > 0 Then
            ' --- SCENARIE 4: Multi-Konto, Multi-Kolonne SUM ---
            ' Account = "+1121;+1124;-1128", ColNames = "+G;+H;-J"

            Dim AccountParts As Variant
            Dim AccountPart As Variant
            Dim MainOperator As String
            Dim SubFormula As String

            FormulaString = "="
            AccountParts = Split(account, ";")

            For Each AccountPart In AccountParts
                If Len(AccountPart) > 1 Then
                    MainOperator = Left(AccountPart, 1)
                    AccountToFind = CLng(Mid(AccountPart, 2))

                    If MainOperator <> "+" And MainOperator <> "-" Then
                        MsgBox "Der mangles fortegn ved flere konti på flere kolonner!", vbExclamation
                        GoTo Exit_Handler
                    End If

                    ' Find rækken for denne konto
                    Set rngFind = wsBudget.Columns("B").Find(What:=AccountToFind, LookIn:=xlValues, LookAt:=xlPart)

                    If Not rngFind Is Nothing Then
                        BudgetRow = rngFind.row

                        ' Byg sub-formlen baseret på ColNames
                        SubFormula = "("
                        ColParts = Split(ColNames, ";")
                        For Each ColPart In ColParts
                            If Len(ColPart) > 1 Then
                                SubOperator = Left(ColPart, 1)
                                ColLetter = Mid(ColPart, 2)
                                SubFormula = SubFormula & SubOperator & "'Samlet Budget'!" & ColLetter & BudgetRow
                            End If
                        Next ColPart
                        SubFormula = SubFormula & ")"

                        'Debug.Print SubFormula

                        ' Tilføj til hovedformlen
                        FormulaString = FormulaString & MainOperator & SubFormula

                        'Debug.Print FormulaString

                    Else
                        MsgBox "Advarsel: Konto " & AccountToFind & " (fra multi-konto streng) blev ikke fundet.", vbExclamation
                    End If
                    Set rngFind = Nothing
                End If
            Next AccountPart

            wsLikviditet.range(DestCol & LikviditetRow).Formula = FormulaString

        Else
            ' --- SCENARIE 3: Enkelt Konto, Multi-Kolonne SUM ---
            ' Account = "6440", ColNames = "+G;+H"

            If InStr(account, ":") > 0 Then
                MsgBox "Fejl: 'ColNames' kan ikke bruges med et konto-interval (f.eks. '1120:1124').", vbCritical
                GoTo Exit_Handler
            End If

            AccountToFind = CLng(account)
            Set rngFind = wsBudget.Columns("B").Find(What:=AccountToFind, LookIn:=xlValues, LookAt:=xlPart)

            If rngFind Is Nothing Then
                MsgBox "Advarsel: Konto " & AccountToFind & " blev ikke fundet.", vbExclamation
                GoTo Exit_Handler
            End If
            BudgetRowStart = rngFind.row

            FormulaString = "="
            ColParts = Split(ColNames, ";")

            For Each ColPart In ColParts
                If Len(ColPart) > 1 Then
                    SubOperator = Left(ColPart, 1)
                    ColLetter = Mid(ColPart, 2)
                    FormulaString = FormulaString & SubOperator & "'Samlet Budget'!" & ColLetter & BudgetRowStart
                End If
            Next ColPart

            wsLikviditet.range(DestCol & LikviditetRow).Formula = FormulaString
        End If

    Else
        ' --- SCENARIE 1 eller 2: ColNames er TOM ---
        ' Loop D:O for enten SUM eller Enkelt Konto

        Dim ColIdx As Long
        Dim BudgetCol As Long

        If InStr(account, ":") > 0 Then
            ' --- SCENARIE 1: KONTO-INTERVAL (SUM) D:O ---
            AccountParts = Split(account, ":")

            AccountToFind = CLng(AccountParts(0))
            Set rngFind = wsBudget.Columns("B").Find(What:=AccountToFind, LookIn:=xlValues, LookAt:=xlPart)
            If rngFind Is Nothing Then GoTo KontoIkkeFundet
            BudgetRowStart = rngFind.row

            AccountToFind = CLng(AccountParts(1))
            Set rngFind = wsBudget.Columns("B").Find(What:=AccountToFind, LookIn:=xlValues, LookAt:=xlPart)
            If rngFind Is Nothing Then GoTo KontoIkkeFundet
            BudgetRowEnd = rngFind.row

            For ColIdx = 4 To 15 ' D til O
                BudgetCol = ColIdx + 2 ' 7 (F) til 18 (Q)
                Dim StartCell As String, EndCell As String
                StartCell = wsBudget.Cells(BudgetRowStart, BudgetCol).Address(False, False)
                EndCell = wsBudget.Cells(BudgetRowEnd, BudgetCol).Address(False, False)
                FormulaString = "=SUM('Samlet Budget'!" & StartCell & ":'Samlet Budget'!" & EndCell & ")"
                wsLikviditet.Cells(LikviditetRow, ColIdx).Formula = FormulaString
            Next ColIdx

        Else
            ' --- SCENARIE 2: ENKELT KONTO D:O ---
            AccountToFind = CLng(account)
            Set rngFind = wsBudget.Columns("B").Find(What:=AccountToFind, LookIn:=xlValues, LookAt:=xlPart)
            If rngFind Is Nothing Then GoTo KontoIkkeFundet
            BudgetRowStart = rngFind.row

            For ColIdx = 4 To 15 ' D til O
                BudgetCol = ColIdx + 2 ' 7 (F) til 18 (Q)
                FormulaString = "='Samlet Budget'!" & wsBudget.Cells(BudgetRowStart, BudgetCol).Address(False, False)
                wsLikviditet.Cells(LikviditetRow, ColIdx).Formula = FormulaString
            Next ColIdx
        End If
    End If

Exit_Handler:
    Set wsBudget = Nothing
    Set rngFind = Nothing
    Exit Sub

KontoIkkeFundet:
    MsgBox "Advarsel: Konto " & AccountToFind & " blev ikke fundet på fanen 'Samlet Budget'.", vbExclamation
    Resume Exit_Handler

Err_Handler:
    MsgBox "Fejl " & Err.Number & " i Populate_Likviditet_Row (Konto: " & account & "): " & Err.Description, vbCritical
    Resume Exit_Handler
End Sub
'========================== GENERIC INVESTMENT SHEET ==========================
Private Sub CreateInvestmentSheet( _
    ByVal wb As Object, _
    ByVal afterSheetName As String, _
    ByVal sheetName As String, _
    ByVal titleText As String, _
    ByVal BudgetYear As Long, _
    ByVal monthNamePrefix As String, _
    Optional ByVal freezeTop As Boolean = False)

    Dim ws As Object, wsAfter As Object, app As Object
    Dim firstDataRow As Long, lastDataRow As Long
    Dim r As Long, m As Long

    Set app = wb.Application

    ' -- Opret fane til højre for afterSheetName --
    On Error Resume Next
    Set wsAfter = wb.Worksheets(afterSheetName)
    On Error GoTo 0
    If wsAfter Is Nothing Then Err.Raise 5, , "Af-fanen '" & afterSheetName & "' blev ikke fundet."

    Set ws = Nothing
    On Error Resume Next
    Set ws = wb.Worksheets(sheetName)
    On Error GoTo 0
    If ws Is Nothing Then
        Set ws = wb.Worksheets.Add(After:=wsAfter)
        ws.Name = sheetName
    Else
        ws.Cells.Clear
        If ws.index <> wsAfter.index + 1 Then ws.Move After:=wsAfter
    End If

    ' -- Generel opsætning --
    app.Windows(1).DisplayGridlines = False      ' Skjul gitterlinjer i vinduet
    'Application.ActiveWindow.DisplayHeadings = True    'ws.DisplayHeadings = True

    ' Headerlinje og overskrift
    ws.Cells(2, "B").value = titleText & ", budgetår: " & BudgetYear
    With ws.range("B2:O2")
        .Merge
        .Font.Bold = True
        .Font.Size = 18
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(0, 0, 0)
        .HorizontalAlignment = -4108 'xlCenter
        .Borders.Weight = 2
    End With

    ' Kolonneoverskrifter B4:O4
    Dim headers As Variant
    headers = Array("Tekst", "Total", "JAN", "FEB", "MAR", "APR", "MAJ", "JUN", "JUL", "AUG", "SEP", "OKT", "NOV", "DEC")
    For m = LBound(headers) To UBound(headers)
        ws.Cells(4, 2 + m).value = headers(m)
    Next

    With ws.range("B4:O4")
        .Font.Bold = True
        .Font.Size = 12
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(89, 89, 89)
        .HorizontalAlignment = -4108 'xlCenter
        .Borders.Weight = 2
    End With

    ' Række-opsætning: summering på række 5, data på 6..35 (30 linjer)
    firstDataRow = 6
    lastDataRow = firstDataRow + 30 - 1   ' 6..35

    ' Totalformel i række 5 (summerer 30 linjer)
    ws.Cells(5, "B").value = "Sum (30 linjer)"
    ws.Cells(5, "C").FormulaR1C1 = "=SUM(R[1]C:R[30]C)"
    ws.range(ws.Cells(5, "D"), ws.Cells(5, "O")).FormulaR1C1 = "=SUM(R[1]C:R[30]C)"
    ws.range("B5:O5").Font.Bold = True

    ' Total pr. række (C6:C35) = SUM over månedsfelter D:O
    For r = firstDataRow To lastDataRow
        ws.Cells(r, "C").FormulaR1C1 = "=SUM(RC[1]:RC[12])"
    Next r

    ' Kolonnebredder og talformat
    ws.Columns("B").ColumnWidth = 40
    ws.Columns("C").ColumnWidth = 14
    ws.Columns("D:O").ColumnWidth = 12
    ws.range(ws.Cells(5, "C"), ws.Cells(lastDataRow, "O")).numberFormat = "#,##0;-#,##0"

    ' Zebra-striber på dataområdet (B6:O35)
    Dim zebra As Object
    For r = firstDataRow To lastDataRow
        If (r Mod 2) = 0 Then
            Set zebra = ws.range(ws.Cells(r, "B"), ws.Cells(r, "O"))
            zebra.Interior.Color = RGB(242, 242, 242)
        End If
    Next r

    ' Rammer
    With ws.range(ws.Cells(5, "B"), ws.Cells(lastDataRow, "O")).Borders
        .LineStyle = 1 'xlContinuous
        .Weight = 2    'xlThin
        .Color = RGB(200, 200, 200)
    End With
    ws.range(ws.Cells(5, "B"), ws.Cells(lastDataRow, "O")).BorderAround 1, 4 'xlContinuous,xlThick

    ' Skjul kolonner udenfor B:O og rækker under 35
    ws.Columns("A").EntireColumn.Hidden = True
    ws.Columns("P:XFD").EntireColumn.Hidden = True
    ws.Rows(CStr(lastDataRow + 1) & ":1048576").EntireRow.Hidden = True

    ' Navngiv summeceller i række 5 (Jan..Dec) som Prefix_1..Prefix_12 -> D5..O5
    For m = 1 To 12
        Dim col As Long, nm As String, addr As String
        col = ws.Columns("C").Column + m   ' D=Jan=+1
        nm = monthNamePrefix & "_" & m
        addr = "='" & ws.Name & "'!" & ws.Cells(5, col).Address
        On Error Resume Next
        wb.names(nm).Delete
        On Error GoTo 0
        wb.names.Add Name:=nm, RefersTo:=addr
    Next m

    ' Beskyt/Lås: alt låst, undtagen B6:B35 og D6:O35 (indtastning)
    ws.Cells.Locked = True
    ws.range(ws.Cells(firstDataRow, "B"), ws.Cells(lastDataRow, "B")).Locked = False        ' Tekst
    ws.range(ws.Cells(firstDataRow, "D"), ws.Cells(lastDataRow, "O")).Locked = False        ' Måneder
    ' Total-kolonne C og summeringsrække B5:O5 forbliver låst
    On Error Resume Next
    ws.Protect password:="", AllowFormattingCells:=True, AllowFormattingColumns:=True, AllowFormattingRows:=True
    On Error GoTo 0

    ' Frys top (så header og summering altid er synlige)
    If freezeTop Then
        ws.Activate
        app.ActiveWindow.SplitColumn = 0
        app.ActiveWindow.SplitRow = firstDataRow - 1 ' 5 -> frys ned til over første inputrække
        app.ActiveWindow.FreezePanes = True
    End If
End Sub
Private Sub CreateAfdragSheet( _
    ByVal wb As Object, _
    ByVal afterSheetName As String, _
    ByVal sheetName As String, _
    ByVal titleText As String, _
    ByVal BudgetYear As Long, _
    ByVal installmentNamePrefix As String) ' F.eks. "Afdrag"

    On Error GoTo Err_Handler

    Dim ws As Object, wsAfter As Object, app As Object
    Dim summaryHeaderRow As Long, firstSummaryDataRow As Long
    Dim inputHeaderRow As Long, lastInputRow As Long
    Dim m As Long
    Dim headers As Variant

    Set app = wb.Application
    summaryHeaderRow = 4
    firstSummaryDataRow = 5
    inputHeaderRow = 15 ' Starten på input-databasen
    lastInputRow = 515 ' Forbereder ca 500 rækker til input

    ' -- Opret fane til højre for afterSheetName --
    On Error Resume Next
    Set wsAfter = wb.Worksheets(afterSheetName)
    On Error GoTo Err_Handler ' Nulstil fejlhåndtering
    If wsAfter Is Nothing Then Err.Raise 5, , "Af-fanen '" & afterSheetName & "' blev ikke fundet."

    Set ws = Nothing
    On Error Resume Next
    Set ws = wb.Worksheets(sheetName)
    On Error GoTo Err_Handler ' Nulstil fejlhåndtering

    If ws Is Nothing Then
        Set ws = wb.Worksheets.Add(After:=wsAfter)
        ws.Name = sheetName
    Else
        ws.Cells.Clear
        If ws.index <> wsAfter.index + 1 Then ws.Move After:=wsAfter
    End If

    ' -- Generel opsætning --
    app.Windows(1).DisplayGridlines = False ' Skjul gitterlinjer

    ' Budgetår (bruges af SUMIFS)
    ws.Cells(1, "C").value = BudgetYear
    ws.Cells(1, "B").value = "Budgetår:"
    ws.Cells(1, "B").Font.Bold = True

    ' Headerlinje og overskrift
    ws.Cells(2, "B").value = titleText & ", budgetår: " & BudgetYear
    With ws.range("B2:I2") ' Udvidet til kolonne I
        .Merge
        .Font.Bold = True
        .Font.Size = 18
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(0, 0, 0)
        .HorizontalAlignment = -4108 'xlCenter
        .Borders.Weight = 2
    End With

    '==========================================================
    ' --- Sektion 1: SUMMERING (ØVERST) ---
    '==========================================================

    ' Kolonneoverskrifter B4:I4
    headers = Array("Termin", "Ydelse", "Bidrag", "Rente", "Afdrag", "Restgæld (Ultimo)", "Rente + Bidrag", "StartGæld (Check)")
    For m = LBound(headers) To UBound(headers)
        ws.Cells(summaryHeaderRow, 2 + m).value = headers(m)
    Next m

    With ws.range(ws.Cells(summaryHeaderRow, "B"), ws.Cells(summaryHeaderRow, "I"))
        .Font.Bold = True
        .Font.Size = 12
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(89, 89, 89)
        .HorizontalAlignment = -4108 'xlCenter
        .Borders.Weight = 2
    End With

    ' --- Labels og Formler for summering (Række 5-9) ---
    ws.Cells(5, "B").value = "1 (Marts)"
    ws.Cells(6, "B").value = "2 (Juni)"
    ws.Cells(7, "B").value = "3 (Sept)"
    ws.Cells(8, "B").value = "4 (Dec)"
    ws.Cells(9, "B").value = "TOTALT"
    ws.range("B5:B9").Font.Bold = True

    ' SUMIFS Formler (C5:I8)
    ' A=År, B=Navn, C=TerminNr, D=StartGæld, E=Ydelse, F=Bidrag, G=Rente, H=Afdrag, I=RestgældUltimo
    Dim i As Long
    For i = 1 To 4 ' Loop for de 4 terminer
        Dim r As Long
        r = firstSummaryDataRow + i - 1 ' Række 5, 6, 7, 8

        ' C: Ydelse (Kol E)
        ws.Cells(r, "C").Formula = "=SUMIFS(E:E, A:A, $C$1, C:C, " & i & ")"
        ' D: Bidrag (Kol F)
        ws.Cells(r, "D").Formula = "=SUMIFS(F:F, A:A, $C$1, C:C, " & i & ")"
        ' E: Rente (Kol G)
        ws.Cells(r, "E").Formula = "=SUMIFS(G:G, A:A, $C$1, C:C, " & i & ")"
        ' F: Afdrag (Kol H)
        ws.Cells(r, "F").Formula = "=SUMIFS(H:H, A:A, $C$1, C:C, " & i & ")"
        ' G: Restgæld (Kol I)
        ws.Cells(r, "G").Formula = "=SUMIFS(I:I, A:A, $C$1, C:C, " & i & ")"
        ' H: Rente + Bidrag
        ws.Cells(r, "H").FormulaR1C1 = "=RC[-4]+RC[-3]" ' =SUM(D_r + E_r)
        ' I: StartGæld (Kol D) - Til check
        ws.Cells(r, "I").Formula = "=SUMIFS(D:D, A:A, $C$1, C:C, " & i & ")"
    Next i

    ' Total-summering (Række 9)
    ws.range("C9:I9").FormulaR1C1 = "=SUM(R[-4]C:R[-1]C)"
    ws.range("G9").Formula = "=G8"
    ws.range("B9:I9").Font.Bold = True

    ' Formatering af summeringsområde
    ws.range("C5:I9").numberFormat = "#,##0;-#,##0"

    '==========================================================
    ' --- Sektion 2: INPUT-DATABASE (NEDERST) ---
    '==========================================================

    ' Kolonneoverskrifter (A15:I15)
    headers = Array("BudgetÅr", "Lån Navn", "TerminNr", "StartGæld (v/ Trm 1)", "Ydelse", "Bidrag", "Rente", "Afdrag", "RestgældUltimo")
    For m = LBound(headers) To UBound(headers)
        ws.Cells(inputHeaderRow, 1 + m).value = headers(m)
    Next m

    With ws.range(ws.Cells(inputHeaderRow, "A"), ws.Cells(inputHeaderRow, "I"))
        .Font.Bold = True
        .Interior.Color = RGB(220, 220, 220)
        .Borders(9).LineStyle = 1 ' xlEdgeBottom
    End With

    ' --- Indsæt FORMEL-KÆDE i 500 rækker ---
    Dim rStart As Long
    rStart = inputHeaderRow + 1

    ' Kolonne I (RestgældUltimo) - DENNE ER LÅST
    ' =HVIS(C16=1; D16-H16; I15-H16)
    ws.range(ws.Cells(rStart, "I"), ws.Cells(lastInputRow, "I")).FormulaR1C1 = _
        "=IF(RC[-6]=1, RC[-5]-RC[-1], IF(RC[-6]<>"""", R[-1]C-RC[-1], """"))"

    ' Formater input-området
    ws.range(ws.Cells(rStart, "D"), ws.Cells(lastInputRow, "I")).numberFormat = "#,##0;[Red]-#,##0"


    '==========================================================
    ' --- Sektion 3: OPSÆTNING AF ARK ---
    '==========================================================

    ' Navngiv summeceller for afdrag (F5:F8)
    For m = 1 To 4
        Dim nm As String, addr As String
        nm = installmentNamePrefix & "_" & m
        addr = "='" & ws.Name & "'!" & ws.Cells(firstSummaryDataRow + m - 1, "F").Address

        On Error Resume Next
        wb.names(nm).Delete
        On Error GoTo Err_Handler
        wb.names.Add Name:=nm, RefersTo:=addr
    Next m

    ' Kolonnebredder
    ws.Columns("A").ColumnWidth = 10 ' BudgetÅr
    ws.Columns("B").ColumnWidth = 25 ' Lån Navn
    ws.Columns("C").ColumnWidth = 10 ' TerminNr
    ws.Columns("D").ColumnWidth = 20 ' StartGæld (v/ Trm 1)
    ws.Columns("E").ColumnWidth = 14 ' Ydelse
    ws.Columns("F").ColumnWidth = 14 ' Bidrag
    ws.Columns("G").ColumnWidth = 14 ' Rente
    ws.Columns("H").ColumnWidth = 14 ' Afdrag
    ws.Columns("I").ColumnWidth = 16 ' RestgældUltimo

    ' Skjul kolonner
    ws.Columns("J:XFD").EntireColumn.Hidden = True

    ' Beskyt/Lås: alt låst, undtagen input-databasen
    ws.Cells.Locked = True

    ' Lås op for A:H (men IKKE Kolonne I, som indeholder kæde-formlen)
    ws.range(ws.Cells(rStart, "A"), ws.Cells(lastInputRow, "H")).Locked = False

    On Error Resume Next
    ws.Protect password:="", AllowFormattingCells:=True, AllowFormattingColumns:=True, AllowFormattingRows:=True
    On Error GoTo Err_Handler

    ' Frys top (så header og summering altid er synlige, og input-header er synlig ved scroll)
    ws.Activate
    app.ActiveWindow.SplitColumn = 0
    app.ActiveWindow.SplitRow = inputHeaderRow ' Frys over input-header rækken
    app.ActiveWindow.FreezePanes = True

    ' Vælg første input celle
    ws.Cells(rStart, "A").Select

Exit_Handler:
    Set ws = Nothing
    Set wsAfter = Nothing
    Set app = Nothing
    Exit Sub

Err_Handler:
    MsgBox "Fejl " & Err.Number & " i CreateAfdragSheet: " & Err.Description, vbCritical
    Resume Exit_Handler
End Sub '========================== KALD: DE 5 FANER ==========================
Public Sub Write_AllInvestmentSheets(ByVal wb As Object, ByVal BudgetYear As Long)
    ' Forudsætter at fanen "Resultat" allerede findes.
    ' 1) Inv. Forbedring ejendomme inkl. skødeomk. (placeres til højre for Resultat)
    Call CreateInvestmentSheet(wb, "Resultat", _
        "Inv. Forbedring ejendomme", _
        "Investering/Forbedring ejendomme inklusiv skødeomk.", _
        BudgetYear, "InvEjn", False)

    ' 2) Inv. lejede lokaler (til højre for forrige) + frys top
    Call CreateInvestmentSheet(wb, "Inv. Forbedring ejendomme", _
        "Inv. lejede lokaler", _
        "Investering i indretning af lejede lokaler", _
        BudgetYear, "InvLej", True)

    ' 3) Inv. driftsmidler (til højre) + frys top
    Call CreateInvestmentSheet(wb, "Inv. lejede lokaler", _
        "Inv. driftsmidler", _
        "Investeringer i driftsmidler", _
        BudgetYear, "InvDrf", True)

    ' 4) Inv. værdipapirer (til højre) + frys top
    Call CreateInvestmentSheet(wb, "Inv. driftsmidler", _
        "Inv. værdipapirer", _
        "Investeringer i værdipapirer", _
        BudgetYear, "InvVær", True)

    ' 5) Låneoptagelse (til højre) + frys top
    Call CreateInvestmentSheet(wb, "Inv. værdipapirer", _
        "Låneoptagelse", _
        "Belåning - låneprovenu - brutto", _
        BudgetYear, "LånOpt", True)

    Call CreateAfdragSheet(wb, "Låneoptagelse", _
        "Lån afdrag.", _
        "Kreditforenings- og prioritetslån", _
        BudgetYear, "LånAfdr")

End Sub
' C = SUM(Srow:AFrow)
Private Sub Bal_PrimoFromSum(ws As Object, ByVal row As Long)
    ws.Cells(row, "C").Formula = "=SUM(S" & row & ":AF" & row & ")"
End Sub

' D:O = forrige kolonne (ren fremrulning: =C, =D, =E, ...)
Private Sub Bal_CopyForward(ws As Object, ByVal row As Long)
    Dim m As Variant, i As Long, prevCol As String
    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    prevCol = "C"
    For i = 0 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=" & prevCol & row
        prevCol = m(i)
    Next i
End Sub

' D:O = forrige kolonne - 'Samlet Budget'![G..R]<række for kontonummer i kolonne B>
Private Sub Bal_RunMinusBudget(ws As Object, ByVal row As Long, ByVal budAccount As Long)
    Dim m As Variant, b As Variant
    Dim i As Long
    Dim prevCol As String
    Dim budRow As Long

    ' Find rækken i 'Samlet Budget' ud fra kontonummer
    budRow = Bal_GetBudgetRowFromAccount(ws, budAccount)

    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    b = Array("F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q")
    prevCol = "C"

    For i = 0 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=" & prevCol & row & "-'Samlet Budget'!" & b(i) & budRow
        prevCol = m(i)
    Next i
End Sub

' D:O = forrige kolonne - 'Samlet Budget'![G..R]<række for kontonummer i kolonne B> - Likviditet![D..O]likvRow
Private Sub Bal_RunMinusBudgetMinusLikv(ws As Object, ByVal row As Long, ByVal budAccount As Long, ByVal likvRow As Long)
    Dim m As Variant, b As Variant, l As Variant
    Dim i As Long
    Dim prevCol As String
    Dim budRow As Long

    ' Find rækken i 'Samlet Budget' ud fra kontonummer
    budRow = Bal_GetBudgetRowFromAccount(ws, budAccount)

    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    b = Array("F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q")
    l = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    prevCol = "C"

    For i = 0 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=" & prevCol & row & _
                                      "-'Samlet Budget'!" & b(i) & budRow & _
                                      "-Likviditet!" & l(i) & likvRow
        prevCol = m(i)
    Next i
End Sub


' D:O = forrige kolonne - Likviditet![D..O]likvRow
Private Sub Bal_RunMinusLikv(ws As Object, ByVal row As Long, ByVal likvRow As Long)
    Dim m As Variant, l As Variant, i As Long, prevCol As String
    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    l = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    prevCol = "C"
    For i = 0 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=" & prevCol & row & "-Likviditet!" & l(i) & likvRow
        prevCol = m(i)
    Next i
End Sub

' D:O = forrige kolonne + Likviditet![D..O]likvRow
Private Sub Bal_RunPlusLikv(ws As Object, ByVal row As Long, ByVal likvRow As Long)
    Dim m As Variant, l As Variant, i As Long, prevCol As String
    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    l = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    prevCol = "C"
    For i = 0 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=" & prevCol & row & "+Likviditet!" & l(i) & likvRow
        prevCol = m(i)
    Next i
End Sub

' D:O = forrige kolonne + Likviditet![D..O]row1 + Likviditet![D..O]row2
Private Sub Bal_RunPlusTwoLikv(ws As Object, ByVal row As Long, ByVal likvRow1 As Long, ByVal likvRow2 As Long)
    Dim m As Variant, l As Variant, i As Long, prevCol As String
    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    l = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    prevCol = "C"
    For i = 0 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=" & prevCol & row & "+Likviditet!" & l(i) & likvRow1 & "+Likviditet!" & l(i) & likvRow2
        prevCol = m(i)
    Next i
End Sub

' D:O = Likviditet![D..O]likvRow (ingen løbende sum)
Private Sub Bal_FromLikv(ws As Object, ByVal row As Long, ByVal likvRow As Long)
    Dim m As Variant, l As Variant, i As Long
    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    l = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    For i = 0 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=Likviditet!" & l(i) & likvRow
    Next i
End Sub
' Række row: akkumuleret årsresultat fra konto i 'Samlet Budget'
' D = G[konto-række]
' E:O = forrige kolonne + H..R[konto-række]
Private Sub Bal_AccumFromBudget(ws As Object, ByVal row As Long, ByVal budAccount As Long)
    Dim m As Variant, b As Variant
    Dim i As Long
    Dim budRow As Long

    ' Find rækken i 'Samlet Budget' ud fra kontonummer
    budRow = Bal_GetBudgetRowFromAccount(ws, budAccount)

    m = Array("D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
    b = Array("F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q")

    ' Første måned (D): ren reference til Samlet Budget
    ws.Cells(row, m(0)).Formula = "='Samlet Budget'!" & b(0) & budRow

    ' Resten: forrige kolonne + Samlet Budget
    For i = 1 To UBound(m)
        ws.Cells(row, m(i)).Formula = "=" & m(i - 1) & row & "+'Samlet Budget'!" & b(i) & budRow
    Next i
End Sub

' Finder rækken i 'Samlet Budget' ud fra kontonummer i kolonne B
Private Function Bal_GetBudgetRowFromAccount(ws As Object, ByVal budAccount As Long) As Long
    Dim wb As Object
    Dim sh As Object
    Dim rng As Object
    Dim f As Object

    ' ws er Balance-arket – vi bruger Parent til at finde workbook
    Set wb = ws.Parent
    Set sh = wb.Worksheets("Samlet Budget")

    ' Søg i kolonne B efter kontonummeret
    Set rng = sh.Columns("B")

    Set f = rng.Find(What:=Replace(Replace(CStr(budAccount), Chr(160), ""), " ", ""), _
                     LookIn:=-4163, _
                     LookAt:=1, _
                     SearchOrder:=1, _
                     SearchDirection:=1, _
                     MatchCase:=False)

    If f Is Nothing Then
        Err.Raise vbObjectError + 513, "Bal_GetBudgetRowFromAccount", _
                  "Kontonummer " & budAccount & " blev ikke fundet i 'Samlet Budget'!B:B."
    End If

    Bal_GetBudgetRowFromAccount = f.row
End Function
