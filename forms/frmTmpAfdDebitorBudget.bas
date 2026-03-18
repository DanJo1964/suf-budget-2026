Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    PictureType =2
    GridY =10
    Width =28403
    DatasheetFontHeight =11
    ItemSuffix =177
    Right =19095
    Bottom =11730
    Filter ="[Year_] = 2026 AND Afdeling = '10'"
    RecSrcDt = Begin
        0x2be8a82ef207e640
    End
    RecordSource ="tblTmpDebtor"
    Caption ="frmTmpAfdDebitorBudget"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =0
            BackColor =7616884
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin Section
            Height =315
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =1131
                    Height =315
                    Name ="Konto"
                    ControlSource ="Konto"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedWidth =1131
                    LayoutCachedHeight =315
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =1125
                    Width =2715
                    Height =315
                    TabIndex =1
                    Name ="Kontonavn"
                    ControlSource ="Kontonavn"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =1125
                    LayoutCachedWidth =3840
                    LayoutCachedHeight =315
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =3840
                    Width =2445
                    Height =315
                    TabIndex =2
                    Name ="Adresse 1"
                    ControlSource ="Adresse 1"
                    EventProcPrefix ="Adresse_1"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =3840
                    LayoutCachedWidth =6285
                    LayoutCachedHeight =315
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6285
                    Width =1695
                    Height =315
                    TabIndex =3
                    Name ="Status Dato"
                    ControlSource ="Status Dato"
                    Format ="Short Date"
                    EventProcPrefix ="Status_Dato"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =6285
                    LayoutCachedWidth =7980
                    LayoutCachedHeight =315
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    Enabled = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =93
                    TextAlign =3
                    IMESentenceMode =3
                    Left =11220
                    Width =1695
                    Height =315
                    TabIndex =7
                    Name ="Takst"
                    ControlSource ="Takst"
                    Format ="Standard"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =11220
                    LayoutCachedWidth =12915
                    LayoutCachedHeight =315
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    Enabled = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =12915
                    Width =1695
                    Height =315
                    TabIndex =8
                    Name ="Xtra takst"
                    ControlSource ="Xtra takst"
                    Format ="Standard"
                    EventProcPrefix ="Xtra_takst"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =12915
                    LayoutCachedWidth =14610
                    LayoutCachedHeight =315
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =14610
                    Width =1440
                    Height =315
                    TabIndex =9
                    Name ="FremskrivPct"
                    ControlSource ="FremskrivPct"
                    Format ="Percent"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =14610
                    LayoutCachedWidth =16050
                    LayoutCachedHeight =315
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =16050
                    Width =1470
                    Height =315
                    TabIndex =10
                    Name ="FremskrivBeløb"
                    ControlSource ="FremskrivBeløb"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =16050
                    LayoutCachedWidth =17520
                    LayoutCachedHeight =315
                    ColumnStart =10
                    ColumnEnd =10
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7980
                    Width =1095
                    Height =315
                    TabIndex =4
                    Name ="DatoFra"
                    ControlSource ="DatoFra"
                    Format ="Short Date"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =7980
                    LayoutCachedWidth =9075
                    LayoutCachedHeight =315
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =95
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9075
                    Width =1125
                    Height =315
                    TabIndex =5
                    Name ="DatoTil"
                    ControlSource ="DatoTil"
                    Format ="Short Date"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =9075
                    LayoutCachedWidth =10200
                    LayoutCachedHeight =315
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =93
                    TextAlign =3
                    IMESentenceMode =3
                    Left =22275
                    Width =1770
                    Height =315
                    TabIndex =14
                    Name ="TotalTakstDÅ"
                    ControlSource ="TotalTakstDÅ"
                    Format ="Standard"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =22275
                    LayoutCachedWidth =24045
                    LayoutCachedHeight =315
                    ColumnStart =14
                    ColumnEnd =14
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =93
                    TextAlign =3
                    IMESentenceMode =3
                    Left =19125
                    Height =315
                    TabIndex =12
                    Name ="XtraTakstFremskr"
                    ControlSource ="XtraTakstFremskr"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =19125
                    LayoutCachedWidth =20826
                    LayoutCachedHeight =315
                    ColumnStart =12
                    ColumnEnd =12
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin ComboBox
                    OverlapFlags =87
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10200
                    Width =1020
                    Height =315
                    TabIndex =6
                    Name ="Paragraf"
                    ControlSource ="Paragraf"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT tblParm_ParagrafKonto.Paragraf FROM tblParm_ParagrafKonto ORDER BY tblPar"
                        "m_ParagrafKonto.Paragraf; "
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    AllowValueListEdits =0

                    LayoutCachedLeft =10200
                    LayoutCachedWidth =11220
                    LayoutCachedHeight =315
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    TextAlign =3
                    IMESentenceMode =3
                    Left =24195
                    Width =225
                    Height =288
                    TabIndex =15
                    Name ="Revision"
                    ControlSource ="Revision"

                    LayoutCachedLeft =24195
                    LayoutCachedWidth =24420
                    LayoutCachedHeight =288
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =87
                    TextAlign =3
                    IMESentenceMode =3
                    Left =17520
                    Width =1606
                    Height =315
                    TabIndex =11
                    Name ="Xtra takst (grund)"
                    ControlSource ="Xtra takst (grund)"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    EventProcPrefix ="Xtra_takst__grund_"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =17520
                    LayoutCachedWidth =19126
                    LayoutCachedHeight =315
                    ColumnStart =11
                    ColumnEnd =11
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =87
                    TextAlign =3
                    IMESentenceMode =3
                    Left =20820
                    Width =1461
                    Height =315
                    TabIndex =13
                    Name ="TotalTakstMdr"
                    ControlSource ="TotalTakstMdr"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =20820
                    LayoutCachedWidth =22281
                    LayoutCachedHeight =315
                    ColumnStart =13
                    ColumnEnd =13
                    LayoutGroup =1
                    GroupTable =1
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="Formularfod"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "frmTmpAfdDebitorBudget.cls"
