Attribute VB_Name = "ExportTilChatGpt"
Option Compare Database

Option Explicit
Sub ExportFormControlsInfo()
    Dim ctl As Control
    Dim f As Form
    Dim output As String
    Dim filePath As String

    ' Skift "FormNavn" til navnet på den formular, du vil analysere
    Set f = Forms("frmTmpInterntBudgetNew")

    output = "Navn;Kontroltype;Kontrolkilde;Datatype" & vbCrLf

    For Each ctl In f.Controls
        On Error Resume Next ' Nogle kontroller har ikke alle egenskaber
        output = output & ctl.Name & ";" & ctl.ControlType & ";" & ctl.ControlSource & ";" & ctl.Properties("Format") & vbCrLf
        On Error GoTo 0
    Next ctl

    ' Gem som tekstfil (CSV-lignende)
    filePath = "C:\Temp\FormControlsInfo.txt"
    Open filePath For Output As #1
    Print #1, output
    Close #1

    MsgBox "Udført! Gemt til: " & filePath
End Sub
