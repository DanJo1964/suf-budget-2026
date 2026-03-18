Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim intYearGrund As Integer

Private Sub Form_Load()
    Dim varAfdeling As String
    Dim varYear_ As Long
    Dim param() As String

    If Not IsNull(Me.OpenArgs) Then
        param = Split(Me.OpenArgs, "|")
        varAfdeling = param(0)
        varYear_ = CLng(param(1))

        Me.tbxAfdeling = varAfdeling
        Me.tbxYear_ = varYear_

        ' Filtrér subformen
        Me.frmTmpMedarbVikarSub.Form.filter = "Afdeling = '" & varAfdeling & "' AND Year_ = " & varYear_
        Me.frmTmpMedarbVikarSub.Form.FilterOn = True

        If TempVars("isFromPrisberegning").value = True Then
            intYearGrund = TempVars("intYearGrund").value
        End If

        ' Initial summering
        Call SumAntalOgBeloeb
    End If
End Sub
Public Sub SumAntalOgBeloeb()
    Dim Afdeling As String
    Dim Aar As Long

    Afdeling = Me.tbxAfdeling
    Aar = Me.tbxYear_

    Me.tbxAntalTimer = Nz(DSum("Antal", "tblTmpMedarbVikar", "Afdeling = '" & Afdeling & "' AND Year_ = " & Aar), 0)
    Me.tbxTotalBeløb = Nz(DSum("Beløb", "tblTmpMedarbVikar", "Afdeling = '" & Afdeling & "' AND Year_ = " & Aar), 0)
End Sub

Private Sub btnAccept_Click()
    Dim str As String
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim strSQL As String
    Dim strAfd As String
    Dim intYear As Integer
    Dim dblTotalLøn As Double
    Dim dblTimerPrUge As Double
    Dim dblBeløbPrUge As Double
    Dim strLønTrinNummer As String
    Dim strLønTrinNavn As String

    intYear = Nz(Me.tbxYear_, 0)

    If intYear = 0 Then
        MsgBox "Årstal mangler"
        Exit Sub
    End If

    strAfd = Nz(Me.tbxAfdeling, "")

    If strAfd = "" Then
        MsgBox "Afdeling mangler"
        Exit Sub
    End If

    Set dB = CurrentDb

    strSQL = "SELECT * FROM tblTmpMedarbVikar " & _
             "WHERE Afdeling = '" & strAfd & "' AND Year_ = " & intYear

    Set rs = dB.OpenRecordset(strSQL, dbOpenDynaset, dbSeeChanges)

    With rs
        If Not .EOF Then
            Do Until .EOF
                If !Antal + !Beløb > 0 Then
                    strLønTrinNavn = !Løntrin
                    strLønTrinNummer = Nz(DLookup("Konto", "tblParm_Timeløn", _
                                "Navn = '" & strLønTrinNavn & "' AND BudgetYear = " & intYear), 0)
                    dblTimerPrUge = !Antal
                    dblBeløbPrUge = !Beløb

                    Debug.Print dblTotalLøn

                    If strLønTrinNummer = "M" Then
                        dblTotalLøn = dblTotalLøn + (!Beløb * 52@ / 12@)
                    Else
                        dblTotalLøn = dblTotalLøn + BeregnPersonaleOmkostning(dblTimerPrUge, dblBeløbPrUge, strLønTrinNummer, intYear)
                    End If

                    Debug.Print dblTotalLøn
                    Debug.Print dblBeløbPrUge



                End If
                .MoveNext
            Loop
        End If
    End With


    Forms!frmAfdMedarbBudget!Text28 = Me.tbxAntalTimer
    Forms!frmAfdMedarbBudget!Text38 = Format(dblTotalLøn, "#,###")

    Call OpdaterEllerIndsætFBTotal(Me.tbxAfdeling, Me.tbxYear_, Me.tbxAntalTimer, dblTotalLøn, Forms!frmAfdMedarbBudget!Text18)

    DoCmd.Close acForm, Me.Name
End Sub
