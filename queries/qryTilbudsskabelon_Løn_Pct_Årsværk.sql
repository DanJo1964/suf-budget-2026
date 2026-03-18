SELECT
  qryTilbudsskabelon_Løn_Opdelt.*,
  qryTilbudsskabelon_Løn_Årsværk.SumOfAvgNormtid
FROM
  qryTilbudsskabelon_Løn_Opdelt
  INNER JOIN qryTilbudsskabelon_Løn_Årsværk ON qryTilbudsskabelon_Løn_Opdelt.Kategori = qryTilbudsskabelon_Løn_Årsværk.Kategori;
