Operation =1
Option =0
Begin InputTables
    Name ="qryFinPost_Basis"
End
Begin OutputColumns
    Expression ="qryFinPost_Basis.Konto"
    Expression ="qryFinPost_Basis.Afdeling"
    Alias ="MdrNo"
    Expression ="Month([Dato])"
    Alias ="SumOfBeløb"
    Expression ="Sum(qryFinPost_Basis.Beløb)"
End
Begin Groups
    Expression ="qryFinPost_Basis.Konto"
    GroupLevel =0
    Expression ="qryFinPost_Basis.Afdeling"
    GroupLevel =0
    Expression ="Month([Dato])"
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
Begin
    Begin
        dbText "Name" ="MdrNo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_Basis.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_Basis.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfBeløb"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2146
    Bottom =1168
    Left =-1
    Top =-1
    Right =2130
    Bottom =906
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =360
        Top =0
        Name ="qryFinPost_Basis"
        Name =""
    End
End
