Operation =1
Option =0
Begin InputTables
    Name ="tblFinansPoster_Local"
End
Begin OutputColumns
    Expression ="tblFinansPoster_Local.Dato"
    Expression ="tblFinansPoster_Local.Konto"
    Expression ="tblFinansPoster_Local.Kontotype"
    Expression ="tblFinansPoster_Local.Beløb"
    Expression ="tblFinansPoster_Local.Afdeling"
    Alias ="Year_"
    Expression ="Year([Dato])"
    Alias ="Month"
    Expression ="Month([Dato])"
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
        dbText "Name" ="tblFinansPoster.[SUF Veteran]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Tekst"
        dbInteger "ColumnWidth" ="4950"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Formål"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Bærer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Beløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Kontotype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Kontonavn"
        dbInteger "ColumnWidth" ="3480"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Uddannelse"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Oprindelse"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster.Dato"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_ "
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Month"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Kontotype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Kontonavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Beløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblFinansPoster_Local.Dato"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1618
    Bottom =1280
    Left =-1
    Top =-1
    Right =1585
    Bottom =664
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =96
        Top =24
        Right =384
        Bottom =565
        Top =0
        Name ="tblFinansPoster_Local"
        Name =""
    End
End
