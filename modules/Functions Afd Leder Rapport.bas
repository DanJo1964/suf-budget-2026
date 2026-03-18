Attribute VB_Name = "Functions Afd Leder Rapport"
Option Compare Database
Option Explicit
Dim O_ARs As ADODB.Recordset ' Overblik for afdeling og Nøgletal
Dim O_BRs As ADODB.Recordset ' Overblik for beboere
Dim O_MRs As ADODB.Recordset ' Overblik for medarbejdere
Dim O_DRs As ADODB.Recordset ' Overblik for drift
Dim Drs As ADODB.Recordset ' Driftsbudget
Dim Brs As ADODB.Recordset ' Beboerbudget
Dim Mrs As ADODB.Recordset ' Medarbejderbudget
Dim rs As DAO.Recordset
Dim dB As DAO.Database
Dim str As String

Function fncCreateVirtualOverblik()
Dim rsKto As DAO.Recordset

Set O_ARs = New ADODB.Recordset

    With O_ARs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic

        .Fields.Append "AfdelingNr", adVarChar, 250
        .Fields.Append "AfdelingNavn", adVarChar, 250
        .Fields.Append "Adresse", adVarChar, 250
        .Fields.Append "PostBy", adVarChar, 250
        .Fields.Append "AfdelingsLeder", adVarChar, 250
        .Fields.Append "Mail", adVarChar, 250
        .Fields.Append "Telefon", adVarChar, 250

        .Fields.Append "Overskudsgrad", adDouble
        .Fields.Append "Fællesbidrag", adDouble
        .Fields.Append "FBPctAfOms", adDouble
        .Fields.Append "KLFremPct", adDouble
        .Fields.Append "BebFremPct", adDouble


    End With

Set O_BRs = New ADODB.Recordset

    With O_BRs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic
        .Fields.Append "Afd", adVarChar, 100
        .Fields.Append "Tekst", adVarChar, 100
        .Fields.Append "Godkendt", adInteger
        .Fields.Append "Tilmeldt", adInteger
        .Fields.Append "Total", adDouble

    End With

Set O_MRs = New ADODB.Recordset

    With O_MRs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic

        .Fields.Append "Afd", adVarChar, 100
        .Fields.Append "Tekst", adVarChar, 100
        .Fields.Append "Ansatte", adDouble
        .Fields.Append "Årsværk", adDouble
        .Fields.Append "Total", adDouble

    End With

Set O_DRs = New ADODB.Recordset

    With O_DRs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic

        .Fields.Append "Afd", adVarChar, 100
        .Fields.Append "KontoNavn", adVarChar, 100
        .Fields.Append "Beløb", adDouble

    End With

End Function
Function fncCreateVirtualDrift()

Set Drs = New ADODB.Recordset

    With Drs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic

        .Fields.Append "Afd", adVarChar, 100
        .Fields.Append "Konto", adVarChar, 10
        .Fields.Append "KontoNavn", adVarChar, 100
        .Fields.Append "KontoType", adVarChar, 25
        .Fields.Append "Bemærk", adVarChar, 500
        .Fields.Append "BudgetIalt", adDouble
        .Fields.Append "_1", adDouble
        .Fields.Append "_2", adDouble
        .Fields.Append "_3", adDouble
        .Fields.Append "_4", adDouble
        .Fields.Append "_5", adDouble
        .Fields.Append "_6", adDouble
        .Fields.Append "_7", adDouble
        .Fields.Append "_8", adDouble
        .Fields.Append "_9", adDouble
        .Fields.Append "_10", adDouble
        .Fields.Append "_11", adDouble
        .Fields.Append "_12", adDouble

    End With

End Function
Function fncCreateVirtualBeboer()

Set Brs = New ADODB.Recordset

    With Brs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic

        .Fields.Append "Afd", adVarChar, 100
        .Fields.Append "Kontonavn", adVarChar, 100
        .Fields.Append "StatusDato", adVarChar, 100
        .Fields.Append "DatoFra", adVarChar, 100
        .Fields.Append "DatoTil", adVarChar, 100
        .Fields.Append "Paragraf", adVarChar, 100
        .Fields.Append "TakstMd", adDouble
        .Fields.Append "TakstÅr", adDouble
        .Fields.Append "FremskrivPct", adDouble

    End With

End Function
Function fncCreateVirtualMedarbejder()

Set Mrs = New ADODB.Recordset

    With Mrs
        .CursorLocation = adUseClient
        .CursorType = adOpenStatic
        .LockType = adLockBatchOptimistic


        'Create fields
        .Fields.Append "Afd", adVarChar, 100
        .Fields.Append "Navn", adVarChar, 100
        .Fields.Append "EksternTitel", adVarChar, 100
        .Fields.Append "StatusDato", adVarChar, 100
        .Fields.Append "Type", adVarChar, 100
        .Fields.Append "FaglærtUfaglært", adVarChar, 100
        .Fields.Append "LøntrinBudget", adVarChar, 100
        .Fields.Append "Normtid", adDouble
        .Fields.Append "Lønart", adVarChar, 100
        .Fields.Append "BeløbMd.", adDouble
        .Fields.Append "BeløbÅr", adDouble

    End With

