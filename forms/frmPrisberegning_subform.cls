Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub Form_Current()
    If Not Me.Parent Is Nothing Then
        Me.Parent!txtPrisberegningNavn = Me!PrisberegningNavn
        Me.Parent!txtVersion = Me!Version
        Me.Parent!txtBeskrivelse = Me!Beskrivelse
        Me.Parent!txtAntalPladser = Me!AntalPladser
        Me.Parent!ID = Me!ID
    End If
End Sub
Private Sub Form_BeforeDelConfirm(Cancel As Integer, Response As Integer)
    Response = acDataErrContinue ' Slår Access-dialog fra
End Sub
Private Sub Form_Delete(Cancel As Integer)
Dim svar As String
Dim besked As String

    DoCmd.SetWarnings False

    besked = "Når du sletter denne prisberegning, vil alle tilknyttede medarbejdere og interne budgetter også blive slettet!" & vbCrLf & vbCrLf & _
             "For at bekræfte sletningen, skriv ordet SLET i feltet nedenfor og klik OK."

    svar = InputBox(besked, "Bekræft sletning")

    If UCase(Trim(svar)) <> "SLET" Then
        MsgBox "Sletning annulleret. Ingen data blev slettet.", vbInformation, "Afbryd"
        Cancel = True
        Exit Sub
    End If

    ' Her kan du indsætte sletning af tilknyttede data
    ' Eksempel:
    'On Error Resume Next
    Call DeleteWithADO("tblTmpMedarbejder", Me.PrisberegningNavn)
    Call DeleteWithADO("tblInterntBudget", Me.PrisberegningNavn)
    Call DeleteWithADO("tblTmpMedarbVikar", Me.PrisberegningNavn)
    Call DeleteWithADO("tblFB_Totaler", Me.PrisberegningNavn)
    Call DeleteWithADO("tblTmpDebtor", Me.PrisberegningNavn)

    On Error GoTo 0

    MsgBox "Prisberegningen og tilknyttede data slettes nu.", vbInformation, "Sletning gennemført"

    DoCmd.SetWarnings True


End Sub
Sub DeleteWithADO(strTable As String, strNavn As String)
    Dim conn As Object ' ADODB.Connection
    Dim cmd As Object  ' ADODB.Command
    Dim strConn As String
    Dim strSQL As String
    Dim intYear As Integer

    ' Brug din forbindelse – her antaget standard DSN-less ODBC
    strConn = fncConnString

    Set conn = CreateObject("ADODB.Connection")
    conn.Open strConn

    intYear = Nz(Me.Parent.cboBudgetår, 0)

    strSQL = "DELETE FROM " & strTable & " WHERE Year_ = " & intYear & " AND Afdeling = '" & Replace(strNavn, "'", "''") & "'"

    Set cmd = CreateObject("ADODB.Command")
    Set cmd.ActiveConnection = conn
    cmd.CommandText = strSQL
    cmd.CommandType = 1 ' adCmdText

    cmd.Execute

    conn.Close
    Set cmd = Nothing
    Set conn = Nothing
End Sub
