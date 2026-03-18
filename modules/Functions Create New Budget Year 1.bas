Attribute VB_Name = "Functions Create New Budget Year 1"
Option Compare Database
Option Explicit
' === Module: modBudgetAar_Init ===
Private Const FIELDS_TARGET As String = _
  "(Year_, AfdID, UnderAfdID, AfdNavn, Adresse, PostBy, TlfMail, Leder, FBafdNr, FBaktiv)"

Private Const FIELDS_SOURCE As String = _
  "(Year_, AfdID, UnderAfdID, AfdNavn, Adresse, PostBy, TlfMail, Leder, FBafdNr, FBaktiv)"
Public Function fncStartOpretNytBudgetÅr()
    'Bruges af macro for at kalde sub - det skal være en funktion og ikke en sub...
    On Error GoTo EH
    Call subStartOpretNytBudgetÅr
    Exit Function
EH:
    MsgBox "Processen blev afbrudt: " & Err.Description, vbCritical, "Fejl i oprettelse"
End Function
Public Sub subStartOpretNytBudgetÅr()
    Dim btn As VbMsgBoxResult
    Dim NewYear As Long, OldYear As Long
    Dim s As String, hasRows As Boolean
    Dim rs As DAO.Recordset

    ' 1) Spørg hvad brugeren vil
    btn = MsgBox("Vil du oprette et NYT budgetår (kopiere/tilføje afdelinger), " & _
                 "eller fortsætte hvor du slap i redigeringen?", _
                 vbQuestion + vbYesNoCancel, "Nyt år = Ja / Fortsæt = Nej")
    If btn = vbCancel Then Exit Sub

    If btn = vbNo Then
        ' Fortsæt: åbn formen som den er
        DoCmd.OpenForm "frmSUF_OpretNytBudgetår", acNormal  ' :contentReference[oaicite:5]{index=5}
        Exit Sub
    End If

    ' 2) Nyt år: indlæs år
    s = InputBox("Angiv nyt budgetår:", "Opret nyt budgetår")
    If Len(Trim$(s)) = 0 Then Exit Sub
    If Not IsNumeric(s) Then
        MsgBox "Ugyldigt år.", vbExclamation
        Exit Sub
    End If
    NewYear = CLng(s)
    If NewYear < 2020 Or NewYear > 2100 Then
        MsgBox "År udenfor gyldigt interval.", vbExclamation
        Exit Sub
    End If
    OldYear = NewYear - 1

    ' 3) Pre-flight: findes der allerede rækker i tblTmpOpretAfd for NewYear?
    Set rs = CurrentDb.OpenRecordset( _
        "SELECT TOP 1 1 FROM tblAfdeling WHERE Year_=" & NewYear, dbOpenSnapshot)
    hasRows = Not (rs.BOF And rs.EOF)
    rs.Close

    If hasRows Then
        MsgBox "Der findes allerede afdelinger for " & NewYear & "." & vbCrLf & _
               "Hvis du vil ændre en afdeling, skal du åbne ikonet 'Afdelinger'.", _
               vbInformation, "Afdelinger findes allerede"
        Exit Sub
    End If
    ' 4) Hent/Sync Uniconta ? tblTmpOpretAfd (basis-afdelinger for NewYear)
    '    (Erstat denne stub med din rigtige hentning)
    SyncUniconta_To_Tmp NewYear

    ' 5) Kør hele 1?4-flowet
    Run_NewYearSetup NewYear, OldYear   ' bruger vores tidligere moduler

    ' 6) Åbn formen på det nye år
    DoCmd.OpenForm "frmSUF_OpretNytBudgetår", acNormal
'    Forms!frmSUF_OpretNytBudgetår!txtYear = NewYear
'    Forms!frmSUF_OpretNytBudgetår.Requery
End Sub
Public Sub Run_NewYearSetup(ByVal NewYear As Long, ByVal OldYear As Long)
    ' Forudsætninger (trin 1): koden bruger allerede tblTmpOpretAfd/UnderAfd:
    ' - Linked tabeller skal eksistere og være tomme/klargjort til NewYear-feed fra Uniconta.

    ' Trin 2A: spørgelogik + indsæt under/ren pr. basisafdeling
    Step2A_HandleUnderAndPlain NewYear, OldYear

    'Trin 3 + 4: set-baseret kopi + slut-synk, så intet mangler
    Step3_4_CopyPlainAndSync NewYear, OldYear

    MsgBox "Nyt budgetår klargjort: " & NewYear & " (kilde: " & OldYear & ").", vbInformation
