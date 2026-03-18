INSERT INTO tblFinbudget_SumYear_Local (
  Year_, Konto, Month_, Afdeling, Beløb
)
SELECT
  Year([Dato])+ 1 AS Year_,
  tblFinansBudget_Local.Konto,
  Month([Dato]) AS Month_,
  tblFinansBudget_Local.Afdeling,
  Sum(tblFinansBudget_Local.Beløb) AS Beløb
FROM
  tblFinansBudget_Local
GROUP BY
  Year([Dato])+ 1,
  tblFinansBudget_Local.Konto,
  tblFinansBudget_Local.Afdeling,
  Month([Dato]);
