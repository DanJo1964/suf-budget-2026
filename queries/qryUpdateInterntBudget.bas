Operation =3
Name ="tblInterntBudget"
Option =0
Where ="(((tblKontoPlan.Kontonummer)<\"2991\") AND (([parmAfdeling])=[parmAfdeling]) AND"
    " (([parmYear_])=[parmYear_]))"
Begin InputTables
    Name ="tblKontoPlan"
    Name ="tblFinbudget_SumÅr_Local"
    Name ="tblFinpost_SumÅr_Local"
End
Begin OutputColumns
    Name ="Konto"
    Expression ="tblKontoPlan.Kontonummer"
    Name ="Kontonavn"
    Expression ="tblKontoPlan.Kontonavn"
    Name ="Kontotype"
    Expression ="tblKontoPlan.Kontotype"
    Name ="Sum"
    Expression ="tblKontoPlan.Sum"
    Alias ="Expr1"
    Name ="Afdeling"
    Expression ="[parmAfdeling]"
    Alias ="Expr2"
    Name ="Year_"
    Expression ="[parmYear_]"
    Alias ="RealForrigeÅr"
    Name ="RealForrigeÅr"
    Expression ="Nz([tblFinbudget_SumÅr_Local].[SumOfBeløb],Null)"
    Alias ="EsitmatForrigeÅr"
    Name ="EstimatForrigeÅr"
    Expression ="Nz([tblFinpost_SumÅr_Local]![SumÅr],Null)"
    Alias ="EstimatFremskrevet"
    Name ="EstimatFremskrevet"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz([tblFinbudget_SumÅr_Local].[SumOfBe"
        "løb]*(1+[parmFremskrivPct]),Null),Null)"
    Alias ="BudgetIalt"
    Name ="BudgetIalt"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz([tblFinbudget_SumÅr_Local].[SumOfBe"
        "løb]*(1+[parmFremskrivPct]),Null),Null)"
    Alias ="_1"
    Name ="_1"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_2"
    Name ="_2"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_3"
    Name ="_3"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_4"
    Name ="_4"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_5"
    Name ="_5"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_6"
    Name ="_6"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_7"
    Name ="_7"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_8"
    Name ="_8"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_9"
    Name ="_9"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_10"
    Name ="_10"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_11"
    Name ="_11"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
    Alias ="_12"
    Name ="_12"
    Expression ="IIf([tblKontoPlan].[Kontonummer]>\"1199\",Nz(([tblFinbudget_SumÅr_Local].[SumOfB"
        "eløb]*(1+[parmFremskrivPct]))/12,Null),Null)"
End
Begin Parameters
    Name ="parmAfdeling"
    Flag =10
    Name ="parmYear_"
    Flag =3
    Name ="parmFremskrivPct"
    Flag =7
End
Begin Joins
    LeftTable ="tblKontoPlan"
    RightTable ="tblFinbudget_SumÅr_Local"
    Expression ="tblKontoPlan.Kontonummer = tblFinbudget_SumÅr_Local.Konto"
    Flag =2
    LeftTable ="tblKontoPlan"
    RightTable ="tblFinpost_SumÅr_Local"
    Expression ="tblKontoPlan.Kontonummer = tblFinpost_SumÅr_Local.Konto"
    Flag =2
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Sum"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontotype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontonavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontonummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinBudgetSumÅr.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinBudgetSumÅr.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinBudgetSumÅr.SumOfBeløb"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1815"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="RealForrigeÅr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinBudget_SumÅr.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinBudget_SumÅr.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_SumÅr.SumÅr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EsitmatForrigeÅr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EstimatFremskrevet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BudgetIalt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_9"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_10"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_11"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_7"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_8"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="_12"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =3410
    Bottom =2336
    Left =-1
    Top =-1
    Right =3377
    Bottom =1169
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =48
        Top =12
        Right =492
        Bottom =767
        Top =0
        Name ="tblKontoPlan"
        Name =""
    End
    Begin
        Left =996
        Top =434
        Right =1284
        Bottom =722
        Top =0
        Name ="tblFinbudget_SumÅr_Local"
        Name =""
    End
    Begin
        Left =972
        Top =24
        Right =1260
        Bottom =312
        Top =0
        Name ="tblFinpost_SumÅr_Local"
        Name =""
    End
End
