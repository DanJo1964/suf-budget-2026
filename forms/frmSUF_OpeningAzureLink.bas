Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    Modal = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    ControlBox = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =8900
    DatasheetFontHeight =11
    ItemSuffix =10
    Left =5400
    Top =4020
    Right =20535
    Bottom =14715
    RecSrcDt = Begin
        0xeca6a8226b3ce640
    End
    Caption ="Linker til Azure"
    DatasheetFontName ="Calibri"
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
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
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
        Begin Section
            Height =4996
            BackColor =13485442
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    Left =3401
                    Top =113
                    Width =5100
                    Height =1140
                    FontSize =20
                    FontWeight =700
                    ForeColor =255
                    Name ="lblForbinder"
                    Caption ="Forbinder til IT Forum...\015\012...vent venligst..."
                    LayoutCachedLeft =3401
                    LayoutCachedTop =113
                    LayoutCachedWidth =8501
                    LayoutCachedHeight =1253
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =570
                    Top =390
                    Width =2460
                    Height =624
                    Name ="btnAzureRelink"
                    Caption ="Tryk for tilslutning til IT Forum"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =570
                    LayoutCachedTop =390
                    LayoutCachedWidth =3030
                    LayoutCachedHeight =1014
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =566
                    Top =2040
                    Width =2460
                    Height =624
                    TabIndex =1
                    Name ="btnTilslutSandkasse"
                    Caption ="Tryk for tilslutning til SANDKASSEN"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =566
                    LayoutCachedTop =2040
                    LayoutCachedWidth =3026
                    LayoutCachedHeight =2664
                    Gradient =0
                    BackThemeColorIndex =7
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    OverlapFlags =93
                    TextAlign =2
                    Left =3401
                    Top =1700
                    Width =5100
                    Height =1140
                    FontSize =20
                    FontWeight =700
                    Name ="lblSandkasse"
                    Caption ="Forbinder til SANDKASSEN\015\012...vent venligst..."
                    LayoutCachedLeft =3401
                    LayoutCachedTop =1700
                    LayoutCachedWidth =8501
                    LayoutCachedHeight =2840
                    ForeThemeColorIndex =7
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =566
                    Top =3628
                    Width =2460
                    Height =624
                    TabIndex =2
                    Name ="btnTilslutPrisberegning"
                    Caption ="Tryk for tilslutning til SANDKASSE 2"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =566
                    LayoutCachedTop =3628
                    LayoutCachedWidth =3026
                    LayoutCachedHeight =4252
                    Gradient =0
                    BackThemeColorIndex =9
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    OverlapFlags =93
                    TextAlign =2
                    Left =3401
                    Top =3288
                    Width =5100
                    Height =1185
                    FontSize =20
                    FontWeight =700
                    Name ="lblPrisberegning"
                    Caption ="Forbinder til SANDKASSE 2\015\012...vent venligst..."
                    LayoutCachedLeft =3401
                    LayoutCachedTop =3288
                    LayoutCachedWidth =8501
                    LayoutCachedHeight =4473
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =3968
                    Top =3628
                    Width =2460
                    Height =624
                    TabIndex =3
                    Name ="btnUpdPrisberegningDB"
                    Caption ="Opdatér SANDKASSE 2 fra BUDGET driftsdatabase"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =3968
                    LayoutCachedTop =3628
                    LayoutCachedWidth =6428
                    LayoutCachedHeight =4252
                    Gradient =0
                    BackThemeColorIndex =9
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =3968
                    Top =2040
                    Width =2460
                    Height =624
                    TabIndex =4
                    Name ="btnUpdSandkasse"
                    Caption ="Opdatér SANDKASSEN fra BUDGET"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =3968
                    LayoutCachedTop =2040
                    LayoutCachedWidth =6428
                    LayoutCachedHeight =2664
                    Gradient =0
                    BackThemeColorIndex =7
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "frmSUF_OpeningAzureLink.cls"
