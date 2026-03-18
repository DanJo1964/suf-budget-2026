dbMemo "SQL" ="SELECT tblTmpMedarbejder.Afdeling, [Valgfri1] & \"-\" & [Valgfri3] AS Kategori, "
    "NZ(Sum(tblTmpMedarbejder.TotalBeløbBudgetDÅ), 0) + \015\012    NZ((SELECT SUM(NZ"
    "(BudgetIalt,0) - NZ(EstimatFremskrevet,0)) FROM tblInterntBudget WHERE Afdeling "
    "= [parmAfdUniconta] AND Konto = '1100'), 0) AS SumOfTotalBeløbBudgetDÅ, (NZ(Sum("
    "tblTmpMedarbejder.TotalBeløbBudgetDÅ), 0) / \015\012        NZ((SELECT Sum(NZ(To"
    "talBeløbBudgetDÅ, 0))\015\012         FROM tblTmpMedarbejder \015\012         WH"
    "ERE Afdeling = [parmAfdeling]), 1)\015\012    ) * 100 AS PercentageOfTotal, NZ(("
    "SELECT SUM(NZ(BudgetIalt,0) - NZ(EstimatFremskrevet,0)) FROM tblInterntBudget WH"
    "ERE Afdeling = [parmAfdUniconta] AND Konto = '1100'), 0) *\015\012    ((NZ(Sum(t"
    "blTmpMedarbejder.TotalBeløbBudgetDÅ), 0) / \015\012        NZ((SELECT Sum(NZ(Tot"
    "alBeløbBudgetDÅ, 0))\015\012         FROM tblTmpMedarbejder \015\012         WHE"
    "RE Afdeling = [parmAfdeling]), 1)\015\012    ) * 0.01) AS ModifiedNestedValue\015"
    "\012FROM tblTmpMedarbejder\015\012GROUP BY tblTmpMedarbejder.Afdeling, [Valgfri1"
    "] & \"-\" & [Valgfri3]\015\012HAVING tblTmpMedarbejder.Afdeling=[parmAfdeling];\015"
    "\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="Kategori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpMedarbejder.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PercentageOfTotal"
        dbInteger "ColumnWidth" ="2160"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfTotalBeløbBudgetDÅ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ModifiedNestedValue"
        dbInteger "ColumnWidth" ="2490"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
