SELECT
  tblInterntBudget.Afdeling,
  tblInterntBudget.Konto,
  tblInterntBudget.BudgetIalt
FROM
  tblInterntBudget
WHERE
  (
    (
      (tblInterntBudget.Konto)= "1102"
      Or (tblInterntBudget.Konto)= "1103"
      Or (tblInterntBudget.Konto)= "1104"
      Or (tblInterntBudget.Konto)= "1201"
      Or (tblInterntBudget.Konto)= "1301"
      Or (tblInterntBudget.Konto)= "1501"
      Or (tblInterntBudget.Konto)= "1803"
    )
    AND (
      (tblInterntBudget.Year_)= 2025
    )
  )
ORDER BY
  tblInterntBudget.Konto;