End Function
Function fncReadIntoOverblik(strAfd As String, intYear As Integer, strFrom As String)
Dim dblKLfremPct As Double
Dim dblBebfremPct As Double
Dim strOrigAfd As String

    Set dB = CurrentDb()
    With O_ARs
        If .State = 0 Then
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        dblKLfremPct = ELookup("Procent", "tblParm_ProcentSatser", "BudgetYear = " & intYear & " AND Konto = 'FremskrivPct'")

            Dim qdf As DAO.QueryDef
            Dim rs  As DAO.Recordset
            Dim strSQL As String

        ' Bestem original afdeling (bruges til beboer-fremskrivning og Prisberegning-opslag)
        If strFrom = "Prisberegning" Then
            strOrigAfd = Nz(DLookup("Afdeling", "tblPrisberegning", "PrisberegningNavn = '" & strAfd & "' And Year_ = " & intYear), strAfd)
        Else
            strOrigAfd = strAfd
        End If

            strSQL = "SELECT TOP 1 FremskrivPct " & _
                     "FROM tblTmpDebtor " & _
                     "WHERE Afdeling = [pAfd] AND Year_ = [pYear] " & _
                     "GROUP BY FremskrivPct " & _
                     "ORDER BY COUNT(*) DESC, FremskrivPct DESC;"

            Set qdf = CurrentDb.CreateQueryDef("", strSQL)
            qdf.Parameters("[pAfd]").value = strOrigAfd
            qdf.Parameters("[pYear]").value = intYear

            Set rs = qdf.OpenRecordset(dbOpenSnapshot)

            If Not (rs.EOF And rs.BOF) Then
                dblBebfremPct = Nz(rs!FremskrivPct, 0)
            Else
                dblBebfremPct = 0
            End If

            rs.Close
            Set rs = Nothing
            Set qdf = Nothing

            If strFrom = "Prisberegning" Then
                ' Hent nøgletal fra tblPrisberegning + stamdata fra tblAfdeling via Afdeling-feltet
                ' samt FB-tal fra tblFB_Totaler
                str = "SELECT " & _
                      "P.PrisberegningNavn, " & _
                      "F.OverskudsGrad, F.FB_SamletBidrag, F.FB_PctAfOms, " & _
                      "A.AfdelingsNavn, A.Afdelingsleder, A.Adresse, A.PostBy, A.Tlf_Mail " & _
                      "FROM (tblPrisberegning As P " & _
                      "INNER JOIN tblAfdeling As A ON P.Afdeling = A.[AfdNr Uniconta]) " & _
                      "INNER JOIN tblFB_Totaler As F ON P.Afdeling = F.Afdeling " & _
                      "WHERE P.PrisberegningNavn = '" & strAfd & "' " & _
                      "And P.Year_ = " & intYear & " " & _
                      "And A.Year_ = " & intYear & " " & _
                      "And F.Year_ = " & intYear

                Debug.Print str   ' valgfrit, men godt til fejlsøgning

                Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

                If Not rs.EOF Then
                    .AddNew

                    ' Her bruger vi Prisberegning-navnet som AfdelingNr i overblikket
                    .Fields("AfdelingNr").value = strAfd
                    .Fields("AfdelingNavn").value = Nz(rs!AfdelingsNavn, "")
                    .Fields("Adresse").value = Nz(rs!Adresse, "")
                    .Fields("PostBy").value = Nz(rs!PostBy, "")
                    .Fields("AfdelingsLeder").value = Nz(rs!Afdelingsleder, "")

                    If Nz(rs!Tlf_Mail, "") > "" Then
                        If InStr(1, rs!Tlf_Mail, "/") > 0 Then
                            .Fields("Telefon").value = Left(rs!Tlf_Mail, InStr(1, rs!Tlf_Mail, "/") - 1)
                            .Fields("Mail").value = Mid(rs!Tlf_Mail, InStr(1, rs!Tlf_Mail, "/") + 1, 100)
                        Else
                            .Fields("Telefon").value = rs!Tlf_Mail
                            .Fields("Mail").value = rs!Tlf_Mail
                        End If
                    End If

                    .Fields("Overskudsgrad").value = Nz(rs!OverskudsGrad, 0)
                    .Fields("Fællesbidrag").value = Nz(rs!FB_SamletBidrag, 0)
                    .Fields("FBPctAfOms").value = Nz(rs!FB_PctAfOms, 0)
                    .Fields("KLFremPct").value = Nz(dblKLfremPct, 0)
                    .Fields("BebFremPct").value = Nz(dblBebfremPct, 0)

                    .Update
                End If
            Else
            ' Original logik for Afdeling
            str = "SELECT A.[AfdNr Uniconta], A.AfdelingsNavn, A.Afdelingsleder, A.Adresse, A.PostBy, A.Tlf_Mail, A.Year_, F.Afdeling, F.OverskudsGrad, F.FB_SamletBidrag, F.FB_PctAfOms, F.Year_ " & _
                  "FROM tblAfdeling As A " & _
                  "INNER JOIN tblFB_Totaler As F ON A.[AfdNr Uniconta] = F.Afdeling " & _
                  "WHERE A.[AfdNr Uniconta] = '" & strAfd & "' And A.Year_ = " & intYear & " " & _
                  "And F.Afdeling = '" & strAfd & "' And F.Year_ = " & intYear

            Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

            If Not rs.EOF Then
                .AddNew

                .Fields("AfdelingNr").value = Nz(rs![AfdNr Uniconta], "")
                .Fields("AfdelingNavn").value = Nz(rs!AfdelingsNavn, "")
                .Fields("Adresse").value = Nz(rs!Adresse, "")
                .Fields("PostBy").value = Nz(rs!PostBy, "")
                .Fields("AfdelingsLeder").value = Nz(rs!Afdelingsleder, "")

                If Nz(rs!Tlf_Mail, "") > "" Then
                    If InStr(1, rs!Tlf_Mail, "/") > 0 Then
                        .Fields("Telefon").value = Left(rs!Tlf_Mail, InStr(1, rs!Tlf_Mail, "/") - 1)
                        .Fields("Mail").value = Mid(rs!Tlf_Mail, InStr(1, rs!Tlf_Mail, "/") + 1, 100)
                    Else
                        .Fields("Telefon").value = rs!Tlf_Mail
                        .Fields("Mail").value = rs!Tlf_Mail
                    End If
                End If

                .Fields("Overskudsgrad").value = Nz(rs!OverskudsGrad, 0)
                .Fields("Fællesbidrag").value = Nz(rs!FB_SamletBidrag, 0)
                .Fields("FBPctAfOms").value = Nz(rs!FB_PctAfOms, 0)
                .Fields("KLFremPct").value = Nz(dblKLfremPct, 0)
                .Fields("BebFremPct").value = Nz(dblBebfremPct, 0)

                .Update
            End If
        End If

    End With

    'Info til Beboer afsnittet (ny version med tblFB_Totaler)
    With O_BRs

        If .State = 0 Then
            .CursorLocation = adUseClient
            .CursorType = adOpenStatic
            .LockType = adLockBatchOptimistic
            .Open
        End If

        Dim dictGodk As Object
        Set dictGodk = CreateObject("Scripting.Dictionary")

        '--- 1) Hent godkendte pr paragraf fra tblFB_Totaler
        Dim rsT As DAO.Recordset
        Dim fld As DAO.field
        Dim rawPrg As String
        Dim normPrg As String
        Dim keyPrg As String

        Set rsT = dB.OpenRecordset( _
            "SELECT * FROM tblFB_Totaler " & _
            "WHERE Afdeling='" & Replace(strOrigAfd, "'", "''") & "' AND Year_=" & intYear & ";", _
            dbOpenSnapshot)

        If Not (rsT.BOF And rsT.EOF) Then
            rsT.MoveFirst

            For Each fld In rsT.Fields

                If Left$(fld.Name, 5) = "Godk_" Then

                    rawPrg = Mid$(fld.Name, 6)

                    If Len(rawPrg) > 0 And IsNumeric(rawPrg) Then
                        normPrg = CStr(val(rawPrg))
                    Else
                        normPrg = rawPrg
                    End If

                    keyPrg = "§" & normPrg

                    dictGodk(keyPrg) = Nz(fld.value, 0)

                End If

            Next fld
        End If

        rsT.Close
        Set rsT = Nothing

        '--- 2) Indskrevne pr paragraf fra tblTmpDebtor
        Dim rsG As DAO.Recordset
        Dim prg As String
        Dim godk As Double

        strSQL = _
            "SELECT " & _
            "    Count(*) AS TotalBeboere, " & _
            "    Sum(TotalTakstDÅ) AS TotalYear, " & _
            "    Paragraf " & _
            "FROM tblTmpDebtor " & _
            "WHERE Afdeling='" & Replace(strOrigAfd, "'", "''") & "' " & _
            "  AND Year_=" & intYear & " " & _
            "GROUP BY Paragraf;"

        Set rsG = dB.OpenRecordset(strSQL, dbOpenSnapshot)

        If Not rsG.EOF Then
            Do Until rsG.EOF

                prg = Nz(rsG!Paragraf, "")

                godk = 0
                If Len(prg) > 0 And Left$(prg, 1) = "§" Then
                    If dictGodk.exists(prg) Then
                        godk = dictGodk(prg)
                        dictGodk.Remove prg
                    End If
                End If

                .AddNew
                    .Fields("Afd").value = strAfd
                    .Fields("Tekst").value = prg
                    .Fields("Godkendt").value = godk
                    .Fields("Tilmeldt").value = Nz(rsG!TotalBeboere, 0)
                    .Fields("Total").value = Nz(rsG!TotalYear, 0)
                .Update

                rsG.MoveNext
            Loop
        End If

        rsG.Close
        Set rsG = Nothing

        '--- 3) Rester i dictGodk = godkendte paragraffer uden indskrevne
        Dim k As Variant
        For Each k In dictGodk.Keys
            .AddNew
                .Fields("Afd").value = strAfd
                .Fields("Tekst").value = CStr(k)
                .Fields("Godkendt").value = dictGodk(k)
                .Fields("Tilmeldt").value = 0
                .Fields("Total").value = 0
            .Update
        Next k

    End With

    With O_MRs
        If .State = 0 Then
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        str = "SELECT Afdeling, Year_, Lønart, Sum(1) AS [Antal Ansatte], Sum(TotalNormtidDÅ) AS SumOfTotalNormtidDÅ, Sum(TotalBeløbBudgetDÅ) AS SumOfTotalBeløbBudgetDÅ " & _
              "FROM tblTmpMedarbejder " & _
              "GROUP BY Afdeling, Year_, Lønart " & _
              "HAVING Afdeling ='" & strOrigAfd & "' AND Year_= " & intYear

        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

        If Not rs.EOF Then
            Do Until rs.EOF
                .AddNew
                    .Fields("Tekst").value = Nz(rs!Lønart, "")
                    .Fields("Ansatte").value = Nz(rs![Antal Ansatte], 0)
                    .Fields("Årsværk").value = Nz(rs!SumOfTotalNormtidDÅ, 1) / 1924
                    .Fields("Total").value = Nz(rs!SumOfTotalBeløbBudgetDÅ, 0)
                .Update

                rs.MoveNext
            Loop
        End If
    End With

    With O_DRs
        If .State = 0 Then
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        str = "SELECT KontoNavn, Kontotype, BudgetIalt " & _
              "FROM tblInterntBudget " & _
              "WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear & " AND Kontotype = 'Sum'"

        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
        If Not rs.EOF Then
            Do Until rs.EOF
                If Abs(Nz(rs!BudgetIalt, 0)) > 0 Then
                    .AddNew

                    .Fields("Afd").value = strAfd
                    .Fields("KontoNavn").value = Nz(rs!Kontonavn, "")
                    .Fields("Beløb").value = Nz(rs!BudgetIalt, 0)

                    .Update
                End If
                rs.MoveNext
            Loop
        End If

    End With

