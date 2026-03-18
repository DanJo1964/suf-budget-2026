PARAMETERS parmAfdeling Text (255);
SELECT
  tblTmpMedarbejder.Afdeling,
  [Valgfri1] & "-" & [Valgfri3] AS Kategori,
  Sum(
    tblTmpMedarbejder.TotalBeløbBudgetDÅ
  ) AS SumOfTotalBeløbBudgetDÅ,
  (
    Sum(
      [tblTmpMedarbejder].[TotalBeløbBudgetDÅ]
    )/(
      SELECT
        Sum(TotalBeløbBudgetDÅ)
      FROM
        tblTmpMedarbejder
      WHERE
        Afdeling = [parmAfdeling]
    )
  )* 100 AS PercentageOfTotal
FROM
  tblTmpMedarbejder
GROUP BY
  tblTmpMedarbejder.Afdeling,
  [Valgfri1] & "-" & [Valgfri3]
HAVING
  (
    (
      (tblTmpMedarbejder.Afdeling)= [parmAfdeling]
    )
  );
