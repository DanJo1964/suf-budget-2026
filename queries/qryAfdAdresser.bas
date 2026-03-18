Operation =1
Option =0
Begin InputTables
    Name ="tblAfdeling"
End
Begin OutputColumns
    Expression ="tblAfdeling.Afdeling"
    Expression ="tblAfdeling.AfdelingsNavn"
    Expression ="tblAfdeling.Adresse"
    Expression ="tblAfdeling.PostBy"
    Expression ="tblAfdeling.Afdelingsleder"
    Expression ="tblAfdeling.Tlf_Mail"
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
        dbText "Name" ="tblAfdeling.Tlf_Mail"
        dbInteger "ColumnWidth" ="3615"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.Afdelingsleder"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.PostBy"
        dbInteger "ColumnWidth" ="2100"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.Adresse"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.AfdelingsNavn"
        dbInteger "ColumnWidth" ="3975"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.Afdeling"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2211
    Bottom =1168
    Left =-1
    Top =-1
    Right =1350
    Bottom =923
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =587
        Top =0
        Name ="tblAfdeling"
        Name =""
    End
End
