Operation =3
Name ="tblTmpStamkortFB"
Option =0
Where ="((([Stamkort_Indlæst_22_11_2024].[ANSPERIODE TIL])>#1/9/2024#) AND (([Stamkort_I"
    "ndlæst_22_11_2024].[ARBEJDSGIVER])=7 Or ([Stamkort_Indlæst_22_11_2024].[ARBEJDSG"
    "IVER])=8))"
Begin InputTables
    Name ="Stamkort_Indlæst_22_11_2024"
End
Begin OutputColumns
    Alias ="Expr1"
    Name ="MEDARBEJDER"
    Expression ="Stamkort_Indlæst_22_11_2024.MEDARBEJDER"
    Alias ="Expr2"
    Name ="MEDARBEJDERNAVN"
    Expression ="Stamkort_Indlæst_22_11_2024.MEDARBEJDERNAVN"
    Alias ="Expr3"
    Name ="FRA"
    Expression ="Stamkort_Indlæst_22_11_2024.[ANSPERIODE FRA]"
    Alias ="Expr4"
    Name ="TIL"
    Expression ="Stamkort_Indlæst_22_11_2024.[ANSPERIODE TIL]"
    Alias ="Expr5"
    Name ="ANS_BETEGN"
    Expression ="Stamkort_Indlæst_22_11_2024.ANSBETEGN"
    Alias ="Expr6"
    Name ="FØRSTE ANS"
    Expression ="Stamkort_Indlæst_22_11_2024.[FØRSTE ANS]"
    Alias ="Expr7"
    Name ="TILTRÅDT"
    Expression ="Stamkort_Indlæst_22_11_2024.TILTRÅDT"
    Alias ="Expr1"
    Name ="FRATRÅDT"
    Expression ="IIf([Stamkort_Indlæst_22_11_2024]!FRATRÅDT=\"\",DateSerial(2050,12,31),CDate([St"
        "amkort_Indlæst_22_11_2024]!FRATRÅDT))"
    Alias ="Expr8"
    Name ="AFD"
    Expression ="Stamkort_Indlæst_22_11_2024.AFD"
    Alias ="Expr9"
    Name ="AFD_BETEGN"
    Expression ="Stamkort_Indlæst_22_11_2024.AFDBETEGN"
    Alias ="Expr10"
    Name ="Valgfri1"
    Expression ="Stamkort_Indlæst_22_11_2024.Valgfri1"
    Alias ="Expr11"
    Name ="Valgfri2"
    Expression ="Stamkort_Indlæst_22_11_2024.Valgfri2"
    Alias ="Expr12"
    Name ="Valgfri3"
    Expression ="Stamkort_Indlæst_22_11_2024.Valgfri3"
    Alias ="Expr13"
    Name ="Valgfri4"
    Expression ="Stamkort_Indlæst_22_11_2024.Valgfri4"
    Alias ="Expr14"
    Name ="Valgfri5"
    Expression ="Stamkort_Indlæst_22_11_2024.Valgfri5"
    Alias ="Expr15"
    Name ="Valgfri6"
    Expression ="Stamkort_Indlæst_22_11_2024.Valgfri6"
    Alias ="Expr16"
    Name ="LØNGRUPPE"
    Expression ="Stamkort_Indlæst_22_11_2024.LØNGRUPPE"
    Alias ="Expr17"
    Name ="NORMTID"
    Expression ="Stamkort_Indlæst_22_11_2024.[NORMTID MEDARB]"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.Valgfri5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.TILTRÅDT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.Valgfri4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.[FØRSTE ANS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.Valgfri3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.ANSBETEGN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.Valgfri2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.[ANSPERIODE TIL]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.Valgfri1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.[ANSPERIODE FRA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.[NORMTID MEDARB]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.AFDBETEGN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.ARBEJDSGIVER"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.LØNGRUPPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.AFD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.MEDARBEJDERNAVN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.Valgfri6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.FRATRÅDT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FunkNr_42_jobNr_25821.MEDARBEJDER"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1615
    Bottom =808
    Left =-1
    Top =-1
    Right =1599
    Bottom =782
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="Stamkort_Indlæst_22_11_2024"
        Name =""
    End
End
