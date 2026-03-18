INSERT INTO tblTmpGLTrans (
  [Date], Account, AccountType, Dimension1,
  Dimension2, Dimension3, Dimension4,
  Dimension5, Amount, Debit, Credit,
  Name, Year_, Date_, User_
)
SELECT
  tmpGLTransClient_48928.Date,
  tmpGLTransClient_48928.Account,
  tmpGLTransClient_48928.AccountType,
  tmpGLTransClient_48928.Dimension1,
  tmpGLTransClient_48928.Dimension2,
  tmpGLTransClient_48928.Dimension3,
  tmpGLTransClient_48928.Dimension4,
  tmpGLTransClient_48928.Dimension5,
  tmpGLTransClient_48928.Amount,
  tmpGLTransClient_48928.Debit,
  tmpGLTransClient_48928.Credit,
  tmpGLTransClient_48928.Text,
  tmpGLTransClient_48928.Year_,
  tmpGLTransClient_48928.Date_,
  tmpGLTransClient_48928.User_
FROM
  tmpGLTransClient_48928;
