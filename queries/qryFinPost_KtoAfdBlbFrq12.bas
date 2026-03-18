Operation =1
Option =0
Where ="(((qryFinPost_KtoAfdBlb12Mdr.AlleMdr)=1))"
Begin InputTables
    Name ="qryFinPost_KtoAfdBlb12Mdr"
    Name ="qryFinPost_AntalMdr"
End
Begin OutputColumns
    Expression ="qryFinPost_KtoAfdBlb12Mdr.Konto"
    Expression ="qryFinPost_KtoAfdBlb12Mdr.Afdeling"
    Alias ="MdrBlb"
    Expression ="IIf([Beløb]<>0,[Beløb]/[AntalMdr],0)"
    Alias ="Jan"
    Expression ="[MdrBlb]"
    Alias ="Feb"
    Expression ="[MdrBlb]"
    Alias ="Mar"
    Expression ="[MdrBlb]"
    Alias ="Apr"
    Expression ="[MdrBlb]"
    Alias ="Maj"
    Expression ="[MdrBlb]"
    Alias ="Jun"
    Expression ="[MdrBlb]"
    Alias ="Jul"
    Expression ="[MdrBlb]"
    Alias ="Aug"
    Expression ="[MdrBlb]"
    Alias ="Sep"
    Expression ="[MdrBlb]"
    Alias ="Okt"
    Expression ="[MdrBlb]"
    Alias ="Nov"
    Expression ="[MdrBlb]"
    Alias ="Dec"
    Expression ="[MdrBlb]"
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
dbMemo "Filter" ="([qryFinPost_KtoAfdBlbFrq12].[Konto]=\"1392\")"
Begin
    Begin
        dbText "Name" ="qryFinPost_KtoAfdBlb12Mdr.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdBlb12Mdr.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Jan"
        dbInteger "ColumnWidth" ="2310"
        dbBoolean "ColumnHidden" ="0"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MdrBlb"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nov"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Mar"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Okt"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Feb"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Apr"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Maj"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Jun"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Jul"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Aug"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Sep"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Dec"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_AntalMdr.AntalMdr"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1411
    Bottom =996
    Left =-1
    Top =-1
    Right =1395
    Bottom =736
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =205
        Top =0
        Name ="qryFinPost_KtoAfdBlb12Mdr"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="qryFinPost_AntalMdr"
        Name =""
    End
End