End Sub

'--- Stub: her kalder du din reelle Uniconta-import (basisrækker for NewYear) ---
Private Sub SyncUniconta_To_Tmp(ByVal NewYear As Long)
    ' TODO: Din eksisterende Uniconta-sync skal nu skrive til tblTmpOpretAfd (Year_=NewYear)
    '       med basis-afdelinger (AfdID [+ evt. stamfelter]).
    '       Hvis sync allerede er kørt før pre-flight, kan denne være tom.
    Call ConnectToOData("tmpAfdeling_48928", "GLDimType1Client", "48928", "")
    Call ConnectToOData("tmpAfdUnder_48928", "GLDimType4Client", "48928", "")
    Call KopierOgOpdaterAfdelinger(NewYear)


End Sub
Private Function GetBase(ByVal s As Variant) As String
    If IsNull(s) Or Len(s & "") = 0 Then
        GetBase = ""
        Exit Function
    End If

    Dim p As Long
    p = InStr(1, s, "_")

    If p > 1 Then
        GetBase = Left$(s, p - 1)
    Else
        GetBase = s
    End If
End Function
Private Function GetUnder(ByVal s As Variant) As String
    If IsNull(s) Or Len(s & "") = 0 Then
        GetUnder = ""
        Exit Function
    End If

    Dim p As Long
    p = InStr(1, s, "_")

    ' Kun returnér tekst efter "_" hvis der faktisk findes en og der er tegn efter
    If p > 0 And p < Len(s) Then
        GetUnder = Mid$(s, p + 1)
    Else
        GetUnder = ""
    End If
End Function
Private Sub BuildLookups(ByVal OldYear As Long, _
                         ByRef HasUnder As Object, _
                         ByRef HasBasis As Object)

    Set HasUnder = CreateObject("Scripting.Dictionary")
    Set HasBasis = CreateObject("Scripting.Dictionary")

    Dim rs As DAO.Recordset
    Dim sql As String
    sql = "SELECT Afdeling, Year_ FROM tblAfdeling WHERE Year_=" & OldYear
    Set rs = CurrentDb.OpenRecordset(sql, dbOpenSnapshot)

    Dim afd As String, base As String, under As String
    Do While Not rs.EOF
        afd = Nz(rs!Afdeling & "", "")
        If Len(afd) > 0 Then
            base = GetBase(afd)
            under = GetUnder(afd)
            If Len(under) > 0 Then
                If Not HasUnder.exists(base) Then HasUnder.Add base, CreateObject("Scripting.Dictionary")
                If Not HasUnder(base).exists(under) Then HasUnder(base).Add under, True
            Else
                If Not HasBasis.exists(base) Then HasBasis.Add base, True
            End If
        End If
        rs.MoveNext
    Loop
    rs.Close
