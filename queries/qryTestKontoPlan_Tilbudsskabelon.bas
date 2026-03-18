Operation =1
Option =0
Where ="(((tblInterntBudget.Konto)>\"1199\") AND ((tblInterntBudget.Kontotype)<>\"SUM\" "
    "And (tblInterntBudget.Kontotype)<>\"Overskrift\") AND ((Round([tblInterntBudget]"
    ".[BudgetIalt],0))<>0) AND ((tblInterntBudget.Afdeling)=\"12\") AND ((tblInterntB"
    "udget.Year_)=2024))"
Begin InputTables
    Name ="tblInterntBudget"
    Name ="tblKontoPlan_Tilbudsskabelon"
End
Begin OutputColumns
    Expression ="tblInterntBudget.Konto"
    Expression ="tblInterntBudget.KontoNavn"
    Expression ="tblInterntBudget.Kontotype"
    Alias ="Budget"
    Expression ="Round([tblInterntBudget].[BudgetIalt],0)"
    Expression ="tblKontoPlan_Tilbudsskabelon.Placering"
    Expression ="tblInterntBudget.Afdeling"
End
Begin Joins
    LeftTable ="tblInterntBudget"
    RightTable ="tblKontoPlan_Tilbudsskabelon"
    Expression ="tblInterntBudget.Konto = tblKontoPlan_Tilbudsskabelon.Konto"
    Flag =2
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
        dbText "Name" ="tblInterntBudget.KontoNavn"
        dbInteger "ColumnWidth" ="4110"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan_Tilbudsskabelon.Placering"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Kontotype"
        dbInteger "ColumnWidth" ="1395"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Budget"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan_Tilbudsskabelon.Beskrivelse"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.BudgetIalt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontotype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan_Tilbudsskabelon.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontonummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontonavn"
        dbInteger "ColumnWidth" ="4755"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2211
    Bottom =1168
    Left =-1
    Top =-1
    Right =1350
    Bottom =889
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =319
        Bottom =896
        Top =0
        Name ="tblInterntBudget"
        Name =""
    End
    Begin
        Left =367
        Top =12
        Right =637
        Bottom =571
        Top =0
        Name ="tblKontoPlan_Tilbudsskabelon"
        Name =""
    End
End
