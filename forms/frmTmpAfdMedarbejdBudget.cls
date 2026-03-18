Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

'========================
' Form-level state
'========================
Dim intYear As Integer
Dim intYearGrund As Integer
Dim strAfd As String

Private m_RecalcBusy As Boolean

Private Const C_OMREGN_16033 As Double = 160.33

'========================
' EVENT: Form lifecycle
'========================
Private Sub Form_Load()

    ' Hent grunddata
    If intYear = 0 Then intYear = Nz(Me.Parent!cboYearAfd, 0)

    If Nz(TempVars("isFromPrisberegning").value, False) = True Then
        strAfd = Nz(TempVars("currentPrisberegningNavn").value, "")
        intYear = Nz(TempVars("currentYear").value, 0)
        intYearGrund = Nz(TempVars("intYearGrund").value, 0)

        Me.cboLøntrin.Enabled = False
        Me.Beløb.Enabled = False
    Else
        strAfd = Nz(Me.Parent!cboAfdeling, "")
    End If

End Sub

Private Sub Form_Current()
    ' Sikkerhedsline: hold beregnede felter konsistente ved recordskift (ingen prompts her)
    RecalculateAll "Current"
End Sub

Private Sub Form_BeforeInsert(Cancel As Integer)

    If intYear = 0 Or strAfd = "" Then
        intYear = Nz(Me.Parent!cboYearAfd, 0)
        strAfd = Nz(Me.Parent!cboAfdeling, "")
    End If

    If intYear = 0 Or strAfd = "" Then
        MsgBox "Grunddata mangler (år/afd).", vbExclamation
        Cancel = True
        Exit Sub
    End If

    ' Defaults (uden force-save)
    Me.Year_ = intYear
    Me.Afdeling = strAfd
    Me.DatoFra = DateSerial(intYear, 1, 1)
    Me.DatoTil = DateSerial(intYear, 12, 31)

'    Me.cboLøntrin = "LØN_A"
'    Me.LøntrinBudget = "LØN_A"
'
'    Me.Normtid = C_OMREGN_16033
'    Me.NormtidPrUge = Round(C_OMREGN_16033 * 12 / 52, 2)
'
'    Me.Beløb = Nz(ELookup("Beløb", "tblParm_Løntrin", "Konto='LØN_A'"), 0)
'
'    ' Styringsfelter (hvis de findes)
'    If FieldExists("BeløbManuel") Then Me.BeløbManuel = 0
'    If FieldExists("Tilfoej9900") Then Me.Tilfoej9900 = Null
'
'    RecalculateAll "BeforeInsert"

End Sub

'========================
' EVENTS: Thin triggers
'========================
Private Sub cboLønart_AfterUpdate()

    ' Når man går væk fra 9900, nulstil 9900-valget.
    If Nz(Me.Lønart, "") <> "9900" Then
        If FieldExists("Tilfoej9900") Then Me.Tilfoej9900 = Null
    End If

    RecalculateAll "Lønart"
End Sub

Private Sub cboLøntrin_AfterUpdate()

    ' Foreslå beløb fra løntrin KUN hvis beløb ikke er manuelt låst
    If Nz(Me.cboLøntrin, "") <> "" Then
        If Not (FieldExists("BeløbManuel") And Nz(Me.BeløbManuel, 0) = 1) Then
            Me.Beløb = CalcRawBelobFromLontrin(CStr(Me.cboLøntrin))
        End If
    Else
        If Not (FieldExists("BeløbManuel") And Nz(Me.BeløbManuel, 0) = 1) Then
            Me.Beløb = 0
        End If
    End If

    RecalculateAll "Løntrin"
End Sub

Private Sub LøntrinBudget_AfterUpdate()
    RecalculateAll "LøntrinBudget"
End Sub

Private Sub Beløb_AfterUpdate()

    ' Marker manuel overstyring
    If FieldExists("BeløbManuel") Then Me.BeløbManuel = 1

    ' 9900: manuelt beløb overstyrer ALT ? sluk tillæg, ingen prompt
    If Nz(Me.Lønart, "") = "9900" Then
        If FieldExists("Tilfoej9900") Then Me.Tilfoej9900 = 0
    End If

    RecalculateAll "Beløb"
