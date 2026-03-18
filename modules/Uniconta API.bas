Attribute VB_Name = "Uniconta API"
Option Compare Database
Option Explicit
Function UnicontaLogin() As String
    Dim objHTTP As Object
    Dim url As String
    Dim strResponse As String
    Dim authToken As String

    ' Set up the API endpoint and credentials
    url = "https://api.uniconta.com/api/login"
    Dim username As String
    Dim password As String
    Dim companyGuid As String

    ' Replace with actual credentials
    username = "dan@consona.biz"
    password = "Phillippa1968"
    companyGuid = "49782"

    ' Create HTTP object
    Set objHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0")

    ' Open HTTP POST request
    objHTTP.Open "POST", url, False

    ' Set the request headers
    objHTTP.SetRequestHeader "Content-Type", "application/json"

    ' Prepare the body for login
    Dim postData As String
    postData = "{""Username"":""" & username & """, ""Password"":""" & password & """, ""CompanyGuid"":""" & companyGuid & """}"

    ' Send the request with the body
    objHTTP.Send postData

    ' Check for success
    If objHTTP.Status = 200 Then
        strResponse = objHTTP.ResponseText
        ' Parse JSON and extract the token
        Dim json As Object
        Set json = JsonConverter.ParseJson(strResponse)
        authToken = json("accessToken")
        UnicontaLogin = authToken
    Else
        MsgBox "Login failed: " & objHTTP.Status & " " & objHTTP.StatusText
        UnicontaLogin = ""
    End If
End Function
Sub TestAPI()
    Call UnicontaLogin
End Sub
