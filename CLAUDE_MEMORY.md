# CLAUDE_MEMORY - SUF Budget 2026

## Om projektet
- MS Access frontend (.accdb/.accde) med SQL Server backend
- Alle tabeller er linked via ODBC til SQL Server
- VBA-baseret budgetløsning til SUF-organisationen
- Distribueres til brugere via Teams som .accde fil

## Versionsstyring setup
- MSAccVCS addin v4.1.2 installeret
- Export-mappe: C:\Temp\SUF\Development\github\suf-budget-2026\
- GitHub repo: suf-budget-2026 (privat)
- Workflow: Export Source Files → Commit i GitHub Desktop → Push

## Export typer
- Export Source Files = ALT (brug ved releases og større sessioner)
- Export VBA Code = kun kode (brug ved rene VBA-rettelser)
- Export Selected = valgfrie objekter (brug ved præcise små ændringer)

## Dagligt workflow
1. Lav ændringer i Access
2. Version Control → Export (Source/VBA/Selected)
3. GitHub Desktop → Commit med beskrivende tekst
4. Push origin

## Versionstjek for brugere
- tblSystemInfo på SQL Server indeholder aktuel version
- Access tjekker ved Form_Open og advarer hvis version er forældet

## Kendte issues
- frm_TmpDebitorBudgetNew har Hidden Attribute fejl ved export
  → Åbn i Design View → Format → sæt Hidden = No

## Om udvikleren
- Freelance BI-konsulent, 61 år
- Erfaring: 300+ ERP-implementeringer
- Værktøjer: Access, Excel, Power BI, Power Apps, Power Automate, SharePoint, Python
- Forfatter af tekniske bøger
- Ny virksomhed: www.pictoprompts.com