End Sub
Public Sub Step2A_HandleUnderAndPlain(ByVal NewYear As Long, ByVal OldYear As Long)
    Dim HasUnder As Object, HasBasis As Object

    BuildLookups OldYear, HasUnder, HasBasis

    Dim WantUnder As Object, WantPlain As Object
    Set WantUnder = CreateObject("Scripting.Dictionary")
    Set WantPlain = CreateObject("Scripting.Dictionary")

    Dim ws As DAO.Workspace: Set ws = DBEngine.Workspaces(0)
    Dim rs As DAO.Recordset, sql As String

    ' Hent unikke basis-AfdID fra Uniconta/nyttabellen (kun “rene” rækker)
    sql = "SELECT DISTINCT AfdID " & _
          "FROM tblTmpOpretAfd " & _
          "WHERE Year_=" & NewYear & " AND (UnderAfdID Is Null OR UnderAfdID='') " & _
          "ORDER BY AfdID"
    Set rs = CurrentDb.OpenRecordset(sql, dbOpenSnapshot)

    'On Error GoTo EH
    ws.BeginTrans  ' transaktion  :contentReference[oaicite:5]{index=5}

    Do While Not rs.EOF
        Dim base As String: base = CStr(rs!AfdID)

        ' (a) Underafdelinger?
        If HasUnder.exists(base) Then
            If Not WantUnder.exists(base) Then
                If MsgBox("Vil du oprette underafdelinger for afdeling " & base & "?", _
                          vbQuestion + vbYesNo, "Underafdelinger " & base) = vbYes Then
                    WantUnder.Add base, True

                    ' INSERT alle underafdelinger fra sidste år (AfdID=base, UnderAfdID=<under>)
                    ' Tilpas felter 1:1 til din struktur:
                    Dim insUnder As String
                    insUnder = _
                      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
                      "SELECT " & NewYear & " AS Year_, " & _
                      "       A.Afdeling, '', A.AfdNavn, A.Adresse, A.PostBy, A.TlfMail, " & _
                      "       A.Leder, A.FBafdNr, A.FBaktiv " & _
                      "FROM tblAfdeling AS A " & _
                      "WHERE A.Year_=" & OldYear & " " & _
                      "  AND A.Afdeling = " & base & " " & _
                      "  AND NOT EXISTS ( " & _
                      "       SELECT 1 FROM tblTmpOpretAfd T " & _
                      "       WHERE T.Year_=" & NewYear & " " & _
                      "         AND T.AfdID=A.Afdeling ,'') " & _
                      "  )"
                    CurrentDb.Execute insUnder, dbFailOnError  ' :contentReference[oaicite:6]{index=6}
                Else
                    WantUnder.Add base, False
                End If
            End If
        End If


        ' (b) Ren afdeling uden under – spørg højst én gang pr. base
        Dim baseNavn As String 'Afdeling.Navn
        If Not WantPlain.exists(base) Then
            baseNavn = DLookup("AfdelingsNavn", "tblAfdeling", "Afdeling = '" & base & "' AND Year_ = " & NewYear - 1)

            If MsgBox("Vil du også oprette afdeling " & base & " " & baseNavn & " UDEN underafdeling?", _
                      vbQuestion + vbYesNo, "Ren afdeling " & base) = vbYes Then

                WantPlain.Add base, True

                Dim insPlain As String

                ' Kopiér stamdata fra sidste års 'rene' hvis den fandtes – ellers indsæt minimal post
                If HasBasis.exists(base) Then
                    insPlain = _
                      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
                      "SELECT " & NewYear & " AS Year_, A.Afdeling AS AfdID, Null AS UnderAfdID, " & _
                      "       A.AfdelingsNavn AS AfdNavn, A.Adresse, A.PostBy, A.[Tlf_Mail] AS TlfMail, " & _
                      "       A.Afdelingsleder AS Leder, A.[FB_AfdNr] AS FBAfdNr, A.[FB_Aktiv] AS FBAktiv " & _
                      "FROM tblAfdeling AS A " & _
                      "WHERE A.Year_=" & OldYear & " AND A.Afdeling='" & base & "' " & _
                      "  AND NOT EXISTS (SELECT 1 FROM tblTmpOpretAfd AS T " & _
                      "                  WHERE T.Year_=" & NewYear & " AND T.AfdID=A.Afdeling AND T.UnderAfdID Is Null)"
                Else
                    ' Fald tilbage: opret tom stamme ud fra en række i tblTmpOpretAfd (NewYear)
                    insPlain = _
                      "INSERT INTO tblTmpOpretAfd " & FIELDS_TARGET & " " & _
                      "SELECT " & NewYear & ", U.AfdID, Null, U.AfdNavn, U.Adresse, U.PostBy, U.TlfMail, U.Leder, U.FBAfdNr, U.FBAktiv " & _
                      "FROM tblTmpOpretAfd AS U " & _
                      "WHERE U.Year_=" & NewYear & " AND U.AfdID='" & base & "' AND (U.UnderAfdID Is Null OR U.UnderAfdID='') " & _
                      "  AND NOT EXISTS (SELECT 1 FROM tblTmpOpretAfd AS T " & _
                      "                  WHERE T.Year_=" & NewYear & " AND T.AfdID=U.AfdID AND T.UnderAfdID Is Null)"
                End If

                CurrentDb.Execute insPlain, dbFailOnError
            Else
                WantPlain.Add base, False
            End If
        End If
        rs.MoveNext
    Loop

    ws.CommitTrans
    rs.Close
    Exit Sub

