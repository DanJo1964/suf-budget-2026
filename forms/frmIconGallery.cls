Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

'--- Galleri parametre ---
Private Const CELL_SIZE As Long = 32     ' ikonstørrelse i px
Private Const PADDING As Long = 12       ' afstand i px
Private Const COLS As Long = 12          ' antal kolonner
Private Const MAX_ICONS As Long = 1024   ' sikkerhedsloft

'--- Tilstand ---
Private mFilePath As String
Private mIconCount As Long
Private mCols As Long, mRows As Long
Private mLoaded As Boolean

Private Sub cmdLoad_Click()
    Dim fd As FileDialog
    Dim f As Variant
    Dim cnt As Long

    Set fd = Application.FileDialog(msoFileDialogFilePicker)
    With fd
        .title = "Vælg DLL/EXE med ikoner"
        .AllowMultiSelect = False
        .Filters.Clear
        .Filters.Add "DLL/EXE/ICO", "*.dll;*.exe;*.ico"
        If .Show <> -1 Then Exit Sub
        f = .SelectedItems(1)
    End With

    mFilePath = CStr(f)
    cnt = CountIcons(mFilePath)
    If cnt <= 0 Then
        MsgBox "Ingen ikoner fundet i:" & vbCrLf & mFilePath, vbExclamation
        Exit Sub
    End If
    If cnt > MAX_ICONS Then cnt = MAX_ICONS

    mIconCount = cnt
    mCols = COLS
    mRows = (cnt + mCols - 1) \ mCols

    ' Skriv info
    Me.txtFile = mFilePath
    Me.txtInfo = mIconCount & " ikoner • " & mCols & " kolonner • " & mRows & " rækker"

    DrawGallery
    mLoaded = True
End Sub

Private Sub DrawGallery()
    Dim hScrDC As LongPtr, hMemDC As LongPtr
    Dim hBmp As LongPtr, hBmpPrev As LongPtr
    Dim pxW As Long, pxH As Long
    Dim idx As Long, r As Long, c As Long
    Dim x As Long, y As Long
    Dim hIco As LongPtr
    Dim pic As StdPicture

    ' Beregn samlet bitmap-størrelse i pixels
    pxW = mCols * (CELL_SIZE + PADDING) + PADDING
    pxH = mRows * (CELL_SIZE + PADDING) + PADDING

    ' 1) Lav offscreen bitmap (memory DC)
    hScrDC = GetDC(Me.hwnd)
    hMemDC = CreateCompatibleDC(hScrDC)
    hBmp = CreateCompatibleBitmap(hScrDC, pxW, pxH)
    hBmpPrev = SelectObject(hMemDC, hBmp)

    ' 2) Tegn alle ikoner i bitmappen
    For idx = 0 To mIconCount - 1
        r = idx \ mCols
        c = idx Mod mCols
        x = PADDING + c * (CELL_SIZE + PADDING)
        y = PADDING + r * (CELL_SIZE + PADDING)

        hIco = GetIconHandleEx(mFilePath, idx, True)
        If hIco <> 0 Then
            DrawIconToDC hMemDC, x, y, hIco, CELL_SIZE
            DestroyIcon hIco
        End If
    Next idx

    ' 3) Konverter HBITMAP -> StdPicture og vis den i Image-kontrollen
    Set pic = CreateStdPictureFromHBitmap(hBmp)
    Me.imgCanvas.Picture = pic

    'Set Me.imgCanvas.Picture = pic


    ' 4) Oprydning (StdPicture ejer hBmp, så vi må ikke DeleteObject hBmp)
    Call SelectObject(hMemDC, hBmpPrev)
    Call DeleteDC(hMemDC)
    Call ReleaseDC(Me.hwnd, hScrDC)

    ' Tilpas billedkontrollens størrelse til bitmap (twips)
    Me.imgCanvas.Width = pxW * (1440 / 96)   ' groft: 96 DPI -> 15 twips/px
    Me.imgCanvas.Height = pxH * (1440 / 96)

    Me.Repaint
End Sub

Private Sub imgCanvas_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Not mLoaded Then Exit Sub

    ' twips ? px
    Dim pxX As Long, pxY As Long
    pxX = CLng(x / 15)
    pxY = CLng(y / 15)

    Dim col As Long, row As Long, idx As Long
    col = (pxX - PADDING) \ (CELL_SIZE + PADDING)
    row = (pxY - PADDING) \ (CELL_SIZE + PADDING)
    idx = row * mCols + col

    If idx >= 0 And idx < mIconCount Then
        Me.txtInfo = "Valgt ikon #" & idx & "  •  " & mFilePath
    End If
End Sub
