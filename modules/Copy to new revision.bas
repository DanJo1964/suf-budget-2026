Attribute VB_Name = "Copy to new revision"
Option Compare Database

'Kode til at oprette en kopi af en afdeling - i dette tilfælde 73 til 73-1
Sub InsertDataFromTmpQuery_old()
    Dim dB As DAO.Database
    Dim rsSource As DAO.Recordset
    Dim rsTarget As DAO.Recordset

    Set dB = CurrentDb()
    Set rsSource = dB.OpenRecordset("SELECT * FROM [tblInterntBudget_til_68-2] WHERE Afdeling = '74' And Year_ = 2024;", dbOpenDynaset, dbSeeChanges)
    Set rsTarget = CurrentDb.OpenRecordset("tblInterntBudget", dbOpenDynaset, dbSeeChanges)

    With rsSource
        If Not (.BOF And .EOF) Then
            .MoveFirst


            Do Until .EOF
                With rsTarget
                    .AddNew

                    !Afdeling = "74-1"
                    !Year_ = rsSource.Fields("Year_")
                    ![_1] = Nz(rsSource.Fields("_1"), 0)
                    ![_10] = Nz(rsSource.Fields("_10"), 0)
                    ![_11] = Nz(rsSource.Fields("_11"), 0)
                    ![_12] = Nz(rsSource.Fields("_12"), 0)
                    ![_2] = Nz(rsSource.Fields("_2"), 0)
                    ![_3] = Nz(rsSource.Fields("_3"), 0)
                    ![_4] = Nz(rsSource.Fields("_4"), 0)
                    ![_5] = Nz(rsSource.Fields("_5"), 0)
                    ![_6] = Nz(rsSource.Fields("_6"), 0)
                    ![_7] = Nz(rsSource.Fields("_7"), 0)
                    ![_8] = Nz(rsSource.Fields("_8"), 0)
                    ![_9] = Nz(rsSource.Fields("_9"), 0)
                    !BudgetIalt = Nz(rsSource.Fields("BudgetIalt"), 0)
                    !EstimatForrigeÅr = Nz(rsSource.Fields("EstimatForrigeÅr"), 0)
                    !EstimatFremskrevet = Nz(rsSource.Fields("EstimatFremskrevet"), 0)
                    !Kommentarer = Nz(rsSource.Fields("Kommentarer"), "")
                    !Konto = Nz(rsSource.Fields("Konto"), "")
                    !Kontonavn = Nz(rsSource.Fields("KontoNavn"), "")
                    !Kontotype = Nz(rsSource.Fields("Kontotype"), "")
                    !RealForrigeÅr = Nz(rsSource.Fields("RealForrigeÅr"), 0)
                    ![Sum] = Nz(rsSource.Fields("Sum"), "")
                    !Revision = 0

                    .Update
                End With
                .MoveNext
            Loop
        End If
    End With

    rsSource.Close
    rsTarget.Close
    Set rsSource = Nothing
    Set rsTarget = Nothing
    Set dB = Nothing