End Sub

Private Sub Normtid_AfterUpdate()
    RecalculateAll "Normtid"
End Sub

Private Sub NormtidPrUge_AfterUpdate()
    RecalculateAll "NormtidPrUge"
End Sub

Private Sub DatoFra_AfterUpdate()
    RecalculateAll "DatoFra"
End Sub

Private Sub DatoTil_AfterUpdate()
    RecalculateAll "DatoTil"
End Sub

Private Sub BeløbBudget_AfterUpdate()

    Dim intSvar As Integer

    intSvar = MsgBox("Vil du følge regelsættet?" & vbCrLf & vbCrLf & _
                     "Klik 'Ja' for at følge regelsættet." & vbCrLf & _
                     "Klik 'Nej' for at overskrive.", _
                     vbYesNo + vbQuestion, "Beløb Budget")

    If intSvar = vbYes Then
        RecalculateAll "BeløbBudget"
    ElseIf intSvar = vbNo Then
        CalcTotaler
    End If

End Sub
'========================
' CORE: Calculation engine
'========================
Private Sub RecalculateAll(Optional ByVal cause As String = "")

    If m_RecalcBusy Then Exit Sub
    m_RecalcBusy = True

    If Not EnsureGrunddata(False) Then GoTo Clean_Exit

    HandleNormtidPair cause

    CalcBeløbBudget_WithRules cause

    CalcTotaler

Clean_Exit:
    m_RecalcBusy = False
End Sub

Private Function EnsureGrunddata(ByVal showUI As Boolean) As Boolean

    If intYear = 0 Then intYear = Nz(Me.Parent!cboYearAfd, 0)
    If strAfd = "" Then strAfd = Nz(Me.Parent!cboAfdeling, "")

    If intYear = 0 Or strAfd = "" Then
        If showUI Then MsgBox "Vælg år og afdeling først.", vbInformation
        EnsureGrunddata = False
        Exit Function
    End If

    EnsureGrunddata = True
End Function

'========================
' Normtid <-> NormtidPrUge rules
'========================
Private Sub HandleNormtidPair(ByVal cause As String)

    If cause = "Normtid" Then

        If IsNull(Me.Normtid) Or Nz(Me.Normtid, 0) = 0 Then
            NullifyNormtidPairWithPrompt
            Exit Sub
        End If

        ' måned -> uge
        Me.NormtidPrUge = Round(Nz(Me.Normtid, 0) * 12 / 52, 2)
        Exit Sub
    End If

    If cause = "NormtidPrUge" Then

        If IsNull(Me.NormtidPrUge) Or Nz(Me.NormtidPrUge, 0) = 0 Then
            NullifyNormtidPairWithPrompt
            Exit Sub
        End If

        ' uge -> måned
        Me.Normtid = Round(Nz(Me.NormtidPrUge, 0) * 52 / 12, 2)
        Exit Sub
    End If

End Sub

Private Sub NullifyNormtidPairWithPrompt()

    ' Slet begge tider
    Me.Normtid = Null
    Me.NormtidPrUge = Null

    Dim ans As VbMsgBoxResult
    ans = MsgBox( _
        "Du har nulstillet arbejdstid (Normtid/Normtid pr. uge)." & vbCrLf & vbCrLf & _
        "Vil du også nulstille lønfelter, så løn følger arbejdstid?" & vbCrLf & _
        "(Beløb, BeløbBudget, TotalBeløbBudgetDÅ, TotalNormtidDÅ, LøntrinBudget, 9900-tillæg)", _
        vbQuestion + vbYesNo, "Nulstil lønfelter?")

    If ans = vbYes Then
        Me.Beløb = 0
        Me.BeløbBudget = 0
        Me.TotalBeløbBudgetDÅ = 0
        Me.TotalNormtidDÅ = 0
        Me.LøntrinBudget = Null

        If FieldExists("BeløbManuel") Then Me.BeløbManuel = 0
        If FieldExists("Tilfoej9900") Then Me.Tilfoej9900 = Null
    End If

