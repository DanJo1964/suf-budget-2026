Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    FilterOn = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =16512
    DatasheetFontHeight =11
    ItemSuffix =13
    Left =1920
    Top =1710
    Right =19035
    Bottom =15015
    Filter ="[AfdU]= '83_SOLISTTILB' AND [Year_]= 2026"
    RecSrcDt = Begin
        0xe2ac4d99aa12e640
    End
    RecordSource ="tblKoncernnote"
    Caption ="frmSUF_TilbudsSkabelon_Koncernnote"
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
        Begin FormHeader
            Height =977
            BackColor =14871513
            Name ="FormHeader"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =342
                    Top =684
                    Width =503
                    Height =293
                    FontWeight =700
                    Name ="Note_Label"
                    Caption ="Note"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =342
                    LayoutCachedTop =684
                    LayoutCachedWidth =845
                    LayoutCachedHeight =977
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =2622
                    Top =684
                    Width =450
                    Height =293
                    FontWeight =700
                    Name ="Post_Label"
                    Caption ="Post"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =2622
                    LayoutCachedTop =684
                    LayoutCachedWidth =3072
                    LayoutCachedHeight =977
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =6296
                    Top =398
                    Width =788
                    Height =563
                    FontWeight =700
                    Name ="Antal årsværk_Label"
                    Caption ="Antal årsværk"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Antal_årsværk_Label"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =6296
                    LayoutCachedTop =398
                    LayoutCachedWidth =7084
                    LayoutCachedHeight =961
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =7246
                    Top =398
                    Width =1155
                    Height =563
                    FontWeight =700
                    Name ="Samhandels-beløb_Label"
                    Caption ="Samhandels-beløb"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Samhandels_beløb_Label"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =7246
                    LayoutCachedTop =398
                    LayoutCachedWidth =8401
                    LayoutCachedHeight =961
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =8904
                    Top =683
                    Width =1185
                    Height =293
                    FontWeight =700
                    Name ="Koncernpart_Label"
                    Caption ="Koncernpart"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =8904
                    LayoutCachedTop =683
                    LayoutCachedWidth =10089
                    LayoutCachedHeight =976
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =12300
                    Top =683
                    Width =1853
                    Height =293
                    FontWeight =700
                    Name ="Type af omkostning_Label"
                    Caption ="Type af omkostning"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Type_af_omkostning_Label"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =12300
                    LayoutCachedTop =683
                    LayoutCachedWidth =14153
                    LayoutCachedHeight =976
                End
            End
        End
        Begin Section
            Height =303
            Name ="Detail"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =338
                    Width =521
                    Height =289
                    ColumnWidth =3000
                    Name ="Note"
                    ControlSource ="Note"

                    LayoutCachedLeft =338
                    LayoutCachedWidth =859
                    LayoutCachedHeight =289
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =908
                    Width =5208
                    Height =289
                    ColumnWidth =3000
                    TabIndex =1
                    Name ="Post"
                    ControlSource ="Post"

                    LayoutCachedLeft =908
                    LayoutCachedWidth =6116
                    LayoutCachedHeight =289
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =6120
                    Width =1140
                    Height =302
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="Antal årsværk"
                    ControlSource ="Antal årsværk"
                    EventProcPrefix ="Antal_årsværk"

                    LayoutCachedLeft =6120
                    LayoutCachedWidth =7260
                    LayoutCachedHeight =302
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =7253
                    Width =1140
                    Height =302
                    ColumnWidth =3000
                    TabIndex =3
                    Name ="Samhandels-beløb"
                    ControlSource ="Samhandels-beløb"
                    EventProcPrefix ="Samhandels_beløb"

                    LayoutCachedLeft =7253
                    LayoutCachedWidth =8393
                    LayoutCachedHeight =302
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =8385
                    Width =2223
                    Height =303
                    ColumnWidth =3000
                    TabIndex =4
                    Name ="Koncernpart"
                    ControlSource ="Koncernpart"

                    LayoutCachedLeft =8385
                    LayoutCachedWidth =10608
                    LayoutCachedHeight =303
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =119
                    IMESentenceMode =3
                    Left =10605
                    Width =5907
                    Height =303
                    ColumnWidth =3000
                    TabIndex =5
                    Name ="Type af omkostning"
                    ControlSource ="Type af omkostning"
                    EventProcPrefix ="Type_af_omkostning"

                    LayoutCachedLeft =10605
                    LayoutCachedWidth =16512
                    LayoutCachedHeight =303
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
