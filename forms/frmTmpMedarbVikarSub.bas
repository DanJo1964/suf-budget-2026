Version =20
VersionRequired =20
Begin Form
    MaxButton = NotDefault
    MinButton = NotDefault
    ControlBox = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =8333
    DatasheetFontHeight =11
    ItemSuffix =9
    Right =18840
    Bottom =11865
    AfterInsert ="[Event Procedure]"
    Filter ="Afdeling = 'BOAS AARHUS_v2' AND Year_ = 2025"
    RecSrcDt = Begin
        0x1a4e8560ce57e640
    End
    RecordSource ="tblTmpMedarbVikar"
    Caption ="tblTmpMedarbVikar"
    OnCurrent ="[Event Procedure]"
    AfterUpdate ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ComboBox
            AddColon = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =0
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =453
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =342
                    Top =57
                    Width =1920
                    Height =330
                    ColumnWidth =3000
                    Name ="Antal"
                    ControlSource ="Antal"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =342
                    LayoutCachedTop =57
                    LayoutCachedWidth =2262
                    LayoutCachedHeight =387
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3690
                    Top =60
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="Beløb"
                    ControlSource ="Beløb"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    OnGotFocus ="[Event Procedure]"

                    LayoutCachedLeft =3690
                    LayoutCachedTop =60
                    LayoutCachedWidth =7350
                    LayoutCachedHeight =390
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7425
                    Top =60
                    Width =276
                    Height =315
                    TabIndex =3
                    Name ="Afdeling"
                    ControlSource ="Afdeling"

                    LayoutCachedLeft =7425
                    LayoutCachedTop =60
                    LayoutCachedWidth =7701
                    LayoutCachedHeight =375
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7822
                    Top =60
                    Width =351
                    Height =315
                    TabIndex =4
                    Name ="Year_"
                    ControlSource ="Year_"

                    LayoutCachedLeft =7822
                    LayoutCachedTop =60
                    LayoutCachedWidth =8173
                    LayoutCachedHeight =375
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =3969
                    Left =2381
                    Top =56
                    Width =1215
                    Height =315
                    TabIndex =1
                    Name ="Løntrin"
                    ControlSource ="Løntrin"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT Navn FROM tblParm_Timeløn WHERE BudgetYear = 2025 ORDER BY Navn; "
                    ColumnWidths ="1701"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =2381
                    LayoutCachedTop =56
                    LayoutCachedWidth =3596
                    LayoutCachedHeight =371
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="FormFooter"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "frmTmpMedarbVikarSub.cls"
