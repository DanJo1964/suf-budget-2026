SELECT
  tblFinansPoster_Local.Dato,
  tblFinansPoster_Local.Konto,
  tblFinansPoster_Local.Beløb,
  tblFinansPoster_Local.Afdeling,
  Year([Dato]) AS Year_,
  Month([Dato]) AS [Month]
FROM
  tblFinansPoster_Local;
