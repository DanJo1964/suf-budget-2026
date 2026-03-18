Operation =1
Option =0
Having ="(((Year([Dato])+1)=[parmYear_]) AND ((tblFinansPoster.Afdeling)=[parmAfdeling]))"
Begin InputTables
    Name ="tblFinansPoster"
End
Begin OutputColumns
    Alias ="Year_"
    Expression ="Year([Dato])+1"
    Expression ="tblFinansPoster.Konto"
    Alias ="SumÅr"
    Expression ="Sum(Nz([Beløb]/[qryFinPost_AntalMdr]![AntalMdr],0)*12)"
    Expression ="tblFinansPoster.Afdeling"
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
    Expression ="tblFinansPoster.Konto"
    GroupLevel =0
    Expression ="tblFinansPoster.Afdeling"
    GroupLevel =0
    Expression ="6"
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
        dbText "Name" ="tblFinansPoster.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumÅr"
        dbInteger "ColumnWidth" ="1815"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="AntalMdr"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1686
    Bottom =1168
    Left =-1
    Top =-1
    Right =1670
    Bottom =889
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =465
        Top =0
        Name ="tblFinansPoster"
        Name =""
    End
End
