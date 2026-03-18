Operation =4
Option =0
Begin InputTables
    Name ="tblInterntBudget"
    Name ="BudgetSM_2026"
End
Begin OutputColumns
    Name ="tblInterntBudget.BudgetIalt"
    Expression ="[BudgetSM_2026]![BudgetIalt]"
    Name ="tblInterntBudget.[_1]"
    Expression ="[BudgetSM_2026]![_1]"
    Name ="tblInterntBudget.[_2]"
    Expression ="[BudgetSM_2026]![_2]"
    Name ="tblInterntBudget.[_3]"
    Expression ="[BudgetSM_2026]![_3]"
    Name ="tblInterntBudget.[_4]"
    Expression ="[BudgetSM_2026]![_4]"
    Name ="tblInterntBudget.[_5]"
    Expression ="[BudgetSM_2026]![_5]"
    Name ="tblInterntBudget.[_6]"
    Expression ="[BudgetSM_2026]![_6]"
    Name ="tblInterntBudget.[_7]"
    Expression ="[BudgetSM_2026]![_7]"
    Name ="tblInterntBudget.[_8]"
    Expression ="[BudgetSM_2026]![_8]"
    Name ="tblInterntBudget.[_9]"
    Expression ="[BudgetSM_2026]![_9]"
    Name ="tblInterntBudget.[_10]"
    Expression ="[BudgetSM_2026]![_10]"
    Name ="tblInterntBudget.[_11]"
    Expression ="[BudgetSM_2026]![_11]"
    Name ="tblInterntBudget.[_12]"
    Expression ="[BudgetSM_2026]![_12]"
End
Begin Joins
    LeftTable ="tblInterntBudget"
    RightTable ="BudgetSM_2026"
    Expression ="tblInterntBudget.Konto = BudgetSM_2026.Konto"
    Flag =1
    LeftTable ="tblInterntBudget"
    RightTable ="BudgetSM_2026"
    Expression ="tblInterntBudget.Afdeling = BudgetSM_2026.Afdeling"
    Flag =1
    LeftTable ="tblInterntBudget"
    RightTable ="BudgetSM_2026"
    Expression ="tblInterntBudget.Year_ = BudgetSM_2026.Year_"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbBoolean "FailOnError" ="0"
dbByte "Orientation" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="tblInterntBudget.[_7]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.BudgetIalt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.[_6]"
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
End
Begin
    State =0
    Left =0
    Top =0
    Right =1182
    Bottom =808
    Left =-1
    Top =-1
    Right =1166
    Bottom =512
    Left =0
    Top =0
    ColumnsShown =579
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="tblInterntBudget"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="BudgetSM_2026"
        Name =""
    End
End