End Function
Function fncReadIntoOverblik_OLD(strAfd As String, intYear As Integer)
Dim dblKLfremPct As Double
Dim dblBebfremPct As Double


    Set dB = CurrentDb()
    With O_ARs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        dblKLfremPct = ELookup("Procent", "tblParm_ProcentSatser", "BudgetYear = " & intYear & " AND Konto = 'FremskrivPct'")

            Dim qdf As DAO.QueryDef
            Dim rs  As DAO.Recordset
            Dim strSQL As String

            strSQL = "SELECT TOP 1 FremskrivPct " & _
                     "FROM tblTmpDebtor " & _
                     "WHERE Afdeling = [pAfd] AND Year_ = [pYear] " & _
                     "GROUP BY FremskrivPct " & _
                     "ORDER BY COUNT(*) DESC, FremskrivPct DESC;"

            Set qdf = CurrentDb.CreateQueryDef("", strSQL)
            qdf.Parameters("[pAfd]").value = strAfd
            qdf.Parameters("[pYear]").value = intYear

            Set rs = qdf.OpenRecordset(dbOpenSnapshot)

            If Not (rs.EOF And rs.BOF) Then
                dblBebfremPct = Nz(rs!FremskrivPct, 0)
            Else
                dblBebfremPct = 0
            End If

            rs.Close
            Set rs = Nothing
            Set qdf = Nothing


        str = "SELECT A.[AfdNr Uniconta], A.AfdelingsNavn, A.Afdelingsleder, A.Adresse, A.PostBy, A.Tlf_Mail, A.Year_, F.Afdeling, F.OverskudsGrad, F.FB_SamletBidrag, F.FB_PctAfOms, F.Year_ " & _
              "FROM tblAfdeling As A " & _
              "INNER JOIN tblFB_Totaler As F ON A.[AfdNr Uniconta] = F.Afdeling " & _
              "WHERE A.[AfdNr Uniconta] = '" & strAfd & "' And A.Year_ = " & intYear & " " & _
              "And F.Afdeling = '" & strAfd & "' And F.Year_ = " & intYear

        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

        If Not rs.EOF Then
            .AddNew

            .Fields("AfdelingNr").value = Nz(rs![AfdNr Uniconta], "")
            .Fields("AfdelingNavn").value = Nz(rs!AfdelingsNavn, "")
            .Fields("Adresse").value = Nz(rs!Adresse, "")
            .Fields("PostBy").value = Nz(rs!PostBy, "")
            .Fields("AfdelingsLeder").value = Nz(rs!Afdelingsleder, "")

            'Debug.Print InStr(1, Nz(rs!Tlf_Mail, ""), "/")

            If Nz(rs!Tlf_Mail, "") > "" Then
                If InStr(1, rs!Tlf_Mail, "/") > 0 Then
                    .Fields("Telefon").value = Left(rs!Tlf_Mail, InStr(1, rs!Tlf_Mail, "/") - 1)
                    .Fields("Mail").value = Mid(rs!Tlf_Mail, InStr(1, rs!Tlf_Mail, "/") + 1, 100)
                Else
                    .Fields("Telefon").value = rs!Tlf_Mail
                    .Fields("Mail").value = rs!Tlf_Mail
                End If
            End If

            .Fields("Overskudsgrad").value = Nz(rs!OverskudsGrad, 0)
            .Fields("Fællesbidrag").value = Nz(rs!FB_SamletBidrag, 0)
            .Fields("FBPctAfOms").value = Nz(rs!FB_PctAfOms, 0)

            .Fields("KLFremPct").value = Nz(dblKLfremPct, 0)
            .Fields("BebFremPct").value = Nz(dblBebfremPct, 0)

            .Update
        End If

    End With

    'Info til Beboer afsnittet (ny version med tblFB_Totaler)
    With O_BRs

        If .State = 0 Then
            .CursorLocation = adUseClient
            .CursorType = adOpenStatic
            .LockType = adLockBatchOptimistic
            .Open
        End If

        Dim dictGodk As Object
        Set dictGodk = CreateObject("Scripting.Dictionary")

        '--- 1) Hent godkendte pr paragraf fra tblFB_Totaler (felter: Godk_### / Godk_Div osv.)
        Dim rsT As DAO.Recordset
        Dim fld As DAO.field
        Dim rawPrg As String
        Dim normPrg As String
        Dim keyPrg As String

        Set rsT = dB.OpenRecordset( _
            "SELECT * FROM tblFB_Totaler " & _
            "WHERE Afdeling='" & Replace(strAfd, "'", "''") & "' AND Year_=" & intYear & ";", _
            dbOpenSnapshot)

        If Not (rsT.BOF And rsT.EOF) Then
            'sikrer at vi står på første række
            rsT.MoveFirst

            For Each fld In rsT.Fields

                If Left$(fld.Name, 5) = "Godk_" Then

                    rawPrg = Mid$(fld.Name, 6)      ' fx "043", "085", "107", "Div"

                    'Normaliser paragrafdelen:
                    ' - numerisk: fjern foranstillede nuller via Val()
                    ' - tekst: behold som den er
                    If Len(rawPrg) > 0 And IsNumeric(rawPrg) Then
                        normPrg = CStr(val(rawPrg)) ' "043" -> "43"
                    Else
                        normPrg = rawPrg            ' "Div" osv.
                    End If

                    keyPrg = "§" & normPrg

                    dictGodk(keyPrg) = Nz(fld.value, 0)

                End If

            Next fld
        End If

        rsT.Close
        Set rsT = Nothing

        '--- 2) Indskrevne pr paragraf fra tblTmpDebtor
        'Dim strSQL As String
        Dim rsG As DAO.Recordset
        Dim prg As String
        Dim godk As Double

        strSQL = _
            "SELECT " & _
            "    Count(*) AS TotalBeboere, " & _
            "    Sum(TotalTakstDÅ) AS TotalYear, " & _
            "    Paragraf " & _
            "FROM tblTmpDebtor " & _
            "WHERE Afdeling='" & Replace(strAfd, "'", "''") & "' " & _
            "  AND Year_=" & intYear & " " & _
            "GROUP BY Paragraf;"

        Set rsG = dB.OpenRecordset(strSQL, dbOpenSnapshot)

        If Not rsG.EOF Then
            Do Until rsG.EOF

                prg = Nz(rsG!Paragraf, "")

                'Slå godkendt op (kun hvis det ligner en paragraf med §)
                godk = 0
                If Len(prg) > 0 And Left$(prg, 1) = "§" Then
                    If dictGodk.exists(prg) Then
                        godk = dictGodk(prg)
                        dictGodk.Remove prg   'så er den “forbrugt”
                    End If
                End If

                .AddNew
                    .Fields("Afd").value = strAfd
                    .Fields("Tekst").value = prg
                    .Fields("Godkendt").value = godk
                    .Fields("Tilmeldt").value = Nz(rsG!TotalBeboere, 0)
                    .Fields("Total").value = Nz(rsG!TotalYear, 0)
                .Update

                rsG.MoveNext
            Loop
        End If

        rsG.Close
        Set rsG = Nothing

        '--- 3) Rester i dictGodk = godkendte paragraffer uden indskrevne (Tilmeldt=0, Total=0)
        Dim k As Variant
        For Each k In dictGodk.Keys
            .AddNew
                .Fields("Afd").value = strAfd
                .Fields("Tekst").value = CStr(k)          'fx "§107"
                .Fields("Godkendt").value = dictGodk(k)
                .Fields("Tilmeldt").value = 0
                .Fields("Total").value = 0
            .Update
        Next k

    End With

    With O_MRs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        'Dim strAfdEjUniconta As String

        'strAfdEjUniconta = Nz(ELookup("Afdeling", "tblAfdeling", "[AfdNr Uniconta] = '" & strAfd & "'"), "")

        str = "SELECT Afdeling, Year_, Lønart, Sum(1) AS [Antal Ansatte], Sum(TotalNormtidDÅ) AS SumOfTotalNormtidDÅ, Sum(TotalBeløbBudgetDÅ) AS SumOfTotalBeløbBudgetDÅ " & _
              "FROM tblTmpMedarbejder " & _
              "GROUP BY Afdeling, Year_, Lønart " & _
              "HAVING Afdeling ='" & strAfd & "' AND Year_= " & intYear

        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

        If Not rs.EOF Then
            Do Until rs.EOF
                .AddNew
                    .Fields("Tekst").value = Nz(rs!Lønart, "")
                    .Fields("Ansatte").value = Nz(rs![Antal Ansatte], 0)
                    .Fields("Årsværk").value = Nz(rs!SumOfTotalNormtidDÅ, 1) / 1924
                    .Fields("Total").value = Nz(rs!SumOfTotalBeløbBudgetDÅ, 0)
                .Update

                ''Debug.Print .Fields("Tekst").value, .Fields("Ansatte").value, .Fields("Årsværk").value, .Fields("Total").value

                rs.MoveNext
            Loop
        End If
    End With

    With O_DRs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        str = "SELECT KontoNavn, Kontotype, BudgetIalt " & _
              "FROM tblInterntBudget " & _
              "WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear & " AND Kontotype = 'Sum'"

        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
        If Not rs.EOF Then
            Do Until rs.EOF
                If Abs(Nz(rs!BudgetIalt, 0)) > 0 Then
                    .AddNew

                    .Fields("Afd").value = strAfd
                    .Fields("KontoNavn").value = Nz(rs!Kontonavn, "")
                    .Fields("Beløb").value = Nz(rs!BudgetIalt, 0)

                    .Update

                    ''Debug.Print .Fields("Afd").value, .Fields("KontoNavn").value, .Fields("Beløb").value

                End If
                rs.MoveNext
            Loop
        End If


    End With

