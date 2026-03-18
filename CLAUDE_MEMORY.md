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

## Import af filer til Access (vigtigt!)
- Brug IKKE Access' egen Import-dialog (opretter Module1, Module2 osv.)
- Brug Version Control båndet → "Load Selected"
- Fremgangsmåde: Markér formen i Navigation Pane (ét klik) → Load Selected

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

## Feltnavn-relationer (vigtigt!)
Disse fire felter refererer til samme værdi på tværs af tabeller:
- tblPrisberegning.PrisberegningNavn
- tblAfdeling.Afdeling
- tblAfdeling.[AfdNr Uniconta]
- tblTilbudsSkabelon.AfdU
- tblInterntBudget.Afdeling

## Implementeret: Tilbudsskabelon fra Prisberegning (18-03-2026)
Ny funktionalitet: Knap "Tilbudsskabelon" på frmPrisberegning åbner
frmSUF_TilbudsSkabelon_Total med den valgte prisberegning som grundlag.

### Ændrede filer:
- forms/frmPrisberegning.bas → ny knap btnTilbudsskabelon i FormHeader
- forms/frmPrisberegning.cls → ny Sub btnTilbudsskabelon_Click()
- forms/frmSUF_TilbudsSkabelon_Total.cls → flere ændringer (se nedenfor)

### Logik i frmSUF_TilbudsSkabelon_Total.cls:
- Form_Load: Detekterer OpenArgs (format: PrisberegningID|PrisberegningNavn|BudgetAar)
  → Sætter TempVar "tsFromPrisberegning" = True
  → Skifter cboAfdeling RowSource til tblPrisberegning
  → Skifter Label37 caption til "Vælg prisberegning"
- cboAfdeling_GotFocus: Springer over hvis åbnet fra Prisberegning
- FilterYearAfd: Filtrerer på [AfdU] = PrisberegningNavn når fra Prisberegning
- btnOpretAfd_Click: Oversætter PrisberegningNavn → [AfdNr Uniconta] via
  ELookup på tblAfdeling inden kald til fncInitTilbud()
  (fncInitTilbud og alle underfunktioner forventer AfdNr Uniconta formatet)
- Form_Unload: Rydder TempVars tsFromPrisberegning, tsPrisberegningID,
  tsPrisberegningNavn, tsYear

### TempVars brugt:
- tsFromPrisberegning (Boolean)
- tsPrisberegningID (Long)
- tsPrisberegningNavn (String)
- tsYear (Integer)

## Kendte issues
- frm_TmpDebitorBudgetNew har Hidden Attribute fejl ved export
  → Åbn i Design View → Format → sæt Hidden = No

## Om udvikleren
- Freelance BI-konsulent, 61 år
- Erfaring: 300+ ERP-implementeringer
- Værktøjer: Access, Excel, Power BI, Power Apps, Power Automate, SharePoint, Python
- Forfatter af tekniske bøger
- Ny virksomhed: www.pictoprompts.com
