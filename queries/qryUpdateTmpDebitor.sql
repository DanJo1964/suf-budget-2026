PARAMETERS parmAfdeling Text (255),
parmYear_ Short,
parmFrmPct IEEEDouble; INSERT INTO tblTmpDebtor (
  Takst, [Status Dato], Paragraf, [Xtra takst],
  Konto, Kontonavn, [Adresse 1], [Adresse 2],
  [Adresse 3], Bynavn, Postnummer,
  Land, Telefon, Afdeling, Bærer, Formål,
  [SUF Veteran], Uddannelse, Year_,
  FremskrivPct, DatoFra, DatoTil, XtraTakstFremskr,
  TotalTakstMdr, TotalTakstDÅ, M2
)
SELECT
  Takst,
  [Status Dato],
  Paragraf,
  [Xtra takst],
  Konto,
  Kontonavn,
  [Adresse 1],
  [Adresse 2],
  [Adresse 3],
  Bynavn,
  Postnummer,
  Land,
  Telefon,
  Afdeling,
  Bærer,
  Formål,
  [SUF Veteran],
  Uddannelse,
  [parmYear_] AS Year_,
  [parmFrmPct] AS FrmPct,
  IIf(
    Year([Status Dato])< [parmYear_],
    DateSerial([parmYear_], 1, 1),
    [Status Dato]
  ) AS DatoFra,
  DateSerial([parmYear_], 12, 31) AS DatoTil,
  [Xtra takst] *(1 + [parmFrmPct]) AS XtraTakstFremskr,
  ([Takst] + [Xtra takst])*(1 + [parmFrmPct]) AS TotalTakstMdr,
  (
    ([Takst] + [Xtra takst])*(1 + [parmFrmPct])
  )*(
    (
      Month([DatoTil])- Month([DatoFra])+ 1
    )
  ) AS TotalTakstDÅ,
  M2
FROM
  tblDebtorClientUser
WHERE
  Afdeling = [parmAfdeling]
  And (
    Status = "Aktiv"
    Or Paragraf <> ""
    Or Nz(tblDebtorClientUser.M2, 0)<> 0
  );
