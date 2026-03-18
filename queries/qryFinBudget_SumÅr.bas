Operation =1
Option =0
Having ="(((Year([Dato])+1)=[parmYear_]) AND ((tblFinansBudget_Local.Afdeling)=[parmAfdel"
    "ing]))"
Begin InputTables
    Name ="tblFinansBudget_Local"
End
Begin OutputColumns
    Alias ="Year_"
    Expression ="Year([Dato])+1"
    Expression ="tblFinansBudget_Local.Konto"
    Expression ="tblFinansBudget_Local.Afdeling"
    Alias ="SumOfBeløb"
    Expression ="Sum(tblFinansBudget_Local.Beløb)"
End
Begin Parameters
    Name ="parmAfdeling"
    Flag =10
    Name ="parmYear_"
    Flag =3
End
Begin Groups
    Expression ="Year([Dato])+1"
    GroupLevel =0
    Expression ="tblFinansBudget_Local.Konto"
    GroupLevel =0
    Expression ="tblFinansBudget_Local.Afdeling"
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
        dbText "Name" ="SumOfBeløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Year_]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget_Local.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansBudget_Local.Konto"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1618
    Bottom =1280
    Left =-1
    Top =-1
    Right =1585
    Bottom =753
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =96
        Top =24
        Right =384
        Bottom =380
        Top =0
        Name ="tblFinansBudget_Local"
        Name =""
    End
End
