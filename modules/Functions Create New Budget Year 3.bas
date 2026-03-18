Attribute VB_Name = "Functions Create New Budget Year 3"
Option Compare Database
Option Explicit
Public Function DataFromVisma() As Boolean
    Dim fd As FileDialog
    Dim strExcelFil As String

    ' Standardreturværdien er False (fejl/annuller)
    DataFromVisma = False

    ' Vælg Excel-fil via dialog
    Set fd = Application.FileDialog(msoFileDialogFilePicker)

    With fd
        .title = "Vælg Excel-fil med løndata"
        .Filters.Clear
        .Filters.Add "Excel-filer", "*.xlsx; *.xls"
        .AllowMultiSelect = False

        ' Hvis brugeren trykker Annuller (.Show returnerer 0)
        If .Show <> -1 Then
            ' Stop funktionen. Den vil returnere den forudindstillede 'False'
            Exit Function
        End If

        strExcelFil = .SelectedItems(1)
    End With

    ' Slet evt. tidligere import
    If fncDeleteTableIfExists("tblImport_LøndataVisma") Then
        ''Debug.Print "Gammel importtabel slettet"
    End If

    ' Importér til midlertidig tabel
    DoCmd.TransferSpreadsheet acImport, acSpreadsheetTypeExcel12, _
        "tblImport_LøndataVisma", strExcelFil, True

    ' Tjek for nødvendige kolonner
    Dim rstCheck As DAO.Recordset
    Set rstCheck = CurrentDb.OpenRecordset("SELECT * FROM tblImport_LøndataVisma", dbOpenSnapshot)

    Dim colOk As Boolean
    colOk = False
    On Error Resume Next
    colOk = Not (IsNull(rstCheck.Fields("Medarbejdernummer")) Or _
                 IsNull(rstCheck.Fields("Lønartsnummer")) Or _
                 IsNull(rstCheck.Fields("Beløb")))
    On Error GoTo 0

    rstCheck.Close
    Set rstCheck = Nothing

    If Not colOk Then
        MsgBox "Excel-filen mangler bl.a. kolonnerne (MedarbejderNummer, Lønartsnummer, Beløb)", vbCritical
        ' Stop funktionen. Den vil returnere 'False'
        Exit Function
    End If

    ' Tøm lokal tabel og kopier nye data ind
    DoCmd.SetWarnings False
    DoCmd.RunSQL "DELETE FROM tblLøndataVisma"
    DoCmd.RunSQL _
        "INSERT INTO tblLøndataVisma (Arbejdsgiver, Medarbejdernummer, Ansættelsesdato, Fornavn, Efternavn, Status, Ansattype, [Ekstern titel], CostCenter, [Arbejdstid timer], Løntrin, Valgfri1, Valgfri2, Valgfri3, Lønartsnummer, [Egen tekst], Beløb, [Rammetrin beløb] ) " & _
        "SELECT Arbejdsgiver, Medarbejdernummer, Ansættelsesdato, Fornavn, Efternavn, Status, Ansattype, [Ekstern titel], CostCenter, [Arbejdstid timer], Løntrin, Valgfri1, Valgfri2, Valgfri3, Lønartsnummer, [Egen tekst], Beløb, [Rammetrin beløb] " & _
        "FROM tblImport_LøndataVisma"
    DoCmd.SetWarnings True

    ' Hvis alt gik godt, sæt returværdien til True
    DataFromVisma = True

End Function
