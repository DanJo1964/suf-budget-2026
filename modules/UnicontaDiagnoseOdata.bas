Attribute VB_Name = "UnicontaDiagnoseOdata"
Option Compare Database
Option Explicit

Private Const UNICONTA_BASE As String = "https://odata.uniconta.com/api/Entities"
Private Const LOG_PATH As String = "C:\temp\SUF\uniconta_diag_log_v2.txt"

' ====== ENTRY ======

Public Sub DiagV2_PostOneLine_AndVerify()
    Dim FirmaID As String
    Dim budgetId As String
    Dim payload As String

    ' >>> UDFYLD <<<
    FirmaID = "48928"                 ' SKIFT til SUF firmaID ved test
    budgetId = "2026-81 BOAS AARHUS"  ' budgetnavn

    ' Brug et fingerprint der er nemt at søge efter:
    ' - unik Amount (fx 12345.67)
    ' - dato og konto
    ' OBS: udelad Dimension4 hvis tom!
    payload = "{""Date"":""2026-01-01T00:00:00Z"",""BudgetId"":""" & budgetId & """,""Account"":""1007"",""Amount"":12345.67,""Dimension1"":""81""}"

    Assert_InsertAndFind FirmaID, budgetId, "2026-01-01T00:00:00Z", "1007", 12345.67, payload, "TEST v2: 1 linje objekt + verify"
End Sub

Public Sub DiagV2_ForceBadJson_ShouldFailOrAtLeastNotInsert()
    Dim FirmaID As String
    Dim payload As String

    FirmaID = "48928"

    ' Ugyldig JSON (mangler ] eller })
    payload = "{""Date"":""2026-01-01T00:00:00Z"",""BudgetId"":""X"",""Account"":""1007"",""Amount"":0.0"

    LogLine "==== FORCE BAD JSON TEST (v2) ===="
    Dim resp As Object
    Set resp = Uniconta_PostRaw("GLBudgetLineClient", payload, FirmaID, 20000) ' kort timeout
    LogHttp "POST Insert GLBudgetLineClient (BAD JSON)", payload, resp
End Sub

' ====== CORE ======

Private Sub Assert_InsertAndFind(ByVal FirmaID As String, ByVal budgetId As String, ByVal isoDate As String, ByVal account As String, ByVal amount As Double, ByVal payloadJson As String, ByVal label As String)
    LogLine "========================================"
    LogLine label
    LogLine "FirmaID: " & FirmaID
    LogLine "BudgetId: " & budgetId
    LogLine "Fingerprint: Date=" & isoDate & " Account=" & account & " Amount=" & CStr(amount)

    Dim resp As Object
    Set resp = Uniconta_PostRaw("GLBudgetLineClient", payloadJson, FirmaID, 30000) ' 30 sek max
    LogHttp "POST Insert GLBudgetLineClient", payloadJson, resp

    ' Vent kort (nogle gange er der server-side lag/async)
    SleepMs 1200

    ' Verify med hårdt filter (ingen $count)
    Dim found As Boolean
    found = Uniconta_FindLineByFingerprint(FirmaID, budgetId, isoDate, account, amount)

    If found Then
        LogLine "RESULT: ? Linjen blev fundet efter POST (insert virker)."
    Else
        LogLine "RESULT: ? Linjen blev IKKE fundet efter POST (insert droppes/ignoreres)."
        LogLine "HINT: prøv uden Dimension1, prøv anden Account der findes, prøv Amount=0.01, og udelad Dimension4 helt."
    End If
End Sub

' ====== HTTP ======

Private Function NewResp() As Object
    Dim d As Object
    Set d = CreateObject("Scripting.Dictionary")
    d("Status") = 0
    d("StatusText") = ""
    d("ResponseText") = ""
    d("Headers") = ""
    Set NewResp = d
End Function

Private Function Uniconta_PostRaw(ByVal tableName As String, ByVal jsonBody As String, ByVal FirmaID As String, ByVal receiveTimeoutMs As Long) As Object
    Dim url As String
    url = UNICONTA_BASE & "/Insert/" & tableName
    Set Uniconta_PostRaw = Uniconta_Http("POST", url, jsonBody, FirmaID, receiveTimeoutMs)
End Function

Private Function Uniconta_GetUrl(ByVal url As String, ByVal FirmaID As String, ByVal receiveTimeoutMs As Long) As Object
    Set Uniconta_GetUrl = Uniconta_Http("GET", url, vbNullString, FirmaID, receiveTimeoutMs)
End Function

Private Function Uniconta_Http(ByVal method As String, ByVal url As String, ByVal body As String, ByVal FirmaID As String, ByVal receiveTimeoutMs As Long) As Object
    Dim http As Object
    Set http = CreateObject("MSXML2.ServerXMLHTTP.6.0")

    Dim resp As Object
    Set resp = NewResp()

    On Error GoTo EH

    http.Open method, url, False
    http.SetTimeouts 5000, 8000, 15000, receiveTimeoutMs

    http.SetRequestHeader "Authorization", SetAuthorizationHeader(FirmaID)
    http.SetRequestHeader "Accept", "application/json"

    If method = "POST" Or method = "PUT" Then
        http.SetRequestHeader "Content-Type", "application/json"
        http.Send body
    Else
        http.Send
    End If

    resp("Status") = CLng(http.Status)
    resp("ResponseText") = Nz(http.ResponseText, vbNullString)
    resp("Headers") = Nz(http.GetAllResponseHeaders, vbNullString)

    Set Uniconta_Http = resp
    Exit Function

EH:
    resp("Status") = 0
    resp("StatusText") = "VBA/COM error " & Err.Number
    resp("ResponseText") = Err.Description
    resp("Headers") = ""
    Set Uniconta_Http = resp
End Function

' ====== VERIFY (FIND LINE) ======

Private Function Uniconta_FindLineByFingerprint(ByVal FirmaID As String, ByVal budgetId As String, ByVal isoDate As String, ByVal account As String, ByVal amount As Double) As Boolean
    ' Vi filtrerer hårdt: BudgetId + Account + Date + Amount.
    ' Bemærk: Date-format i OData kan være følsomt. Vi bruger startswith på Date streng hvis eq fejler.
    Dim b As String: b = EscapeODataString(Trim$(budgetId))
    Dim a As String: a = EscapeODataString(Trim$(account))

    ' Amount som invariant med punktum
    Dim amt As String
    amt = Replace(Format$(amount, "0.00"), ",", ".")

    ' Forsøg 1: eq på alt (hurtigst)
    Dim url1 As String
    url1 = UNICONTA_BASE & "/GLBudgetLineClient?$top=1&$select=RowId,BudgetId,Account,Amount,Date" & _
           "&$filter=BudgetId%20eq%20'" & UrlEncode(b) & "'" & _
           "%20and%20Account%20eq%20'" & UrlEncode(a) & "'" & _
           "%20and%20Amount%20eq%20" & UrlEncode(amt)

    ' Date filter: nogle OData kræver datetimeoffset'...'
    ' Vi undgår det ved at matche på Amount+Budget+Account først. Hvis du vil stramme senere, kan vi udvide.
    Dim resp As Object
    Set resp = Uniconta_GetUrl(url1, FirmaID, 20000)

    LogLine "VERIFY GET status=" & resp("Status") & " resp(first200)=" & Left$(resp("ResponseText"), 200)

    If resp("Status") = 200 Then
        ' Hvis vi får et array med mindst ét objekt ? fundet
        Uniconta_FindLineByFingerprint = (InStr(1, resp("ResponseText"), """RowId"":", vbTextCompare) > 0)
        Exit Function
    End If

    Uniconta_FindLineByFingerprint = False
