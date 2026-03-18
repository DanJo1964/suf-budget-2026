Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim intYear As Integer

' ADO-version af btnOpretNyPrisberegning_Click
Private Sub btnOpretNyPrisberegning_Click()
    'On Error GoTo Fejl

    ' 1. Valider Budgetår
    If IsNull(Me.cboBudgetår) Then
        MsgBox "Vælg venligst et budgetår.", vbExclamation
        Exit Sub
    End If

    ' 2. Valider valg mellem afdeling og fritekst
    Dim strAfdeling As String
    Dim strNavn As String
    Dim intPladser As Integer
    Dim intVersion As Integer
    Dim intYear As Integer
    Dim strAfdUni As String
    Dim isCurAfd As Boolean 'Model 1
    Dim isCurAfdM3 As Boolean 'Model 3
    Dim conn As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim strConn As String
    Dim sql As String
    Dim regEx As Object
    Dim strPrisNavn As String
    Dim strGrundnavn As String
    Dim intNextVersion As Integer
    Dim Match As Object

    intYear = Me.cboBudgetår
    intPladser = Nz(Me.cboAntalPladser, 0)

    strConn = fncConnString ' Din funktion til connectionstring
    Set conn = New ADODB.Connection
    conn.Open strConn


    Select Case Me.fraOpretValg
        Case 3 ' Eksisterende afdeling valgt
            If IsNull(Me.cboPrisberegning) Then
                MsgBox "Vælg en afdeling", vbExclamation
                Exit Sub
            End If

            strPrisNavn = Me.cboPrisberegning  ' eller det aktuelle navn fra formen

            Set regEx = CreateObject("VBScript.RegExp")
            regEx.Pattern = "^(.*)_v[0-9]+$"
            regEx.Global = False
            regEx.IgnoreCase = True

            If regEx.test(strPrisNavn) Then
                ' Navnet slutter på _v[nummer], brug alt før som grundnavn
                Set Match = regEx.Execute(strPrisNavn)
                strGrundnavn = Match(0).SubMatches(0)
            Else
                ' Navnet slutter IKKE på _v[nummer], brug hele navnet som grundnavn
                strGrundnavn = strPrisNavn
            End If

            ' Find højeste version for det grundnavn og læg 1 til
            intNextVersion = Nz(DMax("Version", "tblPrisberegning", _
                "PrisberegningNavn Like '" & strGrundnavn & "_v%'"), 0) + 1

            ' Sæt nyt navn
            strNavn = strGrundnavn & "_v" & intNextVersion
            strAfdUni = Nz(ELookup("[AfdNr Uniconta]", "tblAfdeling", "AfdelingsNavn = '" & strGrundnavn & "' And Year_ = " & intYear), "")

            If strAfdUni = "" Then
                strAfdUni = Nz(ELookup("[AfdNr Uniconta]", "tblAfdeling", "AfdelingsNavn = '" & strGrundnavn & "' And Year_ = " & intYear - 1), "")
            End If



            If strAfdUni <> "" Then
                isCurAfd = True
            Else
                MsgBox "Kan ikke finde afdelingsnr.!"
                GoTo Fejl
            End If


                Set rs = New ADODB.Recordset
                rs.Open "tblPrisberegning", conn, adOpenKeyset, adLockOptimistic
                rs.AddNew
                    rs!BudgetAar = intYear
                    rs!PrisberegningNavn = strNavn
                    rs!AntalPladser = intPladser
                    rs!Version = intNextVersion
                    rs!OprettetDato = Now()
                    rs!OprettetAf = Environ("USERNAME")
                    rs!Status = "Ny"
                    rs!Afdeling = strAfdUni
                    rs!BeregnType = 3
                rs.Update
                rs.Close


        Case 2 ' Frinavn valgt
            If Trim(Me.txtPrisberegningNavn) = "" Then
                MsgBox "Indtast et navn til prisberegningen", vbExclamation
                Exit Sub
            End If

            intNextVersion = Nz(DLookup("Max(Version)", "tblPrisberegning", _
                "BudgetAar = " & intYear & " AND Afdeling = '" & Me.txtPrisberegningNavn & "'"), 0) + 1

            strNavn = Me.txtPrisberegningNavn & "_v" & intVersion

                Set rs = New ADODB.Recordset
                rs.Open "tblPrisberegning", conn, adOpenKeyset, adLockOptimistic
                rs.AddNew
                    rs!BudgetAar = intYear
                    rs!PrisberegningNavn = strNavn
                    rs!AntalPladser = intPladser
                    rs!Version = intNextVersion
                    rs!OprettetDato = Now()
                    rs!OprettetAf = Environ("USERNAME")
                    rs!Status = "Ny"
                    rs!Afdeling = strNavn
                    rs!BeregnType = 2
                rs.Update
                rs.Close

        Case 1 'Eksisterende prisberegning er valgt
            If IsNull(Me.cboPrisberegning) Then
                MsgBox "Vælg en prisberegning", vbExclamation
                Exit Sub
            End If

            strPrisNavn = Me.cboPrisberegning  ' eller det aktuelle navn fra formen

            ' Find grundnavnet (alt før _v[nummer])
            Set regEx = CreateObject("VBScript.RegExp")
            regEx.Pattern = "^(.*)_v[0-9]+$"
            regEx.Global = False

            If regEx.test(strPrisNavn) Then
                Set Match = regEx.Execute(strPrisNavn)
                strGrundnavn = Match(0).SubMatches(0)
            Else
                MsgBox "Navnet skal slutte med _v[nummer]", vbExclamation
                Exit Sub
            End If

            ' Find højeste version for det grundnavn og læg 1 til
            intNextVersion = Nz(DLookup("Max(Version)", "tblPrisberegning", _
                "PrisberegningNavn Like '%" & strGrundnavn & "%'"), 0) + 1

            ' Sæt nyt navn
            strNavn = strGrundnavn & "_v" & intNextVersion
            strAfdUni = strPrisNavn

                Set rs = New ADODB.Recordset
                rs.Open "tblPrisberegning", conn, adOpenKeyset, adLockOptimistic
                rs.AddNew
                    rs!BudgetAar = intYear
                    rs!PrisberegningNavn = strNavn
                    rs!AntalPladser = intPladser
                    rs!Version = intNextVersion
                    rs!OprettetDato = Now()
                    rs!OprettetAf = Environ("USERNAME")
                    rs!Status = "Ny"
                    rs!Afdeling = strAfdUni
                    rs!BeregnType = 1
                rs.Update
                rs.Close
            isCurAfdM3 = True
        Case Else
            MsgBox "Du skal vælge enten afdeling eller skrive et navn", vbExclamation
            Exit Sub
    End Select

    ' 3. Opret posten i tblPrisberegning via ADO


    MsgBox "Prisberegning '" & strNavn & "' er oprettet.", vbInformation

    ' 4. Luk form og returner evt. info via TempVars
