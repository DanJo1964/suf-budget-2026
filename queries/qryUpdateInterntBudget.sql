PARAMETERS parmAfdeling Text (255),
parmYear_ Short,
parmFremskrivPct IEEEDouble; INSERT INTO tblInterntBudget (
  Konto, Kontonavn, Kontotype, [Sum],
  Afdeling, Year_, RealForrigeÅr, EstimatForrigeÅr,
  EstimatFremskrevet, BudgetIalt,
  _1, _2, _3, _4, _5, _6, _7, _8, _9, _10,
  _11, _12
)
SELECT
  tblKontoPlan.Kontonummer,
  tblKontoPlan.Kontonavn,
  tblKontoPlan.Kontotype,
  tblKontoPlan.Sum,
  [parmAfdeling] AS Expr1,
  [parmYear_] AS Expr2,
  Nz(
    [tblFinbudget_SumÅr_Local].[SumOfBeløb],
    Null
  ) AS RealForrigeÅr,
  Nz(
    [tblFinpost_SumÅr_Local]![SumÅr],
    Null
  ) AS EsitmatForrigeÅr,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct]),
      Null
    ),
    Null
  ) AS EstimatFremskrevet,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct]),
      Null
    ),
    Null
  ) AS BudgetIalt,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _1,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _2,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _3,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _4,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _5,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _6,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _7,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _8,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _9,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _10,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _11,
  IIf(
    [tblKontoPlan].[Kontonummer] > "1199",
    Nz(
      (
        [tblFinbudget_SumÅr_Local].[SumOfBeløb] *(1 + [parmFremskrivPct])
      )/ 12,
      Null
    ),
    Null
  ) AS _12
FROM
  (
    tblKontoPlan
    LEFT JOIN tblFinbudget_SumÅr_Local ON tblKontoPlan.Kontonummer = tblFinbudget_SumÅr_Local.Konto
  )
  LEFT JOIN tblFinpost_SumÅr_Local ON tblKontoPlan.Kontonummer = tblFinpost_SumÅr_Local.Konto
WHERE
  (
    (
      (tblKontoPlan.Kontonummer)< "2991"
    )
    AND (
      ([parmAfdeling])= [parmAfdeling]
    )
    AND (
      ([parmYear_])= [parmYear_]
    )
  );
