Operation =1
Option =0
Where ="(((tblFB_Totaler.Year_)=2025) AND ((tblFB_Totaler.FB_Aktiv)=1))"
Begin InputTables
    Name ="tblFB_Totaler"
End
Begin OutputColumns
    Expression ="tblFB_Totaler.Afdeling"
    Expression ="tblFB_Totaler.Year_"
    Expression ="tblFB_Totaler.FB_Aktiv"
    Expression ="tblFB_Totaler.TotalÅrsværk"
End
Begin OrderBy
    Expression ="tblFB_Totaler.Afdeling"
    Flag =0
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
        dbText "Name" ="tblFB_Totaler.TotalÅrsværk"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFB_Totaler.FB_Aktiv"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFB_Totaler.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFB_Totaler.Afdeling"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1608
    Bottom =808
    Left =-1
    Top =-1
    Right =913
    Bottom =563
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =245
        Bottom =493
        Top =0
        Name ="tblFB_Totaler"
        Name =""
    End
End
