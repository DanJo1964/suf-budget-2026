Attribute VB_Name = "Functions Create New Budget Year 2"
Option Compare Database
Option Explicit
Function fncCreateNewYear(strYear As String)
Dim answer As Integer



        answer = MsgBox("Vil du oprette budgetåret " & CInt(strYear) & "?", vbYesNo + vbQuestion, "Bekræftelse")
        If answer = vbYes Then

            'Felterne BudgetYear, Konto, Navn da det er de felter der indeholder stamdata - beløb og procenter skal indtastes manuelt
            Call fncCreateNewAfd(CInt(strYear))
            Call fncCreateNewParm(CInt(strYear), "tblParm_Timeløn") 'ok
            Call fncCreateNewParm(CInt(strYear), "tblParm_BeløbPctMedKonti") 'ok
            Call fncCreateNewParm(CInt(strYear), "tblParm_BeløbUdenKonti") 'ok
            Call fncCreateNewParm(CInt(strYear), "tblParm_Pensionsafsavnstillæg") 'ok
            Call fncCreateNewParm(CInt(strYear), "tblParm_ProcentSatser") 'ok
            Call fncCreateNewParm_FB_Kti(CInt(strYear), "tblParm_FB_Excel_Kti")

            Call fncCreateNewKoncernNote(CInt(strYear)) 'ok
            Call fncCreateNewDashboard(CInt(strYear))

            Call fncCreateNewLønTrin(CInt(strYear), "tblParm_LønTrin") 'ok



        Else
            Exit Function
        End If


End Function
Sub testExcelParm()
    Call fncCreateNewParm_FB_Kti(2026, "tblParm_FB_Excel_Kti")
End Sub
Public Function fncUpdateAccount()

End Function
Public Function fncCreateNewAfd(intYear As Integer) As Boolean
    'On Error GoTo Fejl

    Dim dB     As DAO.Database
    Dim strSQL As String

    Set dB = CurrentDb

 strSQL = _
      "INSERT INTO tblAfdeling ([AfdNr Uniconta],AfdelingsNavn,Afdeling,Adresse,PostBy,Tlf_Mail,Afdelingsleder,[FB_AfdNr],[FB_Aktiv],UnicontaFirmaID,[Year_]) " & _
      "SELECT AfdID & IIf(Nz(UnderAfdID,'')='','', '_' & UnderAfdID),AfdNavn,AfdVismaID & IIf(Nz(UnderAfdID,'')='','', '_' & UnderAfdID),Adresse,PostBy,[TlfMail],Leder,FBafdNr,FBaktiv, 48928," & intYear & " " & _
      "FROM tblTmpOpretAfd;"

    ' Kør INSERT
        'Debug.Print strSQL
    dB.Execute strSQL, dbFailOnError

    fncCreateNewAfd = True
    Exit Function

Fejl:
    MsgBox "Fejl " & Err.Number & ": " & Err.Description, vbCritical
    fncCreateNewAfd = False
End Function

Function fncCreateNewAfd_OLD(intYear As Integer)
Dim str As String

    On Error GoTo ErrorHandler ' Error handling

    'DoCmd.SetWarnings False

    'Her skal der hentes aktuelle afdelinger fra Uniconta som er aktive
    'Den Sociale Udviklingsfond:
    Call ConnectToOData("tmpAfdeling_48928", "GLDimType1Client", "48928", "")

    'Her skal afdelingerne indsættes i tblAfdeling
    str = "INSERT INTO tblAfdeling ([AfdNr Uniconta],Afdeling, AfdelingsNavn, OprettetUnicontaNejJa, Revision, FB_Aktiv, FB_AfdNr, Year_) " & _
                "SELECT Dimension, Dimension, Name, -1, 0, 1, Dimension, " & intYear & " " & _
                "FROM tmpAfdeling_48928 " & _
                "WHERE Year_ = " & intYear - 1 & " And Blocked = '0'"
    'Debug.Print str

    DoCmd.RunSQL str

    'Her skal afdelingernes stamdata kopieres fra sidste års stamdata
    str = "UPDATE tblAfdeling AS t1 " & _
         "INNER JOIN tblTmpOpretAfd AS t2 " & _
         "ON t1.Afdeling = t2.AfdID " & _
         "SET t1.Afdelingsleder = t2.Afdelingsleder, " & _
         "t1.[AfdNr Uniconta] = t2.[AfdNr Uniconta], " & _
         "t1.Adresse = t2.Adresse, " & _
         "t1.AfdStatus = t2.AfdStatus, " & _
         "t1.DatoFra = t2.DatoFra, " & _
         "t1.OprettetUnicontaNejJa = t2.OprettetUnicontaNejJa, " & _
         "t1.PostBy = t2.PostBy, " & _
         "t1.Tlf_Mail = t2.Tlf_Mail, " & _
         "t1.UnicontaFirmaID = t2.UnicontaFirmaID, " & _
         "t1.UnicontaFirmanavn = t2.UnicontaFirmanavn, " & _
         "t1.Revision = 0 " & _
         "WHERE t1.Year_ = " & intYear & " " & _
         "AND t2.Year_ = " & intYear - 1 & ";"


    DoCmd.RunSQL str

    DoCmd.SetWarnings True

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub

