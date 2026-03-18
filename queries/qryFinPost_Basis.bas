dbMemo "SQL" ="SELECT tblFinansPoster_Local.Dato, tblFinansPoster_Local.Konto, tblFinansPoster_"
    "Local.Beløb, tblFinansPoster_Local.Afdeling, Year([Dato]) AS Year_, Month([Dato]"
    ") AS [Month]\015\012FROM tblFinansPoster_Local;\015\012"
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
        dbText "Name" ="Year_ "
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Month"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Dato"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Beløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Afdeling"
        dbLong "AggregateType" ="-1"
    End
End
