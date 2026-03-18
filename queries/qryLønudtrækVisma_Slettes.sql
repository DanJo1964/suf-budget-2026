SELECT
  tblLøndataVisma.Arbejdsgiver,
  [tblLøndataVisma]![CostCenter] & IIf(
    [tblLøndataVisma]![Valgfri2] <> ""
    And [tblLøndataVisma]![CostCenter] <> "1",
    "_" & [tblLøndataVisma]![Valgfri2],
    ""
  ) AS Afdeling,
  [tblLøndataVisma]![Medarbejdernummer] AS Medarbejdernr,
  tblLøndataVisma.CostCenter,
  tblLøndataVisma.Fornavn,
  tblLøndataVisma.Efternavn,
  tblLøndataVisma.Status,
  [tblLøndataVisma]![Ansættelsesdato] AS Fra,
  tblLøndataVisma.Ansattype,
  [tblLøndataVisma]![Ekstern Titel] AS [Ekstern titel],
  [tblLøndataVisma]![Arbejdstid timer] AS Normtid,
  tblLøndataVisma.Løntrin,
  tblLøndataVisma.Valgfri1,
  tblLøndataVisma.Valgfri2,
  tblLøndataVisma.Valgfri3,
  tblLøndataVisma.Lønartsnummer,
  [tblLøndataVisma]![Egen tekst] AS Løntekst,
  [tblLøndataVisma]![Beløb] AS Beløb,
  [tblLøndataVisma]![Rammetrin beløb] AS [Rammetrin beløb],
  IIf(
    IsNull(
      [tblLøndataVisma]![Rammetrin beløb]
    )= True,
    [tblLøndataVisma]![Beløb] / 160.33 *(
      [tblLøndataVisma]![Arbejdstid timer]
    ),
    [tblLøndataVisma]![Rammetrin beløb]
  ) AS [Løn total]
FROM
  tblLøndataVisma;
