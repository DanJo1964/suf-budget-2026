SELECT
  qryFinPost_KtoAfdMdr.Konto,
  qryFinPost_KtoAfdMdr.Afdeling,
  Sum(
    qryFinPost_KtoAfdMdr.SumOfBeløb
  ) AS SumOfSumOfBeløb,
  Sum(1) AS MdrCnt
FROM
  qryFinPost_KtoAfdMdr
GROUP BY
  qryFinPost_KtoAfdMdr.Konto,
  qryFinPost_KtoAfdMdr.Afdeling;
