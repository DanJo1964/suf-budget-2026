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

## VIGTIG AFKLARING: Afdeling vs AfdNr Uniconta
Felterne `Afdeling` og `[AfdNr Uniconta]` i tblAfdeling indeholder i dag den SAMME værdi.
Historisk var der forskel (lønningssystem vs Uniconta), men det er rettet til.
Ingen oversættelse nødvendig mellem de to felter.

## NÆSTE OPGAVE: PrisberegningNavn igennem Functions Tilbudsskabelon
Status: AFKLARET - KLAR TIL IMPLEMENTERING (23-03-2026)

### Afklaret dataflow:
- tblAfdeling: Kender KUN rigtige afdelingsnavne (f.eks. "BOAS NØRREBRO")
- tblFBBudget: Kolonnenavne er rigtige afdelingsnavne (f.eks. "BOAS NØRREBRO")
- Alle andre tabeller (tblTmpDebtor, tblTmpMedarbejder, tblInterntBudget, tblTilbudsSkabelon):
  Indeholder PrisberegningNavn (f.eks. "BOAS NØRREBRO_v2")

### Løsning - tre ændringer:

#### A) btnTilbudsskabelon_Click i frmPrisberegning.cls
Tilføj TempVars inden DoCmd.OpenForm:
- TempVars("isFromPrisberegning") = True
- TempVars("currentAfdeling") = Afdeling fra tblPrisberegning (den rigtige afd)
- TempVars("currentPrisberegningNavn") = PrisberegningNavn

#### B) fncStamdata i Functions Tilbudsskabelon.bas
1. Tjek TempVars("isFromPrisberegning") - hvis True, brug TempVars("currentAfdeling")
   til WHERE-opslag i tblAfdeling i stedet for strAfd
2. Sæt .Fields("AfdU") = strAfd (PrisberegningNavn) i stedet for rs![AfdNr Uniconta]
   Så filtre i efterfølgende funktioner (der bruger AfdU = strAfd) virker korrekt

#### C) fncPersonale i Functions Tilbudsskabelon.bas
tblFBBudget bruger afdelingsnavne som kolonnenavne.
Når kaldt fra Prisberegning, brug TempVars("currentAfdeling") som kolonnenavn
i stedet for strAfd (som er PrisberegningNavn og ikke findes som kolonne).
Berører: SQL-strengen (linje 544) og rs.Fields-opslag (linje 555, 557).

### Funktioner der IKKE skal ændres:
- fncIndtægter: OK - tblTmpDebtor har PrisberegningNavn
- fncOmkostninger: OK - tblInterntBudget har PrisberegningNavn
- fncNøgletal: OK - tblInterntBudget har PrisberegningNavn
- fncKoncernNote: OK - tblInterntBudget har PrisberegningNavn
- fncCleanUp: OK - tblTilbudsskabelon har PrisberegningNavn
- CopyRecords: OK - kopierer fra trs som allerede har korrekt AfdU
