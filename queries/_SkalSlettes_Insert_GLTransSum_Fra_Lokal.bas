Operation =3
Name ="tblTmpGLTransSum"
Option =0
Begin InputTables
    Name ="tmpGLTransSumClient_48928"
End
Begin OutputColumns
    Name ="Date"
    Expression ="tmpGLTransSumClient_48928.Date"
    Name ="Account"
    Expression ="tmpGLTransSumClient_48928.Account"
    Name ="AccountType"
    Expression ="tmpGLTransSumClient_48928.AccountType"
    Name ="Dimension1"
    Expression ="tmpGLTransSumClient_48928.Dimension1"
    Name ="Dimension2"
    Expression ="tmpGLTransSumClient_48928.Dimension2"
    Name ="Dimension3"
    Expression ="tmpGLTransSumClient_48928.Dimension3"
    Name ="Dimension4"
    Expression ="tmpGLTransSumClient_48928.Dimension4"
    Name ="Dimension5"
    Expression ="tmpGLTransSumClient_48928.Dimension5"
    Name ="Amount"
    Expression ="tmpGLTransSumClient_48928.Amount"
    Name ="Debit"
    Expression ="tmpGLTransSumClient_48928.Debit"
    Name ="Credit"
    Expression ="tmpGLTransSumClient_48928.Credit"
    Name ="Name"
    Expression ="tmpGLTransSumClient_48928.Name"
    Name ="Year_"
    Expression ="tmpGLTransSumClient_48928.Year_"
    Name ="Date_"
    Expression ="tmpGLTransSumClient_48928.Date_"
    Name ="User_"
    Expression ="tmpGLTransSumClient_48928.User_"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Dimension5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.User_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Dimension4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Date_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Dimension3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Dimension2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Name"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Dimension1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Credit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.AccountType"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Debit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Account"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Amount"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransSumClient_48928.Date"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =4007
    Bottom =2020
    Left =-1
    Top =-1
    Right =3965
    Bottom =837
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =464
        Top =0
        Name ="tmpGLTransSumClient_48928"
        Name =""
    End
End
