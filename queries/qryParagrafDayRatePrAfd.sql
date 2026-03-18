SELECT
  qryParagrafOmsRatePrBorger.Afdeling,
  qryParagrafOmsRatePrBorger.Paragraf,
  Avg(
    qryParagrafOmsRatePrBorger.DayRate
  ) AS GennemsnitOfDayRate,
  Avg(
    qryParagrafOmsRatePrBorger.DayRateXtra
  ) AS GennemsnitOfDayRateXtra
FROM
  qryParagrafOmsRatePrBorger
GROUP BY
  qryParagrafOmsRatePrBorger.Afdeling,
  qryParagrafOmsRatePrBorger.Paragraf;
