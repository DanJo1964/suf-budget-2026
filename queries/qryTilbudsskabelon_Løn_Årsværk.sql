PARAMETERS parmAfdeling Text (255);
SELECT
  InnerQuery.Kategori,
  (
    Sum(InnerQuery.AvgOfNormtid)/ 160.33
  ) AS SumOfAvgNormtid
FROM
  (
    SELECT
      [Valgfri1] & "-" & [Valgfri3] AS Kategori,
      Avg(tblTmpMedarbejder.Normtid) AS AvgOfNormtid
    FROM
      tblTmpMedarbejder
    WHERE
      tblTmpMedarbejder.Afdeling = [parmAfdeling]
    GROUP BY
      tblTmpMedarbejder.Medarbejdernr,
      [Valgfri1] & "-" & [Valgfri3]
  ) AS InnerQuery
GROUP BY
  InnerQuery.Kategori;
