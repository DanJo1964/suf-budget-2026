SELECT
  tblDebtorClientUser.Konto,
  tblDebtorClientUser.Kontonavn,
  tblDebtorClientUser.Afdeling,
  tblDebtorClientUser.Paragraf,
  IIf(
    [tblDebtorClientUser]![Status Dato] < #1/1/2024#,
    12,
    - DateDiff(
      "m", #1/1/2025#, [tblDebtorClientUser]![Status Dato]
    )
  ) AS QtyMths,
  tblDebtorClientUser.Takst,
  tblDebtorClientUser.[Xtra takst],
  [Takst] * [QtyMths] AS RevenueYearTakst,
  1 AS Qty,
  IIf(
    [tblDebtorClientUser]![Status Dato] < #1/1/2024#,
    365,
    DateDiff(
      "d", [tblDebtorClientUser]![Status Dato],
      #12/31/2024#
    )
  ) AS QtyDays,
  [RevenueYearTakst] / [QtyDays] AS DayRate,
  [Xtra takst] * [QtyMths] AS RevenueYearXtraTakst,
  IIf(
    [QtyDays] > 0, [RevenueYearXtraTakst] / [QtyDays],
    0
  ) AS DayRateXtra
FROM
  tblDebtorClientUser
WHERE
  (
    (
      (tblDebtorClientUser.Status)= "Aktiv"
    )
  );
