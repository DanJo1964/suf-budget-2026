Operation =1
Option =0
Having ="(((tblTmpMedarbejder.Afdeling)=[parmAfdeling]))"
Begin InputTables
    Name ="tblTmpMedarbejder"
End
Begin OutputColumns
    Expression ="tblTmpMedarbejder.Afdeling"
    Alias ="Kategori"
    Expression ="[Valgfri1] & \"-\" & [Valgfri3]"
    Alias ="SumOfTotalBeløbBudgetDÅ"
    Expression ="Sum(tblTmpMedarbejder.TotalBeløbBudgetDÅ)"
    Alias ="PercentageOfTotal"
    Expression ="(Sum([tblTmpMedarbejder].[TotalBeløbBudgetDÅ])/(SELECT Sum(TotalBeløbBudgetDÅ) \015"
        "\012         FROM tblTmpMedarbejder \015\012         WHERE Afdeling = [parmAfdel"
        "ing]))*100"
End
Begin Parameters
    Name ="parmAfdeling"
    Flag =10
End
Begin Groups
    Expression ="tblTmpMedarbejder.Afdeling"
    GroupLevel =0
    Expression ="[Valgfri1] & \"-\" & [Valgfri3]"
    GroupLevel =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="tblTmpMedarbejder.Afdeling"
        dbInteger "ColumnWidth" ="1695"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Kategori"
        dbInteger "ColumnWidth" ="2175"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfTotalBeløbBudgetDÅ"
        dbInteger "ColumnWidth" ="2985"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PercentageOfTotal"
        dbInteger "ColumnWidth" ="2160"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1277
    Bottom =1168
    Left =-1
    Top =-1
    Right =1261
    Bottom =889
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =358
        Bottom =776
        Top =0
        Name ="tblTmpMedarbejder"
        Name =""
    End
End
