SELECT
  Sum(TotalBeløbBudgetDÅ) AS SumAfd1Løn,
  Year_,
  Valgfri2
FROM
  tblTmpMedarbejder
GROUP BY
  Valgfri2,
  Year_,
  Revision,
  Afdeling
HAVING
  Year_ = 2025
  AND Revision = 0
  And Afdeling = '1';
