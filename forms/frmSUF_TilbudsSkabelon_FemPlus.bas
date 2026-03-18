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
    Width =14626
    DatasheetFontHeight =11
    ItemSuffix =16
    Left =1980
    Top =1395
    Right =16905
    Bottom =14445
    Filter ="[AfdU]= '83_SOLISTTILB' AND [Year_]= 2026"
    RecSrcDt = Begin
        0xfc3f391df212e640
    End
    RecordSource ="tblEkstraYdelser"
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
            Height =1133
            BackColor =14871513
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =345
                    Width =1695
                    Height =293
                    FontWeight =700
                    Name ="Post_Label"
                    Caption ="INDTÆGTER"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =345
                    LayoutCachedWidth =2040
                    LayoutCachedHeight =293
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =8503
                    Top =805
                    Width =788
                    Height =303
                    FontWeight =700
                    Name ="Antal årsværk_Label"
                    Caption ="Antal"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Antal_årsværk_Label"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =8503
                    LayoutCachedTop =805
                    LayoutCachedWidth =9291
                    LayoutCachedHeight =1108
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =9297
                    Top =805
                    Width =1155
                    Height =303
                    FontWeight =700
                    Name ="Samhandels-beløb_Label"
                    Caption ="Takst"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Samhandels_beløb_Label"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =9297
                    LayoutCachedTop =805
                    LayoutCachedWidth =10452
                    LayoutCachedHeight =1108
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =10998
                    Top =793
                    Width =780
                    Height =315
                    FontWeight =700
                    Name ="Koncernpart_Label"
                    Caption ="Delsum"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =10998
                    LayoutCachedTop =793
                    LayoutCachedWidth =11778
                    LayoutCachedHeight =1108
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =12755
                    Top =463
                    Width =1830
                    Height =645
                    FontWeight =700
                    Name ="Type af omkostning_Label"
                    Caption ="Forventet belægningspct"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Type_af_omkostning_Label"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =12755
                    LayoutCachedTop =463
                    LayoutCachedWidth =14585
                    LayoutCachedHeight =1108
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =345
                    Top =450
                    Width =5325
                    Height =315
                    FontWeight =700
                    Name ="Label13"
                    Caption ="Indtægter på ydelser godkendt efter SEL"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =345
                    LayoutCachedTop =450
                    LayoutCachedWidth =5670
                    LayoutCachedHeight =765
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =345
                    Top =791
                    Width =5325
                    Height =315
                    FontWeight =700
                    Name ="Label14"
                    Caption ="Takstfinansierede og abonnementsfinansierede ydelser:"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =345
                    LayoutCachedTop =791
                    LayoutCachedWidth =5670
                    LayoutCachedHeight =1106
                End
            End
        End
        Begin Section
            Height =303
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    TextAlign =3
                    IMESentenceMode =3
                    Left =8163
                    Width =1140
                    Height =302
                    ColumnWidth =3000
                    Name ="Antal årsværk"
                    ControlSource ="Antal"
                    EventProcPrefix ="Antal_årsværk"

                    LayoutCachedLeft =8163
                    LayoutCachedWidth =9303
                    LayoutCachedHeight =302
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =340
                    Width =7818
                    Height =303
                    ColumnWidth =3000
                    TabIndex =1
                    Name ="Post"
                    ControlSource ="Indtægter"

                    LayoutCachedLeft =340
                    LayoutCachedWidth =8158
                    LayoutCachedHeight =303
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =9297
                    Width =1140
                    Height =302
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="Samhandels-beløb"
                    ControlSource ="Takst"
                    Format ="Standard"
                    EventProcPrefix ="Samhandels_beløb"

                    LayoutCachedLeft =9297
                    LayoutCachedWidth =10437
                    LayoutCachedHeight =302
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =12982
                    Width =1593
                    Height =303
                    ColumnWidth =3000
                    TabIndex =3
                    Name ="Koncernpart"
                    ControlSource ="BelPct"

                    LayoutCachedLeft =12982
                    LayoutCachedWidth =14575
                    LayoutCachedHeight =303
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    DecimalPlaces =2
                    ScrollBars =2
                    OverlapFlags =247
                    TextAlign =3
                    IMESentenceMode =3
                    Left =10431
                    Width =1767
                    Height =303
                    ColumnWidth =3000
                    TabIndex =4
                    Name ="Type af omkostning"
                    ControlSource ="=[Antal]*[Takst]"
                    Format ="Standard"
                    EventProcPrefix ="Type_af_omkostning"
                    RightPadding =0

                    LayoutCachedLeft =10431
                    LayoutCachedWidth =12198
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
