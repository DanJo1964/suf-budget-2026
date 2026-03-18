Attribute VB_Name = "Functions to test"
Option Compare Database

Sub RenameTables()
    Dim tdf As TableDef
    Dim newName As String
    Dim i As Integer

    For Each tdf In CurrentDb.TableDefs

        If Left(tdf.Name, 4) <> "MSys" And Left(tdf.Name, 4) <> "USys" And Left(tdf.Name, 1) = "_" Then  ' Exclude system tables

                newName = Mid(tdf.Name, 2, 99)

                DoCmd.Rename newName, acTable, tdf.Name

        End If

    Next tdf
'
End Sub
