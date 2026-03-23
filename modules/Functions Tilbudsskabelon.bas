Attribute VB_Name = "Functions Tilbudsskabelon"
Option Compare Database
Option Explicit
Dim trs As ADODB.Recordset
Dim lrs As ADODB.Recordset
Dim IbRs As ADODB.Recordset
Dim dblE24 As Double

Function fncCreateTilbud(strAfd As String)
Dim i As Integer
Dim j As Integer
Dim k As Integer
Dim strFldNme(540) As String
Dim strFldLtr(5)

'Oprettelse af hele tilbudsskabelonen i virtuelt kartotek
Set trs = New ADODB.Recordset

    strFldLtr(0) = "A"
    strFldLtr(1) = "B"
    strFldLtr(2) = "D"
    strFldLtr(3) = "E"
    strFldLtr(4) = "F"
    strFldLtr(5) = "G"

    k = 1

    For j = 0 To 5
        i = 1
        For i = 1 To 88
            If i < 10 Then
                strFldNme(k) = strFldLtr(j) & "0" & CStr(i)
            Else
                strFldNme(k) = strFldLtr(j) & CStr(i)
            End If
            k = k + 1
        Next i
    Next j

    i = 1
    j = 0

    With trs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic


        'Create fields
        For i = i To k
            If strFldNme(i) <> "" Then
                If i < 89 Then
                    .Fields.Append strFldNme(i), adVarChar, 250
                Else
                    .Fields.Append strFldNme(i), adDouble
                End If
            End If

        Next i

        .Fields.Append "Afd", adVarChar, 50
        .Fields.Append "AfdU", adVarChar, 50
        .Fields.Append "Year_", adInteger
        .Fields.Append "BelPct", adDouble
        .Fields.Append "Kommentar", adVarChar, 2500
        .Fields.Append "A_Oms", adInteger
        .Fields.Append "B_OverUnderskud", adDouble
        .Fields.Append "C_OverUnderPctOms", adDouble
        .Fields.Append "I_Lønomk", adDouble
        .Fields.Append "J_OmkBest", adDouble
        .Fields.Append "K_LønBorPer", adDouble
        .Fields.Append "L_LønAdmTek", adDouble
        .Fields.Append "M_OmkIkFast", adDouble
        .Fields.Append "N_OmkKomp", adDouble
        .Fields.Append "O_LønOmkPctOms", adDouble
        .Fields.Append "P_OmkKomPctOms", adDouble
        .Fields.Append "Q_OmkAdmPctOms", adDouble
        .Fields.Append "R_BorOmkPctOms", adDouble
        .Fields.Append "S_EjdOmkPctOms", adDouble


    End With

'Bruges til at sætte yderligere indtægtslinjer ind på 5+ ydelser
Set lrs = New ADODB.Recordset
    With lrs

        .Fields.Append "AfdU", adVarChar, 50
        .Fields.Append "Antal", adDouble
        .Fields.Append "BelPct", adDouble
        .Fields.Append "Indtægter", adVarChar, 250
        .Fields.Append "Takst", adDouble
        .Fields.Append "Year_", adInteger

    End With
'Bruges til at indlæse hele det interne budget til senere brug
Set IbRs = New ADODB.Recordset
    With IbRs

        .Fields.Append "Afd", adVarChar, 50
        .Fields.Append "AfdU", adVarChar, 50
        .Fields.Append "Year_", adInteger
        .Fields.Append "Konto", adVarChar, 10
        .Fields.Append "KontoType", adVarChar, 25
        .Fields.Append "EstFrm", adDouble
        .Fields.Append "BudgetIalt", adDouble

    End With


End Function
Function fncStamdata(strAfd As String, intYear As Integer)
Dim rs As DAO.Recordset
Dim dB As DAO.Database
Dim str As String
Dim strLookupAfd As String

    ' Hvis kaldt fra Prisberegning, brug den rigtige afdeling til opslag i tblAfdeling
    If Nz(TempVars("isFromPrisberegning"), False) = True Then
        strLookupAfd = Nz(TempVars("currentAfdeling"), strAfd)
    Else
        strLookupAfd = strAfd
    End If

    If strAfd = "999" Then
        str = "SELECT * FROM tblAfdeling"
    Else
        str = "SELECT * FROM tblAfdeling WHERE [AfdNr Uniconta] = '" & strLookupAfd & "' And Year_ = " & intYear
    End If

    Set dB = CurrentDb
    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    With trs
        If .State = 0 Then
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        If Not rs.EOF Then
            Do Until rs.EOF
                    .AddNew
                    .Fields("AfdU").value = strAfd    ' <-- PrisberegningNavn, IKKE rs![AfdNr Uniconta]
                    .Fields("Year_").value = intYear
                    .Fields("A05").value = Nz(rs!AfdelingsNavn, "")
                    .Fields("A06").value = Nz(rs!Adresse, "")
                    .Fields("A07").value = Nz(rs!PostBy, "")
                    .Fields("A08").value = Nz(rs!Afdelingsleder, "")
                    .Fields("A09").value = Nz(rs!Tlf_Mail, "")
                    .Fields("E05").value = intYear
                    .Update
                rs.MoveNext
            Loop
        End If
    End With

    rs.Close
    Set rs = Nothing
    Set dB = Nothing