EH:
    On Error Resume Next
    ws.Rollback
    If Not rs Is Nothing Then rs.Close
    MsgBox "Fejl i Step2A: " & Err.Description, vbExclamation
End Sub
Public Sub Step3_4_CopyPlainAndSync(ByVal NewYear As Integer, ByVal OldYear As Integer)
    'Dim ws As DAO.Workspace: Set ws = DBEngine.Workspaces(0)
    'Dim sql3 As String, sql4 As String

    On Error GoTo EH
        Call execute_usp_TmpOpretAfd_CopyPlainAndSync(NewYear, OldYear)

    Exit Sub

EH:
    'ws.Rollback
    MsgBox "Fejl i Step3_4_CopyPlainAndSync: " & Err.Number & " - " & Err.Description, vbExclamation
End Sub

Public Sub KopierOgOpdaterAfdelinger(ByVal BudgetAar As Integer)
    On Error GoTo Fejl

    Dim cn As Object   ' ADODB.Connection
    Dim ForrigeAar As Integer
    Dim sql As String

    Set cn = CurrentProject.Connection  ' ADO forbindelse til den aktuelle Access-projekt DB
    ForrigeAar = BudgetAar - 1

    ' Start transaktion
    cn.BeginTrans

    ' 1) Ryd mål-tabeller (rigtig rækkefølge: under -> hoved)
    cn.Execute "DELETE FROM tblTmpOpretUnderAfd;"
    cn.Execute "DELETE FROM tblTmpOpretAfd;"

    ' 2) Kopiér åbne afdelinger (fra Uniconta-import-tabellen)
    sql = _
      "INSERT INTO tblTmpOpretAfd (AfdID, AfdNavn) " & _
      "SELECT Dimension, Name " & _
      "FROM tmpAfdeling_48928 " & _
      "WHERE Blocked = '0';"
    cn.Execute sql

    ' 3) Kopiér åbne underafdelinger
    sql = _
      "INSERT INTO tblTmpOpretUnderAfd (UafdNr, UafdNavn) " & _
      "SELECT Dimension, Name " & _
      "FROM tmpAfdUnder_48928 " & _
      "WHERE Blocked = '0';"
    cn.Execute sql

    ' 4) Opdater tblTmpOpretAfd med data fra tblAfdeling for året før
    sql = _
      "UPDATE tblTmpOpretAfd AS T " & _
      "INNER JOIN tblAfdeling AS A " & _
      "  ON T.AfdID = A.[AfdNr Uniconta] " & _
      "SET " & _
      "  T.AfdVismaID = A.Afdeling, " & _
      "  T.Adresse    = A.Adresse, " & _
      "  T.PostBy     = A.PostBy, " & _
      "  T.TlfMail    = A.Tlf_Mail, " & _
      "  T.Leder      = A.Afdelingsleder, " & _
      "  T.FBafdNr    = A.FB_afdNr, " & _
      "  T.FBaktiv    = A.FB_aktiv, " & _
      "  T.Year_      = " & BudgetAar & " " & _
      "WHERE A.Year_ = " & ForrigeAar & ";"
    cn.Execute sql

    ' Commit
    cn.CommitTrans

    MsgBox "Afdelinger og underafdelinger er kopieret og opdateret for budgetår " & BudgetAar, vbInformation
    Exit Sub

Fejl:
    On Error Resume Next
    If Not cn Is Nothing Then
        If cn.Errors.Count > 0 Then cn.RollbackTrans
    End If

    ' Giv en klar fejlbesked
    MsgBox "Der opstod en fejl under oprettelsen af nyt budgetår." & vbCrLf & _
           "Fejl " & Err.Number & ": " & Err.Description, vbCritical, "Fejl i KopierOgOpdaterAfdelinger"

    ' Ryd op
    Set cn = Nothing

    ' Stop hele kaldskæden
    Err.Raise vbObjectError + 1000, "KopierOgOpdaterAfdelinger", _
              "Fejl under oprettelse af nyt budgetår. Se tidligere besked."

End Sub
