Operation =1
Option =0
Where ="(((qryFinPost_KtoAfdBlb12Mdr.AlleMdr)=0))"
Begin InputTables
    Name ="qryFinPost_KtoAfdBlb12Mdr"
    Name ="qryFinPost_KtoAfdMdr"
    Name ="qryFinPost_AntalMdr"
End
Begin OutputColumns
    Expression ="qryFinPost_KtoAfdMdr.Konto"
    Expression ="qryFinPost_KtoAfdMdr.Afdeling"
    Expression ="qryFinPost_KtoAfdMdr.MdrNo"
    Expression ="qryFinPost_KtoAfdMdr.SumOfBeløb"
    Alias ="MdrArray"
    Expression ="IIf([AntalMdr]+[MdrNo]<=12,Format([MdrNo],'0') & '-' & Format([AntalMdr]+[MdrNo]"
        ",'0'),'-')"
End
Begin Joins
    LeftTable ="qryFinPost_KtoAfdBlb12Mdr"
    RightTable ="qryFinPost_KtoAfdMdr"
    Expression ="qryFinPost_KtoAfdBlb12Mdr.Konto = qryFinPost_KtoAfdMdr.Konto"
    Flag =1
    LeftTable ="qryFinPost_KtoAfdBlb12Mdr"
    RightTable ="qryFinPost_KtoAfdMdr"
    Expression ="qryFinPost_KtoAfdBlb12Mdr.Afdeling = qryFinPost_KtoAfdMdr.Afdeling"
    Flag =1
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
        dbText "Name" ="qryFinPost_KtoAfdMdr.SumOfBeløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdr.MdrNo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdr.Afdeling"
        dbInteger "ColumnWidth" ="1215"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryFinPost_KtoAfdMdr.Konto"
        dbInteger "ColumnWidth" ="975"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MdrArray"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1489
    Bottom =1168
    Left =-1
    Top =-1
    Right =1473
    Bottom =906
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =242
        Bottom =210
        Top =0
        Name ="qryFinPost_KtoAfdBlb12Mdr"
        Name =""
    End
    Begin
        Left =347
        Top =11
        Right =491
        Bottom =155
        Top =0
        Name ="qryFinPost_KtoAfdMdr"
        Name =""
    End
    Begin
        Left =573
        Top =17
        Right =717
        Bottom =161
        Top =0
        Name ="qryFinPost_AntalMdr"
        Name =""
    End
End