End Sub
Sub InsertDataFromTmpDebtorQuery()
    Dim dB As DAO.Database
    Dim rsSource As DAO.Recordset
    Dim rsTarget As DAO.Recordset

    Set dB = CurrentDb()
    Set rsSource = dB.OpenRecordset("SELECT * FROM [tblTmpDebtor_til_68-1] WHERE Afdeling = '74' And Year_ = 2024;", dbOpenDynaset, dbSeeChanges)
    Set rsTarget = dB.OpenRecordset("tblTmpDebtor", dbOpenDynaset, dbSeeChanges)

    With rsSource
        If Not (.BOF And .EOF) Then
            .MoveFirst
            Do Until .EOF
                With rsTarget
                    .AddNew

                    ![Adresse 1] = IIf(IsNull(rsSource.Fields("[Adresse 1]")), "", rsSource.Fields("[Adresse 1]"))
                    ![Adresse 2] = IIf(IsNull(rsSource.Fields("[Adresse 2]")), "", rsSource.Fields("[Adresse 2]"))
                    ![Adresse 3] = IIf(IsNull(rsSource.Fields("[Adresse 3]")), "", rsSource.Fields("[Adresse 3]"))
                    !Afdeling = "74-1"
                    !Bynavn = IIf(IsNull(rsSource.Fields("Bynavn")), "", rsSource.Fields("Bynavn"))
                    !Bærer = IIf(IsNull(rsSource.Fields("Bærer")), "", rsSource.Fields("Bærer"))
                    !DatoFra = IIf(IsNull(rsSource.Fields("DatoFra")), Date, rsSource.Fields("DatoFra")) ' Assuming Date
                    !DatoTil = IIf(IsNull(rsSource.Fields("DatoTil")), Date, rsSource.Fields("DatoTil")) ' Assuming Date
                    !Formål = IIf(IsNull(rsSource.Fields("Formål")), "", rsSource.Fields("Formål"))
                    !FremskrivBeløb = IIf(IsNull(rsSource.Fields("FremskrivBeløb")), 0, rsSource.Fields("FremskrivBeløb"))  ' Assuming numeric
                    ![FremskrivBeløb (grund)] = IIf(IsNull(rsSource.Fields("[FremskrivBeløb (grund)]")), 0, rsSource.Fields("[FremskrivBeløb (grund)]"))  ' Assuming numeric
                    !FremskrivPct = IIf(IsNull(rsSource.Fields("FremskrivPct")), 0, rsSource.Fields("FremskrivPct"))  ' Assuming numeric
                    !Konto = IIf(IsNull(rsSource.Fields("Konto")), "", rsSource.Fields("Konto"))  ' Assuming numeric
                    !Kontonavn = IIf(IsNull(rsSource.Fields("Kontonavn")), "", rsSource.Fields("Kontonavn"))
                    !Land = IIf(IsNull(rsSource.Fields("Land")), "", rsSource.Fields("Land"))
                    !Paragraf = IIf(IsNull(rsSource.Fields("Paragraf")), "", rsSource.Fields("Paragraf"))
                    !Postnummer = IIf(IsNull(rsSource.Fields("Postnummer")), "", rsSource.Fields("Postnummer"))  ' Assuming numeric
                    ![Status Dato] = IIf(IsNull(rsSource.Fields("[Status Dato]")), Date, rsSource.Fields("[Status Dato]")) ' Assuming Date
                    ![SUF Veteran] = IIf(IsNull(rsSource.Fields("[SUF Veteran]")), "", rsSource.Fields("[SUF Veteran]"))
                    !Takst = IIf(IsNull(rsSource.Fields("Takst")), 0, rsSource.Fields("Takst"))  ' Assuming numeric
                    ![Takst (grund)] = IIf(IsNull(rsSource.Fields("[Takst (grund)]")), 0, rsSource.Fields("[Takst (grund)]"))  ' Assuming numeric
                    !Telefon = IIf(IsNull(rsSource.Fields("Telefon")), "", rsSource.Fields("Telefon"))
                    !TotalTakstDÅ = IIf(IsNull(rsSource.Fields("TotalTakstDÅ")), 0, rsSource.Fields("TotalTakstDÅ"))  ' Assuming numeric
                    ![TotalTakstDÅ (grund)] = IIf(IsNull(rsSource.Fields("[TotalTakstDÅ (grund)]")), 0, rsSource.Fields("[TotalTakstDÅ (grund)]"))  ' Assuming numeric
                    !TotalTakstMdr = IIf(IsNull(rsSource.Fields("TotalTakstMdr")), 0, rsSource.Fields("TotalTakstMdr"))  ' Assuming numeric
                    ![TotalTakstMdr (grund)] = IIf(IsNull(rsSource.Fields("[TotalTakstMdr (grund)]")), 0, rsSource.Fields("[TotalTakstMdr (grund)]"))  ' Assuming numeric
                    !Uddannelse = IIf(IsNull(rsSource.Fields("Uddannelse")), "", rsSource.Fields("Uddannelse"))
                    '!Valuta = IIf(IsNull(rsSource.Fields("Valuta")), "", rsSource.Fields("Valuta"))
                    '!Valutakurs = IIf(IsNull(rsSource.Fields("Valutakurs")), 0, rsSource.Fields("Valutakurs"))  ' Assuming numeric
                    ![Xtra takst] = IIf(IsNull(rsSource.Fields("[Xtra takst]")), 0, rsSource.Fields("[Xtra takst]"))  ' Assuming numeric
                    ![Xtra takst (grund)] = IIf(IsNull(rsSource.Fields("[Xtra takst (grund)]")), 0, rsSource.Fields("[Xtra takst (grund)]"))  ' Assuming numeric
                    !XtraTakstFremskr = IIf(IsNull(rsSource.Fields("XtraTakstFremskr")), 0, rsSource.Fields("XtraTakstFremskr"))  ' Assuming numeric
                    !Year_ = IIf(IsNull(rsSource.Fields("Year_")), 0, rsSource.Fields("Year_"))  ' Assuming numeric
                    !Revision = 0

                    .Update
                End With
                .MoveNext
            Loop
            'Debug.Print "SLUT"
        End If
    End With

    rsSource.Close
    rsTarget.Close
    Set rsSource = Nothing
    Set rsTarget = Nothing
    Set dB = Nothing
