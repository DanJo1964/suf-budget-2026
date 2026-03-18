Operation =1
Option =0
Having ="(((tblTmpDebtor.Afdeling)=\"12\") AND ((tblTmpDebtor.Year_)=2024))"
Begin InputTables
    Name ="tblTmpDebtor"
End
Begin OutputColumns
    Expression ="tblTmpDebtor.Afdeling"
    Expression ="tblTmpDebtor.Year_"
    Expression ="tblTmpDebtor.Paragraf"
    Alias ="SumOfTotalTakstMdr"
    Expression ="Sum(tblTmpDebtor.TotalTakstMdr)"
    Alias ="SumOfXtraTakstFremskr"
    Expression ="Sum(tblTmpDebtor.XtraTakstFremskr)"
    Alias ="Expr1"
    Expression ="Sum(1)"
    Alias ="Expr2"
    Expression ="[TotalTakstMdr]-[XtraTakstFremskr]"
End
Begin Groups
    Expression ="tblTmpDebtor.Afdeling"
    GroupLevel =0
    Expression ="tblTmpDebtor.Year_"
    GroupLevel =0
    Expression ="tblTmpDebtor.Paragraf"
    GroupLevel =0
    Expression ="[TotalTakstMdr]-[XtraTakstFremskr]"
    GroupLevel =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbMemo "OrderBy" ="[Query1].[Paragraf], [Query1].[Expr2]"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.XtraTakstFremskr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.[Xtra takst]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.TotalTakstMdr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.Paragraf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfXtraTakstFremskr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfTotalTakstMdr"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1493
    Bottom =1168
    Left =-1
    Top =-1
    Right =1477
    Bottom =906
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =716
        Top =0
        Name ="tblTmpDebtor"
        Name =""
    End
End
