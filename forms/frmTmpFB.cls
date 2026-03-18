Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub Form_BeforeInsert(Cancel As Integer)
Dim intYear As Integer
    intYear = Me.Parent.cboYear.value

    Me.Year_ = intYear

End Sub

Private Function fncTglColor(str As String)
Dim Ctrl As Control

Set Ctrl = Me.Controls(str)

    With Ctrl

        If .value = False Then
            .Caption = "P"
            .ForeColor = RGB(84, 130, 53)
        Else
            .Caption = "X"
            .ForeColor = RGB(255, 0, 0)
        End If

    End With

End Function
Private Function fncFordelAfd(intYear As Integer, strField As String, dblPctÅr As Double, dblPctOms As Double)
Dim dB As DAO.Database
Dim rsT As DAO.Recordset
Dim str As String

''Debug.Print strField, dblPctÅr, dblPctOms


    str = "SELECT Konto_1, [_01], " & strField & " AS AfdNr, [_91] FROM tblTmpFB WHERE Year_ = " & intYear
    'Debug.Print str

    Set dB = CurrentDb
    Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    If Not rsT.EOF Then
        Do While Not rsT.EOF

            rsT.Edit
            Select Case rsT!Konto_1
                Case "1198_1"
                    rsT!AfdNr = rsT![_01] * dblPctÅr
                Case "1198_2"
                    rsT!AfdNr = rsT![_01] * dblPctÅr
                Case "1198_3"
                    rsT!AfdNr = rsT![_01] * dblPctÅr
                Case "1198_3_Ref"
                    rsT!AfdNr = Nz(rsT![_91] * -dblPctÅr, 0)
                Case "1598_Ref"
                    rsT!AfdNr = Nz(rsT![_91] * -dblPctOms, 0)
                Case "1897_Ref"
                    rsT!AfdNr = Nz(rsT![_91] * -dblPctOms, 0)
                Case Else
                    rsT!AfdNr = rsT![_01] * dblPctOms
            End Select


            rsT.Update

            rsT.MoveNext
        Loop

    End If

    rsT.Close
    Set rsT = Nothing
    Set dB = Nothing

End Function

