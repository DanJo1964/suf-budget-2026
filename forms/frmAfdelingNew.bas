Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    Modal = NotDefault
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    DataEntry = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =14513
    DatasheetFontHeight =11
    ItemSuffix =558
    Left =4830
    Top =3030
    Right =23520
    Bottom =14895
    RecSrcDt = Begin
        0x873124998e39e640
    End
    Caption ="Opret ny afdeling!"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    SplitFormOrientation =1
    SplitFormSize =6413
    SplitFormPrinting =1
    SplitFormOrientation =1
    SplitFormSize =6413
    SplitFormPrinting =1
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
        Begin Image
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
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
            Height =1190
            BackColor =13485442
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    FontItalic = NotDefault
                    BackStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    Left =3000
                    Top =75
                    Width =3930
                    Height =1035
                    FontSize =18
                    FontWeight =700
                    Name ="Auto_hoved0"
                    Caption ="Indtast oplysninger til oprettelse af ny afdeling"
                    FontName ="Calibri Light"
                    GroupTable =3
                    LayoutCachedLeft =3000
                    LayoutCachedTop =75
                    LayoutCachedWidth =6930
                    LayoutCachedHeight =1110
                    LayoutGroup =2
                    ThemeFontIndex =0
                    BackThemeColorIndex =3
                    BackShade =50.0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =3
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =11730
                    Top =450
                    Width =1632
                    Height =648
                    FontWeight =700
                    Name ="btnAddRecord"
                    Caption ="Opret afdeling i kartoteket"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =11730
                    LayoutCachedTop =450
                    LayoutCachedWidth =13362
                    LayoutCachedHeight =1098
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7961551
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =8965045
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeThemeColorIndex =1
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =9599
                    Top =644
                    Width =1425
                    Height =468
                    FontSize =12
                    TabIndex =1
                    Name ="cboYear"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"
                    ColumnWidths ="1440"

                    LayoutCachedLeft =9599
                    LayoutCachedTop =644
                    LayoutCachedWidth =11024
                    LayoutCachedHeight =1112
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =9585
                    Top =165
                    Width =1440
                    Height =405
                    Name ="cboYear_navn"
                    Caption ="Budget år"
                    GroupTable =4
                    VerticalAnchor =1
                    LayoutCachedLeft =9585
                    LayoutCachedTop =165
                    LayoutCachedWidth =11025
                    LayoutCachedHeight =570
                    LayoutGroup =3
                    GroupTable =4
                End
            End
        End
        Begin Section
            Height =5612
            BackColor =14871513
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3255
                    Top =2640
                    Width =3900
                    Height =630
                    ColumnWidth =2232
                    ColumnOrder =4
                    TabIndex =6
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Adresse"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3255
                    LayoutCachedTop =2640
                    LayoutCachedWidth =7155
                    LayoutCachedHeight =3270
                    RowStart =3
                    RowEnd =3
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3255
                    Top =1305
                    Width =3900
                    Height =345
                    ColumnWidth =2955
                    ColumnOrder =1
                    TabIndex =2
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Afdeling"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3255
                    LayoutCachedTop =1305
                    LayoutCachedWidth =7155
                    LayoutCachedHeight =1650
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =3030
                            Top =1305
                            Width =168
                            Height =345
                            ForeColor =2366701
                            Name ="Label492"
                            Caption ="*"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =3030
                            LayoutCachedTop =1305
                            LayoutCachedWidth =3198
                            LayoutCachedHeight =1650
                            RowStart =1
                            RowEnd =1
                            ColumnStart =1
                            ColumnEnd =1
                            LayoutGroup =1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10335
                    Top =1305
                    Width =3780
                    Height =345
                    ColumnWidth =3024
                    ColumnOrder =2
                    TabIndex =3
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Afdelingsleder"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10335
                    LayoutCachedTop =1305
                    LayoutCachedWidth =14115
                    LayoutCachedHeight =1650
                    RowStart =1
                    RowEnd =1
                    ColumnStart =5
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3255
                    Top =1830
                    Width =3900
                    Height =630
                    ColumnWidth =2748
                    ColumnOrder =3
                    TabIndex =4
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="AfdelingsNavn"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3255
                    LayoutCachedTop =1830
                    LayoutCachedWidth =7155
                    LayoutCachedHeight =2460
                    RowStart =2
                    RowEnd =2
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =3030
                            Top =1830
                            Width =168
                            Height =630
                            ForeColor =2366701
                            Name ="Label495"
                            Caption ="*"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =3030
                            LayoutCachedTop =1830
                            LayoutCachedWidth =3198
                            LayoutCachedHeight =2460
                            RowStart =2
                            RowEnd =2
                            ColumnStart =1
                            ColumnEnd =1
                            LayoutGroup =1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3255
                    Top =555
                    Width =3900
                    Height =570
                    ColumnWidth =2625
                    ColumnOrder =0
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="AfdNr Uniconta"
                    BeforeUpdate ="[Event Procedure]"
                    AfterUpdate ="[Event Procedure]"
                    EventProcPrefix ="AfdNr_Uniconta"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3255
                    LayoutCachedTop =555
                    LayoutCachedWidth =7155
                    LayoutCachedHeight =1125
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =3030
                            Top =555
                            Width =168
                            Height =570
                            ForeColor =2366701
                            Name ="Label459"
                            Caption ="*"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =3030
                            LayoutCachedTop =555
                            LayoutCachedWidth =3198
                            LayoutCachedHeight =1125
                            ColumnStart =1
                            ColumnEnd =1
                            LayoutGroup =1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3255
                    Top =3450
                    Width =3900
                    Height =570
                    ColumnWidth =2820
                    ColumnOrder =5
                    TabIndex =9
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="PostBy"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3255
                    LayoutCachedTop =3450
                    LayoutCachedWidth =7155
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3255
                    Top =4200
                    Width =3900
                    Height =885
                    ColumnWidth =3888
                    ColumnOrder =6
                    TabIndex =11
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Tlf_Mail"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3255
                    LayoutCachedTop =4200
                    LayoutCachedWidth =7155
                    LayoutCachedHeight =5085
                    RowStart =5
                    RowEnd =5
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10140
                    Top =4200
                    Width =3975
                    Height =885
                    ColumnWidth =2220
                    ColumnOrder =8
                    TabIndex =12
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="UnicontaFirmanavn"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10140
                    LayoutCachedTop =4200
                    LayoutCachedWidth =14115
                    LayoutCachedHeight =5085
                    RowStart =5
                    RowEnd =5
                    ColumnStart =4
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =7215
                            Top =4200
                            Width =2865
                            Height =885
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label63"
                            Caption ="Uniconta Navn \015\012"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =7215
                            LayoutCachedTop =4200
                            LayoutCachedWidth =10080
                            LayoutCachedHeight =5085
                            RowStart =5
                            RowEnd =5
                            ColumnStart =3
                            ColumnEnd =3
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10335
                    Top =1830
                    Width =3780
                    Height =630
                    ColumnOrder =9
                    TabIndex =5
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Year_"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10335
                    LayoutCachedTop =1830
                    LayoutCachedWidth =14115
                    LayoutCachedHeight =2460
                    RowStart =2
                    RowEnd =2
                    ColumnStart =5
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =10140
                            Top =1830
                            Width =135
                            Height =630
                            ForeColor =2366701
                            Name ="Label458"
                            Caption ="*"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =10140
                            LayoutCachedTop =1830
                            LayoutCachedWidth =10275
                            LayoutCachedHeight =2460
                            RowStart =2
                            RowEnd =2
                            ColumnStart =4
                            ColumnEnd =4
                            LayoutGroup =1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =1
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =10335
                    Top =555
                    Width =3780
                    Height =570
                    TabIndex =1
                    Name ="AfdStatus"
                    RowSourceType ="Value List"
                    RowSource ="112240000;\"Tilbud\";112240001;\"Underafdeling\";112240002;\"Ny\";112240003;\"Dr"
                        "ift\";112240004;\"Lukket\""
                    ColumnWidths ="0"
                    GroupTable =1
                    BottomPadding =150
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22

                    LayoutCachedLeft =10335
                    LayoutCachedTop =555
                    LayoutCachedWidth =14115
                    LayoutCachedHeight =1125
                    ColumnStart =5
                    ColumnEnd =7
                    LayoutGroup =1
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =10140
                            Top =555
                            Width =135
                            Height =570
                            ForeColor =2366701
                            Name ="Label514"
                            Caption ="*"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =10140
                            LayoutCachedTop =555
                            LayoutCachedWidth =10275
                            LayoutCachedHeight =1125
                            ColumnStart =4
                            ColumnEnd =4
                            LayoutGroup =1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10335
                    Top =2640
                    Width =1838
                    Height =630
                    TabIndex =7
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="DatoFra"
                    Format ="Short Date"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10335
                    LayoutCachedTop =2640
                    LayoutCachedWidth =12173
                    LayoutCachedHeight =3270
                    RowStart =3
                    RowEnd =3
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =13245
                    Top =2640
                    Width =870
                    Height =630
                    TabIndex =8
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="OprettetUnicontaNejJa"
                    Format ="Yes/No"
                    DefaultValue ="No"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =13245
                    LayoutCachedTop =2640
                    LayoutCachedWidth =14115
                    LayoutCachedHeight =3270
                    RowStart =3
                    RowEnd =3
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12240
                            Top =2640
                            Width =945
                            Height =630
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label421"
                            Caption ="Opr. i Uniconta"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =12240
                            LayoutCachedTop =2640
                            LayoutCachedWidth =13185
                            LayoutCachedHeight =3270
                            RowStart =3
                            RowEnd =3
                            ColumnStart =6
                            ColumnEnd =6
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10335
                    Top =3450
                    Width =1838
                    Height =570
                    ColumnWidth =1965
                    TabIndex =10
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="UnicontaFirmaID"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10335
                    LayoutCachedTop =3450
                    LayoutCachedWidth =12173
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =345
                    Top =555
                    Width =2625
                    Height =570
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label18"
                    Caption ="Afdelingsnr. generelt og i Uniconta"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =345
                    LayoutCachedTop =555
                    LayoutCachedWidth =2970
                    LayoutCachedHeight =1125
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =345
                    Top =1305
                    Width =2625
                    Height =345
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label9"
                    Caption ="Afdelingsnr. i Visma løn"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =345
                    LayoutCachedTop =1305
                    LayoutCachedWidth =2970
                    LayoutCachedHeight =1650
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =345
                    Top =1830
                    Width =2625
                    Height =630
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label15"
                    Caption ="Afdelingsnavn"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =345
                    LayoutCachedTop =1830
                    LayoutCachedWidth =2970
                    LayoutCachedHeight =2460
                    RowStart =2
                    RowEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =345
                    Top =2640
                    Width =2625
                    Height =630
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label6"
                    Caption ="Adresse"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =345
                    LayoutCachedTop =2640
                    LayoutCachedWidth =2970
                    LayoutCachedHeight =3270
                    RowStart =3
                    RowEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =345
                    Top =3450
                    Width =2625
                    Height =570
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label42"
                    Caption ="Postnummer og By"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =345
                    LayoutCachedTop =3450
                    LayoutCachedWidth =2970
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =345
                    Top =4200
                    Width =2625
                    Height =885
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label57"
                    Caption ="Telefonnr./Mail adresse \015\012(husk skråstreg)"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =345
                    LayoutCachedTop =4200
                    LayoutCachedWidth =2970
                    LayoutCachedHeight =5085
                    RowStart =5
                    RowEnd =5
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =3030
                    Top =2640
                    Width =168
                    Height =630
                    Name ="EmptyCell481"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =3030
                    LayoutCachedTop =2640
                    LayoutCachedWidth =3198
                    LayoutCachedHeight =3270
                    RowStart =3
                    RowEnd =3
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =3030
                    Top =3450
                    Width =168
                    Height =570
                    Name ="EmptyCell482"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =3030
                    LayoutCachedTop =3450
                    LayoutCachedWidth =3198
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =3030
                    Top =4200
                    Width =168
                    Height =885
                    Name ="EmptyCell483"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =3030
                    LayoutCachedTop =4200
                    LayoutCachedWidth =3198
                    LayoutCachedHeight =5085
                    RowStart =5
                    RowEnd =5
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =7215
                    Top =555
                    Width =2865
                    Height =570
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label406"
                    Caption ="Status"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =7215
                    LayoutCachedTop =555
                    LayoutCachedWidth =10080
                    LayoutCachedHeight =1125
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =7215
                    Top =1305
                    Width =2865
                    Height =345
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label12"
                    Caption ="Afdelingsleder"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =7215
                    LayoutCachedTop =1305
                    LayoutCachedWidth =10080
                    LayoutCachedHeight =1650
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =7215
                    Top =1830
                    Width =2865
                    Height =630
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label385"
                    Caption ="Budgetår"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =7215
                    LayoutCachedTop =1830
                    LayoutCachedWidth =10080
                    LayoutCachedHeight =2460
                    RowStart =2
                    RowEnd =2
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =7215
                    Top =2640
                    Width =2865
                    Height =630
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label415"
                    Caption ="DatoFra"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =7215
                    LayoutCachedTop =2640
                    LayoutCachedWidth =10080
                    LayoutCachedHeight =3270
                    RowStart =3
                    RowEnd =3
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =7215
                    Top =3450
                    Width =2865
                    Height =570
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label441"
                    Caption ="Uniconta FirmaID"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =7215
                    LayoutCachedTop =3450
                    LayoutCachedWidth =10080
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =10140
                    Top =1305
                    Width =135
                    Height =345
                    Name ="EmptyCell501"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =10140
                    LayoutCachedTop =1305
                    LayoutCachedWidth =10275
                    LayoutCachedHeight =1650
                    RowStart =1
                    RowEnd =1
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =10140
                    Top =2640
                    Width =135
                    Height =630
                    Name ="EmptyCell503"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =10140
                    LayoutCachedTop =2640
                    LayoutCachedWidth =10275
                    LayoutCachedHeight =3270
                    RowStart =3
                    RowEnd =3
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =10140
                    Top =3450
                    Width =135
                    Height =570
                    Name ="EmptyCell504"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =10140
                    LayoutCachedTop =3450
                    LayoutCachedWidth =10275
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =12240
                    Top =3450
                    Width =945
                    Height =570
                    Name ="EmptyCell552"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =12240
                    LayoutCachedTop =3450
                    LayoutCachedWidth =13185
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =13245
                    Top =3450
                    Width =870
                    Height =570
                    Name ="EmptyCell553"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =13245
                    LayoutCachedTop =3450
                    LayoutCachedWidth =14115
                    LayoutCachedHeight =4020
                    RowStart =4
                    RowEnd =4
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =1
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
CodeBehindForm
' See "frmAfdelingNew.cls"
