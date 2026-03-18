Operation =3
Name ="tblTmpDebtor"
Option =0
Where ="(((tblDebtorClientUser.Afdeling)=[parmAfdeling]) AND (([parmYear_])=[parmYear_])"
    " AND (([parmFrmPct])=[parmFrmPct]) AND ((tblDebtorClientUser.Status)=\"Aktiv\"))"
    " OR (((tblDebtorClientUser.Paragraf)<>\"\") AND ((Nz([tblDebtorClientUser].[M2],"
    "0))<>0))"
Begin InputTables
    Name ="tblDebtorClientUser"
End
Begin OutputColumns
    Name ="Takst"
    Expression ="tblDebtorClientUser.Takst"
    Name ="Status Dato"
    Expression ="tblDebtorClientUser.[Status Dato]"
    Name ="Paragraf"
    Expression ="tblDebtorClientUser.Paragraf"
    Name ="Xtra takst"
    Expression ="tblDebtorClientUser.[Xtra takst]"
    Name ="Konto"
    Expression ="tblDebtorClientUser.Konto"
    Name ="Kontonavn"
    Expression ="tblDebtorClientUser.Kontonavn"
    Name ="Adresse 1"
    Expression ="tblDebtorClientUser.[Adresse 1]"
    Name ="Adresse 2"
    Expression ="tblDebtorClientUser.[Adresse 2]"
    Name ="Adresse 3"
    Expression ="tblDebtorClientUser.[Adresse 3]"
    Name ="Bynavn"
    Expression ="tblDebtorClientUser.Bynavn"
    Name ="Postnummer"
    Expression ="tblDebtorClientUser.Postnummer"
    Name ="Land"
    Expression ="tblDebtorClientUser.Land"
    Name ="Telefon"
    Expression ="tblDebtorClientUser.Telefon"
    Name ="Afdeling"
    Expression ="tblDebtorClientUser.Afdeling"
    Name ="Bærer"
    Expression ="tblDebtorClientUser.Bærer"
    Name ="Formål"
    Expression ="tblDebtorClientUser.Formål"
    Name ="SUF Veteran"
    Expression ="tblDebtorClientUser.[SUF Veteran]"
    Name ="Uddannelse"
    Expression ="tblDebtorClientUser.Uddannelse"
    Alias ="Expr1"
    Name ="Year_"
    Expression ="[parmYear_]"
    Alias ="FrmPct"
    Name ="FremskrivPct"
    Expression ="[parmFrmPct]"
    Alias ="DatoFra"
    Name ="DatoFra"
    Expression ="IIf(Year([Status Dato])<[parmYear_],DateSerial([parmYear_],1,1),[Status Dato])"
    Alias ="DatoTil"
    Name ="DatoTil"
    Expression ="DateSerial([parmYear_],12,31)"
    Alias ="XtraTakstFremskr"
    Name ="XtraTakstFremskr"
    Expression ="[Xtra takst]*(1+[parmFrmPct])"
    Alias ="TotalTakstMdr"
    Name ="TotalTakstMdr"
    Expression ="([Takst]+[Xtra takst])*(1+[parmFrmPct])"
    Alias ="TotalTakstDÅ"
    Name ="TotalTakstDÅ"
    Expression ="(([Takst]+[Xtra takst])*(1+[parmFrmPct]))*((Month([DatoTil])-Month([DatoFra])+1)"
        ")"
End
Begin Parameters
    Name ="parmAfdeling"
    Flag =10
    Name ="parmYear_"
    Flag =3
    Name ="parmFrmPct"
    Flag =7
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbBoolean "FailOnError" ="0"
dbByte "Orientation" ="0"
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
End
Begin
    State =0
    Left =0
    Top =0
    Right =1608
    Bottom =808
    Left =-1
    Top =-1
    Right =1592
    Bottom =651
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =113
        Top =16
        Right =412
        Bottom =693
        Top =0
        Name ="tblDebtorClientUser"
        Name =""
    End
End
