INSERT INTO tblFinbudget_SumYear_Local (
  Year_, Konto, Month_, Afdeling, Beløb
)
SELECT
  Year(
    CDate(
      Left([Date], 10)
    )
  ) AS Year_,
  tmpGLBudgetLineClient_49782_EJD.Account,
  Month(
    CDate(
      Left([Date], 10)
    )
  ) AS Month_,
  tmpGLBudgetLineClient_49782_EJD.Dimension1,
  Sum(
    tmpGLBudgetLineClient_49782_EJD.Amount
  ) AS Beløb
FROM
  tmpGLBudgetLineClient_49782_EJD
GROUP BY
  Year(
    CDate(
      Left([Date], 10)
    )
  ),
  tmpGLBudgetLineClient_49782_EJD.Account,
  Month(
    CDate(
      Left([Date], 10)
    )
  ),
  tmpGLBudgetLineClient_49782_EJD.Dimension1;