End Sub
Sub InsertDataFromTmpMed731Query()
    Dim dB As DAO.Database
    Dim rsSource As DAO.Recordset
    Dim rsTarget As DAO.Recordset

    Set dB = CurrentDb()
    Set rsSource = dB.OpenRecordset("SELECT * FROM [tblTmpMedarbejder_til_68-1] WHERE Afdeling = 'VALBY BOAS Valby' And Year_ = 2024;", dbOpenDynaset, dbSeeChanges)
    Set rsTarget = dB.OpenRecordset("tblTmpMedarbejder", dbOpenDynaset, dbSeeChanges)

    With rsSource
        If Not (.BOF And .EOF) Then
            .MoveFirst
            Do Until .EOF
                With rsTarget
                    .AddNew

                    !Afdeling = "74-1 VALBY BOAS Valby"
                    !Beløb = IIf(IsNull(rsSource.Fields("Beløb")), 0, rsSource.Fields("Beløb"))  ' Assuming numeric
                    !BeløbBudget = IIf(IsNull(rsSource.Fields("BeløbBudget")), 0, rsSource.Fields("BeløbBudget"))  ' Assuming numeric
                    !DatoFra = IIf(IsNull(rsSource.Fields("DatoFra")), Date, rsSource.Fields("DatoFra")) ' Assuming Date
                    !DatoTil = IIf(IsNull(rsSource.Fields("DatoTil")), Date, rsSource.Fields("DatoTil")) ' Assuming Date
                    !Efternavn = IIf(IsNull(rsSource.Fields("Efternavn")), "", rsSource.Fields("Efternavn"))
                    ![Ekstern titel] = IIf(IsNull(rsSource.Fields("[Ekstern titel]")), "", rsSource.Fields("[Ekstern titel]"))
                    !Fornavn = IIf(IsNull(rsSource.Fields("Fornavn")), "", rsSource.Fields("Fornavn"))
                    !Lønart = IIf(IsNull(rsSource.Fields("Lønart")), "", rsSource.Fields("Lønart"))
                    !Løntrin = IIf(IsNull(rsSource.Fields("Løntrin")), "", rsSource.Fields("Løntrin"))  ' Assuming numeric
                    !LøntrinBudget = IIf(IsNull(rsSource.Fields("LøntrinBudget")), 0, rsSource.Fields("LøntrinBudget"))  ' Assuming numeric
                    !Medarbejdernr = IIf(IsNull(rsSource.Fields("Medarbejdernr")), 0, rsSource.Fields("Medarbejdernr"))  ' Assuming numeric
                    !Normtid = IIf(IsNull(rsSource.Fields("Normtid")), 0, rsSource.Fields("Normtid"))  ' Assuming numeric
                    !StatusDato = IIf(IsNull(rsSource.Fields("StatusDato")), Date, rsSource.Fields("StatusDato")) ' Assuming Date
                    !TotalBeløbBudgetDÅ = IIf(IsNull(rsSource.Fields("TotalBeløbBudgetDÅ")), 0, rsSource.Fields("TotalBeløbBudgetDÅ"))  ' Assuming numeric
                    !TotalNormtidDÅ = IIf(IsNull(rsSource.Fields("TotalNormtidDÅ")), 0, rsSource.Fields("TotalNormtidDÅ"))  ' Assuming numeric
                    !Valgfri1 = IIf(IsNull(rsSource.Fields("Valgfri1")), "", rsSource.Fields("Valgfri1"))
                    !Valgfri2 = IIf(IsNull(rsSource.Fields("Valgfri2")), "", rsSource.Fields("Valgfri2"))
                    !Valgfri3 = IIf(IsNull(rsSource.Fields("Valgfri3")), "", rsSource.Fields("Valgfri3"))
                    !Year_ = IIf(IsNull(rsSource.Fields("Year_")), 0, rsSource.Fields("Year_"))  ' Assuming numeric
                    !Revision = 0

                    .Update
                End With
                .MoveNext
            Loop
            'Debug.Print "SLUT Medarb"
        End If
    End With

    rsSource.Close
    rsTarget.Close
    Set rsSource = Nothing
    Set rsTarget = Nothing
    Set dB = Nothing
End Sub

Sub CallStoredProcedure()
    Dim conn As ADODB.Connection
    Dim cmd As ADODB.Command
    Dim YearParam As ADODB.Parameter
    Dim DepartmentParam As ADODB.Parameter
    Dim VersionParam As ADODB.Parameter

    ' Create a new Connection object
    Set conn = New ADODB.Connection
    conn.Open fncConnString

    ' Create a new Command object
    Set cmd = New ADODB.Command
    cmd.ActiveConnection = conn
    cmd.CommandType = adCmdStoredProc
    cmd.CommandText = "STP_CopyTblIB"

    ' Create new Parameter objects
    Set YearParam = cmd.CreateParameter("@YearParam", adInteger, adParamInput, , 2024)
    cmd.Parameters.Append YearParam

    Set DepartmentParam = cmd.CreateParameter("@DepartmentParam", adVarChar, adParamInput, 255, "68-1")
    cmd.Parameters.Append DepartmentParam

    Set VersionParam = cmd.CreateParameter("@VersionParam", adInteger, adParamInput, , 0)
    cmd.Parameters.Append VersionParam

    ' Execute the Command
    cmd.Execute

    ' Clean up
    Set YearParam = Nothing
    Set DepartmentParam = Nothing
    Set VersionParam = Nothing
    Set cmd = Nothing
    conn.Close
    Set conn = Nothing
End Sub
