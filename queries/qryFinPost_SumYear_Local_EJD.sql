INSERT INTO tblFinpost_SumYear_Local (Year_, Konto, Afdeling, Beløb)
SELECT
  YEAR(
    CDate(
      Left([Date], 10)
    )
  )+ 1 AS Year_,
  EJD.Account,
  'EJD' AS Afdeling,
  Sum(EJD.Amount) AS SumOfBeløb
FROM
  tmpGLTransSumClient_49782_EJD AS EJD
GROUP BY
  YEAR(
    CDate(
      Left([Date], 10)
    )
  )+ 1,
  EJD.Account;
