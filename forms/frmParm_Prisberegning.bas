Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    PictureType =2
    GridY =10
    Width =9381
    DatasheetFontHeight =11
    ItemSuffix =40
    Right =24030
    Bottom =11865
    RecSrcDt = Begin
        0x93d47ed24f57e640
    End
    RecordSource ="tblParm_Prisberegning"
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
                    Left =170
                    Width =6810
                    Height =315
                    Name ="Label36"
                    Caption ="Tekst"
                    LayoutCachedLeft =170
                    LayoutCachedWidth =6980
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =3
                    Left =6968
                    Width =1980
                    Height =315
                    Name ="Label37"
                    Caption ="Antal dage"
                    LayoutCachedLeft =6968
                    LayoutCachedWidth =8948
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
                    Left =4762
                    Height =315
                    TabIndex =3
                    Name ="UserModified"
                    ControlSource ="UserModified"

                    LayoutCachedLeft =4762
                    LayoutCachedWidth =6463
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2211
                    Height =315
                    TabIndex =2
                    Name ="DateModified"
                    ControlSource ="DateModified"

                    LayoutCachedLeft =2211
                    LayoutCachedWidth =3912
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =170
                    Width =6771
                    Height =315
                    Name ="Navn"
                    ControlSource ="Tekst"

                    LayoutCachedLeft =170
                    LayoutCachedWidth =6941
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    DecimalPlaces =1
                    OldBorderStyle =0
                    OverlapFlags =247
                    TextAlign =3
                    IMESentenceMode =3
                    Left =6930
                    Width =2061
                    Height =315
                    TabIndex =1
                    Name ="Dage"
                    ControlSource ="Dage"
                    Format ="Standard"
                    ConditionalFormat = Begin
                        0x010000009a000000010000000100000000000000000000001c00000001000000 ,
                        0x00000000fff20000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x490073004e0075006c006c0028005b0044006100740065004d006f0064006900 ,
                        0x66006900650064005d0029003d00540072007500650000000000
                    End

                    LayoutCachedLeft =6930
                    LayoutCachedWidth =8991
                    LayoutCachedHeight =315
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000100000000000000fff200001b0000004900 ,
                        0x73004e0075006c006c0028005b0044006100740065004d006f00640069006600 ,
                        0x6900650064005d0029003d005400720075006500000000000000000000000000 ,
                        0x000000000000000000
                    End
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
' See "frmParm_Prisberegning.cls"
