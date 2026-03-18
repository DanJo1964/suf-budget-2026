SELECT
  tblInterntBudget.Konto,
  tblInterntBudget.KontoNavn,
  tblInterntBudget.Kontotype,
  Round(
    [tblInterntBudget].[BudgetIalt],
    0
  ) AS Budget,
  tblKontoPlan_Tilbudsskabelon.Placering,
  tblInterntBudget.Afdeling
FROM
  tblInterntBudget
  LEFT JOIN tblKontoPlan_Tilbudsskabelon ON tblInterntBudget.Konto = tblKontoPlan_Tilbudsskabelon.Konto
WHERE
  (
    (
      (tblInterntBudget.Konto)> "1199"
    )
    AND (
      (tblInterntBudget.Kontotype)<> "SUM"
      And (tblInterntBudget.Kontotype)<> "Overskrift"
    )
    AND (
      (
        Round(
          [tblInterntBudget].[BudgetIalt],
          0
        )
      )<> 0
    )
    AND (
      (tblInterntBudget.Afdeling)= "12"
    )
    AND (
      (tblInterntBudget.Year_)= 2024
    )
  );
