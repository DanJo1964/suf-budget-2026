Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private m_AntalAfdelinger As Integer
Private m_AktueltNummer As Integer
Private m_MaxWidth As Single
Private m_HarFejl As Boolean

Private Sub Form_Load()
    m_AntalAfdelinger = 0
    m_AktueltNummer = 0
    m_MaxWidth = Me.rctProgressBg.Width
    Me.rctProgress.Width = 0
    m_HarFejl = False
    Me.lstLog.RowSource = ""
End Sub

Public Sub InitialiserProgress(AntalAfdelinger As Integer)
    m_AntalAfdelinger = AntalAfdelinger
    m_AktueltNummer = 0
    Me.lblProgress.Caption = "Afdeling 0 af " & AntalAfdelinger
    Me.Repaint
End Sub

Public Sub OpdaterProgress(AfdelingNavn As String, StatusHead As String, StatusLine As String)
    m_AktueltNummer = m_AktueltNummer + 1

    ' Opdater status label
    Me.lblStatus.Caption = "Behandler: " & AfdelingNavn

    ' Opdater progress label
    Me.lblProgress.Caption = "Afdeling " & m_AktueltNummer & " af " & m_AntalAfdelinger

    ' Opdater progress bar
    If m_AntalAfdelinger > 0 Then
        Me.rctProgress.Width = (m_AktueltNummer / m_AntalAfdelinger) * m_MaxWidth
    End If

    ' Tilføj til log
    Dim StatusTekst As String
    Dim StatusIkon As String

    If InStr(StatusHead, "200") > 0 And InStr(StatusLine, "200") > 0 Then
        StatusIkon = "?"
        Me.rctProgress.BackColor = RGB(76, 175, 80) ' Grøn
    ElseIf InStr(StatusHead, "404") > 0 Or InStr(StatusLine, "404") > 0 Then
        StatusIkon = "?"
        Me.rctProgress.BackColor = RGB(244, 67, 54) ' Rød
        m_HarFejl = True
        Me.cmdVisLog.Visible = True
    Else
        StatusIkon = "!"
        Me.rctProgress.BackColor = RGB(255, 152, 0) ' Orange
        m_HarFejl = True
        Me.cmdVisLog.Visible = True
    End If

    ' Tilføj linje til listbox
    Dim NyLinje As String
    NyLinje = StatusIkon & ";" & AfdelingNavn & ";" & "Head: " & StatusHead & " / Line: " & StatusLine

    If Me.lstLog.RowSource = "" Then
        Me.lstLog.RowSource = NyLinje
    Else
        Me.lstLog.RowSource = Me.lstLog.RowSource & ";" & NyLinje
    End If

    ' Scroll til bunden
    If Me.lstLog.ListCount > 0 Then
        Me.lstLog.Selected(Me.lstLog.ListCount - 1) = True
    End If

    Me.Repaint
    DoEvents
End Sub

Public Sub AfslutProgress(AntalSucces As Integer, AntalFejl As Integer)
    If AntalFejl = 0 Then
        Me.lblStatus.Caption = "Overførsel gennemført!"
        Me.lblStatus.ForeColor = RGB(76, 175, 80)
        Me.rctProgress.BackColor = RGB(76, 175, 80)
    Else
        Me.lblStatus.Caption = "Overførsel afsluttet med fejl"
        Me.lblStatus.ForeColor = RGB(244, 67, 54)
    End If

    Me.lblProgress.Caption = "Succes: " & AntalSucces & " | Fejl: " & AntalFejl
    Me.cmdLuk.Enabled = True
    Me.Repaint
End Sub

Private Sub cmdLuk_Click()
    DoCmd.Close acForm, Me.Name
End Sub

Private Sub cmdVisLog_Click()
    ' Find seneste logfil og åbn den
    Dim LogMappe As String
    LogMappe = CurrentProject.Path & "\Logs\"

    ' Åbn logmappen i Notesblok eller standard tekstprogram
    Dim LogFil As String
    LogFil = Dir(LogMappe & "*.txt", vbNormal)

    If LogFil <> "" Then
        ' Find nyeste fil
        Dim NyesteFil As String
        Dim NyesteDato As Date
        NyesteDato = #1/1/1900#

        Do While LogFil <> ""
            If FileDateTime(LogMappe & LogFil) > NyesteDato Then
                NyesteDato = FileDateTime(LogMappe & LogFil)
                NyesteFil = LogFil
            End If
            LogFil = Dir()
        Loop

        If NyesteFil <> "" Then
            Shell "notepad.exe """ & LogMappe & NyesteFil & """", vbNormalFocus
        End If
    Else
        MsgBox "Ingen logfil fundet.", vbInformation
    End If
End Sub