End Function
Function fncReadIntoDriftsbudget(strAfd As String, intYear As Integer)

    Set dB = CurrentDb()
    With Drs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

    str = "SELECT Konto, KontoNavn, KontoType, Kommentarer, BudgetIalt, [_1], [_2], [_3], [_4], [_5], [_6], [_7], [_8], [_9], [_10], [_11], [_12]" & _
          "FROM tblInterntBudget " & _
          "WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear & " " & _
          "ORDER BY Konto"

    Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
        If Not rs.EOF Then
            Do Until rs.EOF
                If Abs(Nz(rs!BudgetIalt, 0)) > 0 Or Nz(rs!Kontotype, "") = "Overskrift" Then
                    .AddNew
                        .Fields("Afd").value = Nz(strAfd, "")
                        .Fields("Konto").value = Nz(rs!Konto, "")
                        .Fields("KontoNavn").value = Nz(rs!Kontonavn, "")
                        .Fields("KontoType").value = Nz(rs!Kontotype, "")
                        .Fields("Bemærk").value = Nz(rs!Kommentarer, "")
                        .Fields("BudgetIalt").value = Nz(rs!BudgetIalt, 0)
                        .Fields("_1").value = Nz(rs![_1], 0)
                        .Fields("_2").value = Nz(rs![_2], 0)
                        .Fields("_3").value = Nz(rs![_3], 0)
                        .Fields("_4").value = Nz(rs![_4], 0)
                        .Fields("_5").value = Nz(rs![_5], 0)
                        .Fields("_6").value = Nz(rs![_6], 0)
                        .Fields("_7").value = Nz(rs![_7], 0)
                        .Fields("_8").value = Nz(rs![_8], 0)
                        .Fields("_9").value = Nz(rs![_9], 0)
                        .Fields("_10").value = Nz(rs![_10], 0)
                        .Fields("_11").value = Nz(rs![_11], 0)
                        .Fields("_12").value = Nz(rs![_12], 0)
                    .Update
                    ''Debug.Print .Fields("Konto").value, .Fields("KontoNavn").value, .Fields("Bemærk").value, .Fields("BudgetIalt").value, .Fields("_1").value = rs![_1]
                End If
                rs.MoveNext
            Loop
        End If


    End With