Debug.Print "fncStamdata: strAfd=" & strAfd & " strLookupAfd=" & strLookupAfd & " trs.RecordCount=" & trs.RecordCount

End Function
Function fncIndtægter(strAfd As String, intYear As Integer)
Dim rs As DAO.Recordset

Dim dB As DAO.Database
Dim str As String
Dim i As Integer

        Set dB = CurrentDb

        If lrs.State = 0 Then 'Check if the Recordset is closed
                lrs.CursorLocation = adUseClient
                lrs.CursorType = adOpenStatic
                lrs.LockType = adLockBatchOptimistic
                lrs.Open
        End If
'        lrs.MoveFirst

        If trs.State = 0 Then 'Check if the Recordset is closed
                trs.CursorLocation = adUseClient
                trs.CursorType = adOpenStatic
                trs.LockType = adLockBatchOptimistic
                trs.Open
        End If
        trs.MoveFirst

        'Her findes sammentællingen af de linjer der skal udgøre indtægter
        'DatoTil bliver tillagt 1 da antallet af dage f.eks. for et år ellers vil blive 364 i stedet for 365
        str = "SELECT Afdeling, Year_, Paragraf, Round(Sum(TotalTakstMdr), 0) As SumAmount, Sum((DatoTil - DatoFra) + 1) As Days_, ' - dagstakst' as IDtakst, Month(DatoFra) As DatoFraNum, Month(DatoTil) As DatoTilNum " & _
              "FROM tblTmpDebtor " & _
              "WHERE Afdeling = '" & strAfd & "' And Year_ = " & intYear & " " & _
              "GROUP BY Afdeling, Year_, Paragraf, Round(TotalTakstMdr, 0), Month(DatoFra), Month(DatoTil)"

        'Debug.Print str
        'Her findes den faste belægningsprocent
        Dim dblBelPct As Double

        dblBelPct = Nz(ELookup("Procent", "tblParm_ProcentSatser", "Konto = 'TP_BelægPct' And BudgetYear = " & intYear), 0)

        If dblBelPct = 0 Then
            MsgBox "Udfyld belægningsprocent under parametrene " & vbCrLf & "'Pct satser uden konto'"
        End If

        'Her udfyldes alt hvad der har med indtægter at gøre
        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

            If Not rs.EOF Then
                i = 1
                Do Until rs.EOF

                    Dim strFieldName(4) As String
                    Dim strPar As String
                    Dim dblSumYear As Double

                    If Left(rs!Paragraf, 1) <> "§" Then
                        strPar = "§85"
                    Else
                        strPar = rs!Paragraf
                    End If

                    'De første 5 linjer udfyldes
                    If i < 6 Then

                        With trs
                            .filter = "Year_ = " & intYear & " AND AfdU = '" & strAfd & "'"
                            If Not .EOF And Not .BOF Then
                                .MoveFirst
                                Do Until .EOF

                                    If Nz(rs!SumAmount, 0) > 0 Then 'Der er linjer med Xtratakst der er nul, da ikke alle har ekstra takst

                                        strFieldName(1) = "A" & CStr(18 + i)
                                        strFieldName(2) = "B" & CStr(18 + i)
                                        strFieldName(3) = "D" & CStr(18 + i)
                                        strFieldName(4) = "G" & CStr(18 + i)

                                        dblSumYear = ((rs!DatoTilNum - rs!DatoFraNum) + 1) * rs!SumAmount

                                        .Fields(strFieldName(1)).value = Nz(strPar, "") & Nz(rs!IDtakst, "")
                                        .Fields(strFieldName(2)).value = Nz(rs!Days_, 0)
                                        .Fields(strFieldName(3)).value = Round((dblSumYear / rs!Days_), 2)

