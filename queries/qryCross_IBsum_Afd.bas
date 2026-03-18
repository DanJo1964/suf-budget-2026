Operation =6
Option =0
Where ="(((tblInterntBudget.Kontotype)=\"Sum\") And ((tblInterntBudget.Year_)=Forms!frmS"
    "UF_Hovedbudget!cboYear) And ((tblInterntBudget.Revision)=0))"
Begin InputTables
    Name ="tblInterntBudget"
End
Begin OutputColumns
    Alias ="SumOfBudgetIalt"
    Expression ="Sum(tblInterntBudget.BudgetIalt)"
    Expression ="tblInterntBudget.Konto"
    GroupLevel =2
    Expression ="tblInterntBudget.KontoNavn"
    GroupLevel =2
    Expression ="[tblInterntBudget]![Afdeling]"
    GroupLevel =1
End
Begin Parameters
    Name ="pYear"
    Flag =3
    Name ="pRevision"
    Flag =3
End
Begin Groups
    Expression ="tblInterntBudget.Konto"
    GroupLevel =2
    Expression ="tblInterntBudget.KontoNavn"
    GroupLevel =2
    Expression ="tblInterntBudget.Kontotype"
    GroupLevel =2
    Expression ="[tblInterntBudget]![Afdeling]"
    GroupLevel =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
