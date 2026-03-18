SELECT
  qryFinPost_Basis.Konto,
  qryFinPost_Basis.Afdeling,
  Month([Dato]) AS MdrNo,
  Sum(qryFinPost_Basis.Beløb) AS SumOfBeløb
FROM
  qryFinPost_Basis
GROUP BY
  qryFinPost_Basis.Konto,
  qryFinPost_Basis.Afdeling,
  Month([Dato]);
