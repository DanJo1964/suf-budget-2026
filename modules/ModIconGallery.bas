Attribute VB_Name = "ModIconGallery"
'=== modIconGallery ===
Option Compare Database
Option Explicit

'--- Windows API ---
Public Declare PtrSafe Function ExtractIconEx Lib "shell32.dll" Alias "ExtractIconExA" ( _
    ByVal lpszFile As String, ByVal nIconIndex As Long, _
    ByRef phiconLarge As LongPtr, ByRef phiconSmall As LongPtr, _
    ByVal nIcons As Long) As Long

Public Declare PtrSafe Function DestroyIcon Lib "user32" ( _
    ByVal hIcon As LongPtr) As Long

Public Declare PtrSafe Function DrawIconEx Lib "user32" ( _
    ByVal hdc As LongPtr, ByVal xLeft As Long, ByVal yTop As Long, _
    ByVal hIcon As LongPtr, ByVal cxWidth As Long, ByVal cyHeight As Long, _
    ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As LongPtr, _
    ByVal diFlags As Long) As Long

' --- GDI til offscreen bitmap ---
Public Declare PtrSafe Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As LongPtr) As LongPtr
Public Declare PtrSafe Function DeleteDC Lib "gdi32" (ByVal hdc As LongPtr) As Long
Public Declare PtrSafe Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As LongPtr, ByVal nWidth As Long, ByVal nHeight As Long) As LongPtr
Public Declare PtrSafe Function SelectObject Lib "gdi32" (ByVal hdc As LongPtr, ByVal hObject As LongPtr) As LongPtr
Public Declare PtrSafe Function DeleteObject Lib "gdi32" (ByVal hObject As LongPtr) As Long

Public Declare PtrSafe Function GetDC Lib "user32" (ByVal hwnd As LongPtr) As LongPtr
Public Declare PtrSafe Function ReleaseDC Lib "user32" (ByVal hwnd As LongPtr, ByVal hdc As LongPtr) As Long
' --- OLE: lav StdPicture af et HBITMAP ---
Private Type GUID
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(0 To 7) As Byte
End Type

Private Type PICTDESC_BITMAP
    cbSizeofStruct As Long
    picType As Long
    hBitmap As LongPtr
    hPalette As LongPtr
    Reserved As Long
End Type

Public Declare PtrSafe Function OleCreatePictureIndirect Lib "olepro32.dll" ( _
    ByRef PicDesc As PICTDESC_BITMAP, _
    ByRef RefIID As GUID, _
    ByVal fPictureOwnsHandle As Long, _
    ByRef IPic As StdPicture) As Long

Public Const PICTYPE_BITMAP As Long = 1&
'--- Konstant ---
Private Const DI_NORMAL As Long = &H3


Private Sub IID_IPicture(ByRef iid As GUID)
    ' {7BF80980-BF32-101A-8BBB-00AA00300CAB}
    With iid
        .Data1 = &H7BF80980
        .Data2 = &HBF32
        .Data3 = &H101A
        .Data4(0) = &H8B: .Data4(1) = &HBB: .Data4(2) = &H0: .Data4(3) = &HAA
        .Data4(4) = &H0: .Data4(5) = &H30: .Data4(6) = &HC: .Data4(7) = &HAB
    End With
End Sub

Public Function CreateStdPictureFromHBitmap(ByVal hBmp As LongPtr) As StdPicture
    Dim pd As PICTDESC_BITMAP, iid As GUID, pic As StdPicture
    pd.cbSizeofStruct = Len(pd)
    pd.picType = PICTYPE_BITMAP
    pd.hBitmap = hBmp
    IID_IPicture iid
    ' fPictureOwnsHandle = True -> StdPicture ejer bitmapten (vi må IKKE DeleteObject hBmp bagefter)
    Call OleCreatePictureIndirect(pd, iid, 1&, pic)
    Set CreateStdPictureFromHBitmap = pic
End Function

'--- Hjælpefunktioner ---
Public Function CountIcons(ByVal filePath As String) As Long
    ' ExtractIconEx med index = -1 returnerer antal ikoner
    CountIcons = ExtractIconEx(filePath, -1, 0, 0, 0&)
End Function

Public Function GetIconHandleEx(ByVal filePath As String, ByVal index As Long, _
                                Optional ByVal large As Boolean = True) As LongPtr
    Dim hLarge As LongPtr, hSmall As LongPtr
    If large Then
        Call ExtractIconEx(filePath, index, hLarge, 0, 1)
        GetIconHandleEx = hLarge
    Else
        Call ExtractIconEx(filePath, index, 0, hSmall, 1)
        GetIconHandleEx = hSmall
    End If
End Function

Public Sub DrawIconToDC(ByVal hdc As LongPtr, ByVal x As Long, ByVal y As Long, _
                        ByVal hIcon As LongPtr, ByVal sizePx As Long)
    Call DrawIconEx(hdc, x, y, hIcon, sizePx, sizePx, 0, 0, DI_NORMAL)
End Sub
