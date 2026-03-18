SELECT
  qryFinPost_KtoAfdBlb_MdrArray.Konto,
  qryFinPost_KtoAfdBlb_MdrArray.Afdeling,
  qryFinPost_KtoAfdBlb_MdrArray.SumOfBeløb AS MdrBlb,
  IIf(
    Left([MdrArray], 1)= 1,
    [SumOfBeløb],
    0
  ) AS Jan,
  IIf(
    Left([MdrArray], 1)= 2,
    [SumOfBeløb],
    0
  ) AS Feb,
  IIf(
    Left([MdrArray], 1)= 3,
    [SumOfBeløb],
    0
  ) AS Mar,
  IIf(
    Left([MdrArray], 1)= 4,
    [SumOfBeløb],
    0
  ) AS Apr,
  IIf(
    Left([MdrArray], 1)= 5
    Or Right([MdrArray], 1)= 5,
    [SumOfBeløb],
    0
  ) AS Maj,
  IIf(
    Left([MdrArray], 1)= 6
    Or Right([MdrArray], 1)= 6,
    [SumOfBeløb],
    0
  ) AS Jun,
  IIf(
    Left([MdrArray], 1)= 7
    Or Right([MdrArray], 1)= 7,
    [SumOfBeløb],
    0
  ) AS Jul,
  IIf(
    Left([MdrArray], 1)= 8
    Or Right([MdrArray], 1)= 8,
    [SumOfBeløb],
    0
  ) AS Aug,
  IIf(
    Left([MdrArray], 1)= 9
    Or Right([MdrArray], 1)= 9,
    [SumOfBeløb],
    0
  ) AS Sep,
  IIf(
    Left([MdrArray], 2)= 10
    Or Right([MdrArray], 2)= 10,
    [SumOfBeløb],
    0
  ) AS Okt,
  IIf(
    Left([MdrArray], 2)= 11
    Or Right([MdrArray], 2)= 11,
    [SumOfBeløb],
    0
  ) AS Nov,
  IIf(
    Left([MdrArray], 2)= 12
    Or Right([MdrArray], 2)= 12,
    [SumOfBeløb],
    0
  ) AS [Dec]
FROM
  qryFinPost_KtoAfdBlb_MdrArray;
