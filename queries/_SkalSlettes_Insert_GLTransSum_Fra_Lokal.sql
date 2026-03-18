INSERT INTO tblTmpGLTransSum (
  [Date], Account, AccountType, Dimension1,
  Dimension2, Dimension3, Dimension4,
  Dimension5, Amount, Debit, Credit,
  Name, Year_, Date_, User_
)
SELECT
  tmpGLTransSumClient_48928.Date,
  tmpGLTransSumClient_48928.Account,
  tmpGLTransSumClient_48928.AccountType,
  tmpGLTransSumClient_48928.Dimension1,
  tmpGLTransSumClient_48928.Dimension2,
  tmpGLTransSumClient_48928.Dimension3,
  tmpGLTransSumClient_48928.Dimension4,
  tmpGLTransSumClient_48928.Dimension5,
  tmpGLTransSumClient_48928.Amount,
  tmpGLTransSumClient_48928.Debit,
  tmpGLTransSumClient_48928.Credit,
  tmpGLTransSumClient_48928.Name,
  tmpGLTransSumClient_48928.Year_,
  tmpGLTransSumClient_48928.Date_,
  tmpGLTransSumClient_48928.User_
FROM
  tmpGLTransSumClient_48928;
