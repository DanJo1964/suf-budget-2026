SELECT
  tblTmpDebtor.Afdeling,
  tblTmpDebtor.Year_,
  tblTmpDebtor.Paragraf,
  Sum(tblTmpDebtor.TotalTakstMdr) AS SumOfTotalTakstMdr,
  Sum(tblTmpDebtor.XtraTakstFremskr) AS SumOfXtraTakstFremskr,
  Sum(1) AS Expr1,
  [TotalTakstMdr] - [XtraTakstFremskr] AS Expr2
FROM
  tblTmpDebtor
GROUP BY
  tblTmpDebtor.Afdeling,
  tblTmpDebtor.Year_,
  tblTmpDebtor.Paragraf,
  [TotalTakstMdr] - [XtraTakstFremskr]
HAVING
  (
    (
      (tblTmpDebtor.Afdeling)= "12"
    )
    AND (
      (tblTmpDebtor.Year_)= 2024
    )
  );
