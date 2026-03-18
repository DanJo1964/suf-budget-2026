dbMemo "SQL" ="SELECT tblLøndataVisma.Arbejdsgiver, [tblLøndataVisma]![CostCenter] & IIf([tblLø"
    "ndataVisma]![Valgfri2]<>\"\" And [tblLøndataVisma]![CostCenter]<>\"1\",\"_\" & ["
    "tblLøndataVisma]![Valgfri2],\"\") AS Afdeling, [tblLøndataVisma]![Medarbejdernum"
    "mer] AS Medarbejdernr, tblLøndataVisma.CostCenter, tblLøndataVisma.Fornavn, tblL"
    "øndataVisma.Efternavn, tblLøndataVisma.Status, [tblLøndataVisma]![Ansættelsesdat"
    "o] AS Fra, tblLøndataVisma.Ansattype, [tblLøndataVisma]![Ekstern Titel] AS [Ekst"
    "ern titel], [tblLøndataVisma]![Arbejdstid timer] AS Normtid, tblLøndataVisma.Løn"
    "trin, tblLøndataVisma.Valgfri1, tblLøndataVisma.Valgfri2, tblLøndataVisma.Valgfr"
    "i3, tblLøndataVisma.Lønartsnummer, [tblLøndataVisma]![Egen tekst] AS Løntekst, ["
    "tblLøndataVisma]![Beløb] AS Beløb, [tblLøndataVisma]![Rammetrin beløb] AS [Ramme"
    "trin beløb], IIf(IsNull([tblLøndataVisma]![Rammetrin beløb])=True,[tblLøndataVis"
    "ma]![Beløb]/160.33*([tblLøndataVisma]![Arbejdstid timer]),[tblLøndataVisma]![Ram"
    "metrin beløb]) AS [Løn total]\015\012FROM tblLøndataVisma;\015\012"
dbMemo "Connect" =""
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
        dbText "Name" ="Løn total"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1602"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Valgfri1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Fornavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Løntrin"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Medarbejdernr"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1830"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="Normtid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Ekstern titel"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3375"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Ansattype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Lønartsnummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Fra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Valgfri3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Status"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2220"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Valgfri2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Efternavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.Arbejdsgiver"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afdeling"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2625"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="Rammetrin beløb"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1230"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="Løntekst"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2610"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="tblLøndataVisma.CostCenter"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Beløb"
        dbLong "AggregateType" ="-1"
    End
End
