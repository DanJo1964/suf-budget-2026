Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    FilterOn = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    PictureType =2
    GridY =10
    Width =14740
    DatasheetFontHeight =11
    ItemSuffix =42
    Left =765
    Top =2925
    Right =15330
    Bottom =12555
    Filter ="[BudgetYear] = 2025"
    RecSrcDt = Begin
        0xfbeb29e1eb07e640
    End
    OnDirty ="[Event Procedure]"
    RecordSource ="tblParm_ProcentSatser"
    Caption ="Pct Satser Uden Konto"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =255
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
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
            Height =315
            BackColor =7616884
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    Width =1710
                    Height =315
                    Name ="Label35"
                    Caption ="ID"
                    LayoutCachedWidth =1710
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =2495
                    Width =4320
                    Height =315
                    Name ="Label36"
                    Caption ="Tekst"
                    LayoutCachedLeft =2495
                    LayoutCachedWidth =6815
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =7485
                    Width =1710
                    Height =315
                    Name ="Label37"
                    Caption ="Procent"
                    LayoutCachedLeft =7485
                    LayoutCachedWidth =9195
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =9524
                    Width =1710
                    Height =315
                    Name ="Label41"
                    Caption ="Xtra kommentar"
                    LayoutCachedLeft =9524
                    LayoutCachedWidth =11234
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            Height =315
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =4932
                    Height =315
                    TabIndex =4
                    Name ="UserModified"
                    ControlSource ="UserModified"

                    LayoutCachedLeft =4932
                    LayoutCachedWidth =6633
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2381
                    Height =315
                    TabIndex =3
                    Name ="DateModified"
                    ControlSource ="DateModified"

                    LayoutCachedLeft =2381
                    LayoutCachedWidth =4082
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Width =2496
                    Height =315
                    Name ="Konto"
                    ControlSource ="Konto"

                    LayoutCachedWidth =2496
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =2495
                    Width =4836
                    Height =315
                    TabIndex =1
                    Name ="Navn"
                    ControlSource ="Navn"

                    LayoutCachedLeft =2495
                    LayoutCachedWidth =7331
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    OverlapFlags =255
                    TextAlign =3
                    IMESentenceMode =3
                    Left =7320
                    Width =2226
                    Height =315
                    TabIndex =2
                    Name ="Beløb"
                    ControlSource ="Procent"
                    Format ="Percent"
                    ConditionalFormat = Begin
                        0x010000009a000000010000000100000000000000000000001c00000001000000 ,
                        0x00000000fff20000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x490073004e0075006c006c0028005b0044006100740065004d006f0064006900 ,
                        0x66006900650064005d0029003d00540072007500650000000000
                    End

                    LayoutCachedLeft =7320
                    LayoutCachedWidth =9546
                    LayoutCachedHeight =315
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000fff200001b0000004900 ,
                        0x73004e0075006c006c0028005b0044006100740065004d006f00640069006600 ,
                        0x6900650064005d0029003d005400720075006500000000000000000000000000 ,
                        0x000000000000000000
                    End
                End
                Begin TextBox
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =9524
                    Width =5166
                    Height =315
                    TabIndex =5
                    Name ="Kommentar2"
                    ControlSource ="Kommentar2"

                    LayoutCachedLeft =9524
                    LayoutCachedWidth =14690
                    LayoutCachedHeight =315
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="Formularfod"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "frmParm_PctUdenKonti.cls"