'                                       Belægningsprocent skal være en standard procent og skal ikke beregnes.
                                        .Fields(strFieldName(4)).value = dblBelPct * 100

                                        'Sum af indtægter til E24
                                        dblE24 = dblE24 + dblSumYear
                                        '''Debug.Print .Fields(strFieldName(1)).Value, .Fields(strFieldName(2)).Value, .Fields(strFieldName(3)).Value, .Fields(strFieldName(4)).Value

                                        dblSumYear = 0

                                    End If
                                    .MoveNext
                                Loop
                            End If
                            .filter = "" ' Remove the filter
                        End With

                    Else 'resten skal på fanen 5+ ekstra ydelser

                        dblSumYear = ((rs!DatoTilNum - rs!DatoFraNum) + 1) * Nz(rs!SumAmount, 0)

                        With lrs
                            .AddNew

                            .Fields("AfdU").value = strAfd
                            .Fields("Year_").value = intYear
                            .Fields("Indtægter").value = Nz(strPar, "") & Nz(rs!IDtakst, "")
                            .Fields("Antal").value = Nz(rs!Days_, 0)
                            .Fields("Takst").value = Round((dblSumYear / rs!Days_), 2)
                            .Fields("BelPct").value = dblBelPct * 100

                            dblE24 = dblE24 + dblSumYear

                            dblSumYear = 0

                            'Sum af indtægter til E24

                            .Update

                             '''Debug.Print .Fields("Indtægter").value, .Fields("Antal").value, .Fields("Takst").value, .Fields("BelPct").value

                        End With
                    End If
                    '''Debug.Print rs!Afdeling, rs!Year_, rs!Paragraf, rs!SumAmount, rs!cnt, rs!IDTakst
                    i = i + 1
                    rs.MoveNext
                Loop
            End If


    rs.Close
    Set rs = Nothing
    Set dB = Nothing
End Function
Function fncPersonale(strAfd As String, intYear As Integer)
Dim rs As DAO.Recordset
Dim dB As DAO.Database
Dim str As String
Dim i As Integer

        Set dB = CurrentDb

        If trs.State = 0 Then 'Check if the Recordset is closed
                trs.CursorLocation = adUseClient
                trs.CursorType = adOpenStatic
                trs.LockType = adLockBatchOptimistic
                trs.Open
        End If
        trs.MoveFirst

        If IbRs.State = 0 Then 'Check if the Recordset is closed
                IbRs.CursorLocation = adUseClient
                IbRs.CursorType = adOpenStatic
                IbRs.LockType = adLockBatchOptimistic
                IbRs.Open
        End If
        'IbRs.MoveFirst

'Indlæsning af data til IbRs = Internt budget
    str = "SELECT Afdeling, Year_, Konto, Kontotype, EstimatFremskrevet, BudgetIalt " & _
          "FROM tblInterntBudget " & _
          "WHERE Year_ = " & intYear & " "

    If strAfd <> "999" Then
        str = str & " And Afdeling = '" & strAfd & "'"
    End If

    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    If Not rs.EOF Then
        Do Until rs.EOF

            IbRs.AddNew
            IbRs.Fields("AfdU").value = rs!Afdeling
            IbRs.Fields("Year_").value = rs!Year_
            IbRs.Fields("Konto").value = rs!Konto
            IbRs.Fields("Kontotype").value = rs!Kontotype
            IbRs.Fields("EstFrm").value = Nz(rs!EstimatFremskrevet, 0)
            IbRs.Fields("BudgetIalt").value = Nz(rs!BudgetIalt, 0)
            IbRs.Update

'''Debug.Print IbRs.Fields("AfdU").Value, IbRs.Fields("Year_").Value, IbRs.Fields("Konto").Value, IbRs.Fields("Kontotype").Value, IbRs.Fields("EstFrm").Value, IbRs.Fields("BudgetIalt").Value,

            rs.MoveNext
        Loop
    End If

'Tøjpenge
    Dim dblTøjpenge As Double
    Dim dblKto_1100 As Double
    Dim dblKto_1102 As Double
    Dim dblKto_1103 As Double
    Dim dblKto_1104 As Double
    Dim dblKto_1105 As Double
    Dim dblKto_1135 As Double
    Dim dblKto_1198 As Double
    Dim dblRestLøn As Double
    Dim dblSum_1100_1104 As Double


    With IbRs
        .filter = "Year_ = " & intYear & " AND AfdU = '" & strAfd & "' And Konto > '1099' And Konto < '1199'"
            If Not .EOF And Not .BOF Then
                .MoveFirst
                    Do Until .EOF
                        Select Case .Fields("Konto").value
                            Case "1100"
                                dblKto_1100 = Nz(.Fields("BudgetIalt").value, 0)
                                dblTøjpenge = Nz(.Fields("BudgetIalt").value, 0) - Nz(.Fields("EstFrm").value, 0)
                                dblSum_1100_1104 = dblSum_1100_1104 + Nz(.Fields("BudgetIalt").value, 0)
                            Case "1102"
                                dblKto_1102 = Nz(.Fields("BudgetIalt").value, 0)
                                dblSum_1100_1104 = dblSum_1100_1104 + Nz(.Fields("BudgetIalt").value, 0)
                            Case "1103"
                                dblKto_1103 = Nz(.Fields("BudgetIalt").value, 0)
                                dblSum_1100_1104 = dblSum_1100_1104 + Nz(.Fields("BudgetIalt").value, 0)
                            Case "1104"
                                dblKto_1104 = Nz(.Fields("BudgetIalt").value, 0)
                                dblSum_1100_1104 = dblSum_1100_1104 + Nz(.Fields("BudgetIalt").value, 0)
                            Case "1105"
                                dblKto_1105 = Nz(.Fields("BudgetIalt").value, 0)
                            Case "1135"
                                dblKto_1135 = Nz(.Fields("BudgetIalt").value, 0)
                            Case "1198"
                                dblKto_1198 = Nz(.Fields("BudgetIalt").value, 0)
                        End Select

                        .MoveNext
                    Loop
                .filter = ""
            End If
    End With

