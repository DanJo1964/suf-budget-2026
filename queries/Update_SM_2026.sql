UPDATE
  tblInterntBudget
  INNER JOIN BudgetSM_2026 ON (
    tblInterntBudget.Year_ = BudgetSM_2026.Year_
  )
  AND (
    tblInterntBudget.Afdeling = BudgetSM_2026.Afdeling
  )
  AND (
    tblInterntBudget.Konto = BudgetSM_2026.Konto
  )
SET
  tblInterntBudget.BudgetIalt = [BudgetSM_2026]![BudgetIalt],
  tblInterntBudget.[_1] = [BudgetSM_2026]![_1],
  tblInterntBudget.[_2] = [BudgetSM_2026]![_2],
  tblInterntBudget.[_3] = [BudgetSM_2026]![_3],
  tblInterntBudget.[_4] = [BudgetSM_2026]![_4],
  tblInterntBudget.[_5] = [BudgetSM_2026]![_5],
  tblInterntBudget.[_6] = [BudgetSM_2026]![_6],
  tblInterntBudget.[_7] = [BudgetSM_2026]![_7],
  tblInterntBudget.[_8] = [BudgetSM_2026]![_8],
  tblInterntBudget.[_9] = [BudgetSM_2026]![_9],
  tblInterntBudget.[_10] = [BudgetSM_2026]![_10],
  tblInterntBudget.[_11] = [BudgetSM_2026]![_11],
  tblInterntBudget.[_12] = [BudgetSM_2026]![_12];
