dbMemo "SQL" ="SELECT qryTilbudsskabelon_Løn_Opdelt.*, qryTilbudsskabelon_Løn_Årsværk.SumOfAvgN"
    "ormtid\015\012FROM qryTilbudsskabelon_Løn_Opdelt INNER JOIN qryTilbudsskabelon_L"
    "øn_Årsværk ON qryTilbudsskabelon_Løn_Opdelt.Kategori = qryTilbudsskabelon_Løn_År"
    "sværk.Kategori;\015\012"
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
        dbText "Name" ="qryTilbudsskabelon_Løn_Opdelt.Kategori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryTilbudsskabelon_Løn_Opdelt.tblTmpMedarbejder.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryTilbudsskabelon_Løn_Opdelt.SumOfTotalBeløbBudgetDÅ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryTilbudsskabelon_Løn_Opdelt.PercentageOfTotal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryTilbudsskabelon_Løn_Årsværk.SumOfAvgNormtid"
        dbLong "AggregateType" ="-1"
    End
End