'''Debug.Print "Afdeling: ", strAfd
'''Debug.Print "Gager mv", dblKto_1100, dblTøjpenge, dblKto_1102, dblKto_1103, dblKto_1104, dblKto_1198

'Restløn udregnes  I alt kto. 1198 - Sum(1100:1104)
    dblRestLøn = dblKto_1198 - dblSum_1100_1104 + dblTøjpenge - dblKto_1135 - dblKto_1105

'Debug.Print "restløn: ", dblRestLøn, "Konto 1198 ", dblKto_1198, "1100-1104: ", dblSum_1100_1104, " Tøjpenge: ", dblTøjpenge, " 1135: ", dblKto_1135, " 1105: ", dblKto_1105

'Her skal PERSONALEOMKOSTNINGER udfyldes

    trs.filter = "Year_ = " & intYear & " AND AfdU = '" & strAfd & "'"
    If Not trs.EOF And Not trs.BOF Then
        trs.MoveFirst
        Do Until trs.EOF

            'Fordeling af løn på LEDER, BORGERRELATERET Faglært og ufaglært samt årsvæker på hver af dem

                Dim strSQL As String
                Dim parmAfdeling As String

                parmAfdeling = strAfd 'ELookup("Afdeling", "tblAfdeling", "[AfdNr Uniconta] = '" & strAfd & "'")



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'HER SKAL DER TJEKKES FOR OM VALGFRI1 ER UDFYLDT OG HVIS
'DER ER TALE OM EN BORGERREL SKAL VALGFRI3 TJEKKES FOR OM DET ER FAGLÆRT/UFAGLÆRT
'Den 28-05-2025 kl. 13.39 efter samtale med Anna og Susanne
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


      strSQL = "SELECT " & _
                "main.Kategori, " & _
                "SUM(main.TotalBeløbBudgetDÅ) AS SumTotalBeløbBudgetDÅ_Cat, " & _
                "Nz(sub.SumTotalNormtidDÅ, 0) AS SumTotalNormtidDÅ_Cat, " & _
                "(SUM(main.TotalBeløbBudgetDÅ) / " & _
                    "(SELECT SUM(TotalBeløbBudgetDÅ) " & _
                     "FROM tblTmpMedarbejder " & _
                     "WHERE Afdeling = '" & parmAfdeling & "' AND Year_ = " & intYear & ") * 100) AS SumTotalBeløbBudgetDÅ_Percent " & _
            "FROM " & _
                "(SELECT " & _
                    "IIF(Nz(Valgfri3, '') = '', Valgfri1, Valgfri1 & '-' & Valgfri3) AS Kategori, " & _
                    "TotalBeløbBudgetDÅ, " & _
                    "TotalNormtidDÅ " & _
                 "FROM tblTmpMedarbejder " & _
                 "WHERE Afdeling = '" & parmAfdeling & "' AND Year_ = " & intYear & ") AS main " & _
            "LEFT JOIN " & _
                "(SELECT " & _
                    "IIF(Nz(Valgfri3, '') = '', Valgfri1, Valgfri1 & '-' & Valgfri3) AS Kategori, " & _
                    "SUM(TotalNormtidDÅ) AS SumTotalNormtidDÅ " & _
                 "FROM tblTmpMedarbejder " & _
                 "WHERE Afdeling = '" & parmAfdeling & "' AND Year_ = " & intYear & " AND (Lønart = '1000' OR Lønart = '9900') " & _
                 "GROUP BY IIF(Nz(Valgfri3, '') = '', Valgfri1, Valgfri1 & '-' & Valgfri3)) AS sub " & _
            "ON main.Kategori = sub.Kategori " & _
            "GROUP BY main.Kategori, sub.SumTotalNormtidDÅ"


''Debug.Print "strSQL: ", strSQL



                Set rs = dB.OpenRecordset(strSQL, dbOpenDynaset, dbSeeChanges)
                Dim dbl
                With rs
                    If Not .EOF Then
                        Do Until .EOF

