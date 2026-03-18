INSERT INTO tblTmpStamkortFB (
  MEDARBEJDER, MEDARBEJDERNAVN, FRA,
  TIL, ANS_BETEGN, [FØRSTE ANS], TILTRÅDT,
  FRATRÅDT, AFD, AFD_BETEGN, Valgfri1,
  Valgfri2, Valgfri3, Valgfri4, Valgfri5,
  Valgfri6, LØNGRUPPE, NORMTID
)
SELECT
  Stamkort_Indlæst_22_11_2024.MEDARBEJDER AS Expr1,
  Stamkort_Indlæst_22_11_2024.MEDARBEJDERNAVN AS Expr2,
  Stamkort_Indlæst_22_11_2024.[ANSPERIODE FRA] AS Expr3,
  Stamkort_Indlæst_22_11_2024.[ANSPERIODE TIL] AS Expr4,
  Stamkort_Indlæst_22_11_2024.ANSBETEGN AS Expr5,
  Stamkort_Indlæst_22_11_2024.[FØRSTE ANS] AS Expr6,
  Stamkort_Indlæst_22_11_2024.TILTRÅDT AS Expr7,
  IIf(
    [Stamkort_Indlæst_22_11_2024]!FRATRÅDT = "",
    DateSerial(2050, 12, 31),
    CDate(
      [Stamkort_Indlæst_22_11_2024]!FRATRÅDT
    )
  ) AS Expr1,
  Stamkort_Indlæst_22_11_2024.AFD AS Expr8,
  Stamkort_Indlæst_22_11_2024.AFDBETEGN AS Expr9,
  Stamkort_Indlæst_22_11_2024.Valgfri1 AS Expr10,
  Stamkort_Indlæst_22_11_2024.Valgfri2 AS Expr11,
  Stamkort_Indlæst_22_11_2024.Valgfri3 AS Expr12,
  Stamkort_Indlæst_22_11_2024.Valgfri4 AS Expr13,
  Stamkort_Indlæst_22_11_2024.Valgfri5 AS Expr14,
  Stamkort_Indlæst_22_11_2024.Valgfri6 AS Expr15,
  Stamkort_Indlæst_22_11_2024.LØNGRUPPE AS Expr16,
  Stamkort_Indlæst_22_11_2024.[NORMTID MEDARB] AS Expr17
FROM
  Stamkort_Indlæst_22_11_2024
WHERE
  (
    (
      (
        [Stamkort_Indlæst_22_11_2024].[ANSPERIODE TIL]
      )> #1/9/2024#
    )
    AND (
      (
        [Stamkort_Indlæst_22_11_2024].[ARBEJDSGIVER]
      )= 7
      Or (
        [Stamkort_Indlæst_22_11_2024].[ARBEJDSGIVER]
      )= 8
    )
  );
