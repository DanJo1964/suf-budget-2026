SELECT
  qryFinPost_KtoAfdMdrCnt.Konto,
  qryFinPost_KtoAfdMdrCnt.Afdeling,
  qryFinPost_KtoAfdMdrCnt.SumOfSumOfBeløb AS Beløb,
  qryFinPost_KtoAfdMdrCnt.MdrCnt,
  qryFinPost_AntalMdr.AntalMdr,
  IIf([MdrCnt] = [AntalMdr], 1, 0) AS AlleMdr
FROM
  qryFinPost_AntalMdr,
  qryFinPost_KtoAfdMdrCnt;
