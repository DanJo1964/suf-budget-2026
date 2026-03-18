SELECT
  tblKontoPlan.Kontonummer,
  tblKontoPlan.Kontonavn,
  tblKontoPlan.Kontotype,
  tblKontoPlan_Tilbudsskabelon.Konto,
  tblKontoPlan_Tilbudsskabelon.Beskrivelse,
  tblKontoPlan_Tilbudsskabelon.Områdenavn,
  tblKontoPlan_Tilbudsskabelon.Placering
FROM
  tblKontoPlan
  LEFT JOIN tblKontoPlan_Tilbudsskabelon ON tblKontoPlan.Kontonummer = tblKontoPlan_Tilbudsskabelon.Konto;
