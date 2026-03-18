Attribute VB_Name = "Functions Form Medarbejdere"
Option Compare Database
Option Explicit
Private Const FULD_TID_TIMER_PR_MD As Double = 160.33
Public Function OpdaterEllerIndsætFBTotal(strAfdeling As String, _
                                           lngYear As Long, _
                                           dblTimer As Variant, _
                                           dblBeløb As Variant, _
                                           dblTimerPrMd As Variant) As Boolean
    On Error GoTo Fejl

    If IsNull(dblTimer) Or dblTimer = "" Then
        MsgBox "Antal timer mangler!", vbExclamation
        Exit Function
    End If

    If IsNull(dblBeløb) Or dblBeløb = "" Then
        MsgBox "Beløb mangler!", vbExclamation
        Exit Function
    End If

    Dim conn As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim strSQL As String
    Dim strWhere As String

    Set conn = CurrentProject.Connection

    strWhere = "Afdeling = '" & strAfdeling & "' AND Year_ = " & lngYear
    strSQL = "SELECT * FROM tblFB_Totaler WHERE " & strWhere

    Set rs = New ADODB.Recordset
    rs.Open strSQL, conn, adOpenKeyset, adLockOptimistic

    If Not rs.EOF Then
        rs!MedarbTimerPrMd = dblTimerPrMd
        rs!MedarbVikarTimPrMd = dblTimer
        rs!MedarbVikarBlbPrMd = dblBeløb
        rs.Update
    Else
        rs.AddNew
        rs!Afdeling = strAfdeling
        rs!Year_ = lngYear
        rs!MedarbTimerPrMd = dblTimerPrMd
        rs!MedarbVikarTimPrMd = dblTimer
        rs!MedarbVikarBlbPrMd = dblBeløb
        rs!FB_Aktiv = 1
        rs.Update
    End If

    rs.Close
    Set rs = Nothing
    Set conn = Nothing

    OpdaterEllerIndsætFBTotal = True
    Exit Function

Fejl:
    MsgBox "Fejl: " & Err.Description, vbCritical
    OpdaterEllerIndsætFBTotal = False
End Function
Sub testBeregnPersonaleOmkostning()
    Debug.Print BeregnPersonaleOmkostning(1, 242.53, "2", 2026)
End Sub
' Funktionen bruges til at udregne vikar omkostninger
Public Function BeregnPersonaleOmkostning( _
    ByVal Timer As Double, _
    ByVal UgeBelob As Currency, _
    ByVal Lontrin As String, _
    ByVal Aar As Integer, _
    Optional ByRef Detaljer As Variant _
) As Currency

    Dim TimerPrMaaned As Double
    Dim LonPrMaaned As Currency

    ' 1) & 2)
    TimerPrMaaned = Timer * 52# / 12#
    LonPrMaaned = UgeBelob * 52@ / 12@

    'Debug.Print "TimerPrMaaned: " & TimerPrMaaned
    'Debug.Print "LonPrMaaned: " & LonPrMaaned

    ' --------- 3) ATP ---------

    Dim atpBelob(1 To 4) As Currency
    Dim kriterieFmt(4) As String

    kriterieFmt(1) = "BudgetYear=" & Aar & " AND Konto= '1145-000-038'"
    kriterieFmt(2) = "BudgetYear=" & Aar & " AND Konto= '1145-039-077'"
    kriterieFmt(3) = "BudgetYear=" & Aar & " AND Konto= '1145-078-117'"
    kriterieFmt(4) = "BudgetYear=" & Aar & " AND Konto= '1145-118-999'"

    atpBelob(1) = DLookupCur("Beløb", "tblParm_BeløbPctMedKonti", kriterieFmt(1))
    atpBelob(2) = DLookupCur("Beløb", "tblParm_BeløbPctMedKonti", kriterieFmt(2))
    atpBelob(3) = DLookupCur("Beløb", "tblParm_BeløbPctMedKonti", kriterieFmt(3))
    atpBelob(4) = DLookupCur("Beløb", "tblParm_BeløbPctMedKonti", kriterieFmt(4))

    'Debug.Print "ATP beløb(1): " & atpBelob(1)
    'Debug.Print "ATP beløb(2): " & atpBelob(2)
    'Debug.Print "ATP beløb(3): " & atpBelob(3)
    'Debug.Print "ATP beløb(4): " & atpBelob(4)

    Dim atpTotal As Currency
    atpTotal = ATPGebyrFraTimer(TimerPrMaaned, atpBelob())
    Debug.Print "ATP Totalbeløb: " & atpTotal