End Function
Function fncCreateNewDashboard(intYear As Integer)
Dim str As String

    On Error GoTo ErrorHandler ' Error handling

    DoCmd.SetWarnings False

    str = "INSERT INTO tblDashboard (Afdeling, [AfdNr Uniconta], Year_, UnicontaFirmaID, " & _
                                    "Debitor, Fordeling, GngMLeder, IB_SendtLeder, InterntBudget, KoncernNote, Medarbejder, Parametre, TilUnicontaBudget, TP_BudgetPrint, TP_BudgetSendtTilsyn) " & _
        "SELECT a.AfdelingsNavn, a.[AfdNr Uniconta], " & intYear & ", a.UnicontaFirmaID, " & _
                                    "false, false, false, false, false, false, false, false, false, false, false " & _
        "FROM tblAfdeling a " & _
        "WHERE a.Year_ = " & intYear

    'Debug.Print str

    DoCmd.RunSQL str

    DoCmd.SetWarnings True

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"


    Resume ExitSub

End Function
Sub testNewDashboard()

    'Call fncCreateNewAfd(2026)
    Call fncCreateNewDashboard(2026)

'    Call fncCreateNewParm(2025, "tblParm_Timeløn")
'    Call fncCreateNewParm(2025, "tblParm_BeløbPctMedKonti")
'    Call fncCreateNewParm(2025, "tblParm_BeløbUdenKonti")
''
'    Call fncCreateNewParm(2025, "tblParm_Pensionsafsavnstillæg")
'    Call fncCreateNewParm(2025, "tblParm_ProcentSatser")
    'Call fncCreateNewLønTrin(2025, "tblParm_LønTrin")
'

End Sub


