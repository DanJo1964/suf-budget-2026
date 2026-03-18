Operation =3
Name ="tblTmpMedarbejder"
Option =0
Where ="(((qryLønudtrækVisma.Afdeling)=[parmAfdeling]))"
Begin InputTables
    Name ="qryLønudtrækVisma"
End
Begin OutputColumns
    Name ="Afdeling"
    Expression ="qryLønudtrækVisma.Afdeling"
    Name ="Fornavn"
    Expression ="qryLønudtrækVisma.Fornavn"
    Name ="Efternavn"
    Expression ="qryLønudtrækVisma.Efternavn"
    Name ="DatoFra"
    Expression ="qryLønudtrækVisma.Fra"
    Name ="Ekstern titel"
    Expression ="qryLønudtrækVisma.[Ekstern titel]"
    Name ="Normtid"
    Expression ="qryLønudtrækVisma.Normtid"
    Name ="Løntrin"
    Expression ="qryLønudtrækVisma.Løntrin"
    Name ="Lønart"
    Expression ="qryLønudtrækVisma.Lønartsnummer"
    Name ="Beløb"
    Expression ="qryLønudtrækVisma.[Løn total]"
    Name ="Medarbejdernr"
    Expression ="qryLønudtrækVisma.Medarbejdernr"
    Alias ="Expr1"
    Name ="Year_"
    Expression ="[parmYear_]"
    Alias ="Expr2"
    Name ="LøntrinBudget"
    Expression ="[parmLønArtBudget]"
    Alias ="Expr3"
    Name ="BeløbBudget"
    Expression ="[parmLønBudget]"
End
Begin Parameters
    Name ="parmAfdeling"
    Flag =10
    Name ="parmYear_"
    Flag =3
    Name ="parmLønArtBudget"
    Flag =10
    Name ="parmLønBudget"
    Flag =7
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="qryLønudtrækVisma.Løntrin"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.Normtid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.[Ekstern titel]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.Fra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.Efternavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.Fornavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.[Løn total]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.Medarbejdernr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.Lønartsnummer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qryLønudtrækVisma.Afdeling"
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
End
Begin
    State =0
    Left =0
    Top =0
    Right =1608
    Bottom =808
    Left =-1
    Top =-1
    Right =1592
    Bottom =411
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =522
        Top =0
        Name ="qryLønudtrækVisma"
        Name =""
    End
End
