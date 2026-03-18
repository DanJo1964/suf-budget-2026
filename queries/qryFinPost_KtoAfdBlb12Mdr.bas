Operation =1
Option =0
Begin InputTables
    Name ="qryFinPost_AntalMdr"
    Name ="qryFinPost_KtoAfdMdrCnt"
End
Begin OutputColumns
    Expression ="qryFinPost_KtoAfdMdrCnt.Konto"
    Expression ="qryFinPost_KtoAfdMdrCnt.Afdeling"
    Alias ="Beløb"
    Expression ="qryFinPost_KtoAfdMdrCnt.SumOfSumOfBeløb"
    Expression ="qryFinPost_KtoAfdMdrCnt.MdrCnt"
    Expression ="qryFinPost_AntalMdr.AntalMdr"
    Alias ="AlleMdr"
    Expression ="IIf([MdrCnt]=[AntalMdr],1,0)"
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
        dbText "Name" ="qryFinPost_AntalMdr.AntalMdr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdrCnt.MdrCnt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdrCnt.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdrCnt.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Beløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="AlleMdr"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2035
    Bottom =1168
    Left =-1
    Top =-1
    Right =2019
    Bottom =838
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =277
        Top =12
        Right =421
        Bottom =156
        Top =0
        Name ="qryFinPost_AntalMdr"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =230
        Bottom =156
        Top =0
        Name ="qryFinPost_KtoAfdMdrCnt"
        Name =""
    End
End
