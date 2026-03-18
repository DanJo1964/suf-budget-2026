PARAMETERS parmAfdeling Text (255),
parmYear_ Short,
parmLønArtBudget Text (255),
parmLønBudget IEEEDouble; INSERT INTO tblTmpMedarbejder (
  Afdeling, Fornavn, Efternavn, DatoFra,
  [Ekstern titel], Normtid, Løntrin,
  Lønart, Beløb, Medarbejdernr, Year_,
  LøntrinBudget, BeløbBudget
)
SELECT
  qryLønudtrækVisma.Afdeling,
  qryLønudtrækVisma.Fornavn,
  qryLønudtrækVisma.Efternavn,
  qryLønudtrækVisma.Fra,
  qryLønudtrækVisma.[Ekstern titel],
  qryLønudtrækVisma.Normtid,
  qryLønudtrækVisma.Løntrin,
  qryLønudtrækVisma.Lønartsnummer,
  qryLønudtrækVisma.[Løn total],
  qryLønudtrækVisma.Medarbejdernr,
  [parmYear_] AS Expr1,
  [parmLønArtBudget] AS Expr2,
  [parmLønBudget] AS Expr3
FROM
  qryLønudtrækVisma
WHERE
  (
    (
      (qryLønudtrækVisma.Afdeling)= [parmAfdeling]
    )
  );
