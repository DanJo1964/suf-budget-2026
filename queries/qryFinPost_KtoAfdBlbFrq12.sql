SELECT
  qryFinPost_KtoAfdBlb12Mdr.Konto,
  qryFinPost_KtoAfdBlb12Mdr.Afdeling,
  IIf(
    [Beløb] <> 0, [Beløb] / [AntalMdr], 0
  ) AS MdrBlb,
  [MdrBlb] AS Jan,
  [MdrBlb] AS Feb,
  [MdrBlb] AS Mar,
  [MdrBlb] AS Apr,
  [MdrBlb] AS Maj,
  [MdrBlb] AS Jun,
  [MdrBlb] AS Jul,
  [MdrBlb] AS Aug,
  [MdrBlb] AS Sep,
  [MdrBlb] AS Okt,
  [MdrBlb] AS Nov,
  [MdrBlb] AS [Dec]
FROM
  qryFinPost_KtoAfdBlb12Mdr,
  qryFinPost_AntalMdr
WHERE
  (
    (
      (
        qryFinPost_KtoAfdBlb12Mdr.AlleMdr
      )= 1
    )
  );