Function fncFindLastYear() As String
    On Error GoTo ErrorHandler ' Error handling

    Dim dB As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim rsT As DAO.Recordset
    Dim intMaxYear As Integer


    Set dB = CurrentDb

    Set qdf = dB.CreateQueryDef("", _
    "SELECT MAX(Year_) AS MaxYear FROM tblAfdeling")

    Set rsT = qdf.OpenRecordset(dbOpenSnapshot)
        If rsT.RecordCount > 0 Then
        Do While Not rsT.EOF
              intMaxYear = rsT!MaxYear
            rsT.MoveNext
        Loop
    End If

    fncFindLastYear = Format(intMaxYear, "####")

    rsT.Close
    Set rsT = Nothing
    Set qdf = Nothing
    Set dB = Nothing

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub
End Function
Function fncUpdateCurrentYear(intYear As Integer)
    Dim sql As String
    If IsNull(DLookup("CurrentUser", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'")) Then
        ' CurrentUser is not filled, create a new record
        sql = "INSERT INTO tblCurrentYearDepartment (CurrentUser, Year_) VALUES ('" & Environ("UserName") & "', " & intYear & ")"
    Else
        ' CurrentUser is filled, update the existing record
        sql = "UPDATE tblCurrentYearDepartment SET Year_ = " & intYear & " WHERE CurrentUser = '" & Environ("UserName") & "'"
    End If
    CurrentDb.Execute sql
End Function
Function fncUpdateCurrentDept(strAfd As String, strAfdUni As String, intRevNo As Integer)
    Dim sql As String
    If IsNull(DLookup("CurrentUser", "tblCurrentYearDepartment", "CurrentUser = '" & Environ("UserName") & "'")) Then
        ' CurrentUser is not filled, create a new record
        sql = "INSERT INTO tblCurrentYearDepartment (CurrentUser, Afdeling, [AfdNr Uniconta], Revision) " & _
              "VALUES ('" & Environ("UserName") & "', '" & strAfd & "', '" & strAfdUni & "', " & intRevNo & ")"
    Else
        ' CurrentUser is filled, update the existing record
        sql = "UPDATE tblCurrentYearDepartment SET CurrentUser = '" & Environ("UserName") & "', Afdeling = '" & strAfd & "', [AfdNr Uniconta] = '" & strAfdUni & "', Revision = " & intRevNo & " " & _
        "WHERE CurrentUser = '" & Environ("UserName") & "'"


    End If

    CurrentDb.Execute sql
End Function
Function fncCreateNewParm(intYear As Integer, strTabel As String)
    Dim str As String

    On Error GoTo ErrorHandler ' Error handling

    DoCmd.SetWarnings False

    str = "INSERT INTO " & strTabel & " (BudgetYear, Konto, Navn) " & _
        "SELECT " & intYear & ", Konto, Navn " & _
        "FROM " & strTabel & " " & _
        "WHERE BudgetYear = " & intYear - 1

    DoCmd.RunSQL str

    DoCmd.SetWarnings True

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub

End Function
Function fncCreateNewParm_FB_Kti(intYear As Integer, strTabel As String)
    Dim str As String

    On Error GoTo ErrorHandler ' Error handling

    DoCmd.SetWarnings False

    str = "INSERT INTO " & strTabel & " (Year_, Konto_1, Konto_2, KontoNavn) " & _
        "SELECT " & intYear & ", Konto_1, Konto_2, KontoNavn " & _
        "FROM " & strTabel & " " & _
        "WHERE Year_ = " & intYear - 1


    DoCmd.RunSQL str

    DoCmd.SetWarnings True

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub

End Function
Sub fyrParmaf()

    Call fncCreateNewParm_FB_Kti(2026, "tblParm_FB_Excel_Kti")

End Sub
Function fncCreateNewLønTrin(intYear As Integer, strTabel As String)
    Dim str As String

    On Error GoTo ErrorHandler ' Error handling

    DoCmd.SetWarnings False

    str = "INSERT INTO " & strTabel & " (BudgetYear, Konto, LøntrinNext_1, LøntrinNext_2, LøntrinNext_3, LøntrinNext_4, Navn) " & _
        "SELECT " & intYear & ", Konto, LøntrinNext_1, LøntrinNext_2, LøntrinNext_3, LøntrinNext_4, Navn " & _
        "FROM " & strTabel & " " & _
        "WHERE BudgetYear = " & intYear - 1

    DoCmd.RunSQL str

    DoCmd.SetWarnings True

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub

End Function
Function fncCreateNewKoncernNote(intYear As Integer)
    Dim str As String

        'On Error GoTo ErrorHandler ' Error handling

    'DoCmd.SetWarnings False

    str = "INSERT INTO tblParm_Koncernnote ([Antal årsværk], [Koncernpart], [Note], [Post], [Samhandelskonto], [Status], [Type af omkostning], [Year_]) " & _
          "SELECT  [Antal årsværk], Koncernpart, Note, Post, [Samhandelskonto], [Status], [Type af omkostning], " & intYear & " " & _
          "From tblParm_Koncernnote " & _
          "WHERE Year_ = " & intYear - 1

    DoCmd.RunSQL str

    'DoCmd.SetWarnings True

ExitSub:
    Exit Function

ErrorHandler:
    MsgBox Err.Description, vbCritical, "Error"
    Resume ExitSub


End Function
Sub test()
            Call fncCreateNewKoncernNote(2025)
End Sub