End Function
Function fncReadIntoBeboerbudget(strAfd As String, intYear As Integer)

    Set dB = CurrentDb()

    With Brs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        str = "SELECT Afdeling, Year_, Kontonavn, [Status Dato], DatoFra, DatoTil, Paragraf, TotalTakstMdr, TotalTakstDÅ " & _
              "FROM tblTmpDebtor " & _
              "WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear & " " & _
              "ORDER BY Kontonavn"

        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
            If Not rs.EOF Then
                Do Until rs.EOF
                    .AddNew
                        .Fields("Afd").value = Nz(rs!Afdeling, "")
                        .Fields("Kontonavn").value = Nz(rs!Kontonavn, "")
                        .Fields("StatusDato").value = Nz(Format(rs![Status Dato], "dd-mm-yyyy"), "")
                        .Fields("DatoFra").value = Nz(Format(rs!DatoFra, "dd-mm-yyyy"), "")
                        .Fields("DatoTil").value = Nz(Format(rs!DatoTil, "dd-mm-yyyy"), "")
                        .Fields("Paragraf").value = Nz(rs!Paragraf, "")
                        .Fields("TakstMd").value = Nz(rs!TotalTakstMdr, "")
                        .Fields("TakstÅr").value = Nz(rs!TotalTakstDÅ, "")

                    .Update
                    ''Debug.Print .Fields("Konto").value, .Fields("KontoNavn").value, .Fields("Bemærk").value, .Fields("BudgetIalt").value, .Fields("_1").value = rs![_1]
                    rs.MoveNext
                Loop
            End If

    End With

End Function
Function fncReadIntoMedarbejderbudget(strAfd As String, intYear As Integer)

    Set dB = CurrentDb()

    With Mrs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If
        'Dim strAfdEjUniconta As String
        'strAfdEjUniconta = Nz(ELookup("Afdeling", "tblAfdeling", "[AfdNr Uniconta] = '" & strAfd & "'"), "")

        str = "SELECT Afdeling, Fornavn, Efternavn, [Ekstern titel], StatusDato, Valgfri3, LøntrinBudget, Normtid, Lønart, BeløbBudget, TotalBeløbBudgetDÅ " & _
              "FROM tblTmpMedarbejder " & _
              "WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear & " " & _
              "ORDER BY Fornavn"

        Set rs = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
        If Not rs.EOF Then
            Do Until rs.EOF
                .AddNew

                    .Fields("Afd").value = Nz(rs!Afdeling, "")
                    .Fields("Navn").value = Nz(rs!Fornavn, "") & " " & Nz(rs!Efternavn, "")
                    .Fields("EksternTitel").value = Nz(rs![Ekstern titel], "")
                    .Fields("StatusDato").value = Format(Nz(rs!StatusDato, ""), "dd-mm-yyyy")
                    '.Fields("Type").value = Nz(rs!Type, "")
                    .Fields("FaglærtUfaglært").value = Nz(rs!Valgfri3, "")
                    .Fields("LøntrinBudget").value = Nz(rs!LøntrinBudget, "")
                    .Fields("Normtid").value = Nz(rs!Normtid, 0)
                    .Fields("Lønart").value = Nz(rs!Lønart, "")
                    .Fields("BeløbMd.").value = Nz(rs!BeløbBudget, "")
                    .Fields("BeløbÅr").value = Nz(rs!TotalBeløbBudgetDÅ, "")

                .Update
                rs.MoveNext
            Loop
        End If



    End With

End Function
Function fncExpToExcelAfdbudget(strAfd As String, intYear As Integer, strFrom As String)
Dim objExcel As Object
Dim wb As Object
Dim ws As Object
Dim copiedfilePath As String
Dim templatePath As String
Dim fld As DAO.field
Dim strCol As String
Dim intRow As Integer
Dim intCol As Integer
Dim strCellAdd As String
Dim strAfdNavn As String
Dim range As range
Dim fso As Object

' Initialize
Set dB = CurrentDb()

' Hent AfdelingsNavn til filnavn
If strFrom = "Prisberegning" Then
    strAfdNavn = Nz(DLookup("AfdelingsNavn", "tblAfdeling", _
        "[AfdNr Uniconta] = '" & _
        Nz(DLookup("Afdeling", "tblPrisberegning", "PrisberegningNavn = '" & strAfd & "' And Year_ = " & intYear), "") & _
        "' And Year_ = " & intYear), "")
    copiedfilePath = "C:\temp\SUF\Prisberegning " & strAfd & "_" & strAfdNavn & " budgetår " & intYear & ".xlsx"
Else
    strAfdNavn = DLookup("AfdelingsNavn", "tblAfdeling", "[AfdNr Uniconta] = '" & strAfd & "'")
    copiedfilePath = "C:\temp\SUF\Afdelingsbudget for " & strAfd & "_" & strAfdNavn & " budgetår " & intYear & ".xlsx"
End If


Set fso = CreateObject("Scripting.FileSystemObject")

If fso.FileExists(copiedfilePath) Then
    If IsFileOpen(copiedfilePath) Then
        MsgBox "Excel-filen er åben. Luk venligst filen og prøv igen.", vbExclamation, "Fil er allerede åben"
        Exit Function
    Else
        fso.DeleteFile copiedfilePath, True
    End If
End If

Set objExcel = CreateObject("Excel.Application")
objExcel.Visible = True
Set wb = objExcel.Workbooks.Add
'Set wb = objExcel.Workbooks.Open(templatePath)

Set ws = wb.Worksheets.Add
ws.Name = "Medarbejderbudget"
Set ws = wb.Worksheets.Add
ws.Name = "Beboerbudget"
Set ws = wb.Worksheets.Add
ws.Name = "Driftsbudget"
Set ws = wb.Worksheets.Add
ws.Name = "Overblik"


