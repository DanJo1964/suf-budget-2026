Operation =1
Option =0
Where ="(((tblInterntBudget.Konto)=\"1102\" Or (tblInterntBudget.Konto)=\"1103\" Or (tbl"
    "InterntBudget.Konto)=\"1104\" Or (tblInterntBudget.Konto)=\"1201\" Or (tblIntern"
    "tBudget.Konto)=\"1301\" Or (tblInterntBudget.Konto)=\"1501\" Or (tblInterntBudge"
    "t.Konto)=\"1803\") AND ((tblInterntBudget.Year_)=2025))"
Begin InputTables
    Name ="tblInterntBudget"
End
Begin OutputColumns
    Expression ="tblInterntBudget.Afdeling"
    Expression ="tblInterntBudget.Konto"
    Expression ="tblInterntBudget.BudgetIalt"
End
Begin OrderBy
    Expression ="tblInterntBudget.Konto"
    Flag =0
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
        dbText "Name" ="tblInterntBudget.BudgetIalt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Afdeling"
        dbInteger "ColumnWidth" ="1560"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2716
    Bottom =2020
    Left =-1
    Top =-1
    Right =2674
    Bottom =1400
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =120
        Top =30
        Right =480
        Bottom =1230
        Top =0
        Name ="tblInterntBudget"
        Name =""
    End
End
