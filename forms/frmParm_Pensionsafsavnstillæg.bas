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
    Width =13662
    DatasheetFontHeight =11
    ItemSuffix =42
    Left =735
    Top =2940
    Right =14700
    Bottom =12450
    Filter ="[BudgetYear] = 2025"
    RecSrcDt = Begin
        0x059ec92bd507e640
    End
    OnDirty ="[Event Procedure]"
    RecordSource ="tblParm_Pensionsafsavnstillæg"
    Caption ="Timeløn"
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
                    OverlapFlags =93
                    Width =1710
                    Height =315
                    Name ="Label35"
                    Caption ="Løntrin"
                    LayoutCachedWidth =1710
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =223
                    Left =1700
                    Width =5115
                    Height =315
                    Name ="Label36"
                    Caption ="Tekst"
                    LayoutCachedLeft =1700
                    LayoutCachedWidth =6815
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =3
                    Left =6803
                    Width =1710
                    Height =315
                    Name ="Label37"
                    Caption ="Beløb"
                    LayoutCachedLeft =6803
                    LayoutCachedWidth =8513
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =9467
                    Width =1710
                    Height =315
                    Name ="Label41"
                    Caption ="Xtra kommentar"
                    LayoutCachedLeft =9467
                    LayoutCachedWidth =11177
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
                    Left =4648
                    Height =315
                    TabIndex =4
                    Name ="UserModified"
                    ControlSource ="UserModified"

                    LayoutCachedLeft =4648
                    LayoutCachedWidth =6349
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2324
                    Height =315
                    TabIndex =3
                    Name ="DateModified"
                    ControlSource ="DateModified"

                    LayoutCachedLeft =2324
                    LayoutCachedWidth =4025
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =93
                    IMESentenceMode =3
                    Height =315
                    Name ="Konto"
                    ControlSource ="Konto"

                    LayoutCachedWidth =1701
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =1700
                    Width =5631
                    Height =315
                    TabIndex =1
                    Name ="Navn"
                    ControlSource ="Navn"

                    LayoutCachedLeft =1700
                    LayoutCachedWidth =7331
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    DecimalPlaces =2
                    OldBorderStyle =0
                    OverlapFlags =247
                    TextAlign =3
                    IMESentenceMode =3
                    Left =7320
                    Width =2121
                    Height =315
                    TabIndex =2
                    Name ="Beløb"
                    ControlSource ="Beløb"
                    Format ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
                    ConditionalFormat = Begin
                        0x010000009a000000010000000100000000000000000000001c00000001000000 ,
                        0x00000000fff20000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x490073004e0075006c006c0028005b0044006100740065004d006f0064006900 ,
                        0x66006900650064005d0029003d00540072007500650000000000
                    End

                    LayoutCachedLeft =7320
                    LayoutCachedWidth =9441
                    LayoutCachedHeight =315
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000fff200001b0000004900 ,
                        0x73004e0075006c006c0028005b0044006100740065004d006f00640069006600 ,
                        0x6900650064005d0029003d005400720075006500000000000000000000000000 ,
                        0x000000000000000000
                    End
                    CurrencySymbol ="kr."
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =9467
                    Width =4116
                    Height =315
                    TabIndex =5
                    Name ="Kommentar2"
                    ControlSource ="Kommentar2"

                    LayoutCachedLeft =9467
                    LayoutCachedWidth =13583
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
' See "frmParm_Pensionsafsavnstillæg.cls"
