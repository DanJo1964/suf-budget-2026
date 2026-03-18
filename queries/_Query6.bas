Operation =3
Name ="tblDebtorClientUser"
Option =0
Begin InputTables
    Name ="tmpDebitorClientUser_EJD"
End
Begin OutputColumns
    Name ="Takst"
    Expression ="tmpDebitorClientUser_EJD.Takst"
    Name ="AntalM2"
    Expression ="tmpDebitorClientUser_EJD.AntalM2"
    Name ="Konto"
    Expression ="tmpDebitorClientUser_EJD.Account"
    Name ="Kontonavn"
    Expression ="tmpDebitorClientUser_EJD.Name"
    Alias ="Expr1"
    Name ="Afdeling"
    Expression ="\"EJD\""
    Alias ="Expr2"
    Name ="Revision"
    Expression ="0"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpDebitorClientUser_EJD.Name"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpDebitorClientUser_EJD.Account"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpDebitorClientUser_EJD.AntalM2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpDebitorClientUser_EJD.Takst"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1046
    Bottom =808
    Left =-1
    Top =-1
    Right =1030
    Bottom =563
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =488
        Top =0
        Name ="tmpDebitorClientUser_EJD"
        Name =""
    End
End
