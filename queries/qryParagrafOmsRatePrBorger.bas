Operation =1
Option =0
Where ="(((tblDebtorClientUser.Status)=\"Aktiv\"))"
Begin InputTables
    Name ="tblDebtorClientUser"
End
Begin OutputColumns
    Expression ="tblDebtorClientUser.Konto"
    Expression ="tblDebtorClientUser.Kontonavn"
    Expression ="tblDebtorClientUser.Afdeling"
    Expression ="tblDebtorClientUser.Paragraf"
    Alias ="QtyMths"
    Expression ="IIf([tblDebtorClientUser]![Status Dato]<#1/1/2024#,12,-DateDiff(\"m\",#1/1/2025#"
        ",[tblDebtorClientUser]![Status Dato]))"
    Expression ="tblDebtorClientUser.Takst"
    Expression ="tblDebtorClientUser.[Xtra takst]"
    Alias ="RevenueYearTakst"
    Expression ="[Takst]*[QtyMths]"
    Alias ="Qty"
    Expression ="1"
    Alias ="QtyDays"
    Expression ="IIf([tblDebtorClientUser]![Status Dato]<#1/1/2024#,365,DateDiff(\"d\",[tblDebtor"
        "ClientUser]![Status Dato],#12/31/2024#))"
    Alias ="DayRate"
    Expression ="[RevenueYearTakst]/[QtyDays]"
    Alias ="RevenueYearXtraTakst"
    Expression ="[Xtra takst]*[QtyMths]"
    Alias ="DayRateXtra"
    Expression ="IIf([QtyDays]>0,[RevenueYearXtraTakst]/[QtyDays],0)"
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
        dbText "Name" ="QtyMths"
        dbInteger "ColumnWidth" ="1215"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Qty"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="QtyDays"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DayRate"
        dbInteger "ColumnWidth" ="1815"
        dbBoolean "ColumnHidden" ="0"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbByte "DecimalPlaces" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RevenueYearTakst"
        dbInteger "ColumnWidth" ="2730"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RevenueYearXtraTakst"
        dbInteger "ColumnWidth" ="1800"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DayRateXtra"
        dbText "Format" ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblDebtorClientUser.Konto"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1266
    Bottom =883
    Left =-1
    Top =-1
    Right =1250
    Bottom =430
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =343
        Top =0
        Name ="tblDebtorClientUser"
        Name =""
    End
End
