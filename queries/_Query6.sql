INSERT INTO tblDebtorClientUser (
  Takst, AntalM2, Konto, Kontonavn, Afdeling,
  Revision
)
SELECT
  tmpDebitorClientUser_EJD.Takst,
  tmpDebitorClientUser_EJD.AntalM2,
  tmpDebitorClientUser_EJD.Account,
  tmpDebitorClientUser_EJD.Name,
  "EJD" AS Expr1,
  0 AS Expr2
FROM
  tmpDebitorClientUser_EJD;
