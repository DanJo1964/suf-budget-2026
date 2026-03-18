INSERT INTO tblLøndataVisma (
  Arbejdsgiver, Medarbejdernummer,
  Ansættelsesdato, Fornavn, Efternavn,
  Status, Ansattype, Ekstern_titel,
  CostCenter, Arbejdstid_timer, Løntrin,
  Valgfri1, Valgfri2, Valgfri3, Lønartsnummer,
  Egen_tekst, Beløb, Rammetrin_beløb
)
SELECT
  Report.Arbejdsgiver,
  Report.Medarbejdernummer,
  Report.Ansættelsesdato,
  Report.Fornavn,
  Report.Efternavn,
  Report.Status,
  Report.Ansattype,
  Report.[Ekstern titel],
  Report.CostCenter,
  Report.[Arbejdstid timer],
  Report.Løntrin,
  Report.Valgfri1,
  Report.Valgfri2,
  Report.Valgfri3,
  Report.Lønartsnummer,
  Report.[Egen tekst],
  Report.Beløb,
  Report.[Rammetrin beløb]
FROM
  Report
WHERE
  (
    (
      (
        IsNull([Report].[Til])
      )= False
    )
  );
