Operation =3
Name ="tblLøndataVisma"
Option =0
Where ="(((IsNull([Report].[Til]))=False))"
Begin InputTables
    Name ="Report"
End
Begin OutputColumns
    Name ="Arbejdsgiver"
    Expression ="Report.Arbejdsgiver"
    Name ="Medarbejdernummer"
    Expression ="Report.Medarbejdernummer"
    Name ="Ansættelsesdato"
    Expression ="Report.Ansættelsesdato"
    Name ="Fornavn"
    Expression ="Report.Fornavn"
    Name ="Efternavn"
    Expression ="Report.Efternavn"
    Name ="Status"
    Expression ="Report.Status"
    Name ="Ansattype"
    Expression ="Report.Ansattype"
    Name ="Ekstern_titel"
    Expression ="Report.[Ekstern titel]"
    Name ="CostCenter"
    Expression ="Report.CostCenter"
    Name ="Arbejdstid_timer"
    Expression ="Report.[Arbejdstid timer]"
    Name ="Løntrin"
    Expression ="Report.Løntrin"
    Name ="Valgfri1"
    Expression ="Report.Valgfri1"
    Name ="Valgfri2"
    Expression ="Report.Valgfri2"
    Name ="Valgfri3"
    Expression ="Report.Valgfri3"
    Name ="Lønartsnummer"
    Expression ="Report.Lønartsnummer"
    Name ="Egen_tekst"
    Expression ="Report.[Egen tekst]"
    Name ="Beløb"
    Expression ="Report.Beløb"
    Name ="Rammetrin_beløb"
    Expression ="Report.[Rammetrin beløb]"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="Report.Valgfri3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Til"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Valgfri2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Fra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Valgfri1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Status"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Løntrin"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Efternavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.[Rammetrin beløb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.[Arbejdstid timer]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Fornavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Beløb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.CostCenter"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Ansættelsesdato"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.[Egen tekst]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.[Ekstern titel]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Medarbejdernummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Lønartsnummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Ansattype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Report.Arbejdsgiver"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1003
    Bottom =808
    Left =-1
    Top =-1
    Right =987
    Bottom =546
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =465
        Top =0
        Name ="Report"
        Name =""
    End
End
