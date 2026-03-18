Operation =1
Option =0
Having ="(((d.Afdeling)=[pDepartment]) AND ((d.Year_)=[pYear]))"
Begin InputTables
    Name ="tblTmpMedarbejder"
    Alias ="d"
    Name ="tblParm_LønartKonto"
    Alias ="p"
End
Begin OutputColumns
    Expression ="p.FinansKonto"
    Expression ="d.Afdeling"
    Expression ="d.Year_"
    Alias ="SumOfTakst"
    Expression ="Sum(IIf(Year([d].[DatoFra])<[d].[Year_] And ([d].[DatoTil] Is Null Or Year([d].["
        "DatoTil])>[d].[Year_]),[d].[Beløb]*12,IIf(Year([d].[DatoFra])<[d].[Year_] And (["
        "d].[DatoTil] Is Null Or Year([d].[DatoTil])=[d].[Year_]),[d].[Beløb]*Month([d].["
        "DatoTil]),IIf(Year([d].[DatoFra])=[d].[Year_] And ([d].[DatoTil] Is Null Or Year"
        "([d].[DatoTil])>[d].[Year_]),[d].[Beløb]*(12-Month([d].[DatoFra])),IIf(Year([d]."
        "[DatoFra])=[d].[Year_] And Year([d].[DatoTil])=[d].[Year_],[d].[Beløb]*((Month(["
        "d].[DatoTil])-Month([d].[DatoFra]))),0)))))"
End
Begin Parameters
    Name ="pDepartment"
    Flag =10
    Name ="pYear"
    Flag =3
End
Begin Joins
    LeftTable ="d"
    RightTable ="p"
    Expression ="d.Lønart = p.Lønart"
    Flag =2
End
Begin Groups
    Expression ="p.FinansKonto"
    GroupLevel =0
    Expression ="d.Afdeling"
    GroupLevel =0
    Expression ="d.Year_"
    GroupLevel =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="d.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="p.FinansKonto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfTakst"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="d.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="d.Fornavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfBeløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="d.Lønart"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="d.Medarbejdernr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1852
    Bottom =1168
    Left =-1
    Top =-1
    Right =1836
    Bottom =855
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =454
        Top =0
        Name ="d"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="p"
        Name =""
    End
End
