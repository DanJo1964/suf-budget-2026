Attribute VB_Name = "Functions for Windows API screen"
Option Compare Database
Option Explicit

' API declarations

    Public Declare PtrSafe Function GetWindowRect Lib "user32" (ByVal hwnd As LongPtr, lpRect As RECT) As Long
    Public Declare PtrSafe Function MonitorFromWindow Lib "user32" (ByVal hwnd As LongPtr, ByVal dwFlags As Long) As LongPtr
    Public Declare PtrSafe Function GetMonitorInfo Lib "user32" Alias "GetMonitorInfoA" (ByVal hMonitor As LongPtr, lpmi As MONITORINFO) As Long
    Public Declare PtrSafe Function GetDC Lib "user32" (ByVal hwnd As LongPtr) As LongPtr
    Public Declare PtrSafe Function ReleaseDC Lib "user32" (ByVal hwnd As LongPtr, ByVal hdc As LongPtr) As Long
    Public Declare PtrSafe Function GetDeviceCaps Lib "gdi32" (ByVal hdc As LongPtr, ByVal nIndex As Long) As Long

' Constants
Public Const MONITOR_DEFAULTTONEAREST = &H2
Public Const LOGPIXELSX = 88   ' Pixels per logical inch along the screen width
Public Const LOGPIXELSY = 90   ' Pixels per logical inch along the screen height

' Type definitions
Public Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Public Type MONITORINFO
    cbSize As Long
    rcMonitor As RECT
    rcWork As RECT
    dwFlags As Long
End Type
Public Function waitFncCenterform()
    Dim hWndAccess As LongPtr
    Dim hMonitor As LongPtr
    Dim mi As MONITORINFO
    Dim lngFormWidth As Long
    Dim lngFormHeight As Long
    Dim lngLeft As Long
    Dim lngTop As Long
    Dim hdc As LongPtr
    Dim dpiX As Long
    Dim dpiY As Long
    Dim twipsPerPixelX As Single
    Dim twipsPerPixelY As Single

    ' Get the hWnd of the Access application window
    hWndAccess = Application.hWndAccessApp

    ' Get the monitor handle for the Access application window
    hMonitor = MonitorFromWindow(hWndAccess, MONITOR_DEFAULTTONEAREST)

    ' Prepare the MONITORINFO structure
    mi.cbSize = LenB(mi)
    GetMonitorInfo hMonitor, mi

    ' Get the DPI settings to calculate twips per pixel
    hdc = GetDC(0)
    dpiX = GetDeviceCaps(hdc, LOGPIXELSX)
    dpiY = GetDeviceCaps(hdc, LOGPIXELSY)
    ReleaseDC 0, hdc

    ' Calculate twips per pixel (1 inch = 1440 twips)
    ' twipsPerPixelX and twipsPerPixelY are Single to hold decimal values
    twipsPerPixelX = 1440 / dpiX
    twipsPerPixelY = 1440 / dpiY

    ' Get monitor work area dimensions in twips (using Singles for precision)
    Dim sngMonitorLeft As Single
    Dim sngMonitorTop As Single
    Dim sngMonitorWidth As Single
    Dim sngMonitorHeight As Single

    sngMonitorLeft = mi.rcWork.Left * twipsPerPixelX
    sngMonitorTop = mi.rcWork.Top * twipsPerPixelY
    sngMonitorWidth = (mi.rcWork.Right - mi.rcWork.Left) * twipsPerPixelX
    sngMonitorHeight = (mi.rcWork.Bottom - mi.rcWork.Top) * twipsPerPixelY

    ' Get form dimensions
'    lngFormWidth = Me.WindowWidth
'    lngFormHeight = Me.WindowHeight

    ' Calculate the position to center the form within the monitor
    ' Use Singles for intermediate calculations
    Dim sngLeft As Single
    Dim sngTop As Single

    sngLeft = sngMonitorLeft + (sngMonitorWidth - lngFormWidth) / 2
    sngTop = sngMonitorTop + (sngMonitorHeight - lngFormHeight) / 2

    ' Convert final positions to Long using CLng for DoCmd.MoveSize
    lngLeft = CLng(sngLeft)
    lngTop = CLng(sngTop)

    ' Move the form to the calculated position
    DoCmd.MoveSize lngLeft, lngTop

End Function
