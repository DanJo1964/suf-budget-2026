Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
    Dim mlngInterntBudgetID As Long

Private Sub Beløb_AfterUpdate()

'    DoCmd.Save

    fncSumBeløb

 '   DoCmd.Save

End Sub

Private Sub btnClose_Click()

    Forms("frmSUF_InterntBudget").tbxRegRecID = Null
    Forms("frmSUF_InterntBudget").tbxIBRecId = Null

    DoCmd.Close

End Sub

Private Sub btnSaveExit_Click()
    Dim Response As VbMsgBoxResult
    Dim conn As ADODB.Connection
    Dim rsT As ADODB.Recordset
    Dim strSQL_Insert As String
    Dim strSQL_Update As String
    Dim strSQL_GetID As String
    Dim newRegID As Long

    ' Ask the user for confirmation
    Response = MsgBox("Are you sure you want to save the data?", vbYesNo, "Confirm Save")

    If Response = vbYes Then
        Set conn = New ADODB.Connection
        conn.ConnectionString = fncConnString
        conn.Open

        ' --- START OF KEY CHANGES: THE TWO-STEP APPROACH ---

        ' 1. DEFINE the INSERT statement. Note it no longer has the SELECT part.
        strSQL_Insert = "INSERT INTO tblRegulering (IB_ID, Bemærkning, Beløb) " & _
                        "VALUES (" & mlngInterntBudgetID & ", '" & Me.Bemærkning.value & "', " & Replace(Nz(Me.Beløb.value, 0), ",", ".") & ");"

        ' 2. EXECUTE the insert command. We use dbFailOnError to ensure it stops if there's a problem.
        '    We don't expect a recordset back from this, so we don't assign it to anything.
        On Error GoTo InsertError
        conn.Execute strSQL_Insert, , adExecuteNoRecords
        On Error GoTo 0

        ' 3. DEFINE and EXECUTE a second, simple query to get the new ID.
        '    SCOPE_IDENTITY() is session-specific, so this is safe and will get the ID from the INSERT above.
        strSQL_GetID = "SELECT SCOPE_IDENTITY() AS NewID;"

        Set rsT = New ADODB.Recordset
        rsT.Open strSQL_GetID, conn, adOpenForwardOnly, adLockReadOnly ' Use the simplest cursor possible

        ' --- END OF KEY CHANGES ---

        If Not rsT.EOF Then
            newRegID = rsT!newID
        Else
            ' This part should ideally never be reached if the INSERT succeeded.
            MsgBox "CRITICAL ERROR: The regulation record was created, but its new ID could not be retrieved.", vbCritical
            rsT.Close
            conn.Close
            Set rsT = Nothing
            Set conn = Nothing
            Exit Sub
        End If
        rsT.Close
        Set rsT = Nothing

        ' 4. Pass the newly created ID back to the calling form's hidden textbox
        Forms("frmSUF_InterntBudget").Form.tbxHiddenRegID.value = newRegID

        ' 5. UPDATE the existing record in tblInterntBudget with the new values AND the new ReguleringID
        strSQL_Update = "UPDATE tblInterntBudget SET " & _
                 "Regulering = " & Replace(Nz(Me.Beløb.value, 0), ",", ".") & ", " & _
                 "Kommentarer = '" & Me.Bemærkning.value & "', " & _
                 "BudgetIalt = " & Replace(Nz(Me.Beløb.value, 0), ",", ".") & ", " & _
                 "[_1] = " & Replace(Nz(Me.[_1].value, 0), ",", ".") & ", " & _
                 "[_2] = " & Replace(Nz(Me.[_2].value, 0), ",", ".") & ", " & _
                 "[_3] = " & Replace(Nz(Me.[_3].value, 0), ",", ".") & ", " & _
                 "[_4] = " & Replace(Nz(Me.[_4].value, 0), ",", ".") & ", " & _
                 "[_5] = " & Replace(Nz(Me.[_5].value, 0), ",", ".") & ", " & _
                 "[_6] = " & Replace(Nz(Me.[_6].value, 0), ",", ".") & ", " & _
                 "[_7] = " & Replace(Nz(Me.[_7].value, 0), ",", ".") & ", " & _
                 "[_8] = " & Replace(Nz(Me.[_8].value, 0), ",", ".") & ", " & _
                 "[_9] = " & Replace(Nz(Me.[_9].value, 0), ",", ".") & ", " & _
                 "[_10] = " & Replace(Nz(Me.[_10].value, 0), ",", ".") & ", " & _
                 "[_11] = " & Replace(Nz(Me.[_11].value, 0), ",", ".") & ", " & _
                 "[_12] = " & Replace(Nz(Me.[_12].value, 0), ",", ".") & ", " & _
                 "ReguleringID = " & newRegID & " " & _
                 "WHERE ID = " & mlngInterntBudgetID

        On Error GoTo UpdateError
        conn.Execute strSQL_Update, , adExecuteNoRecords
        On Error GoTo 0

        ' Clean up and close
        conn.Close
        Set conn = Nothing
        DoCmd.Close acForm, Me.Name
    End If

    Exit Sub

InsertError:
    MsgBox "An error occurred while creating the regulation record: " & vbCrLf & Err.Description, vbCritical
    GoTo Cleanup

UpdateError:
    MsgBox "An error occurred while updating the budget record: " & vbCrLf & Err.Description, vbCritical
    GoTo Cleanup

