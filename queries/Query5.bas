Operation =2
Name ="SKALLEN"
Option =0
Where ="(((tblInterntBudget.Afdeling)=\"10\") AND ((tblInterntBudget.Year_)=2025))"
Begin InputTables
    Name ="tblInterntBudget"
End
Begin OutputColumns
    Expression ="tblInterntBudget.Konto"
    Expression ="tblInterntBudget.BudgetIalt"
    Alias ="Jan"
    Expression ="tblInterntBudget.[_1]"
    Alias ="Feb"
    Expression ="tblInterntBudget.[_2]"
    Alias ="Mar"
    Expression ="tblInterntBudget.[_3]"
    Alias ="Apr"
    Expression ="tblInterntBudget.[_4]"
    Alias ="Maj"
    Expression ="tblInterntBudget.[_5]"
    Alias ="Jun"
    Expression ="tblInterntBudget.[_6]"
    Alias ="Jul"
    Expression ="tblInterntBudget.[_7]"
    Alias ="Aug"
    Expression ="tblInterntBudget.[_8]"
    Alias ="Sep"
    Expression ="tblInterntBudget.[_9]"
    Alias ="Okt"
    Expression ="tblInterntBudget.[_10]"
    Alias ="Nov"
    Expression ="tblInterntBudget.[_11]"
    Alias ="Dec"
    Expression ="tblInterntBudget.[_12]"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="tblInterntBudget.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_6]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_5]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_12]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_4]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_11]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_3]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_10]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_2]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_9]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_1]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_8]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.BudgetIalt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_7]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Jan"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Feb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Mar"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Jul"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Apr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Aug"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Maj"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Sep"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Jun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Okt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nov"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Dec"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1641
    Bottom =799
    Left =-1
    Top =-1
    Right =1625
    Bottom =537
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="tblInterntBudget"
        Name =""
    End
End
