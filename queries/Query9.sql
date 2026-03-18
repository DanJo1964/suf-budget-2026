SELECT
  tblFB_Totaler.Afdeling,
  tblFB_Totaler.Year_,
  tblFB_Totaler.FB_Aktiv,
  tblFB_Totaler.TotalÅrsværk
FROM
  tblFB_Totaler
WHERE
  (
    (
      (tblFB_Totaler.Year_)= 2025
    )
    AND (
      (tblFB_Totaler.FB_Aktiv)= 1
    )
  )
ORDER BY
  tblFB_Totaler.Afdeling;