Cleanup:
    If Not rsT Is Nothing Then
        If rsT.State = adStateOpen Then rsT.Close
    End If
    If Not conn Is Nothing Then
        If conn.State = adStateOpen Then conn.Close
    End If
    Set rsT = Nothing
    Set conn = Nothing
End Sub

Private Sub Ctl_1_AfterUpdate()

    fncSumBeløb
End Sub

Private Sub Ctl_10_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_11_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_12_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_2_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_3_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_4_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_5_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_6_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_7_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_8_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Ctl_9_AfterUpdate()
    fncSumBeløb
End Sub

Private Sub Fordeles12_AfterUpdate()

    If Fordeles12.value = True Then

            fncEnableMdr

    Else
            fncEnableBeløb
    End If

End Sub
Private Function fncSumBeløb()
Dim i As Integer
Dim str As String
Dim dbl As Double

    If Me.Fordeles12 = False Then
        Me.Beløb.Enabled = False
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            dbl = dbl + Nz(Me.Controls(str).value, 0)
        Next i

        Me.Beløb = dbl
    Else
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            Me.Controls(str).value = Nz(Me.Beløb / 12, 0)
        Next i

    End If

'    DoCmd.Save acTable, "tblRegulering"


End Function
Private Function fncEnableMdr()
Dim i As Integer
Dim str As String

             For i = 1 To 12
                str = "[_" & CStr(i) & "]"
                Me.Controls(str).value = Null
                Me.Controls(str).Enabled = False
            Next i
            Me.Beløb.Enabled = True
            Me.Beløb.value = Null

End Function
Private Function fncEnableBeløb()
Dim i As Integer
Dim str As String

             For i = 1 To 12
                str = "[_" & CStr(i) & "]"
                Me.Controls(str).value = Null
                Me.Controls(str).Enabled = True
            Next i
            Me.Beløb.Enabled = False
            Me.Beløb.value = Null

End Function
Private Sub Form_Load()
    Dim i As Integer
    Dim j As Boolean
    Dim str As String
    Dim dbl As Double
    Dim conn As ADODB.Connection
    Dim rsT As ADODB.Recordset

    ' --- KEY CHANGES START HERE ---
    ' Check if an ID was passed from the calling form
    If IsNull(Me.OpenArgs) Or Not IsNumeric(Me.OpenArgs) Then
        MsgBox "No budget record ID was provided. The form will now close.", vbCritical
        DoCmd.Close acForm, Me.Name
        Exit Sub
    End If

    ' Store the passed ID in a form-level variable
    mlngInterntBudgetID = Me.OpenArgs
    ' --- KEY CHANGES END HERE ---

    Set conn = New ADODB.Connection
    Set rsT = New ADODB.Recordset

    conn.ConnectionString = fncConnString
    conn.Open

    ' Use the passed ID to get the correct record
    str = "SELECT * FROM tblInterntBudget WHERE ID = " & mlngInterntBudgetID

    rsT.Open str, conn, adOpenDynamic, adLockOptimistic

    ' Check if a matching record exists
    If Not rsT.EOF Then
        ' Populate the fields in the form
        Me.Konto.value = rsT.Fields("Konto").value
        Me.Beløb.value = rsT.Fields("BudgetIalt").value
        dbl = Nz(Round(rsT.Fields("BudgetIalt").value / 12, 0), 0)
        Me.Bemærkning.value = rsT.Fields("Kommentarer").value
        Me.[_1].value = rsT.Fields("_1").value
        Me.[_2].value = rsT.Fields("_2").value
        Me.[_3].value = rsT.Fields("_3").value
        Me.[_4].value = rsT.Fields("_4").value
        Me.[_5].value = rsT.Fields("_5").value
        Me.[_6].value = rsT.Fields("_6").value
        Me.[_7].value = rsT.Fields("_7").value
        Me.[_8].value = rsT.Fields("_8").value
        Me.[_9].value = rsT.Fields("_9").value
        Me.[_10].value = rsT.Fields("_10").value
        Me.[_11].value = rsT.Fields("_11").value
        Me.[_12].value = rsT.Fields("_12").value
    Else
        ' Fallback in case the record was deleted
        MsgBox "Could not find the specified budget record.", vbExclamation
        DoCmd.Close acForm, Me.Name
        Exit Sub
    End If

    rsT.Close

    ' Your existing logic for enabling/disabling fields
    j = True ' Assume true until proven otherwise
    If dbl <> 0 Then
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            If dbl <> Round(Nz(Me.Controls(str).value, 0), 0) Then
                j = False
                Exit For ' No need to check further
            End If
        Next i
    Else
        j = False
    End If

    Me.Fordeles12 = j

    If Me.Fordeles12 = False Then
        Me.Beløb.Enabled = False
        dbl = 0
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            dbl = dbl + Nz(Me.Controls(str).value, 0)
            Me.Controls(str).Enabled = True
        Next i
        Me.Beløb = dbl
    Else
        Me.Beløb.Enabled = True
        For i = 1 To 12
            str = "[_" & CStr(i) & "]"
            Me.Controls(str).Enabled = False
        Next i
    End If

    Me.Fordeles12.SetFocus

    conn.Close
    Set rsT = Nothing
    Set conn = Nothing


End Sub
Function FormatNumberDot(num As Double) As String
    Dim s As String
    s = Format(num, "0.00")
    s = Replace(s, ",", ".")
    FormatNumberDot = s
End Function
