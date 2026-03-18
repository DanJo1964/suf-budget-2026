Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11520
    DatasheetFontHeight =11
    ItemSuffix =13
    Right =20948
    Bottom =17265
    RecSrcDt = Begin
        0x882b2c06ac12e640
    End
    RecordSource ="tblEkstraYdelser"
    Caption ="frmEkstraYdelser"
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
            Height =1020
            BackColor =14871513
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =93
                    TextAlign =1
                    Left =342
                    Top =684
                    Width =4503
                    Height =293
                    FontWeight =700
                    Name ="Indtægter_Label"
                    Caption ="Indtægter"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =342
                    LayoutCachedTop =684
                    LayoutCachedWidth =4845
                    LayoutCachedHeight =977
                End
                Begin Label
                    OverlapFlags =215
                    TextAlign =3
                    Left =4827
                    Top =684
                    Width =1230
                    Height =293
                    FontWeight =700
                    Name ="Antal_Label"
                    Caption ="Antal"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =4827
                    LayoutCachedTop =684
                    LayoutCachedWidth =6057
                    LayoutCachedHeight =977
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =6915
                    Top =683
                    Width =1380
                    Height =293
                    FontWeight =700
                    Name ="Takst_Label"
                    Caption ="Takst"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =6915
                    LayoutCachedTop =683
                    LayoutCachedWidth =8295
                    LayoutCachedHeight =976
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =10035
                    Top =683
                    Width =1249
                    Height =293
                    FontWeight =700
                    Name ="BelPct_Label"
                    Caption ="BelPct"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =10035
                    LayoutCachedTop =683
                    LayoutCachedWidth =11284
                    LayoutCachedHeight =976
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =8617
                    Top =680
                    Width =1380
                    Height =293
                    FontWeight =700
                    Name ="Label11"
                    Caption ="Delsum"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =8617
                    LayoutCachedTop =680
                    LayoutCachedWidth =9997
                    LayoutCachedHeight =973
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
                    IMESentenceMode =3
                    Left =10056
                    Width =1249
                    Height =302
                    ColumnWidth =3000
                    Name ="BelPct"
                    ControlSource ="BelPct"

                    LayoutCachedLeft =10056
                    LayoutCachedWidth =11305
                    LayoutCachedHeight =302
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =6975
                    Width =1380
                    Height =302
                    ColumnWidth =3000
                    TabIndex =1
                    Name ="Takst"
                    ControlSource ="Takst"

                    LayoutCachedLeft =6975
                    LayoutCachedWidth =8355
                    LayoutCachedHeight =302
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =4841
                    Width =1230
                    Height =302
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="Antal"
                    ControlSource ="Antal"

                    LayoutCachedLeft =4841
                    LayoutCachedWidth =6071
                    LayoutCachedHeight =302
                End
                Begin TextBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =8355
                    Height =303
                    TabIndex =3
                    Name ="Text9"

                    LayoutCachedLeft =8355
                    LayoutCachedWidth =10056
                    LayoutCachedHeight =303
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =338
                    Width =4503
                    Height =303
                    ColumnWidth =3000
                    TabIndex =4
                    Name ="Indtægter"
                    ControlSource ="Indtægter"

                    LayoutCachedLeft =338
                    LayoutCachedWidth =4841
                    LayoutCachedHeight =303
                End
                Begin Label
                    OverlapFlags =85
                    Left =6518
                    Width =158
                    Height =293
                    Name ="Label12"
                    Caption ="á"
                    LayoutCachedLeft =6518
                    LayoutCachedWidth =6676
                    LayoutCachedHeight =293
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
