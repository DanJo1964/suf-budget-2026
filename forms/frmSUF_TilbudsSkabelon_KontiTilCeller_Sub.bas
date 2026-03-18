Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    OrderByOn = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10209
    DatasheetFontHeight =11
    ItemSuffix =9
    Left =405
    Top =1815
    Right =14370
    Bottom =10095
    OrderBy ="[tblKontoPlan_Tilbudsskabelon].[Konto], [tblKontoPlan_Tilbudsskabelon].[Placerin"
        "g], [tblKontoPlan_Tilbudsskabelon].[Beskrivelse]"
    RecSrcDt = Begin
        0x7c911efbeb68e640
    End
    RecordSource ="tblKontoPlan_Tilbudsskabelon"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    NavigationCaption ="Her er Navigation Caption"
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
            Height =1026
            Name ="FormHeader"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    Left =57
                    Top =57
                    Width =6264
                    Height =969
                    FontSize =20
                    Name ="Label8"
                    Caption ="tblKontoPlan_Tilbudsskabelon1"
                    LayoutCachedLeft =57
                    LayoutCachedTop =57
                    LayoutCachedWidth =6321
                    LayoutCachedHeight =1026
                End
            End
        End
        Begin Section
            Height =2553
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
                    Left =2892
                    Top =342
                    Width =7260
                    Height =600
                    ColumnWidth =5895
                    Name ="Beskrivelse"
                    ControlSource ="Beskrivelse"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =342
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =942
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =342
                            Width =2460
                            Height =330
                            Name ="Beskrivelse_Label"
                            Caption ="Beskrivelse"
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2892
                    Top =1026
                    Width =3060
                    Height =330
                    ColumnWidth =1515
                    TabIndex =1
                    Name ="Konto"
                    ControlSource ="Konto"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1026
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =1356
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1026
                            Width =2460
                            Height =330
                            Name ="Konto_Label"
                            Caption ="Konto"
                            LayoutCachedLeft =342
                            LayoutCachedTop =1026
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1356
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1425
                    Width =7260
                    Height =600
                    ColumnWidth =4155
                    TabIndex =2
                    Name ="Områdenavn"
                    ControlSource ="Områdenavn"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1425
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =2025
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1425
                            Width =2460
                            Height =330
                            Name ="Områdenavn_Label"
                            Caption ="Områdenavn"
                            LayoutCachedLeft =342
                            LayoutCachedTop =1425
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1755
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2892
                    Top =2109
                    Width =1410
                    Height =330
                    ColumnWidth =1665
                    TabIndex =3
                    Name ="Placering"
                    ControlSource ="Placering"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2109
                    LayoutCachedWidth =4302
                    LayoutCachedHeight =2439
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2109
                            Width =2460
                            Height =330
                            Name ="Placering_Label"
                            Caption ="Placering"
                            LayoutCachedLeft =342
                            LayoutCachedTop =2109
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2439
                        End
                    End
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
