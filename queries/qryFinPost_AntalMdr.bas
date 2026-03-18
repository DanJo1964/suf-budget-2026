Operation =1
Option =0
Begin InputTables
    Name ="qryFinPost_Basis"
End
Begin OutputColumns
    Alias ="AntalMdr"
    Expression ="Max(Month([Dato]))"
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
        dbText "Name" ="AntalMdr"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1419
    Bottom =1280
    Left =-1
    Top =-1
    Right =1386
    Bottom =821
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =96
        Top =24
        Right =384
        Bottom =401
        Top =0
        Name ="qryFinPost_Basis"
        Name =""
    End
End