Begin
    Begin
        dbText "Name" ="12 Eremitterne"
        dbInteger "ColumnWidth" ="1890"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PIVOT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908 -  Afd_ 908"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10 Skallen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.BudgetIalt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1 Administrationen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68-1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Afdeling"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.KontoNavn"
        dbInteger "ColumnWidth" ="3480"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblAfdeling.AfdelingsNavn"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Konto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="12"
        dbInteger "ColumnWidth" ="1890"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901 -  Afd_ 901"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_BREMERHO9"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901 Afd_ 901"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2308-1126"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Boas Frederiksberg"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78 -  Boas Nørrebro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_NØRREGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_ØSTERGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60-1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Administrationen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34 Projekt 34"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_HUNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_SOHNGÅRD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68-2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13 Albertslund"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909 -  Afd_ 909"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_BREMERH09"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900 Afd_ 900"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_MOSEVEJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Djurs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74 Boas Valby"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73-1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74-1 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Holstebro, Østergade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74-1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 903"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14 Boas Mentor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902 -  Afd_ 902"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CAFE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BOAS TAASTRUP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="VF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Kontotype"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16 SUF Sydsjælland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2308-1126 DJO test"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="<>"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60 SUF HOLSTEBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_NØRREGADE Holstebro, Nørregade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_ØSTERGADE Holstebro, Østergade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61 SUF Djurs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64 SUF Sydjylland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67 SUF Nord Bostøtte"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68 SUF Nord Botilbud"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_HUNE SUF NORDTILBUD HUNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_SOHNGÅRD SUF NORDTILBUD SOHNGÅRD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69 SUF Veteran"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_BREMERHO9 SUF VETERAN JORDLØSE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_MOSEVEJ SUF VETERAN MOSEVEJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70 SUF Nordsjælland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72 BOAS JÆGERSPRIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJD SUF Ejendomme ApS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73 BOAS TEGLHOLMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75 Bostedet Stranden"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76 SUF Opgangen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77 Boas Frederiksberg"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Boas Nørrebro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78 Boas Nørrebro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79 Boas Villa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73-1 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80 BOAS TAASTRUP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81 BOAS AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83 Boas Brønshøj"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84 SUF AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902 Afd_ 902"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903 Afd_ 903"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904 Afd_ 904"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907 -  Afd_ 907"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906 Afd_ 906"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907 Afd_ 907"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908 Afd_ 908"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Projekt 34"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909 Afd_ 909"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CAFE Caféen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 900"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 901"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 902"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 904"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 906"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 907"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 908"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Afd_ 909"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72 -  BOAS JÆGERSPRIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Albertslund"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Boas Brønshøj"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BOAS JÆGERSPRIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Boas Mentor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BOAS TEGLHOLMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Boas Valby"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Boas Villa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BOAS AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Bostedet Stranden"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Caféen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DJO test"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Eremitterne"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Holstebro, Nørregade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Skallen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Ejendomme ApS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF HOLSTEBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Nord Bostøtte"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Nord Botilbud"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Nordsjælland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="12 -  Eremitterne"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF NORDTILBUD HUNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64 -  SUF Sydjylland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF NORDTILBUD SOHNGÅRD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Opgangen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Sydjylland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Sydsjælland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77 -  Boas Frederiksberg"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF Veteran"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_SOHNGÅRD -  SUF NORDTILBUD SOHNGÅRD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF VETERAN JORDLØSE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SUF VETERAN MOSEVEJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1 -"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1 -  Administrationen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10 -  Skallen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="12 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13 -  Albertslund"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14 -  Boas Mentor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16 -  SUF Sydsjælland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2308-1126 -  DJO test"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34 -  Projekt 34"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60 -  SUF HOLSTEBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_NØRREGADE -  Holstebro, Nørregade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_ØSTERGADE -  Holstebro, Østergade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60-1 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61 -  SUF Djurs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67 -  SUF Nord Bostøtte"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68 -  SUF Nord Botilbud"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_HUNE -  SUF NORDTILBUD HUNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68-1 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68-2 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69 -  SUF Veteran"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_BREMERHO9 -  SUF VETERAN JORDLØSE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_MOSEVEJ -  SUF VETERAN MOSEVEJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70 -  SUF Nordsjælland"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73 -  BOAS TEGLHOLMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74 -  Boas Valby"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJD -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75 -  Bostedet Stranden"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76 -  SUF Opgangen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79 -  Boas Villa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80 -  BOAS TAASTRUP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81 -  BOAS AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83 -  Boas Brønshøj"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84 -  SUF AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900 -  Afd_ 900"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903 -  Afd_ 903"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904 -  Afd_ 904"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906 -  Afd_ 906"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909 -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CAFE -  Caféen"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJD -  SUF Ejendomme ApS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SM -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="VF -"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SumOfBudgetIalt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJD-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906 - AFD_ 906"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909-AFD_ 909"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78 - BOAS NØRREBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJD - SUF EJENDOMME APS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83 - BOAS BRØNSHØJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81 - BOAS AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13ALBERTSLUND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78-BOAS NØRREBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="12EREMITTERNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75 - BOSTEDET STRANDEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83BOAS BRØNSHØJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1 - ADMINISTRATIONEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16 - SUF SYDSJÆLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70SUF NORDSJÆLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13 - ALBERTSLUND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14 - BOAS MENTOR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_NØRREGADE - HOLSTEBRO, NØRREGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="12 - EREMITTERNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79 - BOAS VILLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69SUF VETERAN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73BOAS TEGLHOLMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10 - SKALLEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903AFD_ 903"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74BOAS VALBY"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34 - PROJEKT 34"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60 - SUF HOLSTEBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2308-1126 - DJO TEST"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72BOAS JÆGERSPRIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81-BOAS AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_BREMERHO9 - SUF VETERAN JORDLØSE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67 - SUF NORD BOSTØTTE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61 - SUF DJURS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_HUNE - SUF NORDTILBUD HUNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_ØSTERGADE - HOLSTEBRO, ØSTERGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79BOAS VILLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902-AFD_ 902"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68 - SUF NORD BOTILBUD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74-1-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16-SUF SYDSJÆLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_ØSTERGADEHOLSTEBRO, ØSTERGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_MOSEVEJ-SUF VETERAN MOSEVEJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13-ALBERTSLUND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_NØRREGADEHOLSTEBRO, NØRREGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_SOHNGÅRDSUF NORDTILBUD SOHNGÅRD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75-BOSTEDET STRANDEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10-SKALLEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903 - AFD_ 903"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67SUF NORD BOSTØTTE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70-SUF NORDSJÆLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68-1-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_NØRREGADE-HOLSTEBRO, NØRREGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76 - SUF OPGANGEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_HUNESUF NORDTILBUD HUNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73-BOAS TEGLHOLMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74-BOAS VALBY"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60SUF HOLSTEBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJD-SUF EJENDOMME APS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909AFD_ 909"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="VF-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73-1-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2308-1126DJO TEST"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_BREMERHO9-SUF VETERAN JORDLØSE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907-AFD_ 907"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77BOAS FREDERIKSBERG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68-SUF NORD BOTILBUD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EJDSUF EJENDOMME APS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80 - BOAS TAASTRUP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64 - SUF SYDJYLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_SOHNGÅRD - SUF NORDTILBUD SOHNGÅRD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69 - SUF VETERAN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_MOSEVEJ - SUF VETERAN MOSEVEJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="70 - SUF NORDSJÆLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84SUF AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72 - BOAS JÆGERSPRIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="73 - BOAS TEGLHOLMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74 - BOAS VALBY"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77 - BOAS FREDERIKSBERG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84 - SUF AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900 - AFD_ 900"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901 - AFD_ 901"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902 - AFD_ 902"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_HUNE-SUF NORDTILBUD HUNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904 - AFD_ 904"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907 - AFD_ 907"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908 - AFD_ 908"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906AFD_ 906"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="909 - AFD_ 909"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CAFE - CAFÉEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68SUF NORD BOTILBUD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_BREMERHO9SUF VETERAN JORDLØSE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="12-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64SUF SYDJYLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="12-EREMITTERNE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14-BOAS MENTOR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1-ADMINISTRATIONEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2308-1126-DJO TEST"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34-PROJEKT 34"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60_ØSTERGADE-HOLSTEBRO, ØSTERGADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CAFECAFÉEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60-1-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="60-SUF HOLSTEBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61-SUF DJURS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="64-SUF SYDJYLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="67-SUF NORD BOSTØTTE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68_SOHNGÅRD-SUF NORDTILBUD SOHNGÅRD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="68-2-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69-SUF VETERAN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="72-BOAS JÆGERSPRIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="74-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76-SUF OPGANGEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="77-BOAS FREDERIKSBERG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="16SUF SYDSJÆLLAND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="79-BOAS VILLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80-BOAS TAASTRUP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="83-BOAS BRØNSHØJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904AFD_ 904"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="84-SUF AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10SKALLEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900-AFD_ 900"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901-AFD_ 901"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="903-AFD_ 903"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="904-AFD_ 904"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="906-AFD_ 906"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908-AFD_ 908"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CAFE-CAFÉEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="61SUF DJURS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SM-"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="14BOAS MENTOR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1ADMINISTRATIONEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="34PROJEKT 34"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="69_MOSEVEJSUF VETERAN MOSEVEJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="75BOSTEDET STRANDEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="76SUF OPGANGEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="78BOAS NØRREBRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="80BOAS TAASTRUP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="81BOAS AARHUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="900AFD_ 900"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="901AFD_ 901"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="902AFD_ 902"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="907AFD_ 907"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="908AFD_ 908"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FullAfdelingName"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Revision"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblInterntBudget.Year_"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1207
    Bottom =808
    Left =-1
    Top =-1
    Right =1191
    Bottom =529
    Left =0
    Top =0
    ColumnsShown =559
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =542
        Top =0
        Name ="tblInterntBudget"
        Name =""
    End
End
