Version =20
VersionRequired =20
Begin Form
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
    Width =29197
    DatasheetFontHeight =11
    ItemSuffix =248
    Left =-12165
    Top =2970
    Right =16365
    Bottom =14940
    Filter ="[Year_] = 2026 AND Afdeling = '60_ØSTERGADE'"
    Picture ="OutlookSearchMagnifyingGlassHS"
    RecSrcDt = Begin
        0x2da99eed2f07e640
    End
    RecordSource ="tblTmpMedarbejder"
    Caption ="frmTmpAfdMedarbejdBudget"
    OnCurrent ="[Event Procedure]"
    BeforeInsert ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    OnDataChange ="[Event Procedure]"
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
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =1418
                    Height =315
                    ColumnWidth =3000
                    Name ="Fornavn"
                    ControlSource ="Fornavn"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedWidth =1418
                    LayoutCachedHeight =315
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1425
                    Width =2155
                    Height =315
                    TabIndex =1
                    Name ="Efternavn"
                    ControlSource ="Efternavn"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =1425
                    LayoutCachedWidth =3580
                    LayoutCachedHeight =315
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3585
                    Width =2190
                    Height =315
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="Ekstern titel"
                    ControlSource ="Ekstern titel"
                    EventProcPrefix ="Ekstern_titel"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =3585
                    LayoutCachedWidth =5775
                    LayoutCachedHeight =315
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    ScrollBars =2
                    OverlapFlags =93
                    TextAlign =1
                    IMESentenceMode =3
                    Left =11520
                    Width =1425
                    Height =315
                    ColumnWidth =3000
                    TabIndex =7
                    Name ="DatoFra"
                    ControlSource ="DatoFra"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =11520
                    LayoutCachedWidth =12945
                    LayoutCachedHeight =315
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =12945
                    Width =1425
                    Height =315
                    ColumnWidth =1620
                    TabIndex =8
                    Name ="DatoTil"
                    ControlSource ="DatoTil"
                    Format ="Short Date"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =12945
                    LayoutCachedWidth =14370
                    LayoutCachedHeight =315
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =93
                    TextAlign =3
                    IMESentenceMode =3
                    Left =17250
                    Width =1440
                    Height =315
                    ColumnWidth =3000
                    TabIndex =11
                    Name ="Normtid"
                    ControlSource ="Normtid"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =17250
                    LayoutCachedWidth =18690
                    LayoutCachedHeight =315
                    ColumnStart =11
                    ColumnEnd =11
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =93
                    TextAlign =3
                    IMESentenceMode =3
                    Left =20130
                    Width =1710
                    Height =315
                    ColumnWidth =3000
                    TabIndex =13
                    Name ="Beløb"
                    ControlSource ="Beløb"
                    Format ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =20130
                    LayoutCachedWidth =21840
                    LayoutCachedHeight =315
                    ColumnStart =13
                    ColumnEnd =13
                    LayoutGroup =1
                    GroupTable =2
                    CurrencySymbol ="kr."
                End
                Begin ComboBox
                    OverlapFlags =87
                    TextAlign =2
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2505
                    Left =18690
                    Width =1440
                    Height =315
                    TabIndex =12
                    Name ="cboLønart"
                    ControlSource ="Lønart"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [tblLønarter].Lønartsnummer, [tblLønarter].Løntekst FROM tblLønarter ORDE"
                        "R BY [Lønartsnummer]; "
                    ColumnWidths ="1066;1441"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =18690
                    LayoutCachedWidth =20130
                    LayoutCachedHeight =315
                    ColumnStart =12
                    ColumnEnd =12
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin ComboBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =14370
                    Width =1440
                    Height =315
                    TabIndex =9
                    Name ="cboLøntrin"
                    ControlSource ="Løntrin"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [tblLøntrin].Løntrin FROM tblLøntrin ORDER BY [Løntrin]; "
                    ColumnWidths ="1441"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =14370
                    LayoutCachedWidth =15810
                    LayoutCachedHeight =315
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5775
                    Width =1425
                    Height =315
                    TabIndex =3
                    Name ="StatusDato"
                    ControlSource ="StatusDato"
                    Format ="Short Date"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =5775
                    LayoutCachedWidth =7200
                    LayoutCachedHeight =315
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =93
                    TextAlign =3
                    IMESentenceMode =3
                    Left =23280
                    Width =1695
                    Height =315
                    TabIndex =15
                    Name ="BeløbBudget"
                    ControlSource ="BeløbBudget"
                    Format ="#,##0.00\" kr.\";-#,##0.00\" kr.\""
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =23280
                    LayoutCachedWidth =24975
                    LayoutCachedHeight =315
                    ColumnStart =15
                    ColumnEnd =15
                    LayoutGroup =1
                    GroupTable =2
                    CurrencySymbol ="kr."
                End
                Begin ComboBox
                    OverlapFlags =87
                    TextAlign =1
                    IMESentenceMode =3
                    Left =21840
                    Width =1440
                    Height =315
                    TabIndex =14
                    Name ="LøntrinBudget"
                    ControlSource ="LøntrinBudget"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [tblLøntrin].Løntrin FROM tblLøntrin; "
                    ColumnWidths ="567;2268"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =21840
                    LayoutCachedWidth =23280
                    LayoutCachedHeight =315
                    ColumnStart =14
                    ColumnEnd =14
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =2
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =24975
                    Width =1785
                    Height =315
                    TabIndex =16
                    Name ="TotalBeløbBudgetDÅ"
                    ControlSource ="TotalBeløbBudgetDÅ"
                    Format ="Standard"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =24975
                    LayoutCachedWidth =26760
                    LayoutCachedHeight =315
                    ColumnStart =16
                    ColumnEnd =16
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =87
                    TextAlign =1
                    IMESentenceMode =3
                    Left =26760
                    Width =105
                    Height =315
                    TabIndex =17
                    Name ="TotalNormtidDÅ"
                    ControlSource ="TotalNormtidDÅ"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =26760
                    LayoutCachedWidth =26865
                    LayoutCachedHeight =315
                    ColumnStart =17
                    ColumnEnd =17
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =7200
                    Width =1440
                    Height =315
                    TabIndex =4
                    Name ="Valgfri1"
                    ControlSource ="Valgfri1"
                    RowSourceType ="Value List"
                    RowSource ="ADM/TEKNIK;BORGERREL;LEDER"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =7200
                    LayoutCachedWidth =8640
                    LayoutCachedHeight =315
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =2
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =95
                    TextAlign =1
                    IMESentenceMode =3
                    Left =8640
                    Width =1440
                    Height =315
                    TabIndex =5
                    Name ="Valgfri2"
                    ControlSource ="Valgfri2"
                    RowSourceType ="Value List"
                    RowSource ="\"ADM/TEKNIK\";\"BREMERH09\";\"HR/LØN\";\"LEDER\";\"Mangler\";\"MOSEVEJ\""
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =8640
                    LayoutCachedWidth =10080
                    LayoutCachedHeight =315
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =2
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =87
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10080
                    Width =1440
                    Height =315
                    TabIndex =6
                    Name ="Valgfri3"
                    ControlSource ="Valgfri3"
                    RowSourceType ="Value List"
                    RowSource ="\"ADM/TEKNIK\";\"Faglært\";\"LEDER\";\"Mangler\";\"Ufaglært\""
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =10080
                    LayoutCachedWidth =11520
                    LayoutCachedHeight =315
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =2
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =27496
                    Width =219
                    Height =288
                    TabIndex =18
                    Name ="Revision"
                    ControlSource ="Revision"

                    LayoutCachedLeft =27496
                    LayoutCachedWidth =27715
                    LayoutCachedHeight =288
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =87
                    TextAlign =3
                    IMESentenceMode =3
                    Left =15810
                    Width =1440
                    Height =315
                    TabIndex =10
                    Name ="NormtidPrUge"
                    ControlSource ="NormtidPrUge"
                    Format ="Standard"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0

                    LayoutCachedLeft =15810
                    LayoutCachedWidth =17250
                    LayoutCachedHeight =315
                    ColumnStart =10
                    ColumnEnd =10
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =27269
                    Width =111
                    Height =315
                    TabIndex =19
                    Name ="BeløbManuel"
                    ControlSource ="BeløbManuel"

                    LayoutCachedLeft =27269
                    LayoutCachedWidth =27380
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =27212
                    Width =51
                    Height =315
                    TabIndex =20
                    Name ="Tilfoej9900"
                    ControlSource ="Tilfoej9900"

                    LayoutCachedLeft =27212
                    LayoutCachedWidth =27263
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
' See "frmTmpAfdMedarbejdBudget.cls"
