INSERT INTO tblFinpost_SumYear_Local (Year_, Konto, Afdeling, Beløb)
SELECT
  Year([Dato])+ 1 AS Year_,
  tblFinansPoster_Local.Konto,
  tblFinansPoster_Local.Afdeling,
  Sum(tblFinansPoster_Local.Beløb) AS SumOfBeløb
FROM
  tblFinansPoster_Local
GROUP BY
  Year([Dato])+ 1,
  tblFinansPoster_Local.Konto,
  tblFinansPoster_Local.Afdeling;
