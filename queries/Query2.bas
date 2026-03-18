dbMemo "SQL" ="SELECT Sum(TotalBeløbBudgetDÅ) AS SumAfd1Løn, Year_, Valgfri2\015\012FROM tblTmp"
    "Medarbejder\015\012GROUP BY Valgfri2, Year_, Revision, Afdeling\015\012HAVING Ye"
    "ar_ = 2025 AND Revision = 0 And Afdeling = '1';\015\012"
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
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumAfd1Løn"
        dbInteger "ColumnWidth" ="2046"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Valgfri2"
        dbLong "AggregateType" ="-1"
    End
End
