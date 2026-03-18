Operation =1
Option =0
Begin InputTables
    Name ="tblTmpStamkortFB"
End
Begin OutputColumns
    Alias ="Expr1"
    Expression ="CStr([MEDARBEJDER])"
    Expression ="tblTmpStamkortFB.Valgfri2"
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
        dbText "Name" ="tblTmpStamkortFB.Valgfri2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTmpStamkortFB.MEDARBEJDER"
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
    Right =3072
    Bottom =1400
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =120
        Top =30
        Right =480
        Bottom =1400
        Top =0
        Name ="tblTmpStamkortFB"
        Name =""
    End
End
