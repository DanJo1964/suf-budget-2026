PARAMETERS parmAfdeling Text (255),
parmYear_ Short,
parmFrmPct IEEEDouble; INSERT INTO tblTmpDebtor (
  Takst, [Status Dato], Paragraf, [Xtra takst],
  Konto, Kontonavn, [Adresse 1], [Adresse 2],
  [Adresse 3], Bynavn, Postnummer,
  Land, Telefon, Afdeling, Bærer, Formål,
  [SUF Veteran], Uddannelse, Year_,
  FremskrivPct, DatoFra, DatoTil, XtraTakstFremskr,
  TotalTakstMdr, TotalTakstDÅ
)
SELECT
  tblDebtorClientUser.Takst,
  tblDebtorClientUser.[Status Dato],
  tblDebtorClientUser.Paragraf,
  tblDebtorClientUser.[Xtra takst],
  tblDebtorClientUser.Konto,
  tblDebtorClientUser.Kontonavn,
  tblDebtorClientUser.[Adresse 1],
  tblDebtorClientUser.[Adresse 2],
  tblDebtorClientUser.[Adresse 3],
  tblDebtorClientUser.Bynavn,
  tblDebtorClientUser.Postnummer,
  tblDebtorClientUser.Land,
  tblDebtorClientUser.Telefon,
  tblDebtorClientUser.Afdeling,
  tblDebtorClientUser.Bærer,
  tblDebtorClientUser.Formål,
  tblDebtorClientUser.[SUF Veteran],
  tblDebtorClientUser.Uddannelse,
  [parmYear_] AS Expr1,
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
  ) AS TotalTakstDÅ
FROM
  tblDebtorClientUser
WHERE
  (
    (
      (tblDebtorClientUser.Afdeling)= [parmAfdeling]
    )
    AND (
      ([parmYear_])= [parmYear_]
    )
    AND (
      ([parmFrmPct])= [parmFrmPct]
    )
    AND (
      (tblDebtorClientUser.Status)= "Aktiv"
    )
  )
  OR (
    (
      (tblDebtorClientUser.Paragraf)<> ""
    )
    AND (
      (
        Nz([tblDebtorClientUser].[M2], 0)
      )<> 0
    )
  );
