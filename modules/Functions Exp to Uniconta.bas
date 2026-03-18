Attribute VB_Name = "Functions Exp to Uniconta"
Option Compare Database
Option Explicit

Sub BudgetModelExportTableToCSV(intYear As Integer, strFirmaID As String)
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim qdf As DAO.QueryDef
    Dim fld As DAO.field
    Dim filePath As String
    Dim outputLine As String
    Dim fileNo As Integer
    Dim strDateFrom As String
    Dim strDateTo As String
    Dim rsStr As String


    strDateFrom = "01-01-" & CStr(intYear)
    strDateTo = "31-12-" & CStr(intYear)


    ' Specify the file path
    filePath = "C:\temp\SUF\BudgetAfd_" & CStr(intYear) & "_" & strFirmaID & ".csv"

    ' Prepare file number for writing
    fileNo = FreeFile

    ' Open the file for output
    Open filePath For Output As #fileNo

    Set dB = CurrentDb()

    rsStr = "SELECT " & _
            "'" & strDateFrom & "' As [Fra Dato], " & _
            "'" & strDateTo & "' As [Til Dato], " & _
            "'" & CStr(intYear) & "' & '-' & d.[AfdNr Uniconta] & '-' & a.Name As Navn " & _
            "FROM tblDashboard d INNER JOIN tmpAfdeling" & "_" & strFirmaID & " a ON d.[AfdNr Uniconta] = a.Dimension " & _
            "WHERE a.Blocked='0' AND d.UnicontaFirmaID = '" & strFirmaID & "' AND d.Year_= " & intYear

    Set rs = dB.OpenRecordset(rsStr, dbOpenDynaset, dbSeeChanges)

    ' Write the header row
    For Each fld In rs.Fields
        outputLine = IIf(outputLine = "", fld.Name, outputLine & ";" & fld.Name)
    Next fld
    Print #fileNo, outputLine

    ' Write data rows
    Do Until rs.EOF
        outputLine = ""
        For Each fld In rs.Fields
            outputLine = IIf(outputLine = "", """" & fld.value & """", outputLine & ";" & """" & fld.value & """")
        Next fld
        Print #fileNo, outputLine
        rs.MoveNext
    Loop

    ' Cleanup
    Close #fileNo
    rs.Close
    Set rs = Nothing
    Set qdf = Nothing
    Set dB = Nothing
End Sub
Sub BudgetLineExportTableToCSV(intYear As Integer, strFirmaID As String)
    Dim dB As DAO.Database
    Dim rs As DAO.Recordset
    Dim qdf As DAO.QueryDef
    Dim fld As DAO.field
    Dim filePath As String
    Dim outputLine As String
    Dim headOutputLine As String
    Dim fileNo As Integer
    Dim strAfdNavn As String
    Dim rsStr As String
    Dim strDato As String
    Dim intEntydigtID As Long

    intEntydigtID = 140000

    ' Specify the file path
    filePath = "C:\temp\SUF\BudgetLine_" & CStr(intYear) & "_" & strFirmaID & ".csv"

    ' Prepare file number for writing
    fileNo = FreeFile

    ' Open the file for output
    Open filePath For Output As #fileNo

    Set dB = CurrentDb()

    rsStr = "SELECT " & _
            "(" & CStr(intYear) & " &'-' & d.[AfdNr Uniconta] & '-' & a.Name) As Navn, " & _
            "b.Konto, " & _
            "d.[AfdNr Uniconta] As Afdeling, " & _
            "d.UnicontaUnderAfd, " & _
            "b.[_1], " & _
            "b.[_2], " & _
            "b.[_3], " & _
            "b.[_4], " & _
            "b.[_5], " & _
            "b.[_6], " & _
            "b.[_7], " & _
            "b.[_8], " & _
            "b.[_9], " & _
            "b.[_10], " & _
            "b.[_11], " & _
            "b.[_12] " & _
      "FROM (tmpAfdeling_48928 a " & _
      "INNER JOIN tblDashboard d ON a.Dimension = IIf(d.AddBudget <> """", d.AddBudget, d.[AfdNr Uniconta])) " & _
      "INNER JOIN tblInterntBudget b ON d.[AfdNr Uniconta] = b.Afdeling " & _
      "WHERE d.TilUnicontaBudget = True AND b.BudgetIalt <> 0 And b.Kontotype <> 'Sum'"

    Set rs = dB.OpenRecordset(rsStr, dbOpenDynaset, dbSeeChanges)

    ' Write data rows
    Do Until rs.EOF
        outputLine = ""
        headOutputLine = ""
        For Each fld In rs.Fields

            Select Case fld.Name

                Case Is = "Navn"
                    headOutputLine = """" & fld.value & """"
                Case Is = "Konto"
                    headOutputLine = headOutputLine & ";" & """" & fld.value & """"
                Case Is = "Afdeling"
                    headOutputLine = headOutputLine & ";" & """" & fld.value & """"
                Case Is = "UnicontaUnderAfd"
                    headOutputLine = headOutputLine & ";" & """" & fld.value & """"
                Case Is = "_1"

                    strDato = "01-01-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_2"

                    strDato = "01-02-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_3"

                    strDato = "01-03-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_4"

                    strDato = "01-04-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_5"

                    strDato = "01-05-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_6"

                    strDato = "01-06-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_7"

                    strDato = "01-07-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_8"

                    strDato = "01-08-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_9"

                    strDato = "01-09-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_10"

                    strDato = "01-10-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_11"

                    strDato = "01-11-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

                Case Is = "_12"

                    strDato = "01-12-" & CStr(intYear)
                    intEntydigtID = intEntydigtID + 1

                    outputLine = headOutputLine & ";" & """" & strDato & """"
                    outputLine = outputLine & ";" & """" & fld.value & """"
                    outputLine = outputLine & ";" & """" & CStr(intEntydigtID) & """"

                    Print #fileNo, outputLine
                    outputLine = ""

            End Select


            'outputLine = IIf(outputLine = "", """" & fld.Value & """", outputLine & ";" & """" & fld.Value & """")

        Next fld

        'Print #fileNo, outputLine

        rs.MoveNext
    Loop

    MsgBox "Færdig"

    ' Cleanup
    Close #fileNo
    rs.Close
    Set rs = Nothing
    Set qdf = Nothing
    Set dB = Nothing
End Sub
Sub test()
    Call BudgetLineExportTableToCSV(2024, "48928")

End Sub
