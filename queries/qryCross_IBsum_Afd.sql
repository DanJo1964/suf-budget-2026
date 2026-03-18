PARAMETERS pYear Short,
pRevision Short; TRANSFORM Sum(tblInterntBudget.BudgetIalt) AS SumOfBudgetIalt
SELECT
  tblInterntBudget.Konto,
  tblInterntBudget.KontoNavn
FROM
  tblInterntBudget
WHERE
  (
    (
      (tblInterntBudget.Kontotype)= "Sum"
    )
    And (
      (tblInterntBudget.Year_)= Forms!frmSUF_Hovedbudget!cboYear
    )
    And (
      (tblInterntBudget.Revision)= 0
    )
  )
GROUP BY
  tblInterntBudget.Konto,
  tblInterntBudget.KontoNavn,
  tblInterntBudget.Kontotype PIVOT [tblInterntBudget]![Afdeling];