' Save a copy of the template to a temporary location
    wb.SaveAs copiedfilePath

    ' Close the template without saving changes
    'wb.Close SaveChanges:=True

    ' Open the copied workbook
    'Set wb = objExcel.Workbooks.Open(copiedfilePath)

'____________Fanen Overblik_____________________________________________________________________________

Set ws = wb.sheets("Overblik")
    'Stamdata og nøgletal
    With O_ARs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

            ws.range("C2").value = "Budget for år"
            ws.range("D2").value = CStr(intYear)
                ws.range("D2").HorizontalAlignment = xlLeft

            ws.range("C4").value = "Afdelingnr."
            ws.range("C5").value = "Afdelingsnavn"
            ws.range("C6").value = "Adresse"
            ws.range("C7").value = "Postnr og by"
            ws.range("C9").value = "Afdelingsleder"
            ws.range("C10").value = "Mail"
            ws.range("C11").value = "Telefon"
            ws.range("C13").value = "Nøgletal"
                ws.range("C13").Font.Bold = True
            ws.range("C14").value = "Overskudsgrad"
            ws.range("C15").value = "Samlet fællesbidrag"
            ws.range("C16").value = "Fællesbidrag i pct. af omsætning"
            ws.range("C17").value = "KL fremskr. pct."
            ws.range("C18").value = "Beboertakst fremskr. pct."


        If Not .EOF Then
        .MoveFirst

            ws.range("D4").value = .Fields("AfdelingNr").value
                ws.range("D4").HorizontalAlignment = xlLeft
            ws.range("D5").value = .Fields("AfdelingNavn").value
            ws.range("D6").value = .Fields("Adresse").value
            ws.range("D7").value = .Fields("PostBy").value
            ws.range("D9").value = .Fields("AfdelingsLeder").value
            ws.range("D10").value = .Fields("Mail").value
            ws.range("D11").value = .Fields("Telefon").value
                ws.range("D11").HorizontalAlignment = xlLeft

            ws.range("D14").value = .Fields("Overskudsgrad").value * 0.01
                ws.range("D14").numberFormat = "0.00%"
            ws.range("D15").value = .Fields("Fællesbidrag").value
                ws.range("D15").numberFormat = "#,##0"
            ws.range("D16").value = .Fields("FBPctAfOms").value
                ws.range("D16").numberFormat = "0.00%"
            ws.range("D17").value = .Fields("KLfremPct").value
                ws.range("D17").numberFormat = "0.00%"
            ws.range("D18").value = .Fields("BebFremPct").value
                ws.range("D18").numberFormat = "0.00%"

                Set range = ws.range("C2", "D5")
                range.Font.Bold = True


        End If
    End With 'O_ARs

    'Beboer oplysninger

    With O_BRs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        If Not .EOF Then
            .MoveFirst

                ws.range("C20").value = "Beboer paragraf"
                ws.range("D20").value = "Antal godkendte"
                ws.range("E20").value = "Antal indskrivninger"
                ws.range("F20").value = "Total budget"

                    Set range = ws.range("C20", "F20")
                    range.Font.Bold = True
                    Set range = ws.range("D20", "F20")
                    range.HorizontalAlignment = xlRight

            intRow = 20

            Do Until .EOF
                    If (.Fields("Godkendt").value + .Fields("Tilmeldt").value) > 0 Then
                        intRow = intRow + 1

                        ws.range("C" & CStr(intRow)).value = .Fields("Tekst")
                        ws.range("D" & CStr(intRow)).value = .Fields("Godkendt")
                        ws.range("E" & CStr(intRow)).value = .Fields("Tilmeldt")
                        ws.range("F" & CStr(intRow)).value = .Fields("Total")
                            ws.range("F" & CStr(intRow)).numberFormat = "#,##0"
                    End If

                .MoveNext
            Loop
                intRow = intRow + 1
                ws.range("C" & CStr(intRow)).value = "I alt"
                ws.range("D" & CStr(intRow)).Formula = "=Sum(D20:D" & CStr(intRow - 1) & ")"
                ws.range("E" & CStr(intRow)).Formula = "=Sum(E20:E" & CStr(intRow - 1) & ")"
                ws.range("F" & CStr(intRow)).Formula = "=Sum(F20:F" & CStr(intRow - 1) & ")"

                    Set range = ws.range("C" & CStr(intRow), "F" & CStr(intRow))
                    range.Font.Bold = True
                    Set range = ws.range("D" & CStr(intRow), "F" & CStr(intRow))
                    range.HorizontalAlignment = xlRight
                    ws.range("F" & CStr(intRow)).numberFormat = "#,##0"

        End If
    End With 'O_BRs

    'Medarbejder oplysninger
    With O_MRs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        If Not .EOF Then
            .MoveFirst

            Dim intRowBegin As Integer
            intRow = intRow + 2
            intRowBegin = intRow + 1

                ws.range("C" & CStr(intRow)).value = "Lønart"
                ws.range("D" & CStr(intRow)).value = "Antal Ansatte"
                ws.range("E" & CStr(intRow)).value = "Antal Årsværk"
                ws.range("F" & CStr(intRow)).value = "Total budget"

                    Set range = ws.range("C" & CStr(intRow), "F" & CStr(intRow))
                    range.Font.Bold = True
                    Set range = ws.range("D" & CStr(intRow), "F" & CStr(intRow))
                    range.HorizontalAlignment = xlRight

            Do Until .EOF
                intRow = intRow + 1

                ws.range("C" & CStr(intRow)).value = .Fields("Tekst").value
                    ws.range("C" & CStr(intRow)).HorizontalAlignment = xlLeft
                ws.range("D" & CStr(intRow)).value = .Fields("Ansatte").value

                If ws.range("C" & CStr(intRow)).value = "1000" Or ws.range("C" & CStr(intRow)).value = "9900" Then
                    ws.range("E" & CStr(intRow)).value = .Fields("Årsværk").value
                        ws.range("E" & CStr(intRow)).numberFormat = "#,##0.0"
                End If

                ws.range("F" & CStr(intRow)).value = .Fields("Total").value
                        ws.range("F" & CStr(intRow)).numberFormat = "#,##0"

                .MoveNext
            Loop

                intRow = intRow + 1

                ''Debug.Print "=Sum(D" & CStr(intRowBegin) & ":D" & CStr(intRow - 1) & ")"

                ws.range("C" & CStr(intRow)).value = "I alt"
                ws.range("D" & CStr(intRow)).Formula = "=SUM(D" & CStr(intRowBegin) & ":D" & CStr(intRow - 1) & ")"
                ws.range("E" & CStr(intRow)).Formula = "=SUM(E" & CStr(intRowBegin) & ":E" & CStr(intRow - 1) & ")"
                ws.range("F" & CStr(intRow)).Formula = "=SUM(F" & CStr(intRowBegin) & ":F" & CStr(intRow - 1) & ")"

                    Set range = ws.range("C" & CStr(intRow), "F" & CStr(intRow))
                    range.Font.Bold = True


        End If
    End With 'O_MRs

    'Driftsoplysninger fra Internt Budget
    With O_DRs
        If .State = 0 Then 'Check if the Recordset is closed
                .CursorLocation = adUseClient
                .CursorType = adOpenStatic
                .LockType = adLockBatchOptimistic
                .Open
        End If

        If Not .EOF Then
            .MoveFirst
            intRow = intRow + 2
            intRowBegin = intRow + 1

                ws.range("C" & CStr(intRow)).value = "Konto Navn"
                ws.range("D" & CStr(intRow)).value = "Budget Beløb"
                    ws.range("D" & CStr(intRow)).HorizontalAlignment = xlRight

                    Set range = ws.range("C" & CStr(intRow), "D" & CStr(intRow))
                    range.Font.Bold = True

            Do Until .EOF
                intRow = intRow + 1

                ws.range("C" & CStr(intRow)).value = .Fields("KontoNavn").value
                ws.range("D" & CStr(intRow)).value = .Fields("Beløb").value
                    ws.range("D" & CStr(intRow)).numberFormat = "#,##0"

                .MoveNext
            Loop
                For intCol = 1 To 9
                    Set range = ws.Columns(intCol)
                    range.AutoFit
                Next intCol



        End If

    End With 'O_Drs

