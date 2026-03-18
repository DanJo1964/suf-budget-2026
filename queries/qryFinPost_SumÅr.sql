PARAMETERS parmAfdeling Text (255),
parmYear_ Short;
SELECT
  Year([Dato])+ 1 AS Year_,
  tblFinansPoster.Konto,
  Sum(
    Nz(
      [Beløb] / [qryFinPost_AntalMdr]![AntalMdr],
      0
    )* 12
  ) AS SumÅr,
  tblFinansPoster.Afdeling
FROM
  tblFinansPoster
GROUP BY
  Year([Dato])+ 1,
  tblFinansPoster.Konto,
  tblFinansPoster.Afdeling,
  6
HAVING
  (
    (
      (
        Year([Dato])+ 1
      )= [parmYear_]
    )
    AND (
      (tblFinansPoster.Afdeling)= [parmAfdeling]
    )
  );
