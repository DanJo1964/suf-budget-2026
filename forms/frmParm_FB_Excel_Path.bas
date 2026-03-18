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
    Width =12869
    DatasheetFontHeight =11
    ItemSuffix =44
    Left =570
    Top =2505
    Right =15765
    Bottom =7455
    RecSrcDt = Begin
        0xb46f502faf40e640
    End
    OnDirty ="[Event Procedure]"
    RecordSource ="tblParm_FB_Excel_Path"
    Caption ="FirmaID"
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
                    Caption ="Beskrivelse"
                    LayoutCachedWidth =1710
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =215
                    Left =1700
                    Width =5115
                    Height =315
                    Name ="Label36"
                    Caption ="Sti til fil"
                    LayoutCachedLeft =1700
                    LayoutCachedWidth =6815
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
                    Left =4195
                    Height =315
                    TabIndex =3
                    Name ="UserModified"
                    ControlSource ="UserModified"

                    LayoutCachedLeft =4195
                    LayoutCachedWidth =5896
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2097
                    Height =315
                    TabIndex =2
                    Name ="DateModified"
                    ControlSource ="DateModified"

                    LayoutCachedLeft =2097
                    LayoutCachedWidth =3798
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OverlapFlags =255
                    IMESentenceMode =3
                    Width =2151
                    Height =315
                    Name ="Konto"
                    ControlSource ="Description"

                    LayoutCachedWidth =2151
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =2150
                    Width =10206
                    Height =315
                    TabIndex =1
                    Name ="Navn"
                    ControlSource ="strPath"

                    LayoutCachedLeft =2150
                    LayoutCachedWidth =12356
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =12420
                    Width =171
                    Height =315
                    TabIndex =4
                    Name ="Text40"
                    ControlSource ="DateModified"

                    LayoutCachedLeft =12420
                    LayoutCachedWidth =12591
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =12647
                    Width =156
                    Height =315
                    TabIndex =5
                    Name ="Text42"
                    ControlSource ="UserModified"

                    LayoutCachedLeft =12647
                    LayoutCachedWidth =12803
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
' See "frmParm_FB_Excel_Path.cls"