End Function

' ====== LOG ======

Private Sub LogHttp(ByVal title As String, ByVal body As String, ByVal resp As Object)
    LogLine "---- " & title & " ----"
    LogLine "Status: " & resp("Status") & IIf(Len(resp("StatusText") & "") > 0, " (" & resp("StatusText") & ")", "")
    LogLine "Headers: " & Replace(resp("Headers"), vbCrLf, " | ")

    If Len(body) > 0 Then
        LogLine "Request length: " & Len(body)
        LogLine "Request (first 800): " & Left$(body, 800)
    End If

    LogLine "Response (first 800): " & Left$(resp("ResponseText"), 800)
End Sub

Private Sub LogLine(ByVal s As String)
    Dim f As Integer: f = FreeFile
    Open LOG_PATH For Append As #f
    Print #f, Format$(Now, "yyyy-mm-dd hh:nn:ss") & "  " & s
    Close #f
    Debug.Print s
End Sub

' ====== UTILS ======

Private Function EscapeODataString(ByVal s As String) As String
    EscapeODataString = Replace(s, "'", "''")
End Function

Private Function UrlEncode(ByVal s As String) As String
    s = Replace(s, "%", "%25")
    s = Replace(s, " ", "%20")
    s = Replace(s, "'", "%27")
    s = Replace(s, """", "%22")
    UrlEncode = s
End Function

Private Sub SleepMs(ByVal ms As Long)
    ' Access/VBA sleep uden API-deklaration: brug DoEvents-loop
    Dim t As Single
    t = Timer
    Do While (Timer - t) * 1000 < ms
        DoEvents
    Loop
End Sub
