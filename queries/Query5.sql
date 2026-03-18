SELECT
  tblInterntBudget.Konto,
  tblInterntBudget.BudgetIalt,
  tblInterntBudget.[_1] AS Jan,
  tblInterntBudget.[_2] AS Feb,
  tblInterntBudget.[_3] AS Mar,
  tblInterntBudget.[_4] AS Apr,
  tblInterntBudget.[_5] AS Maj,
  tblInterntBudget.[_6] AS Jun,
  tblInterntBudget.[_7] AS Jul,
  tblInterntBudget.[_8] AS Aug,
  tblInterntBudget.[_9] AS Sep,
  tblInterntBudget.[_10] AS Okt,
  tblInterntBudget.[_11] AS Nov,
  tblInterntBudget.[_12] AS [Dec] INTO SKALLEN
FROM
  tblInterntBudget
WHERE
  (
    (
      (tblInterntBudget.Afdeling)= "10"
    )
    AND (
      (tblInterntBudget.Year_)= 2025
    )
  );