End Sub

'========================
' BeløbBudget rules (Budget-løntrin overstyrer alt)
'========================
Private Sub CalcBeløbBudget_WithRules(ByVal cause As String)

    Dim lonart As String
    lonart = Nz(Me.Lønart, "")

    ' Ingen tid => ingen løn (og totaler nulstilles)
    If Nz(Me.Normtid, 0) = 0 Then
        Me.BeløbBudget = 0
        Me.TotalBeløbBudgetDÅ = 0
        Me.TotalNormtidDÅ = 0
        Exit Sub
    End If

    ' 1) Budget-løntrin overstyrer alt (for 1000/1180/1560)
    If Nz(Me.LøntrinBudget, "") <> "" Then
        If lonart = "1000" Or lonart = "1180" Or lonart = "1560" Or lonart = "1562" Then
            Me.BeløbBudget = CalcBeløbBudget_FromParams(CStr(Me.LøntrinBudget), lonart, Nz(Me.Normtid, 0))
            Exit Sub
        End If
        ' 9900 har sin egen regel nedenfor.
    End If

    ' 2) 9900: individuel månedssats
    If lonart = "9900" Then

        Dim baseBelob As Double
        baseBelob = Nz(Me.Beløb, 0)

        ' Manuelt beløb overstyrer ALT: ingen tillæg, ingen prompt
        If FieldExists("BeløbManuel") And Nz(Me.BeløbManuel, 0) = 1 Then
            Me.BeløbBudget = baseBelob
            Exit Sub
        End If

        Dim addBelob As Double
        addBelob = 0

        ' Spørg kun når record redigeres (ellers bliver browsing irriterende)
        If Me.Dirty Then
            If DecideTilfoej9900() Then
                addBelob = GetParam_9900_Forhoej(GetYearOpslag())
            End If
        Else
            ' Ingen prompt ved browsing: brug evt gemt valg, ellers ingen tillæg
            If FieldExists("Tilfoej9900") And Nz(Me.Tilfoej9900, 0) = 1 Then
                addBelob = GetParam_9900_Forhoej(GetYearOpslag())
            End If
        End If

        Me.BeløbBudget = baseBelob + addBelob
        Exit Sub
    End If

    ' 3) Fallback: BeløbBudget følger Beløb
    Me.BeløbBudget = Nz(Me.Beløb, 0)

End Sub

Private Function CalcBeløbBudget_FromParams(ByVal strLontrinBudget As String, ByVal lonart As String, ByVal normtidMonth As Double) As Double

    Dim intYearOpslag As Long
    intYearOpslag = GetYearOpslag()

    If normtidMonth <= 0 Then
        CalcBeløbBudget_FromParams = 0
        Exit Function
    End If

    If (lonart = "1000" Or lonart = "1180") Then
        CalcBeløbBudget_FromParams = _
            Nz(ELookup("Beløb", "tblParm_Løntrin", _
                "Konto='" & strLontrinBudget & "' And BudgetYear=" & CStr(intYearOpslag)), 0) _
            / C_OMREGN_16033 * normtidMonth

    ElseIf lonart = "1560" Or lonart = "1560" Then
        CalcBeløbBudget_FromParams = _
            Nz(ELookup("Beløb", "tblParm_BeløbUdenKonti", _
                "Konto='LønRådighed' And BudgetYear=" & CStr(intYearOpslag)), 0) _
            / C_OMREGN_16033 * normtidMonth
    Else
        CalcBeløbBudget_FromParams = 0
    End If

End Function

Private Function CalcRawBelobFromLontrin(ByVal strLontrin As String) As Double
    CalcRawBelobFromLontrin = Nz(ELookup("Beløb", "tblParm_Løntrin", _
        "Konto='" & strLontrin & "' And BudgetYear=" & CStr(GetYearOpslag())), 0)
End Function

