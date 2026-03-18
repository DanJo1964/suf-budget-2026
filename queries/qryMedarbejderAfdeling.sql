SELECT
  DISTINCT tblMedarbejder.*,
  Report_GL.Afdeling,
  Report_GL.Løntrin
FROM
  tblMedarbejder
  INNER JOIN Report_GL ON tblMedarbejder.Medarbejdernr = Report_GL.Medarbejdernr;
