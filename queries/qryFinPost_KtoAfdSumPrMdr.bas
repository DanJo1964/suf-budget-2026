Operation =1
Option =0
Begin InputTables
    Name ="qryFinPost_KtoAfdBlbUnionMscAnd12"
End
Begin OutputColumns
    Expression ="qryFinPost_KtoAfdBlbUnionMscAnd12.Konto"
    Expression ="qryFinPost_KtoAfdBlbUnionMscAnd12.Afdeling"
    Alias ="SumOfJan"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Jan)"
    Alias ="SumOfFeb"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Feb)"
    Alias ="SumOfMar"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Mar)"
    Alias ="SumOfApr"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Apr)"
    Alias ="SumOfMaj"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Maj)"
    Alias ="SumOfJun"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Jun)"
    Alias ="SumOfJul"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Jul)"
    Alias ="SumOfAug"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Aug)"
    Alias ="SumOfSep"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Sep)"
    Alias ="SumOfOkt"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Okt)"
    Alias ="SumOfNov"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Nov)"
    Alias ="SumOfDec"
    Expression ="Sum(qryFinPost_KtoAfdBlbUnionMscAnd12.Dec)"
End
Begin Groups
    Expression ="qryFinPost_KtoAfdBlbUnionMscAnd12.Konto"
    GroupLevel =0
    Expression ="qryFinPost_KtoAfdBlbUnionMscAnd12.Afdeling"
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
dbMemo "Filter" ="([qryFinPost_KtoAfdSumPrMdr].[Konto]=\"1392\")"
Begin
    Begin
        dbText "Name" ="SumOfAug"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfJul"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfJun"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfMaj"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfDec"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfApr"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfNov"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfMar"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfOkt"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfFeb"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdBlbUnionMscAnd12.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfSep"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfJan"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdBlbUnionMscAnd12.Konto"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1798
    Bottom =996
    Left =-1
    Top =-1
    Right =1782
    Bottom =889
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =322
        Bottom =431
        Top =0
        Name ="qryFinPost_KtoAfdBlbUnionMscAnd12"
        Name =""
    End
End
