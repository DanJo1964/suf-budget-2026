SELECT
  tblTmpMedarbejder.Afdeling,
  [Valgfri1] & "-" & [Valgfri3] AS Kategori,
  NZ(
    Sum(
      tblTmpMedarbejder.TotalBeløbBudgetDÅ
    ),
    0
  )+ NZ(
    (
      SELECT
        SUM(
          NZ(BudgetIalt, 0)- NZ(EstimatFremskrevet, 0)
        )
      FROM
        tblInterntBudget
      WHERE
        Afdeling = [parmAfdUniconta]
        AND Konto = '1100'
    ),
    0
  ) AS SumOfTotalBeløbBudgetDÅ,
  (
    NZ(
      Sum(
        tblTmpMedarbejder.TotalBeløbBudgetDÅ
      ),
      0
    )/ NZ(
      (
        SELECT
          Sum(
            NZ(TotalBeløbBudgetDÅ, 0)
          )
        FROM
          tblTmpMedarbejder
        WHERE
          Afdeling = [parmAfdeling]
      ),
      1
    )
  )* 100 AS PercentageOfTotal,
  NZ(
    (
      SELECT
        SUM(
          NZ(BudgetIalt, 0)- NZ(EstimatFremskrevet, 0)
        )
      FROM
        tblInterntBudget
      WHERE
        Afdeling = [parmAfdUniconta]
        AND Konto = '1100'
    ),
    0
  )* (
    (
      NZ(
        Sum(
          tblTmpMedarbejder.TotalBeløbBudgetDÅ
        ),
        0
      )/ NZ(
        (
          SELECT
            Sum(
              NZ(TotalBeløbBudgetDÅ, 0)
            )
          FROM
            tblTmpMedarbejder
          WHERE
            Afdeling = [parmAfdeling]
        ),
        1
      )
    )* 0.01
  ) AS ModifiedNestedValue
FROM
  tblTmpMedarbejder
GROUP BY
  tblTmpMedarbejder.Afdeling,
  [Valgfri1] & "-" & [Valgfri3]
HAVING
  tblTmpMedarbejder.Afdeling = [parmAfdeling];
