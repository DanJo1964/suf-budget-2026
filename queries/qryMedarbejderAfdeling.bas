Operation =1
Option =2
Begin InputTables
    Name ="tblMedarbejder"
    Name ="Report_GL"
End
Begin OutputColumns
    Expression ="tblMedarbejder.*"
    Expression ="Report_GL.Afdeling"
    Expression ="Report_GL.Løntrin"
End
Begin Joins
    LeftTable ="tblMedarbejder"
    RightTable ="Report_GL"
    Expression ="tblMedarbejder.Medarbejdernr = Report_GL.Medarbejdernr"
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
        dbText "Name" ="Report_GL.Afdeling"
        dbInteger "ColumnWidth" ="3075"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report_GL.Løntrin"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Statusårsag"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.AfdNr Uniconta"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder._ownerid_value"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.tblMedarbejder_Local"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Arbejdstid timer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ansattype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Efternavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ejende afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ejende bruger"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ejende team"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ekstern titel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Fornavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Fra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Importsekvensnummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Medarbejdernr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Normtid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Oprettet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Versionsnummer for tidszoneregel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Oprettet af"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Oprettet af (stedfortræder)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Versionsnummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Posten blev oprettet den"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.statecode"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Status"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Tidszonekode for UTC-konvertering"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Type"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Valgfri1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Valgfri2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Valgfri3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ændret"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ændret af"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblMedarbejder.Ændret af (stedfortræder)"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =2237
    Bottom =1168
    Left =-1
    Top =-1
    Right =2221
    Bottom =570
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="tblMedarbejder"
        Name =""
    End
    Begin
        Left =331
        Top =150
        Right =475
        Bottom =590
        Top =0
        Name ="Report_GL"
        Name =""
    End
End
