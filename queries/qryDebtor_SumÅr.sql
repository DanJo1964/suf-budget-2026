PARAMETERS parmAfdeling Text (255),
parmYear_ Short;
SELECT
  tblTmpDebtor.Paragraf,
  Sum(
    IIf(
      Year([Status Dato])< [Year_],
      ([Takst] + [Xtra takst])* 12,
      ([Takst] + [Xtra takst])*(
        13 - Month([Status Dato])
      )
    )
  ) AS Takst_,
  tblTmpDebtor.Afdeling,
  tblTmpDebtor.Year_
FROM
  tblTmpDebtor
GROUP BY
  tblTmpDebtor.Paragraf,
  tblTmpDebtor.Afdeling,
  tblTmpDebtor.Year_
HAVING
  (
    (
      (tblTmpDebtor.Afdeling)= [parmAfdeling]
    )
    AND (
      (tblTmpDebtor.Year_)= [parmYear_]
    )
  );
