dbMemo "SQL" ="INSERT INTO tblFinpost_SumYear_Local ( Year_, Konto, Afdeling, Beløb )\015\012SE"
    "LECT YEAR(CDate(Left([Date],10)))+1 AS Year_, EJD.Account, 'EJD' AS Afdeling, Su"
    "m(EJD.Amount) AS SumOfBeløb\015\012FROM tmpGLTransSumClient_49782_EJD AS EJD\015"
    "\012GROUP BY YEAR(CDate(Left([Date],10)))+1, EJD.Account;\015\012"
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
        dbText "Name" ="EJD.Account"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfBeløb"
        dbInteger "ColumnWidth" ="1836"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afdeling"
        dbLong "AggregateType" ="-1"
    End
End
