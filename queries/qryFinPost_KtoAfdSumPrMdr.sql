SELECT
  qryFinPost_KtoAfdBlbUnionMscAnd12.Konto,
  qryFinPost_KtoAfdBlbUnionMscAnd12.Afdeling,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Jan
  ) AS SumOfJan,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Feb
  ) AS SumOfFeb,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Mar
  ) AS SumOfMar,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Apr
  ) AS SumOfApr,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Maj
  ) AS SumOfMaj,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Jun
  ) AS SumOfJun,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Jul
  ) AS SumOfJul,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Aug
  ) AS SumOfAug,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Sep
  ) AS SumOfSep,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Okt
  ) AS SumOfOkt,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Nov
  ) AS SumOfNov,
  Sum(
    qryFinPost_KtoAfdBlbUnionMscAnd12.Dec
  ) AS SumOfDec
FROM
  qryFinPost_KtoAfdBlbUnionMscAnd12
GROUP BY
  qryFinPost_KtoAfdBlbUnionMscAnd12.Konto,
  qryFinPost_KtoAfdBlbUnionMscAnd12.Afdeling;