'Debug.Print "Kategori og Summer: ", !Kategori, !SumTotalBeløbBudgetDÅ_Cat, !SumTotalBeløbBudgetDÅ_Percent, Nz(!SumTotalNormtidDÅ_Cat / 1923.96, 0), !SumTotalNormtidDÅ_Cat
'Debug.Print dblRestLøn



                           If Left(!Kategori, 5) = "LEDER" Then
                                trs.Fields("E39").value = !SumTotalBeløbBudgetDÅ_Cat + (dblRestLøn * (!SumTotalBeløbBudgetDÅ_Percent * 0.01))
                                trs.Fields("D39").value = Nz(!SumTotalNormtidDÅ_Cat / 1923.96, 0)




                                'Debug.Print "LEDER: ", !SumTotalBeløbBudgetDÅ_Cat, dblKto_1102, dblRestLøn, !SumTotalBeløbBudgetDÅ_Percent
                            End If

                            If Left(!Kategori, 11) = "BORGERREL-F" Then
                                trs.Fields("E40").value = !SumTotalBeløbBudgetDÅ_Cat + (dblRestLøn * (!SumTotalBeløbBudgetDÅ_Percent * 0.01))
                                trs.Fields("D40").value = Nz(!SumTotalNormtidDÅ_Cat / 1923.96, 0)

                                'Debug.Print "BORGERREL-F", !SumTotalBeløbBudgetDÅ_Cat, dblKto_1104, dblRestLøn, !SumTotalBeløbBudgetDÅ_Percent
                            End If

                            If Left(!Kategori, 11) = "BORGERREL-U" Then
                                trs.Fields("E41").value = !SumTotalBeløbBudgetDÅ_Cat + (dblRestLøn * (!SumTotalBeløbBudgetDÅ_Percent * 0.01))
                                trs.Fields("D41").value = Nz(!SumTotalNormtidDÅ_Cat / 1923.96, 0)

                                'Debug.Print "BORGERREL-U", !SumTotalBeløbBudgetDÅ_Cat, dblKto_1104, dblRestLøn, !SumTotalBeløbBudgetDÅ_Percent
                            End If

                            If Left(!Kategori, 3) = "ADM" Then
                                trs.Fields("E43").value = !SumTotalBeløbBudgetDÅ_Cat + (dblRestLøn * (!SumTotalBeløbBudgetDÅ_Percent * 0.01))
                                trs.Fields("D43").value = Nz(!SumTotalNormtidDÅ_Cat / 1923.96, 0)

                                'Debug.Print "ADM", !SumTotalBeløbBudgetDÅ_Cat, dblKto_1104, dblRestLøn, !SumTotalBeløbBudgetDÅ_Percent
                            End If

                            'Debug.Print !Afdeling, !Kategori, !SumOfTotalBeløbBudgetDÅ, !PercentageOfTotal, !SumOfAvgNormtid
                            .MoveNext
                        Loop


                        'Udregning af normering af ikke-fastansat personale
                        '13-11-2026 besluttede vi at lade beløbet på kto. 1105 og timelønnen på løntrin 2 være udgangspunkt for udregningen af årsværker.
                        'Derfor skal timelønnen fra løntrin 2 igennem funktionen BeregnPersonaleOmkostning(AntalTImer, Ugebeløb,LønTrin,Årstal) for at finde
                        'den fulde timeløn. Den bliver så brugt til at finde antallet af timer pr. år, som så skal divideres 1924

                        Dim dblAvg_Timeløn As Double
                        Dim dblAvg_TimelønMTill As Double
                        Dim dblAvg_MdLønMTill As Double


                        If dblKto_1105 > 0 Then

                            dblAvg_Timeløn = ELookup("Beløb", "tblParm_Timeløn", "BudgetYear = " & intYear & " And Konto = '2'")

                            dblAvg_MdLønMTill = BeregnPersonaleOmkostning(1, dblAvg_Timeløn, "2", intYear)

                            dblAvg_TimelønMTill = Nz(dblAvg_MdLønMTill * 12 / 52, 0)

                            trs.Fields("D42").value = Nz((dblKto_1105 / (dblAvg_TimelønMTill) / 1924), 0)

                            Debug.Print "Beløb fra 1105  : ", dblKto_1105
                            Debug.Print "Løntrin 2 hentet: ", dblAvg_Timeløn
                            Debug.Print "Timeløn m tillæg: ", dblAvg_TimelønMTill



                        End If


                        'Her sætter jeg fællesbidraget ind i LEDER, da det ikke er sikkert at der ER en LEDER på afdelingen - meget usandsynligt, men nu er det gjort
                        'Kontraordre den 06-12-2023, for at undgå at der skal udregnes årsværker, så skal det ned i E58
                        'Kontraordre den 11-08-2025, nu skal 1102 ind i E39 og årsværk for Fællesbidrags opgørelse af årsværk til LEDELSE skal tillægges D39.

                        Dim dblFBårvLED As Double
                        Dim dblFBårvADM As Double
                        Dim strFBAfd As String

                        If Nz(TempVars("isFromPrisberegning"), False) = True Then
                            strFBAfd = Nz(TempVars("currentAfdeling"), strAfd)
                        Else
                            strFBAfd = strAfd
                        End If

                        strSQL = "SELECT Konto_1, Year_, [" & strFBAfd & "] FROM tblFBBudget " & _
                                 "WHERE Year_ = " & intYear & " " & _
                                 "AND (Konto_1 = 'LEDER' OR Konto_1 = 'ADM_TEKNIK')"

                        Set rs = dB.OpenRecordset(strSQL, dbOpenDynaset, dbSeeChanges)

                            With rs
                                If Not .EOF Then
                                    Do Until .EOF
                                    Select Case !Konto_1
                                            Case Is = "LEDER"
                                                dblFBårvLED = rs.Fields(strFBAfd).value
                                            Case Is = "ADM_TEKNIK"
                                                dblFBårvADM = rs.Fields(strFBAfd).value
                                    End Select
                                    .MoveNext
                                    Loop

                                End If
                            End With

                        'Debug.Print dblFBårvLED
                        'Debug.Print dblFBårvADM

                        trs.Fields("E39").value = trs.Fields("E39").value + dblKto_1102
                        trs.Fields("D39").value = trs.Fields("D39").value + Nz(dblFBårvLED, 0) 'Her skal årsværker for FB Ledelse indsættes


                        'Her sætter jeg fællesbidraget ind i ADM/TEKNIK, da det ikke er sikkert at der ER noget ADM personale på afdelingen
                        'Også her er der kontraordre 06-12-2023 - se ovenfor

                        trs.Fields("E43").value = trs.Fields("E43").value + dblKto_1103 + dblKto_1104
                        trs.Fields("D43").value = trs.Fields("D43").value + Nz(dblFBårvADM, 0) 'Her skal årsværker for FB ADM/Teknik indsættes

                        trs.Fields("Kommentar").value = "Fællesbidraget vedr. samlet ledelse udgør kr.: " & Format(dblKto_1102, "#,##0.00") & vbCrLf & _
                                                        "og indgår i summen for 'Samlet ledelse'." & vbCrLf & _
                                                        "Fællesbidraget vedrørende Administrativt og teknisk personale udgør kr.: " & Format(dblKto_1103 + dblKto_1104, "#,##0.00") & vbCrLf & _
                                                        "og indgår i summen for 'Administrativt og teknisk personale'." & vbCrLf & _
                                                        "Alle vores lønninger er overenskomstforhandlet." & vbCrLf & _
                                                        "Rådighedstillægget udgør kr. 7.500 pr. måned pr. hele årsværk og er indregnet i den samlede lønsum." & vbCrLf & _
                                                        "For udspecificering af fællesbidragets indhold henvises til fanen 'Bilag'." & vbCrLf


                    End If
                End With

            trs.MoveNext
        Loop
    End If
    trs.filter = "" ' Remove the filter

    rs.Close
    Set rs = Nothing
    Set dB = Nothing


