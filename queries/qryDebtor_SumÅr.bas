Operation =1
Option =0
Having ="(((tblTmpDebtor.Afdeling)=[parmAfdeling]) AND ((tblTmpDebtor.Year_)=[parmYear_])"
    ")"
Begin InputTables
    Name ="tblTmpDebtor"
End
Begin OutputColumns
    Expression ="tblTmpDebtor.Paragraf"
    Alias ="Takst_"
    Expression ="Sum(IIf(Year([Status Dato])<[Year_],([Takst]+[Xtra takst])*12,([Takst]+[Xtra tak"
        "st])*(13-Month([Status Dato]))))"
    Expression ="tblTmpDebtor.Afdeling"
    Expression ="tblTmpDebtor.Year_"
End
Begin Parameters
    Name ="parmAfdeling"
    Flag =10
    Name ="parmYear_"
    Flag =3
End
Begin Groups
    Expression ="tblTmpDebtor.Paragraf"
    GroupLevel =0
    Expression ="tblTmpDebtor.Afdeling"
    GroupLevel =0
    Expression ="tblTmpDebtor.Year_"
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
        dbText "Name" ="tblTmpDebtor.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Takst_"
        dbInteger "ColumnWidth" ="1725"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.Takst"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.Paragraf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpDebtor.Kontonavn"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =5626
    Bottom =2921
    Left =-1
    Top =-1
    Right =5584
    Bottom =880
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =457
        Top =0
        Name ="tblTmpDebtor"
        Name =""
    End
End
