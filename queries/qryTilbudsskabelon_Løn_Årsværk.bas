dbMemo "SQL" ="PARAMETERS parmAfdeling Text ( 255 );\015\012SELECT InnerQuery.Kategori, (Sum(In"
    "nerQuery.AvgOfNormtid)/160.33) AS SumOfAvgNormtid\015\012FROM (SELECT [Valgfri1]"
    " & \"-\" & [Valgfri3] AS Kategori, Avg(tblTmpMedarbejder.Normtid) AS AvgOfNormti"
    "d FROM tblTmpMedarbejder WHERE tblTmpMedarbejder.Afdeling=[parmAfdeling] GROUP B"
    "Y tblTmpMedarbejder.Medarbejdernr, [Valgfri1] & \"-\" & [Valgfri3])  AS InnerQue"
    "ry\015\012GROUP BY InnerQuery.Kategori;\015\012"
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
        dbText "Name" ="SumOfAvgNormtid"
        dbInteger "ColumnWidth" ="2175"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="InnerQuery.Kategori"
        dbInteger "ColumnWidth" ="2130"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
