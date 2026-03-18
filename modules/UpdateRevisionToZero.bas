Attribute VB_Name = "UpdateRevisionToZero"
Option Compare Database
Option Explicit
Sub testStatusBar()
  ' Sæt statuslinjen tilbage
    PutStatusBarBack

 Application.Echo False, "Meddelelse til statusbar..."

     ' Sæt statuslinjen tilbage til normal.
    PutStatusBarBack

End Sub
Function PutStatusBarBack()
    Dim RetVal As Variant
    On Error GoTo ErrHandler

    ' Sæt statuslinjen tilbage til normal.
    RetVal = SysCmd(5) ' Jeg er ikke sikker på, om jeg har brug for dette.
    Application.Echo True, ""

    On Error GoTo 0
    Exit Function

ErrHandler:
    ' Vis fejlnummeret og fejlteksten.
    MsgBox "Fejl # " & Err & " : " & Error(Err)

    ' Sæt statuslinjen tilbage til normal.
    RetVal = SysCmd(5) ' Jeg er ikke sikker på, om jeg har brug for dette.
    Application.Echo True, ""
End Function
