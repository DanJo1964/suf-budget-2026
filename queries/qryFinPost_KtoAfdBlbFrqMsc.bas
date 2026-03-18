Operation =1
Option =0
Begin InputTables
    Name ="qryFinPost_KtoAfdBlb_MdrArray"
End
Begin OutputColumns
    Expression ="qryFinPost_KtoAfdBlb_MdrArray.Konto"
    Expression ="qryFinPost_KtoAfdBlb_MdrArray.Afdeling"
    Alias ="MdrBlb"
    Expression ="qryFinPost_KtoAfdBlb_MdrArray.SumOfBeløb"
    Alias ="Jan"
    Expression ="IIf(Left([MdrArray],1)=1,[SumOfBeløb],0)"
    Alias ="Feb"
    Expression ="IIf(Left([MdrArray],1)=2,[SumOfBeløb],0)"
    Alias ="Mar"
    Expression ="IIf(Left([MdrArray],1)=3,[SumOfBeløb],0)"
    Alias ="Apr"
    Expression ="IIf(Left([MdrArray],1)=4,[SumOfBeløb],0)"
    Alias ="Maj"
    Expression ="IIf(Left([MdrArray],1)=5 Or Right([MdrArray],1)=5,[SumOfBeløb],0)"
    Alias ="Jun"
    Expression ="IIf(Left([MdrArray],1)=6 Or Right([MdrArray],1)=6,[SumOfBeløb],0)"
    Alias ="Jul"
    Expression ="IIf(Left([MdrArray],1)=7 Or Right([MdrArray],1)=7,[SumOfBeløb],0)"
    Alias ="Aug"
    Expression ="IIf(Left([MdrArray],1)=8 Or Right([MdrArray],1)=8,[SumOfBeløb],0)"
    Alias ="Sep"
    Expression ="IIf(Left([MdrArray],1)=9 Or Right([MdrArray],1)=9,[SumOfBeløb],0)"
    Alias ="Okt"
    Expression ="IIf(Left([MdrArray],2)=10 Or Right([MdrArray],2)=10,[SumOfBeløb],0)"
    Alias ="Nov"
    Expression ="IIf(Left([MdrArray],2)=11 Or Right([MdrArray],2)=11,[SumOfBeløb],0)"
    Alias ="Dec"
    Expression ="IIf(Left([MdrArray],2)=12 Or Right([MdrArray],2)=12,[SumOfBeløb],0)"
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
        dbText "Name" ="Jan"
        dbInteger "ColumnWidth" ="2310"
        dbBoolean "ColumnHidden" ="0"
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
        dbText "Name" ="qryFinPost_KtoAfdBlb_MdrArray.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdBlb_MdrArray.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MdrBlb"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2048
    Bottom =1168
    Left =-1
    Top =-1
    Right =2032
    Bottom =855
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =177
        Top =0
        Name ="qryFinPost_KtoAfdBlb_MdrArray"
        Name =""
    End
End
