Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub cmdOK_Click()
Dim Year_ As Integer
Dim Month_ As Integer
Dim Filter_ As String
Dim UnicontaID As Long
Dim i As Integer
Dim dblPct As Double
Dim maxMonth As Integer
Dim svar As String

If IsNull(Me.cboYear) Or IsNull(Me.cboMth) Then
    MsgBox ("Du skal udfylde både år og måned!")
    Exit Sub
End If

DoEvents

Year_ = Me.cboYear
Month_ = Me.cboMth
Filter_ = "Date ge datetime'" & Format(DateSerial(Year_, 1, 1), "yyyy-mm-dd") & "T00:00:00' and Date le datetime'" & Format(DateSerial(Year_, Month_ + 1, 0), "yyyy-mm-dd") & "T00:00:00' and Account le '3000'"

''Debug.Print Filter_
'UnicontaID = 48928

'Call InsertUnicontaToSQLPython(Filter_, Year_, Month_, UnicontaID)

DoEvents

If Me.chkEstimat = 0 Then
    Exit Sub
End If

'Prompt the user for the percentage increase
dblPct = Nz(ELookup("Procent", "tblParm_Procentsatser", "Konto = 'FremskrivPct'  And BudgetYear = " & Year_), 0)
If IsNull(dblPct) Then
    MsgBox "Der er ikke nogen fremskrivningsprocent under parametre! " & vbCrLf & "Kørsel afsluttes."
    Exit Sub
End If

Dim strFremskPct As String
strFremskPct = Replace(Format(dblPct, "0.0000"), ",", ".")
'Debug.Print strFremskPct

'Hvis checkfeltet er sat til, så skal alle eksisterende IB opdateres
i = 1
maxMonth = Nz(GetMaxMonthFromGLTransSumByYear(Year_ - 1), 0)

If maxMonth = 0 Then
    MsgBox "Der er ingen finansposter fra i år." & vbCrLf & "Tjek at Uniconta har data for det valgte år!"
    Exit Sub
End If

If Month_ > maxMonth Then
    svar = MsgBox( _
            "Der er kun mulighed for at hente " & maxMonth & " antal måneder i finansposterne." & vbCrLf & _
            "Vil du nøjes med " & maxMonth & "måneder til at bygge estimerede finansdata med?", _
            vbYesNo + vbQuestion, "Fortsæt oprettelse?" _
            )

    If svar = vbYes Then
        Month_ = maxMonth
    Else
        Exit Sub
    End If
End If

'strFremskPct skal være tekst, ellers vil parameteren ikke aflevere et punktum, som SQL vil have.
'Kalder opdatering af Estimatkolonnen og Sumkti
Call executeSP_UpdateIB_EstimatForrigeAar_FromGLtransSum(Year_, Month_, strFremskPct)

' Lukker den aktuelle formular
DoCmd.Close acForm, Me.Name
End Sub

Private Function GetMaxMonthFromGLTransSumByYear(intYear As Integer) As Integer
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim strSQL As String

    Set dB = CurrentDb
    strSQL = "SELECT Max(Month([Date])) AS MaxMonth " & _
             "FROM tblTmpGLTransSum " & _
             "WHERE Year([Date]) = " & intYear

    Set rs = dB.OpenRecordset(strSQL, dbOpenSnapshot)

    If Not rs.EOF Then
        GetMaxMonthFromGLTransSumByYear = Nz(rs!maxMonth, 0)
    Else
        GetMaxMonthFromGLTransSumByYear = 0
    End If

    rs.Close
    Set rs = Nothing
    Set dB = Nothing
End Function