'____________Fanen Driftsbudget_____________________________________________________________________________
Set ws = wb.sheets("Driftsbudget")

    With Drs
        If .State = 0 Then 'Check if the Recordset is closed
            .CursorLocation = adUseClient
            .CursorType = adOpenStatic
            .LockType = adLockBatchOptimistic
            .Open
        End If

        If Not .EOF Then
            .MoveFirst
                ws.range("C1").value = "BUDGETÅR"
                ws.range("D1").value = intYear
                    ws.range("D1").HorizontalAlignment = xlLeft
                    ws.range("C1:D1").Font.Bold = True
            intRow = 3

            ws.range("C3").value = "Kontonummer"
            ws.range("D3").value = "Kontonavn"
            ws.range("E3").value = "Bemærkninger"
            ws.range("G3").value = "Budget i alt"
            ws.range("H3").value = "Jan"
            ws.range("I3").value = "Feb"
            ws.range("J3").value = "Mar"
            ws.range("K3").value = "Apr"
            ws.range("L3").value = "Maj"
            ws.range("M3").value = "Jun"
            ws.range("N3").value = "Jul"
            ws.range("O3").value = "Aug"
            ws.range("P3").value = "Sep"
            ws.range("Q3").value = "Okt"
            ws.range("R3").value = "Nov"
            ws.range("S3").value = "Dec"

            ws.range("C3:S3").Font.Bold = True
            ws.range("H3:S3").HorizontalAlignment = xlCenter


            Do Until .EOF
                intRow = intRow + 1

                ws.range("C" & CStr(intRow)).value = .Fields("Konto").value
                ws.range("D" & CStr(intRow)).value = .Fields("KontoNavn").value
                ws.range("E" & CStr(intRow)).value = .Fields("Bemærk").value
                ws.range("G" & CStr(intRow)).value = .Fields("BudgetIalt").value
                ws.range("H" & CStr(intRow)).value = .Fields("_1").value
                ws.range("I" & CStr(intRow)).value = .Fields("_2").value
                ws.range("J" & CStr(intRow)).value = .Fields("_3").value
                ws.range("K" & CStr(intRow)).value = .Fields("_4").value
                ws.range("L" & CStr(intRow)).value = .Fields("_5").value
                ws.range("M" & CStr(intRow)).value = .Fields("_6").value
                ws.range("N" & CStr(intRow)).value = .Fields("_7").value
                ws.range("O" & CStr(intRow)).value = .Fields("_8").value
                ws.range("P" & CStr(intRow)).value = .Fields("_9").value
                ws.range("Q" & CStr(intRow)).value = .Fields("_10").value
                ws.range("R" & CStr(intRow)).value = .Fields("_11").value
                ws.range("S" & CStr(intRow)).value = .Fields("_12").value

                If .Fields("KontoType").value = "Sum" Or .Fields("KontoType").value = "Overskrift" Then
                    Set range = ws.range("C" & CStr(intRow), "S" & CStr(intRow))
                    range.Font.Bold = True
                End If

                .MoveNext
            Loop
                Set range = ws.range("G4", "S" & CStr(intRow))
                range.numberFormat = "#,##0"

                For intCol = 1 To 26
                    Set range = ws.Columns(intCol)
                    range.AutoFit
                Next intCol

        End If

    End With


'____________Fanen Beboerbudget_____________________________________________________________________________
Set ws = wb.sheets("Beboerbudget")

    With Brs
        If .State = 0 Then 'Check if the Recordset is closed
            .CursorLocation = adUseClient
            .CursorType = adOpenStatic
            .LockType = adLockBatchOptimistic
            .Open
        End If

        If Not .EOF Then
            .MoveFirst
                ws.range("C1").value = "BUDGETÅR"
                ws.range("D1").value = intYear
                    ws.range("D1").HorizontalAlignment = xlLeft
                    ws.range("C1:D1").Font.Bold = True

                ws.range("C3").value = "Kontonavn"
                ws.range("D3").value = "Status Dato"
                ws.range("E3").value = "Dato Fra"
                ws.range("F3").value = "Dato Til"
                ws.range("G3").value = "Paragraf"
                ws.range("H3").value = "Takst pr. md"
                ws.range("I3").value = "Takst pr. år"
                    ws.range("C3:I3").Font.Bold = True

            intRow = 3

            Do Until .EOF
                intRow = intRow + 1

                    ws.range("C" & CStr(intRow)).value = .Fields("KontoNavn").value
                    ws.range("D" & CStr(intRow)).value = ParseDDMMYYYY(.Fields("StatusDato").value)
                    ws.range("E" & CStr(intRow)).value = ParseDDMMYYYY(.Fields("DatoFra").value)
                    ws.range("F" & CStr(intRow)).value = ParseDDMMYYYY(.Fields("DatoTil").value)
                    ws.range("G" & CStr(intRow)).value = .Fields("Paragraf").value
                    ws.range("H" & CStr(intRow)).value = .Fields("TakstMd").value
                    ws.range("I" & CStr(intRow)).value = .Fields("TakstÅr").value

                .MoveNext
            Loop
                Set range = ws.range("H4", "I" & CStr(intRow))
                range.numberFormat = "#,##0"


                    intRow = intRow + 1
                    ws.range("C" & CStr(intRow)).value = "I alt"
                    ws.range("H" & CStr(intRow)).Formula = "=Sum(H4:H" & CStr(intRow - 1) & ")"
                    ws.range("I" & CStr(intRow)).Formula = "=Sum(I4:I" & CStr(intRow - 1) & ")"
                    ws.range("C" & CStr(intRow), "I" & CStr(intRow)).Font.Bold = True

                For intCol = 1 To 9
                    Set range = ws.Columns(intCol)
                    range.AutoFit
                Next intCol
                ws.Columns("D:F").numberFormat = "dd-mm-yyyy"


        End If

    End With