'    TempVars("NyPrisberegningNavn") = strNavn
'    TempVars("NyPrisberegningÅr") = intYear

    ' ---- Opdater subform og vælg ny post ----
    Dim lngNewID As Long
    Dim rsFind As ADODB.Recordset
    Set rsFind = New ADODB.Recordset
    sql = "SELECT ID FROM tblPrisberegning WHERE PrisberegningNavn='" & strNavn & "' AND BudgetAar=" & intYear
    rsFind.Open sql, conn, adOpenStatic, adLockReadOnly
    If Not rsFind.EOF Then lngNewID = rsFind!ID
    rsFind.Close
    Set rsFind = Nothing

    With Forms!frmPrisberegning!frmPrisberegning_subform.Form
        .Requery
        .Recordset.FindFirst "ID = " & lngNewID
    End With

    ' 5. Kopiér InterntBudget hvis nødvendig
    If isCurAfd Or isCurAfdM3 Then
        sql = "INSERT INTO tblInterntBudget (Afdeling, Year_, [_1], [_2], [_3], [_4], [_5], [_6], [_7], [_8], [_9], [_10], [_11], [_12], BudgetIalt, EstimatForrigeÅr, EstimatFremskrevet, Kommentarer, Konto, Kontonavn, Kontotype, RealForrigeÅr, [Sum], Revision) " & _
              "SELECT '" & strNavn & "', Year_, [_1], [_2], [_3], [_4], [_5], [_6], [_7], [_8], [_9], [_10], [_11], [_12], BudgetIalt, EstimatForrigeÅr, EstimatFremskrevet, Kommentarer, Konto, Kontonavn, Kontotype, RealForrigeÅr, [Sum], 0 " & _
              "FROM tblInterntBudget WHERE Afdeling = '" & strAfdUni & "' AND Year_ = " & intYear
        conn.Execute sql
    Else
        sql = "INSERT INTO tblInterntBudget (Afdeling, Year_, Konto, Kontonavn, Kontotype, Sum) " & _
              "SELECT '" & strNavn & "', " & intYear & ", KontoNummer, Kontonavn, Kontotype, Sum " & _
              "FROM tblKontoPlan"
        conn.Execute sql
    End If

    Dim lngFB_TotalID As Long
    Dim newID As Long

    lngFB_TotalID = Nz(ELookup("ID", "tblFB_Totaler", "Afdeling = '" & strAfdUni & "' And Year_ = " & intYear), 0)

    newID = CopyRecordWithoutIdentityReturnID(lngFB_TotalID, "tblFB_Totaler")

    If newID > 0 Then

         conn.Execute "UPDATE dbo.tblFB_Totaler SET Afdeling = '" & Replace(strNavn, "'", "''") & "', FB_Aktiv = 0 WHERE ID = " & newID
         'MsgBox "Ny post oprettet med ID: " & newID
    Else
        MsgBox "Fejl under kopiering af tblFB_Totaler under btnOpretNyPrisberegning_Click"
    End If

    DoCmd.Close acForm, Me.Name
    conn.Close
    Set conn = Nothing
    Set rs = Nothing
    Exit Sub