Private Sub Form_Load()
'FORM LOAD
Dim dB As DAO.Database
Dim rsT As DAO.Recordset
Dim rstIB As DAO.Recordset
Dim str As String
Dim strCnt As String
Dim dblTotalOms As Double
Dim dblTotalÅrsværk As Double
Dim dblTotalAfd1 As Double
Dim dblOms As Double
Dim intYear As Integer
Dim dblOmk(11) As Double
Dim dblPctÅr As Double
Dim dblPctOms As Double
Dim i As Integer
Dim dblLønPct(3) As Double
Dim intRev As Integer

    intRev = 0
    intYear = Nz(ELookup("Year_", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'"), 0)

    Set dB = CurrentDb

'Her findes den totale omsætning og totale årsværk
    str = "SELECT Sum(TotalOmsætning) AS Omsætning, Sum(TotalÅrsværk) as Årsværk, Sum(TotalÅrsværkExtVikar) As ÅrsværkExtVikar " & _
          "FROM tblFB_Totaler " & _
          "WHERE Afdeling <> '1' " & _
          "GROUP BY Year_, FB_Aktiv " & _
          "HAVING Year_ = " & intYear & " AND FB_Aktiv = 1 "

    Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    If rsT.RecordCount = 1 Then
        dblTotalOms = rsT!Omsætning
        dblTotalÅrsværk = Nz(rsT!Årsværk, 0) ' + Nz(rst!ÅrsværkExtVikar, 0)
    End If

    Set rsT = Nothing

    'Her skal Afd1 have indsamlet data til OmkAfd1 kolonnen
    str = "SELECT Sum(TotalBeløbBudgetDÅ) As SumAfd1Løn, Year_, Valgfri2 " & _
          "FROM tblTmpMedarbejder " & _
          "GROUP BY Valgfri2, Year_, Revision, Afdeling " & _
          "HAVING Year_ = " & intYear & " AND Revision = " & intRev & " And Afdeling = '1'"

'          If intAktuel = 0 Then
'            str = str & "And Revision = 0"
'          ElseIf intAktuel = 1 Then
'            str = str & "And FB_Aktuel = 1"
'          End If

    'Debug.Print str

    Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)
        If Not rsT.EOF Then
            Do While Not rsT.EOF

                Select Case rsT!Valgfri2
                Case "LEDER"
                    dblOmk(1) = rsT!SumAfd1Løn
                Case "HR/LØN"
                    dblOmk(2) = rsT!SumAfd1Løn
                Case "ADM/TEKNIK"
                    dblOmk(3) = rsT!SumAfd1Løn
                Case Else
                    MsgBox "Der er medarbejder linjer i afd. 1 hvor Valgfri2 er forkert!"
                    'Debug.Print rst!Valgfri2, rst!SumAfd1Løn
                End Select
                rsT.MoveNext
            Loop
        End If
    Set rsT = Nothing

    'Her skal Afd1 have indsamlet data til omkostningskti
    str = "SELECT Konto, BudgetIalt FROM tblInterntBudget " & _
          "WHERE Year_ = " & intYear & " AND Afdeling = '1' AND Revision = " & intRev

    Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

            If Not rsT.EOF Then
            Do While Not rsT.EOF

                Select Case rsT!Konto
                Case "1198"
                    dblOmk(0) = Nz(rsT!BudgetIalt, 0)
                Case "1298"
                    dblOmk(4) = Nz(rsT!BudgetIalt, 0)
                Case "1398"
                    dblOmk(5) = Nz(rsT!BudgetIalt, 0)
                Case "1598"
                    dblOmk(6) = Nz(rsT!BudgetIalt, 0)
                Case "1698"
                    dblOmk(7) = Nz(rsT!BudgetIalt, 0)
                Case "1897"
                    dblOmk(8) = Nz(rsT!BudgetIalt, 0)
                Case "2097"
                    dblOmk(9) = Nz(rsT!BudgetIalt, 0)
                Case "2189"
                    dblOmk(10) = Nz(rsT!BudgetIalt, 0)
                Case "0998"
                    dblOmk(11) = Nz(rsT!BudgetIalt, 0)

                End Select

                rsT.MoveNext
            Loop
        End If

    Set rsT = Nothing

    'Udregning af øvrige lønomkostninger fordelt på LEDER - HR/LØN - ADM/TEKNIK
    'dblLønPct(0) variablen skulle have heddet noget med omkostninger, men er her blot en pladsholder for den samlede løn fra tmpMedarbejder i afdeling 1
    dblLønPct(0) = Nz(dblOmk(1) + dblOmk(2) + dblOmk(3), 0)
    If dblLønPct(0) > 0 Then
        dblLønPct(1) = Nz(dblOmk(1) / dblLønPct(0), 0)
        dblLønPct(2) = Nz(dblOmk(2) / dblLønPct(0), 0)
        dblLønPct(3) = Nz(dblOmk(3) / dblLønPct(0), 0)
    End If

    'Her reduceres dblLønPct(0) til alle lønudgifter UDEN de rå lønudgifter fra medabejder fanen.
    'Så det er summen af al løn fra 1198, dblOmk(0), minus løn fra medarbejderfanen i dblLønPct(0)
    dblLønPct(0) = dblOmk(0) - dblLønPct(0)

    'Her hentes den procent man ønsker som overskudsgrad på afdeling 1
    Dim dblOpct As Double
    dblOpct = Nz(ELookup("Procent", "tblParm_Procentsatser", "BudgetYear = " & intYear & " And Konto = 'Afd1_Opct'"), 0)

    'Til at summere alle omkostninger i til udregning af overskud
    Dim dblSumAfd1 As Double

    'Her udfyldes linjer i tblTmpFB med omkostninger i afdeling 1
    str = "SELECT Konto_1, [_01] FROM tblTmpFB WHERE Year_ = " & intYear & " AND Revision = " & intRev
    Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

        If Not rsT.EOF Then
            Do While Not rsT.EOF

                rsT.Edit

                Select Case rsT!Konto_1
                Case "1198_1"
                    rsT![_01] = dblOmk(1) + (dblLønPct(0) * dblLønPct(1))
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "1198_2"
                    rsT![_01] = dblOmk(2) + (dblLønPct(0) * dblLønPct(2))
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "1198_3"
                    rsT![_01] = dblOmk(3) + (dblLønPct(0) * dblLønPct(3))
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "1298"
                    rsT![_01] = dblOmk(4)
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "1398"
                    rsT![_01] = dblOmk(5)
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "1598"
                    rsT![_01] = dblOmk(6)
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "1698"
                    rsT![_01] = dblOmk(7)
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "1897"
                    rsT![_01] = dblOmk(8)
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "2097"
                    rsT![_01] = dblOmk(9)
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "2189"
                    rsT![_01] = dblOmk(10)
                    dblSumAfd1 = dblSumAfd1 + rsT![_01]
                Case "9900"
                    rsT![_01] = dblSumAfd1 * dblOpct

                End Select

                rsT.Update

                rsT.MoveNext
            Loop
        End If

    Set rsT = Nothing


    'Summering af afd. 1 - men skal MÅSKE ikke bruges mere ...
    str = "SELECT Sum([_01]) AS Afd01 FROM tblTmpFB " & _
          "WHERE Year_ = " & intYear

    Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    If rsT.RecordCount = 1 Then
        dblTotalAfd1 = Nz(rsT!Afd01, 0)
    End If

    Me.Text_SumÅV = dblTotalÅrsværk
    Me.Text_SumAfdOms = dblTotalOms * 0.001
    Me.Text_SumAfd1Omk = dblTotalAfd1 * 0.001

    str = "SELECT * FROM tblFB_Totaler " & _
          "WHERE Udelades = 0 AND FB_Aktiv = 1 AND Year_ = " & intYear & " " & _
          "ORDER BY Afdeling "

''Debug.Print str

    Set rsT = dB.OpenRecordset(str, dbOpenDynaset, dbSeeChanges)

    i = 0
    If Not rsT.EOF Then
        Do While Not rsT.EOF

            If rsT!Afdeling <> "1" Then

                Select Case rsT!Afdeling

                    Case "60_NØRREGADE"
                        Call fncTextInsert("601", Nz(rsT!TotalÅrsværk, 0), 0, Nz(rsT!TotalOmsætning, 0), 0.001, Nz(rsT!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rsT!Udelades, 0))
                        Call fncFordelAfd(intYear, "[_601]", Nz(rsT!TotalÅrsværk, 0) / Nz(dblTotalÅrsværk, 0), Nz(rsT!TotalOmsætning / dblTotalOms, 0))

                    Case "60_ØSTERGADE"
                        Call fncTextInsert("602", Nz(rsT!TotalÅrsværk, 0), 0, Nz(rsT!TotalOmsætning, 0), 0.001, Nz(rsT!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rsT!Udelades, 0))
                        Call fncFordelAfd(intYear, "[_602]", Nz(rsT!TotalÅrsværk, 0) / Nz(dblTotalÅrsværk, 0), Nz(rsT!TotalOmsætning / dblTotalOms, 0))

                    Case "68_HUNE"
                        Call fncTextInsert("681", Nz(rsT!TotalÅrsværk, 0), 0, Nz(rsT!TotalOmsætning, 0), 0.001, Nz(rsT!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rsT!Udelades, 0))
                        Call fncFordelAfd(intYear, "[_681]", Nz(rsT!TotalÅrsværk, 0) / Nz(dblTotalÅrsværk, 0), Nz(rsT!TotalOmsætning / dblTotalOms, 0))

                    Case "68_SOHNGÅRD"
                        Call fncTextInsert("682", Nz(rsT!TotalÅrsværk, 0), 0, Nz(rsT!TotalOmsætning, 0), 0.001, Nz(rsT!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rsT!Udelades, 0))
                        Call fncFordelAfd(intYear, "[_682]", Nz(rsT!TotalÅrsværk, 0) / Nz(dblTotalÅrsværk, 0), Nz(rsT!TotalOmsætning / dblTotalOms, 0))

                    Case "69_BREMERHO9"
                        Call fncTextInsert("691", Nz(rsT!TotalÅrsværk, 0), 0, Nz(rsT!TotalOmsætning, 0), 0.001, Nz(rsT!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rsT!Udelades, 0))
                        Call fncFordelAfd(intYear, "[_691]", Nz(rsT!TotalÅrsværk, 0) / Nz(dblTotalÅrsværk, 0), Nz(rsT!TotalOmsætning / dblTotalOms, 0))

                   Case "69_MOSEVEJ"
                        Call fncTextInsert("692", Nz(rsT!TotalÅrsværk, 0), 0, Nz(rsT!TotalOmsætning, 0), 0.001, Nz(rsT!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rsT!Udelades, 0))
                        Call fncFordelAfd(intYear, "[_692]", Nz(rsT!TotalÅrsværk, 0) / Nz(dblTotalÅrsværk, 0), Nz(rsT!TotalOmsætning / dblTotalOms, 0))

                    Case Else

                        'Original hvor ExtVikar er med, men det skal den ikke!
                        'Call fncTextInsert(rst!Afdeling, Nz(rst!TotalÅrsværk, 0), Nz(rst!TotalÅrsværkExtVikar, 0), Nz(rst!TotalOmsætning, 0), 0.001, Nz(rst!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rst!Udelades, 0))

                        Call fncTextInsert(rsT!Afdeling, Nz(rsT!TotalÅrsværk, 0), 0, Nz(rsT!TotalOmsætning, 0), 0.001, Nz(rsT!TotalOmsætning, 0), Nz(dblTotalOms, 0), Nz(rsT!Udelades, 0))
                        Call fncFordelAfd(intYear, "[_" & rsT!Afdeling & "]", Nz(rsT!TotalÅrsværk, 0) / Nz(dblTotalÅrsværk, 0), Nz(rsT!TotalOmsætning / dblTotalOms, 0))

                End Select


            End If

            rsT.MoveNext
        Loop

    End If

    rsT.Close
    Set rsT = Nothing
    Set dB = Nothing


End Sub
Private Function fncTextInsert(str As String, dbl1_1 As Double, dbl1_2 As Double, dbl2_1, dbl2_2, dbl3_1, dbl3_2, intUdelades As Integer)
Dim strCnt As String

    If IsNumeric(str) Then
        strCnt = "Text_1" & str
        Me.Controls(strCnt).value = dbl1_1 + dbl1_2 'rst!TotalÅrsværk + rst!TotalÅrsværkExtVikar

        strCnt = "Text_2" & str
        Me.Controls(strCnt).value = dbl2_1 * dbl2_2 'rst!TotalOmsætning * 0.001

        strCnt = "Text_3" & str
        Me.Controls(strCnt).value = Nz(dbl3_1 / dbl3_2, 0) 'rst!TotalOmsætning / dblTotalOms

        If str > "1" Then
            strCnt = "Tgl_4" & str
        Me.Controls(strCnt).value = intUdelades 'rst!Udelades
        fncTglColor (strCnt)
        End If
    End If

End Function

Private Sub tgl_410_AfterUpdate()
    fncTglColor ("tgl_410")
End Sub
Private Sub tgl_412_AfterUpdate()
    fncTglColor ("tgl_412")
End Sub
Private Sub tgl_413_AfterUpdate()
    fncTglColor ("tgl_413")
End Sub
Private Sub tgl_414_AfterUpdate()
    fncTglColor ("tgl_414")
End Sub
Private Sub tgl_416_AfterUpdate()
    fncTglColor ("tgl_416")
End Sub
Private Sub tgl_434_AfterUpdate()
    fncTglColor ("tgl_434")
End Sub
Private Sub tgl_460_AfterUpdate()
    fncTglColor ("tgl_460")
End Sub
Private Sub tgl_461_AfterUpdate()
    fncTglColor ("tgl_461")
End Sub
Private Sub tgl_464_AfterUpdate()
    fncTglColor ("tgl_464")
End Sub
Private Sub tgl_467_AfterUpdate()
    fncTglColor ("tgl_467")
End Sub
Private Sub tgl_469_AfterUpdate()
    fncTglColor ("tgl_469")
End Sub
Private Sub tgl_470_AfterUpdate()
    fncTglColor ("tgl_470")
End Sub
Private Sub tgl_472_AfterUpdate()
    fncTglColor ("tgl_472")
End Sub
Private Sub tgl_473_AfterUpdate()
    fncTglColor ("tgl_473")
End Sub
Private Sub tgl_474_AfterUpdate()
    fncTglColor ("tgl_474")
End Sub
Private Sub tgl_475_AfterUpdate()
    fncTglColor ("tgl_475")
End Sub
Private Sub tgl_476_AfterUpdate()
    fncTglColor ("tgl_476")
End Sub
Private Sub tgl_477_AfterUpdate()
    fncTglColor ("tgl_477")
End Sub
Private Sub tgl_478_AfterUpdate()
    fncTglColor ("tgl_478")
End Sub
Private Sub tgl_479_AfterUpdate()
    fncTglColor ("tgl_479")
End Sub
Private Sub tgl_480_AfterUpdate()
    fncTglColor ("tgl_480")
End Sub
Private Sub tgl_481_AfterUpdate()
    fncTglColor ("tgl_481")
End Sub
Private Sub tgl_483_AfterUpdate()
    fncTglColor ("tgl_483")
End Sub
Private Sub tgl_484_AfterUpdate()
    fncTglColor ("tgl_484")
End Sub
Private Sub tgl_490_AfterUpdate()
    fncTglColor ("tgl_490")
End Sub
Private Sub tgl_491_AfterUpdate()
    fncTglColor ("tgl_491")
End Sub
