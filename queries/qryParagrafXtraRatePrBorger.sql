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
  tblDebtorClientUser.[Xtra takst],
  IIf(
    [tblDebtorClientUser]![Status Dato] < #1/1/2024#,
    365,
    DateDiff(
      "d", [tblDebtorClientUser]![Status Dato],
      #12/31/2024#
    )
  ) AS QtyDays,
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
      (
        tblDebtorClientUser.[Xtra takst]
      )> 0
    )
    AND (
      (tblDebtorClientUser.Status)= "Aktiv"
    )
  );
