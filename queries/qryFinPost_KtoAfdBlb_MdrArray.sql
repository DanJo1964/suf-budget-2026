SELECT
  qryFinPost_KtoAfdMdr.Konto,
  qryFinPost_KtoAfdMdr.Afdeling,
  qryFinPost_KtoAfdMdr.MdrNo,
  qryFinPost_KtoAfdMdr.SumOfBeløb,
  IIf(
    [AntalMdr] + [MdrNo] <= 12,
    Format([MdrNo], '0')& '-' & Format([AntalMdr] + [MdrNo], '0'),
    '-'
  ) AS MdrArray
FROM
  qryFinPost_AntalMdr,
  qryFinPost_KtoAfdBlb12Mdr
  INNER JOIN qryFinPost_KtoAfdMdr ON (
    qryFinPost_KtoAfdBlb12Mdr.Afdeling = qryFinPost_KtoAfdMdr.Afdeling
  )
  AND (
    qryFinPost_KtoAfdBlb12Mdr.Konto = qryFinPost_KtoAfdMdr.Konto
  )
WHERE
  (
    (
      (
        qryFinPost_KtoAfdBlb12Mdr.AlleMdr
      )= 0
    )
  );
