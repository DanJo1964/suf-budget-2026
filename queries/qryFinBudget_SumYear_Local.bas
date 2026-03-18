dbMemo "SQL" ="INSERT INTO tblFinbudget_SumYear_Local ( Year_, Konto, Month_, Afdeling, Beløb )"
    "\015\012SELECT Year([Dato])+1 AS Year_, tblFinansBudget_Local.Konto, Month([Dato"
    "]) AS Month_, tblFinansBudget_Local.Afdeling, Sum(tblFinansBudget_Local.Beløb) A"
    "S Beløb\015\012FROM tblFinansBudget_Local\015\012GROUP BY Year([Dato])+1, tblFin"
    "ansBudget_Local.Konto, tblFinansBudget_Local.Afdeling, Month([Dato]);\015\012"
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
dbBoolean "UseTransaction" ="-1"
Begin
    Begin
        dbText "Name" ="SumOfBeløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Year_]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget_Local.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget_Local.Konto"
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
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
End