'____________Fanen Medarbejderbudget_____________________________________________________________________________
Set ws = wb.sheets("Medarbejderbudget")

    With Mrs
        If .State = 0 Then 'Check if the Recordset is closed
            .CursorLocation = adUseClient
            .CursorType = adOpenStatic
            .LockType = adLockBatchOptimistic
            .Open
        End If

        If Not .EOF Then
            .MoveFirst
                ws.range("C1").value = "BUDGETÅR"
                ws.range("D1").value = intYear
                    ws.range("D1").HorizontalAlignment = xlLeft
                    ws.range("C1:D1").Font.Bold = True

                ws.range("C3").value = "Navn"
                ws.range("D3").value = "Ekstern Titel"
                ws.range("E3").value = "Statusdato"
                ws.range("F3").value = "Type"
                ws.range("G3").value = "Faglært/Ufaglært"
                ws.range("H3").value = "Løntring Budget"
                ws.range("I3").value = "Normtid"
                ws.range("J3").value = "Lønart"
                ws.range("K3").value = "Beløb pr. md."
                ws.range("L3").value = "Beløb pr. år"

                    ws.range("C3:L3").Font.Bold = True

            intRow = 3

            Do Until .EOF
                intRow = intRow + 1

                    ws.range("C" & CStr(intRow)).value = .Fields("Navn").value
                    ws.range("D" & CStr(intRow)).value = .Fields("EksternTitel").value
                    ws.range("E" & CStr(intRow)).value = ParseDDMMYYYY(.Fields("StatusDato").value)
                    ws.range("F" & CStr(intRow)).value = .Fields("Type").value
                    ws.range("G" & CStr(intRow)).value = .Fields("FaglærtUfaglært").value
                    ws.range("H" & CStr(intRow)).value = .Fields("LøntrinBudget").value
                    ws.range("I" & CStr(intRow)).value = .Fields("Normtid").value
                    ws.range("J" & CStr(intRow)).value = .Fields("Lønart").value
                    ws.range("K" & CStr(intRow)).value = .Fields("BeløbMd.").value
                    ws.range("L" & CStr(intRow)).value = .Fields("BeløbÅr").value

                .MoveNext
            Loop
                Set range = ws.range("K4", "L" & CStr(intRow))
                range.numberFormat = "#,##0"


                    intRow = intRow + 1
                    ws.range("C" & CStr(intRow)).value = "I alt"
                    ws.range("K" & CStr(intRow)).Formula = "=Sum(K4:K" & CStr(intRow - 1) & ")"
                    ws.range("L" & CStr(intRow)).Formula = "=Sum(L4:L" & CStr(intRow - 1) & ")"
                    ws.range("C" & CStr(intRow), "L" & CStr(intRow)).Font.Bold = True

                For intCol = 1 To 12
                    Set range = ws.Columns(intCol)
                    range.AutoFit
                Next intCol

            ws.Columns("D:D").numberFormat = "dd-mm-yyyy"
        End If

    End With



' Save and Close
wb.Save
'wb.Close
'objExcel.Quit

'Call fncOutlook(copiedfilePath, "dan@it-regnskab.dk")

' Cleanup
Set ws = Nothing
Set wb = Nothing
Set objExcel = Nothing

End Function
Function fncOutlook(strFileName As String, strMail As String)
Dim objOutlook As Object
Dim objMail As Object
Dim objAttach As Object
Dim objNameSpace As Outlook.Namespace
Dim objAccount As Outlook.MAPIFolder
Dim strRecipient As String

Set objNameSpace = objOutlook.GetNamespace("MAPI")
strRecipient = strFileName

Set objAccount = objNameSpace.Accounts.FindByAccountName(strRecipient)
If objAccount Is Nothing Then
    MsgBox "No account"
    Exit Function
End If

Set objOutlook = CreateObject("Outlook.Application")
Set objMail = objOutlook.CreateItem(0)

objMail.To = strFileName
objMail.Subject = "Email from Access"
objMail.body = "This email was sent from Access VBA."

' Attach a file from Access
'Debug.Print strFileName
'Set objAttach = objMail.Attachments.Add(strFileName)

objMail.Send

End Function
Sub printIB(strAfd As String, intYear As Integer, strFrom As String)

    Call fncCreateVirtualOverblik
    Call fncCreateVirtualDrift
    Call fncCreateVirtualBeboer
    Call fncCreateVirtualMedarbejder
    Call fncReadIntoOverblik(strAfd, intYear, strFrom)
    Call fncReadIntoDriftsbudget(strAfd, intYear)
    Call fncReadIntoBeboerbudget(strAfd, intYear)
    Call fncReadIntoMedarbejderbudget(strAfd, intYear)
    Call fncExpToExcelAfdbudget(strAfd, intYear, strFrom)

    Set dB = Nothing
    rs.Close
    Set rs = Nothing
    Set O_ARs = Nothing
    Set O_BRs = Nothing
    Set O_MRs = Nothing
    Set O_DRs = Nothing
    Set Drs = Nothing
    Set Brs = Nothing
    Set Mrs = Nothing

    ''Debug.Print "Done"

End Sub
Sub printIB_OLD(strAfd As String, intYear As Integer, strFrom As String)
'
'
'
'    Call fncCreateVirtualOverblik
'    Call fncCreateVirtualDrift
'    Call fncCreateVirtualBeboer
'    Call fncCreateVirtualMedarbejder
'    Call fncReadIntoOverblik(strAfd, intYear)
'    Call fncReadIntoDriftsbudget(strAfd, intYear)
'    Call fncReadIntoBeboerbudget(strAfd, intYear)
'    Call fncReadIntoMedarbejderbudget(strAfd, intYear)
'    Call fncExpToExcelAfdbudget(strAfd, intYear)
'
'
'    Set dB = Nothing
'    rs.Close
'    Set rs = Nothing
'    Set O_ARs = Nothing
'    Set O_BRs = Nothing
'    Set O_MRs = Nothing
'    Set O_DRs = Nothing
'    Set Drs = Nothing
'    Set Brs = Nothing
'    Set Mrs = Nothing

    ''Debug.Print "Done"

End Sub
Sub runTest()

    'Call printIB("10", 2025)
    'MsgBox "Done"


End Sub
Function ParseDDMMYYYY(s As String) As Date
    If Len(s) = 10 Then
        ParseDDMMYYYY = DateSerial( _
            CInt(Right(s, 4)), _
            CInt(Mid(s, 4, 2)), _
            CInt(Left(s, 2)))
    Else
        ParseDDMMYYYY = 0
    End If
End Function
Function IsFileOpen(filename As String) As Boolean
    Dim filenum As Integer
    On Error Resume Next
    filenum = FreeFile()
    Open filename For Binary Access Read Write Lock Read Write As #filenum
    Close filenum
    If Err.Number <> 0 Then
        IsFileOpen = True
        Err.Clear
    Else
        IsFileOpen = False
    End If
    On Error GoTo 0
End Function
