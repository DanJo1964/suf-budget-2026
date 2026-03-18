Operation =1
Option =0
Begin InputTables
    Name ="tblKontoPlan_Tilbudsskabelon"
    Name ="tblKontoPlan"
End
Begin OutputColumns
    Expression ="tblKontoPlan.Kontonummer"
    Expression ="tblKontoPlan.Kontonavn"
    Expression ="tblKontoPlan.Kontotype"
    Expression ="tblKontoPlan_Tilbudsskabelon.Konto"
    Expression ="tblKontoPlan_Tilbudsskabelon.Beskrivelse"
    Expression ="tblKontoPlan_Tilbudsskabelon.Områdenavn"
    Expression ="tblKontoPlan_Tilbudsskabelon.Placering"
End
Begin Joins
    LeftTable ="tblKontoPlan"
    RightTable ="tblKontoPlan_Tilbudsskabelon"
    Expression ="tblKontoPlan.Kontonummer = tblKontoPlan_Tilbudsskabelon.Konto"
    Flag =2
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbMemo "Filter" ="([Query1].[Kontotype] Not In (\"Overskrift\",\"Sum\") Or [Query1].[Kontotype] IS"
    " Null)"
dbMemo "OrderBy" ="[Query1].[Kontonummer], [Query1].[Konto]"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="tblKontoPlan.Kontonavn"
        dbInteger "ColumnWidth" ="4110"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan_Tilbudsskabelon.Placering"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan_Tilbudsskabelon.Områdenavn"
        dbInteger "ColumnWidth" ="4920"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan_Tilbudsskabelon.Beskrivelse"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan_Tilbudsskabelon.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontotype"
        dbInteger "ColumnWidth" ="1770"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblKontoPlan.Kontonummer"
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
    Right =1477
    Bottom =923
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =525
        Top =42
        Right =669
        Bottom =619
        Top =0
        Name ="tblKontoPlan_Tilbudsskabelon"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =391
        Top =0
        Name ="tblKontoPlan"
        Name =""
    End
End
