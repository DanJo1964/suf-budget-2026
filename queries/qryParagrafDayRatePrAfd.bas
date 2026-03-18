Operation =1
Option =0
Begin InputTables
    Name ="qryParagrafOmsRatePrBorger"
End
Begin OutputColumns
    Expression ="qryParagrafOmsRatePrBorger.Afdeling"
    Expression ="qryParagrafOmsRatePrBorger.Paragraf"
    Alias ="GennemsnitOfDayRate"
    Expression ="Avg(qryParagrafOmsRatePrBorger.DayRate)"
    Alias ="GennemsnitOfDayRateXtra"
    Expression ="Avg(qryParagrafOmsRatePrBorger.DayRateXtra)"
End
Begin Groups
    Expression ="qryParagrafOmsRatePrBorger.Afdeling"
    GroupLevel =0
    Expression ="qryParagrafOmsRatePrBorger.Paragraf"
    GroupLevel =0
End
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
        dbText "Name" ="GennemsnitOfDayRate"
        dbInteger "ColumnWidth" ="2625"
        dbBoolean "ColumnHidden" ="0"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="GennemsnitOfDayRateXtra"
        dbInteger "ColumnWidth" ="2925"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
    End
    Begin
        dbText "Name" ="[qryParagrafOmsRatePrBorger].Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[qryParagrafOmsRatePrBorger].Paragraf"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1266
    Bottom =883
    Left =-1
    Top =-1
    Right =1250
    Bottom =447
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="qryParagrafOmsRatePrBorger"
        Name =""
    End
End
