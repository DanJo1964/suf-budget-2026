Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub btnExportNormtid_Click()
Dim Year_ As Integer
Dim Month_ As Integer

    If IsNull(Me.cboYear) Or IsNull(Me.cboMth) Then
        MsgBox ("Du skal udfylde både år og måned!")
        Exit Sub
    End If

    Me.tbxButDate_4.value = Format(Now, "dd-mm-yyyy hh:mm:ss")

    Year_ = Me.cboYear
    Month_ = Me.cboMth

    Call CreateLederTillægExcel(Year_, Month_)

End Sub

Private Sub btnFBtoExcel_Click()
Dim intYear As Integer
Dim intMonth As Integer

   If IsNull(Me.cboYear) Or IsNull(Me.cboMth) Then
        MsgBox ("Du skal udfylde både år og måned!")
        Exit Sub
    End If

    Me.tbxButDate_3.value = Format(Now(), "dd-mm-yyyy hh:mm:ss")

    intYear = Me.cboYear
    intMonth = Me.cboMth

    Call ExportTblFBRealToExcel(intYear, intMonth)


End Sub

Private Sub btnImportGLTrans_Click()
Dim Year_ As Integer
Dim Month_ As Integer
Dim Filter_ As String
Dim UnicontaID As String

    If IsNull(Me.cboYear) Or IsNull(Me.cboMth) Then
        MsgBox ("Du skal udfylde både år og måned!")
        Exit Sub
    End If

    Me.lblArbejder.Visible = True
    Me.tbxButDate_2.value = Format(Now(), "dd-mm-yyyy hh:mm:ss")

    DoEvents

    Year_ = Me.cboYear
    Month_ = Me.cboMth
    Filter_ = "Date ge datetime'" & Format(DateSerial(Year_, 1, 1), "yyyy-mm-dd") & "T00:00:00' and Date le datetime'" & Format(DateSerial(Year_, Month_ + 1, 0), "yyyy-mm-dd") & "T00:00:00' and Account le '3000'"

    ''Debug.Print Filter_
    UnicontaID = "48928" 'FirmaID skal angives med semikolon som adskiller
    Call InsertUnicontaToSQLPython(Filter_, Year_, Month_, UnicontaID)

    'Kalder den "gamle" kørsel
    'Call InsertFraUniconta_48928(Filter_, Year_, Month_)
    DoEvents
    Me.lblArbejder.Visible = False

End Sub

Private Sub btnImportVisma_Click()

    Me.lblArbejder.Visible = True

    Me.tbxButDate_1.value = Format(Now(), "dd-mm-yyyy hh:mm:ss")

    DoEvents

    Call ImportVismaToNewTable(Me.cboMth, Me.cboYear)

    Me.lblArbejder.Visible = False


End Sub

Private Sub btnKtiTilbudsPortal_Click()
    If IsNull(Me.cboYear) Then
            MsgBox ("Du skal udfylde budget år")
        Exit Sub
    End If

    Call PrecessAfdelingData(Me.cboYear)
End Sub

Private Sub btnIndsætFBUnic_Click()
Dim intYear As Integer
Dim intMth As Integer

    Me.lblArbejder.Visible = True
    Me.tbxButDate_5.value = Format(Now(), "dd-mm-yyyy hh:mm:ss")

    DoEvents

    intYear = Me.cboYear
    intMth = Me.cboMth

    Call IndsætFBRegKladde_Uniconta(intYear, intMth)

    Me.lblArbejder.Visible = False



End Sub

Private Sub Form_Load()
    Dim strFormName As String
    Dim strUser As String

    strFormName = Me.Name
    strUser = Environ("USERNAME") ' Get current Windows user

    ' Move the form
    Me.Move 5000, 0

    ' Call the function to assign values to form objects
    AssignValuesToFormObjects Me, strUser, strFormName

End Sub
Private Sub Form_Unload(Cancel As Integer)
Dim params As New Scripting.Dictionary
Dim strCurrUser As String

strCurrUser = Environ("USERNAME")

params.Add "cboYear", Me.cboYear.value
params.Add "cboMth", Me.cboMth.value
params.Add "tbxButDate_1", Me.tbxButDate_1.value
params.Add "tbxButDate_2", Me.tbxButDate_2.value
params.Add "tbxButDate_3", Me.tbxButDate_3.value
params.Add "tbxButDate_4", Me.tbxButDate_4.value
params.Add "tbxButDate_5", Me.tbxButDate_5.value

Call SaveFormParameters(strCurrUser, "frmSUF_FB_Excel", "", "", params)

End Sub