'========================
' 9900 prompt + param lookup
'========================
Private Function DecideTilfoej9900() As Boolean

    If Not FieldExists("Tilfoej9900") Then
        DecideTilfoej9900 = False
        Exit Function
    End If

    If Not IsNull(Me.Tilfoej9900) Then
        DecideTilfoej9900 = (Nz(Me.Tilfoej9900, 0) = 1)
        Exit Function
    End If

    Dim ans As VbMsgBoxResult
    ans = MsgBox( _
        "Lønart 9900 (individuel løn):" & vbCrLf & vbCrLf & _
        "Vil du tillægge årsskifte-regulering fra parametre (Konto: 'LønForhøj_9900')?", _
        vbQuestion + vbYesNo, "Tillæg 9900-regulering?")

    If ans = vbYes Then
        Me.Tilfoej9900 = 1
        DecideTilfoej9900 = True
    Else
        Me.Tilfoej9900 = 0
        DecideTilfoej9900 = False
    End If

End Function

Private Function GetParam_9900_Forhoej(ByVal yearOpslag As Long) As Double
    GetParam_9900_Forhoej = Nz(ELookup("Beløb", "tblParm_BeløbUdenKonti", _
        "Konto='LønForhøj_9900' And BudgetYear=" & CStr(yearOpslag)), 0)
End Function

Private Function GetYearOpslag() As Long
    If Nz(TempVars("intYearGrund").value, 0) > 0 Then
        GetYearOpslag = Nz(TempVars("intYearGrund").value, 0)
    Else
        GetYearOpslag = intYear
    End If
End Function

'========================
' Totaler (delmåneder som decimal, inkl. begge datoer)
'========================
Private Sub CalcTotaler()

    Dim belobBudget As Double
    belobBudget = Nz(Me.BeløbBudget, 0)

    If belobBudget = 0 Or Nz(Me.Normtid, 0) = 0 Then
        Me.TotalBeløbBudgetDÅ = 0
        Me.TotalNormtidDÅ = 0
        Exit Sub
    End If

    If IsNull(Me.DatoFra) Or IsNull(Me.DatoTil) Then
        Me.TotalBeløbBudgetDÅ = 0
        Me.TotalNormtidDÅ = 0
        Exit Sub
    End If

    Dim mdr As Double
    mdr = MonthsFraction(Me.DatoFra, Me.DatoTil)

    Me.TotalBeløbBudgetDÅ = belobBudget * mdr
    Me.TotalNormtidDÅ = Nz(Me.Normtid, 0) * mdr

End Sub

Private Function MonthsFraction(ByVal dStart As Date, ByVal dEnd As Date) As Double
    Dim dA As Date, dB As Date
    Dim dCursor As Date
    Dim dMonthEnd As Date
    Dim dOverlapStart As Date, dOverlapEnd As Date
    Dim total As Double
    Dim daysInMonth As Long, overlapDays As Long

    If dEnd < dStart Then
        dA = dEnd: dB = dStart
    Else
        dA = dStart: dB = dEnd
    End If

    dCursor = DateSerial(Year(dA), Month(dA), 1)

    Do While dCursor <= dB
        dMonthEnd = DateSerial(Year(dCursor), Month(dCursor) + 1, 0)

        dOverlapStart = IIf(dA > dCursor, dA, dCursor)
        dOverlapEnd = IIf(dB < dMonthEnd, dB, dMonthEnd)

        If dOverlapEnd >= dOverlapStart Then
            daysInMonth = Day(dMonthEnd)
            overlapDays = DateDiff("d", dOverlapStart, dOverlapEnd) + 1
            total = total + (overlapDays / daysInMonth)
        End If

        dCursor = DateSerial(Year(dCursor), Month(dCursor) + 1, 1)
    Loop

    MonthsFraction = total
End Function

'========================
' Utility: field exists on recordsource
'========================
Private Function FieldExists(ByVal fieldName As String) As Boolean
    On Error GoTo Nope
    Dim v As Variant
    v = Me.Recordset.Fields(fieldName).Name
    FieldExists = True
    Exit Function
Nope:
    FieldExists = False
End Function
