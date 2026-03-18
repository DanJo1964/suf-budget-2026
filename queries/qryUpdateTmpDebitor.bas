dbMemo "SQL" ="PARAMETERS parmAfdeling Text ( 255 ), parmYear_ Short, parmFrmPct IEEEDouble;\015"
    "\012INSERT INTO tblTmpDebtor ( Takst, [Status Dato], Paragraf, [Xtra takst], Kon"
    "to, Kontonavn, [Adresse 1], [Adresse 2], [Adresse 3], Bynavn, Postnummer, Land, "
    "Telefon, Afdeling, Bærer, Formål, [SUF Veteran], Uddannelse, Year_, FremskrivPct"
    ", DatoFra, DatoTil, XtraTakstFremskr, TotalTakstMdr, TotalTakstDÅ, M2 )\015\012S"
    "ELECT Takst, [Status Dato], Paragraf, [Xtra takst], Konto, Kontonavn, [Adresse 1"
    "], [Adresse 2], [Adresse 3], Bynavn, Postnummer, Land, Telefon, Afdeling, Bærer,"
    " Formål, [SUF Veteran], Uddannelse, [parmYear_] AS Year_, [parmFrmPct] AS FrmPct"
    ", IIf(Year([Status Dato])<[parmYear_],DateSerial([parmYear_],1,1),[Status Dato])"
    " AS DatoFra, DateSerial([parmYear_],12,31) AS DatoTil, [Xtra takst]*(1+[parmFrmP"
    "ct]) AS XtraTakstFremskr, ([Takst]+[Xtra takst])*(1+[parmFrmPct]) AS TotalTakstM"
    "dr, (([Takst]+[Xtra takst])*(1+[parmFrmPct]))*((Month([DatoTil])-Month([DatoFra]"
    ")+1)) AS TotalTakstDÅ, M2\015\012FROM tblDebtorClientUser\015\012WHERE Afdeling="
    "[parmAfdeling] And (Status=\"Aktiv\" Or Paragraf<>\"\" Or Nz(tblDebtorClientUser"
    ".M2,0)<>0);\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbBoolean "FailOnError" ="0"
dbByte "Orientation" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="tblDebtorClientUser.Bærer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.[Adresse 1]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Kontonavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Telefon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Land"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.[Xtra takst]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Postnummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.[Status Dato]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Uddannelse"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Bynavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Paragraf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.[SUF Veteran]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.[Adresse 3]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Status"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Formål"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.[Adresse 2]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Takst"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DatoTil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="AntalMdr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DatoFra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FrmPct"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TotalMdr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.[Leveringsadresse 1]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Leveringsby"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="XtraTakstFremskr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TotalTakstDÅ"
        dbInteger "ColumnWidth" ="1635"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TotalTakstMdr"
        dbInteger "ColumnWidth" ="1740"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nz([tblDebtorClientUser].[M2],0)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="M2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Kvm"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SUF Veteran]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Formål"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Bærer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Status Dato]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Adresse 2]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Adresse 3]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Takst"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Paragraf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Xtra takst]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Kontonavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Adresse 1]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Bynavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Postnummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Land"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Telefon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Uddannelse"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
End