'    Dim valgtAtpSats As Currency
'    Select Case CLng(Fix(TimerPrMaaned))
'        Case 117 To 999
'            valgtAtpSats = atpBelob(4)
'        Case 77 To 118
'            valgtAtpSats = atpBelob(3)
'        Case 38 To 78
'            valgtAtpSats = atpBelob(2)
'        Case 0 To 39
'            valgtAtpSats = atpBelob(1)
'        Case Else
'            valgtAtpSats = 0@
'    End Select
'    Debug.Print "valgtAtpSats: " & valgtAtpSats

'    Dim ATP As Currency
'    ATP = valgtAtpSats
'    Debug.Print "ATP: " & ATP

    ' --------- 4) Pension ---------
    Dim PensionsSats As Currency
    PensionsSats = DLookupCur("Procent", "tblParm_ProcentSatser", _
                              "BudgetYear=" & Aar & " AND Konto='PensAfsTillæg'")
    'Debug.Print "PensionsSats: " & PensionsSats

    Dim Pension As Currency
    Pension = CCur(LonPrMaaned * PensionsSats)
    Debug.Print "Pension: " & Pension

    ' --------- 5) Feriepenge ---------
    Dim FeriePct As Double
    FeriePct = DLookupDbl("Procent", "tblParm_BeløbPctMedKonti", _
                          "BudgetYear=" & Aar & " AND Konto='1120'")
    'Debug.Print "FeriePct: " & FeriePct

    Dim Feriepenge As Currency
    Feriepenge = CCur(LonPrMaaned * FeriePct)
    'Debug.Print "Feriepenge: " & Feriepenge

    ' --------- Total ---------
    Dim TotalBelob As Currency
    TotalBelob = LonPrMaaned + atpTotal + Pension + Feriepenge
    'Debug.Print "TotalBeløb: " & TotalBelob

    ' Valgfrit breakdown retur
    If Not IsMissing(Detaljer) Then
        Detaljer = Array( _
            Array("TimerPrMåned", TimerPrMaaned), _
            Array("LønPrMåned", LonPrMaaned), _
            Array("ATP", atpTotal), _
            Array("Pension", Pension), _
            Array("Feriepenge", Feriepenge), _
            Array("TotalBeløb", TotalBelob) _
        )
    End If

    BeregnPersonaleOmkostning = TotalBelob
End Function

Private Function DLookupCur(expr As String, domain As String, criteria As String, Optional defaultValue As Currency = 0@) As Currency
    Dim v As Variant
        v = DLookup(expr, domain, criteria)
    DLookupCur = Nz(v, defaultValue)
End Function

Private Function DLookupDbl(expr As String, domain As String, criteria As String, Optional defaultValue As Double = 0#) As Double
    Dim v As Variant: v = DLookup(expr, domain, criteria)
    If IsNull(v) Then
        DLookupDbl = defaultValue
    Else
        DLookupDbl = CDbl(v)
    End If
End Function
' Returnerer samlet ATP-gebyr for en given månedspulje af timer.
' atpBelob(1..4) skal være udfyldt på forhånd (som i din kode).
Public Function ATPGebyrFraTimer(ByVal TimerPrMaaned As Double, _
                                 ByRef atpBelob() As Currency, _
                                 Optional ByVal fuldtidsTimer As Double = FULD_TID_TIMER_PR_MD) As Currency
    Dim antalFTE As Long
    Dim restTimer As Double
    Dim total As Currency
    Dim idx As Integer

    ' Antal fuldtidsmedarbejdere = heltalsdelen af timer / 160,33
    ' Fix()/Int() fjerner brøkdelen – vi bruger Fix for at undgå evt. negative særtilfælde.
    antalFTE = Fix((TimerPrMaaned + 0.0000001) / fuldtidsTimer)

    ' Resterende timer
    restTimer = TimerPrMaaned - (antalFTE * fuldtidsTimer)

    ' ATP for fuldtidsansatte (én ATP pr. fuldtidsmedarbejder)
    total = CCur(antalFTE) * atpBelob(4)

    ' ATP for resttimer: kun hvis der faktisk er rest > 0
    If restTimer > 0.0001 Then
        idx = ATPIntervalIndex(restTimer)
        total = total + atpBelob(idx)
    End If

    ATPGebyrFraTimer = total
End Function

' Map restTimer -> 1..4 efter intervallerne "000-038", "039-077", "078-117", "118-999"
Private Function ATPIntervalIndex(ByVal restTimer As Double) As Integer
    ' NB: Grænserne er inklusive (38, 77, 117)
    If restTimer <= 38# Then
        ATPIntervalIndex = 1
    ElseIf restTimer <= 77# Then
        ATPIntervalIndex = 2
    ElseIf restTimer <= 117# Then
        ATPIntervalIndex = 3
    Else
        ATPIntervalIndex = 4
    End If
End Function