Fejl:
    MsgBox "Der opstod en fejl i btnOpretNyPrisberegning_Click:  " & Err.Description, vbCritical
    If Not rs Is Nothing Then If rs.State = 1 Then rs.Close
    If Not conn Is Nothing Then If conn.State = 1 Then conn.Close
    Set rs = Nothing
    Set conn = Nothing
End Sub

Private Sub Form_Load()

    Call fraOpretValg_AfterUpdate ' initier korrekt visning
        ' Disable felter til start
    EnableInputFields False

    ' Hvis kaldt fra frmPrisberegning og den har valgt et budgetår
    On Error Resume Next
    Dim strCallerForm As String
    strCallerForm = "frmPrisberegning"

    If IsLoaded(strCallerForm) Then
        If Not IsNull(Forms(strCallerForm)!cboBudgetår) Then
            Me.cboBudgetår = Forms(strCallerForm)!cboBudgetår
            intYear = Me.cboBudgetår
            EnableInputFields True
        End If
    End If

    Me.fraOpretValg = 3 ' standard: vælg afdeling
    Call fraOpretValg_AfterUpdate

    On Error GoTo 0


End Sub
Private Sub EnableInputFields(blnEnable As Boolean)

    Me.cboPrisberegning.Enabled = blnEnable
    Me.cboPrisberegning.Locked = Not blnEnable

    Me.txtPrisberegningNavn.Enabled = blnEnable
    Me.txtPrisberegningNavn.Locked = Not blnEnable

    Me.cboAntalPladser.Enabled = blnEnable
    Me.cboAntalPladser.Locked = Not blnEnable

    Me.fraOpretValg.Enabled = blnEnable

End Sub
Private Sub cboBudgetår_AfterUpdate()
    EnableInputFields True
End Sub
Private Sub fraOpretValg_AfterUpdate()


    Select Case fraOpretValg
        Case 1 'Model 2
            Me.cboPrisberegning.Enabled = True
            Me.cboPrisberegning.Locked = False
            Me.cboPrisberegning.Visible = True
            Me.cboPrisberegning.RowSource = "SELECT PrisberegningNavn FROM tblPrisberegning WHERE BudgetAar = " & intYear & " ORDER BY PrisberegningNavn; "
            Me.lblAfdeling.Caption = "Vælg eksisterende prisberegning"

            Me.txtPrisberegningNavn.Enabled = False
            Me.txtPrisberegningNavn.Locked = True
            Me.txtPrisberegningNavn.Visible = False
            Me.cboAntalPladser.Visible = True
            Me.lblPladser.Visible = True


        Case 2 'Model 3
            Me.cboPrisberegning.Enabled = False
            Me.cboPrisberegning.Locked = True
            Me.cboPrisberegning.Visible = False
            Me.lblAfdeling.Caption = "Indast nyt navn"

            Me.txtPrisberegningNavn.Enabled = True
            Me.txtPrisberegningNavn.Locked = False
            Me.txtPrisberegningNavn.Visible = True
            Me.cboAntalPladser.Visible = True
            Me.lblPladser.Visible = True



        Case 3 'Model 1
            Me.cboPrisberegning.Enabled = True
            Me.cboPrisberegning.Locked = False
            Me.cboPrisberegning.Visible = True
            Me.cboPrisberegning.RowSource = "SELECT AfdelingsNavn FROM tblAfdeling WHERE Year_ = " & intYear & " ORDER BY AfdelingsNavn; "

            Me.lblAfdeling.Caption = "Vælg afdeling fra liste"

            Me.txtPrisberegningNavn.Enabled = False
            Me.txtPrisberegningNavn.Locked = True
            Me.txtPrisberegningNavn.Visible = False
            Me.cboAntalPladser.value = 1
            Me.lblPladser.Visible = False
            Me.cboAntalPladser.Visible = False

    End Select

End Sub

Private Sub cboPrisberegning_AfterUpdate()
Dim strNavn As String

    strNavn = Me.cboPrisberegning.value

    If fraOpretValg.value = 1 Then
        Me.cboAntalPladser = Nz(ELookup("AntalPladser", "tblPrisberegning", "BudgetAar = " & intYear & " AND PrisberegningNavn = '" & strNavn & "'"), 1)
    End If

End Sub