End Function
Function fncOmkostninger(strAfd As String, intYear As Integer)
Dim rs As DAO.Recordset
Dim dB As DAO.Database
Dim str As String
Dim i As Integer

    Set dB = CurrentDb

    If trs.State = 0 Then 'Check if the Recordset is closed
            trs.CursorLocation = adUseClient
            trs.CursorType = adOpenStatic
            trs.LockType = adLockBatchOptimistic
            trs.Open
    End If
    trs.MoveFirst

    trs.filter = "Year_ = " & intYear & " AND AfdU = '" & strAfd & "'"
    If Not trs.EOF And Not trs.BOF Then
        Do Until trs.EOF

            str = "SELECT Sum(i.BudgetIalt) as SumBudget, t.Placering " & _
                  "FROM tblInterntBudget i " & _
                  "LEFT JOIN tblKontoPlan_Tilbudsskabelon as t " & _
                  "ON i.Konto = t.Konto " & _
                  "WHERE i.Afdeling = '" & strAfd & "' And i.Year_ = " & intYear & " And i.Konto > '1104' " & _
                  "GROUP BY t.Placering"


'''Debug.Print str


            Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
            Dim strPlacering As String
            If Not rs.EOF Then
                Do Until rs.EOF

                    If IsNull(rs!placering) = False Then
                        strPlacering = rs!placering
                        trs.Fields(strPlacering).value = Nz(rs!SumBudget, 0)

                        ''Debug.Print rs!Placering, rs!SumBudget, trs.Fields(strPlacering).Value
                    End If

                    rs.MoveNext
                Loop
            End If

        trs.MoveNext
        Loop
    End If
    trs.filter = "" ' Remove the filter


    rs.Close
    Set rs = Nothing
    Set dB = Nothing

End Function
Function fncNøgletal(strAfd As String, intYear As Integer)
Dim dblA_Oms As Double
Dim dblB_OverUnderskud As Double


    If trs.State = 0 Then 'Check if the Recordset is closed
            trs.CursorLocation = adUseClient
            trs.CursorType = adOpenStatic
            trs.LockType = adLockBatchOptimistic
            trs.Open
    End If
    trs.MoveFirst

    dblA_Oms = Nz(ELookup("BudgetIalt", "tblInterntBudget", "Konto = '1098' And Afdeling = '" & strAfd & "' And Year_ = " & intYear), 0)

    dblB_OverUnderskud = Nz(ELookup("BudgetIalt", "tblInterntBudget", "Konto = '2990' And Afdeling = '" & strAfd & "' And Year_ = " & intYear), 0)


    With trs
        .filter = "Year_ = " & intYear & " AND AfdU = '" & strAfd & "'"
        If Not .EOF And Not .BOF Then
            .MoveFirst
            Do Until .EOF

                .Fields("A_Oms").value = dblA_Oms
                .Fields("B_OverUnderskud").value = dblB_OverUnderskud
                .Fields("C_OverUnderPctOms").value = (Abs(dblB_OverUnderskud) * 100) / Abs(dblA_Oms)
                .Fields("I_Lønomk").value = .Fields("E39").value
                .Fields("J_OmkBest").value = .Fields("E44").value
                .Fields("K_LønBorPer").value = .Fields("E40").value + .Fields("E41").value
                .Fields("L_LønAdmTek").value = .Fields("E43").value
                .Fields("M_OmkIkFast").value = .Fields("E42").value
                .Fields("N_OmkKomp").value = .Fields("E63").value + .Fields("E64").value
                .Fields("O_LønOmkPctOms").value = ((.Fields("E39").value + .Fields("E40").value + .Fields("E41").value + .Fields("E42").value + .Fields("E43").value + .Fields("E44").value) * 100) / .Fields("A_Oms").value
                .Fields("P_OmkKomPctOms").value = .Fields("N_OmkKomp").value * 100 / .Fields("A_Oms").value
                .Fields("Q_OmkAdmPctOms").value = ((.Fields("E57").value + .Fields("E58").value + .Fields("E59").value) * 100) / .Fields("A_Oms").value
                .Fields("R_BorOmkPctOms").value = ((.Fields("E48").value + .Fields("E49").value + .Fields("E50").value + .Fields("E51").value + .Fields("E52").value + .Fields("E53").value) * 100) / .Fields("A_Oms").value
                .Fields("S_EjdOmkPctOms").value = ((.Fields("E69").value + .Fields("E70").value + .Fields("E71").value + .Fields("E72").value + .Fields("E73").value + .Fields("E74").value + .Fields("E75").value + .Fields("E78").value) * 100) / .Fields("A_Oms").value

                .MoveNext
            Loop
        End If
        .filter = "" ' Remove the filter

    End With
End Function
Function fncKoncernNote(strAfd As String, intYear As Integer)
Dim rsParm As DAO.Recordset
Dim rsKonNote As DAO.Recordset
Dim dB As DAO.Database
Dim str As String
Dim i As Integer
Dim dblBeløb As Double

'On Error GoTo ErrorHandler ' Initialize error handling

    Set dB = CurrentDb

    str = "DELETE FROM tblKoncernnote " & _
          "WHERE AfdU = '" & strAfd & "' And Year_ = " & intYear

    DoCmd.SetWarnings False

    DoCmd.RunSQL (str)

    str = "SELECT * FROM tblParm_Koncernnote " & _
          "WHERE Year_ = " & intYear & " ORDER BY ID"

    Set rsParm = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    With rsParm
        If Not .EOF Then
            Do Until .EOF

                dblBeløb = 0
                If Nz(!SamhandelsKonto, "") <> "" Then
                    dblBeløb = Nz(ELookup("BudgetIalt", "tblInterntBudget", "Afdeling = '" & strAfd & "' And Year_ = " & intYear & " And Konto = '" & !SamhandelsKonto & "'"), 0)
                Else
                    dblBeløb = 0
                End If

        str = "INSERT INTO tblKoncernNote ([AfdU], [Year_], [Note], [Post], [Samhandels-beløb], [Type af omkostning]) " & _
              "VALUES ('" & strAfd & "', " & _
              intYear & ", '" & !Note & "', '" & !Post & "', " & Replace(Format(dblBeløb, "###0.00"), ",", ".") & ", '" & ![Type af omkostning] & "')"

                DoCmd.RunSQL (str)

                .MoveNext
            Loop
        End If
    End With

Cleanup:
    ' Clean up objects and resume normal operations
    rsParm.Close
    Set rsParm = Nothing
    Set dB = Nothing
    DoCmd.SetWarnings True
    Exit Function

ErrorHandler:
    MsgBox "An error has occurred: " & Err.Description
    Resume Cleanup ' Clean up and exit function
End Function
Function CopyRecords()

    Dim dB As DAO.Database
    Dim rsDest As DAO.Recordset
    Dim fld As ADODB.field
    Dim strEY As String


    'On Error GoTo ErrorHandler

    ' Check if trs is closed, if so, open it
    If trs.State = 0 Then
        trs.CursorLocation = adUseClient
        trs.CursorType = adOpenStatic
        trs.LockType = adLockBatchOptimistic
        trs.Open
    End If
    trs.MoveFirst

    If lrs.State = 0 Then 'Check if the Recordset is closed
        lrs.CursorLocation = adUseClient
        lrs.CursorType = adOpenStatic
        lrs.LockType = adLockBatchOptimistic
        lrs.Open
    End If

    ' Initialize the DAO database and recordset
    Set dB = CurrentDb()
    Set rsDest = dB.OpenRecordset("tblTilbudsskabelon", dbOpenDynaset, dbSeeChanges)

    ' Loop through the ADODB source recordset
    Do Until trs.EOF

        ' Start a new record in the destination table
        rsDest.AddNew

        For Each fld In trs.Fields
            If IsFieldExist(fld.Name, rsDest) And Not IsValueEmpty(fld.value) Then
                Dim fieldValue As Variant
                fieldValue = fld.value

                ' Check if the field value is numeric
                If IsNumeric(fieldValue) Then
                    fieldValue = CDbl(fieldValue)
                End If

                'On Error Resume Next 'Ignore the error temporarily
                rsDest.Fields(fld.Name).value = fieldValue
                If Err.Number <> 0 Then
                    MsgBox "Error with field: " & fld.Name & " - " & Err.Description
                    Exit For 'Exit the loop since you've identified a problematic field
                End If
                On Error GoTo ErrorHandler 'Return to the default error handler
            End If
        Next fld

        trs.MoveNext

    Loop
        'Sum af indtægter til E24
        rsDest!E24 = dblE24
        dblE24 = 0
        rsDest!Oprettet = Format(Date, "dd-MM-yyyy")
    rsDest.Update


'        .Fields.Append "AfdU", adVarChar, 50
'        .Fields.Append "Antal", adDouble
'        .Fields.Append "BelPct", adDouble
'        .Fields.Append "Indtægter", adVarChar, 250
'        .Fields.Append "Takst", adDouble
'        .Fields.Append "Year_", adInteger

    If Not lrs.EOF Then
        With lrs
        lrs.MoveFirst

        Do Until .EOF

            strEY = "INSERT INTO tblEkstraYdelser " & _
                    "(AfdU, Antal, BelPct, Indtægter, Takst, Year_) " & _
                    "VALUES " & _
                    "('" & .Fields("AfdU").value & "', " & _
                    Replace(Format(.Fields("Antal").value, "###0.00"), ",", ".") & ", " & _
                    Replace(Format(.Fields("BelPct").value, "###0.00"), ",", ".") & ", " & _
                    "'" & .Fields("Indtægter").value & "', " & _
                    Replace(Format(.Fields("Takst").value, "###0.00"), ",", ".") & ", " & _
                    .Fields("Year_").value & _
                    ")"

''Debug.Print strEY
      '''Debug.Print .Fields("Indtægter").value, .Fields("Antal").value, .Fields("Takst").value, .Fields("BelPct").value

            If .Fields("Takst").value > 0 Then
                DoCmd.SetWarnings False
                    DoCmd.RunSQL (strEY)
                DoCmd.SetWarnings True
            End If

            .MoveNext
        Loop
        End With
    End If



    ' Clean up
