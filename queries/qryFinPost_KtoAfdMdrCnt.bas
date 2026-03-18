Operation =1
Option =0
Begin InputTables
    Name ="qryFinPost_KtoAfdMdr"
End
Begin OutputColumns
    Expression ="qryFinPost_KtoAfdMdr.Konto"
    Expression ="qryFinPost_KtoAfdMdr.Afdeling"
    Alias ="SumOfSumOfBeløb"
    Expression ="Sum(qryFinPost_KtoAfdMdr.SumOfBeløb)"
    Alias ="MdrCnt"
    Expression ="Sum(1)"
End
Begin Groups
    Expression ="qryFinPost_KtoAfdMdr.Konto"
    GroupLevel =0
    Expression ="qryFinPost_KtoAfdMdr.Afdeling"
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
        dbText "Name" ="SumOfSumOfBeløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MdrCnt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdr.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdr.Konto"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1391
    Bottom =1168
    Left =-1
    Top =-1
    Right =1375
    Bottom =889
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="qryFinPost_KtoAfdMdr"
        Name =""
    End
End
