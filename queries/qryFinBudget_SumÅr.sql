PARAMETERS parmAfdeling Text (255),
parmYear_ Short;
SELECT
  Year([Dato])+ 1 AS Year_,
  tblFinansBudget_Local.Konto,
  tblFinansBudget_Local.Afdeling,
  Sum(tblFinansBudget_Local.Beløb) AS SumOfBeløb
FROM
  tblFinansBudget_Local
GROUP BY
  Year([Dato])+ 1,
  tblFinansBudget_Local.Konto,
  tblFinansBudget_Local.Afdeling
HAVING
  (
    (
      (
        Year([Dato])+ 1
      )= [parmYear_]
    )
    AND (
      (tblFinansBudget_Local.Afdeling)= [parmAfdeling]
    )
  );
