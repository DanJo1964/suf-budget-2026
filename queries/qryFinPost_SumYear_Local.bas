dbMemo "SQL" ="INSERT INTO tblFinpost_SumYear_Local ( Year_, Konto, Afdeling, Beløb )\015\012SE"
    "LECT Year([Dato])+1 AS Year_, tblFinansPoster_Local.Konto, tblFinansPoster_Local"
    ".Afdeling, Sum(tblFinansPoster_Local.Beløb) AS SumOfBeløb\015\012FROM tblFinansP"
    "oster_Local\015\012GROUP BY Year([Dato])+1, tblFinansPoster_Local.Konto, tblFina"
    "nsPoster_Local.Afdeling;\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="tblFinansPoster.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumÅr"
        dbInteger "ColumnWidth" ="1815"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="AntalMdr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Month_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Beløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget_Local.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget_Local.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansposter_Local.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansposter_Local.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Month([Dato])"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.[Month([Dato])]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfBeløb"
        dbLong "AggregateType" ="-1"
    End
End
