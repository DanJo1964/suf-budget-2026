Operation =3
Name ="tblFinbudget_SumYear_Local"
Option =0
Begin InputTables
    Name ="tmpGLBudgetLineClient_49782_EJD"
End
Begin OutputColumns
    Alias ="Year_"
    Name ="Year_"
    Expression ="Year(CDate(Left([Date],10)))"
    Name ="Konto"
    Expression ="tmpGLBudgetLineClient_49782_EJD.Account"
    Alias ="Month_"
    Name ="Month_"
    Expression ="Month(CDate(Left([Date],10)))"
    Name ="Afdeling"
    Expression ="tmpGLBudgetLineClient_49782_EJD.Dimension1"
    Alias ="Beløb"
    Name ="Beløb"
    Expression ="Sum(tmpGLBudgetLineClient_49782_EJD.Amount)"
End
Begin Groups
    Expression ="Year(CDate(Left([Date],10)))"
    GroupLevel =0
    Expression ="tmpGLBudgetLineClient_49782_EJD.Account"
    GroupLevel =0
    Expression ="Month(CDate(Left([Date],10)))"
    GroupLevel =0
    Expression ="tmpGLBudgetLineClient_49782_EJD.Dimension1"
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
dbBoolean "UseTransaction" ="-1"
Begin
    Begin
        dbText "Name" ="tmpGLBudgetLineClient_49782_EJD.Account"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Beløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLBudgetLineClient_49782_EJD.Dimension1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Month_"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =921
    Bottom =799
    Left =-1
    Top =-1
    Right =905
    Bottom =533
    Left =0
    Top =0
    ColumnsShown =655
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="tmpGLBudgetLineClient_49782_EJD"
        Name =""
    End
End
