PARAMETERS pDepartment Text (255),
pYear Short;
SELECT
  p.FinansKonto,
  d.Afdeling,
  d.Year_,
  Sum(
    IIf(
      Year([d].[DatoFra])< [d].[Year_]
      And (
        [d].[DatoTil] Is Null
        Or Year([d].[DatoTil])> [d].[Year_]
      ),
      [d].[Beløb] * 12,
      IIf(
        Year([d].[DatoFra])< [d].[Year_]
        And (
          [d].[DatoTil] Is Null
          Or Year([d].[DatoTil])= [d].[Year_]
        ),
        [d].[Beløb] * Month([d].[DatoTil]),
        IIf(
          Year([d].[DatoFra])= [d].[Year_]
          And (
            [d].[DatoTil] Is Null
            Or Year([d].[DatoTil])> [d].[Year_]
          ),
          [d].[Beløb] *(
            12 - Month([d].[DatoFra])
          ),
          IIf(
            Year([d].[DatoFra])= [d].[Year_]
            And Year([d].[DatoTil])= [d].[Year_],
            [d].[Beløb] *(
              (
                Month([d].[DatoTil])- Month([d].[DatoFra])
              )
            ),
            0
          )
        )
      )
    )
  ) AS SumOfTakst
FROM
  tblTmpMedarbejder AS d
  LEFT JOIN tblParm_LønartKonto AS p ON d.Lønart = p.Lønart
GROUP BY
  p.FinansKonto,
  d.Afdeling,
  d.Year_
HAVING
  (
    (
      (d.Afdeling)= [pDepartment]
    )
    AND (
      (d.Year_)= [pYear]
    )
  );