Cleanup:
    If Not rsDest Is Nothing Then rsDest.Close
    Set rsDest = Nothing
    Set dB = Nothing

    Exit Function

ErrorHandler:
    ' Handle errors
    MsgBox "An error occurred: " & Err.Number & " - " & Err.Description, vbCritical, "Error"
    Resume Cleanup

End Function

' Helper function to check if a field exists in a recordset
Function IsFieldExist(fieldName As String, rs As DAO.Recordset) As Boolean
    Dim fld As DAO.field

    On Error Resume Next
    Set fld = rs.Fields(fieldName)
    IsFieldExist = Err.Number = 0
    On Error GoTo 0

End Function
Function fncCleanUp(strAfd As String, intYear As Integer)
Dim str As String
    DoCmd.SetWarnings False

    str = "DELETE * FROM tblTilbudsskabelon " & _
          "WHERE [AfdU] = '" & strAfd & "' AND [Year_] = " & intYear

    DoCmd.RunSQL (str)

    str = "DELETE * FROM tblEkstraYdelser " & _
          "WHERE [AfdU] = '" & strAfd & "' AND [Year_] = " & intYear

    DoCmd.RunSQL (str)

    DoCmd.SetWarnings True

End Function
Public Function fncInitTilbud(strAfd As String, intYear As Integer)

    'Hvis det er alle afdelinger der skal med, så skal afdelingen hedde 999

    Call fncCleanUp(strAfd, intYear)
    'MsgBox "1"
    Call fncCreateTilbud(strAfd)
    'MsgBox "2"
    Call fncStamdata(strAfd, intYear)
    'MsgBox "3"
    Call fncIndtægter(strAfd, intYear)
    'MsgBox "4"
    Call fncPersonale(strAfd, intYear)
    'MsgBox "5"
    Call fncOmkostninger(strAfd, intYear)
    'MsgBox "6"
    Call fncNøgletal(strAfd, intYear)
    'Her løber jeg alle felter igennem og indsætter dem i tilbudsskabelonen
    'MsgBox "7"
    Call CopyRecords
    'MsgBox "8"
    Call fncKoncernNote(strAfd, intYear)
    'MsgBox "9"


    trs.Close
    Set trs = Nothing

    lrs.Close
    Set lrs = Nothing

    IbRs.Close
    Set IbRs = Nothing


End Function
Function IsValueEmpty(value As Variant) As Boolean
    ' Check for Null
    If IsNull(value) Then
        IsValueEmpty = True
        Exit Function
    End If

    ' Check for empty string
    If Trim(CStr(value)) = "" Then
        IsValueEmpty = True
        Exit Function
    End If

    ' You can add more checks if needed

    ' If all checks pass, the value is not empty
    IsValueEmpty = False
End Function
