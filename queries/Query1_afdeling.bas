Operation =1
Option =0
Begin InputTables
    Name ="tblAfdeling"
End
Begin OutputColumns
    Expression ="tblAfdeling.AfdelingsNavn"
    Expression ="tblAfdeling.[AfdNr Uniconta]"
    Expression ="tblAfdeling.UnicontaFirmaID"
    Expression ="tblAfdeling.UnicontaFirmanavn"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbMemo "OrderBy" ="[Query1].[AfdNr Uniconta]"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="tblAfdeling.UnicontaFirmanavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.UnicontaFirmaID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.[AfdNr Uniconta]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.AfdelingsNavn"
        dbInteger "ColumnWidth" ="3435"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2103
    Bottom =1157
    Left =-1
    Top =-1
    Right =1507
    Bottom =923
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =654
        Top =0
        Name ="tblAfdeling"
        Name =""
    End
End
