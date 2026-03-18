Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    BorderStyle =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11338
    DatasheetFontHeight =11
    ItemSuffix =185
    Left =4005
    Top =3030
    Right =23340
    Bottom =14895
    OnUnload ="[Event Procedure]"
    RecSrcDt = Begin
        0xd5d89a7c4e45e640
    End
    Caption ="SUF Budget Modul"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
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
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =850
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            BorderThemeColorIndex =1
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            BorderShade =65.0
            ShowPageHeaderAndPageFooter =1
        End
        Begin Tab
            Width =5103
            Height =3402
            FontSize =11
            FontName ="Calibri Light"
            ThemeFontIndex =0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =3
            BackThemeColorIndex =1
            BackShade =85.0
            BorderLineStyle =0
            BorderThemeColorIndex =2
            BorderTint =60.0
            HoverThemeColorIndex =1
            PressedThemeColorIndex =1
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
            ForeThemeColorIndex =0
            ForeTint =75.0
        End
        Begin Page
            Width =1701
            Height =1701
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =7313
            BackColor =13485442
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =645
                    Top =60
                    Width =7245
                    Height =505
                    FontSize =24
                    FontWeight =700
                    Name ="Auto_hoved0"
                    Caption ="FÆLLESBIDRAG - REAL - PR. MÅNED"
                    GroupTable =1
                    LayoutCachedLeft =645
                    LayoutCachedTop =60
                    LayoutCachedWidth =7890
                    LayoutCachedHeight =565
                    LayoutGroup =1
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =8910
                    Top =1185
                    Width =930
                    Height =390
                    FontSize =12
                    Name ="cboYear"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"
                    ColumnWidths ="1444"
                    ControlTipText ="Vælg det budgetår du ønsker at se!"
                    GroupTable =12

                    LayoutCachedLeft =8910
                    LayoutCachedTop =1185
                    LayoutCachedWidth =9840
                    LayoutCachedHeight =1575
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =8910
                    Top =735
                    Width =930
                    Height =390
                    TopMargin =57
                    Name ="cboYear_navn"
                    Caption ="År"
                    GroupTable =12
                    LayoutCachedLeft =8910
                    LayoutCachedTop =735
                    LayoutCachedWidth =9840
                    LayoutCachedHeight =1125
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6930
                    Top =4455
                    Width =1920
                    Height =675
                    TabIndex =6
                    Name ="btnFBtoExcel"
                    Caption ="Udlæs fællesbidrag opgørelse til Excel"
                    OnClick ="[Event Procedure]"
                    GroupTable =12

                    LayoutCachedLeft =6930
                    LayoutCachedTop =4455
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =5130
                    RowStart =7
                    RowEnd =7
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =10637474
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    BorderColor =9732411
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =12
                    Overlaps =1
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =570
                            Top =4455
                            Width =6300
                            Height =675
                            FontWeight =700
                            TopMargin =57
                            BorderColor =9732411
                            Name ="Label76"
                            Caption ="7. Klik på knappen \"Udlæs fællesbidrag opgørelse til Excel\""
                            GroupTable =12
                            LayoutCachedLeft =570
                            LayoutCachedTop =4455
                            LayoutCachedWidth =6870
                            LayoutCachedHeight =5130
                            RowStart =7
                            RowEnd =7
                            LayoutGroup =3
                            BorderThemeColorIndex =-1
                            BorderTint =100.0
                            ForeThemeColorIndex =1
                            ForeTint =100.0
                            GroupTable =12
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =9900
                    Top =1185
                    Width =885
                    Height =390
                    FontSize =12
                    TabIndex =1
                    Name ="cboMth"
                    RowSourceType ="Value List"
                    RowSource ="1;2;3;4;5;6;7;8;9;10;11;12"
                    ColumnWidths ="1445"
                    ControlTipText ="Vælg det budgetår du ønsker at se!"
                    GroupTable =12

                    LayoutCachedLeft =9900
                    LayoutCachedTop =1185
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =1575
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =9900
                    Top =735
                    Width =885
                    Height =390
                    TopMargin =57
                    Name ="Label13"
                    Caption ="Måned"
                    GroupTable =12
                    LayoutCachedLeft =9900
                    LayoutCachedTop =735
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =1125
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6930
                    Top =5190
                    Width =1920
                    Height =675
                    TabIndex =8
                    Name ="btnExportNormtid"
                    Caption ="Udlæs normtids rapport til Excel"
                    OnClick ="[Event Procedure]"
                    GroupTable =12

                    LayoutCachedLeft =6930
                    LayoutCachedTop =5190
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =5865
                    RowStart =8
                    RowEnd =8
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =10637474
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    BorderColor =9732411
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =12
                    Overlaps =1
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =570
                            Top =5190
                            Width =6300
                            Height =675
                            FontWeight =700
                            TopMargin =57
                            BorderColor =9732411
                            Name ="Label57"
                            Caption ="8. Du kan nu klikke på knappen \"Udlæs normtids rapport til Excel\" - primært ti"
                                "l Carina."
                            GroupTable =12
                            LayoutCachedLeft =570
                            LayoutCachedTop =5190
                            LayoutCachedWidth =6870
                            LayoutCachedHeight =5865
                            RowStart =8
                            RowEnd =8
                            LayoutGroup =3
                            BorderThemeColorIndex =-1
                            BorderTint =100.0
                            ForeThemeColorIndex =1
                            ForeTint =100.0
                            GroupTable =12
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6930
                    Top =2985
                    Width =1920
                    Height =675
                    TabIndex =2
                    Name ="btnImportVisma"
                    Caption ="Indlæs stamkort fra Visma"
                    OnClick ="[Event Procedure]"
                    GroupTable =12

                    LayoutCachedLeft =6930
                    LayoutCachedTop =2985
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =3660
                    RowStart =5
                    RowEnd =5
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =10637474
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    BorderColor =9732411
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =12
                    Overlaps =1
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =570
                            Top =2985
                            Width =6300
                            Height =675
                            FontWeight =700
                            TopMargin =57
                            BorderColor =9732411
                            Name ="Label74"
                            Caption ="5. Klik på knappen \"Indlæs stamkort fra Visma\""
                            GroupTable =12
                            LayoutCachedLeft =570
                            LayoutCachedTop =2985
                            LayoutCachedWidth =6870
                            LayoutCachedHeight =3660
                            RowStart =5
                            RowEnd =5
                            LayoutGroup =3
                            BorderThemeColorIndex =-1
                            BorderTint =100.0
                            ForeThemeColorIndex =1
                            ForeTint =100.0
                            GroupTable =12
                        End
                    End
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    Left =8280
                    Top =165
                    Width =2430
                    Height =510
                    FontSize =18
                    FontWeight =700
                    ForeColor =2366701
                    Name ="lblArbejder"
                    Caption ="Indlæser data..."
                    GroupTable =10
                    LayoutCachedLeft =8280
                    LayoutCachedTop =165
                    LayoutCachedWidth =10710
                    LayoutCachedHeight =675
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =10
                End
                Begin EmptyCell
                    Left =6930
                    Top =2085
                    Width =1920
                    Height =390
                    Name ="EmptyCell49"
                    GroupTable =12
                    LayoutCachedLeft =6930
                    LayoutCachedTop =2085
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =2475
                    RowStart =3
                    RowEnd =3
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin EmptyCell
                    Left =6930
                    Top =2535
                    Width =1920
                    Height =390
                    Name ="EmptyCell52"
                    GroupTable =12
                    LayoutCachedLeft =6930
                    LayoutCachedTop =2535
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =2925
                    RowStart =4
                    RowEnd =4
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =570
                    Top =1185
                    Width =6300
                    Height =390
                    FontWeight =700
                    TopMargin =57
                    BorderColor =9732411
                    Name ="Label63"
                    Caption ="1. Vælg År og Måned i bokse ovenfor"
                    GroupTable =12
                    LayoutCachedLeft =570
                    LayoutCachedTop =1185
                    LayoutCachedWidth =6870
                    LayoutCachedHeight =1575
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =3
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6930
                    Top =3720
                    Width =1920
                    Height =675
                    TabIndex =4
                    Name ="btnImportGLTrans"
                    Caption ="Opdatér data fra Uniconta"
                    OnClick ="[Event Procedure]"
                    GroupTable =12

                    LayoutCachedLeft =6930
                    LayoutCachedTop =3720
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =4395
                    RowStart =6
                    RowEnd =6
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =10637474
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    BorderColor =9732411
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =12
                    Overlaps =1
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =570
                            Top =3720
                            Width =6300
                            Height =675
                            FontWeight =700
                            TopMargin =57
                            BorderColor =9732411
                            Name ="Label60"
                            Caption =" 6. Klik på knappen \"Opdatér data fra Uniconta\""
                            GroupTable =12
                            LayoutCachedLeft =570
                            LayoutCachedTop =3720
                            LayoutCachedWidth =6870
                            LayoutCachedHeight =4395
                            RowStart =6
                            RowEnd =6
                            LayoutGroup =3
                            BorderThemeColorIndex =-1
                            BorderTint =100.0
                            ForeThemeColorIndex =1
                            ForeTint =100.0
                            GroupTable =12
                        End
                    End
                End
                Begin EmptyCell
                    Left =8910
                    Top =2085
                    Width =1875
                    Height =390
                    Name ="EmptyCell83"
                    GroupTable =12
                    LayoutCachedLeft =8910
                    LayoutCachedTop =2085
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =2475
                    RowStart =3
                    RowEnd =3
                    ColumnStart =2
                    ColumnEnd =3
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =8910
                    Top =2535
                    Width =1875
                    Height =390
                    TopMargin =57
                    Name ="Label90"
                    Caption ="Dato og tid for klik"
                    GroupTable =12
                    LayoutCachedLeft =8910
                    LayoutCachedTop =2535
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =2925
                    RowStart =4
                    RowEnd =4
                    ColumnStart =2
                    ColumnEnd =3
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =570
                    Top =2535
                    Width =6300
                    Height =390
                    FontWeight =700
                    TopMargin =57
                    BorderColor =9732411
                    Name ="Label53"
                    Caption ="4. Omdøb til \"Stamkortmmåå.csv\" f.eks. \"Stamkort1124.csv\""
                    GroupTable =12
                    LayoutCachedLeft =570
                    LayoutCachedTop =2535
                    LayoutCachedWidth =6870
                    LayoutCachedHeight =2925
                    RowStart =4
                    RowEnd =4
                    LayoutGroup =3
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =570
                    Top =2085
                    Width =6300
                    Height =390
                    FontWeight =700
                    TopMargin =57
                    BorderColor =9732411
                    Name ="Label50"
                    Caption ="3. Læg filen i mappen C:\\Temp\\SUF\\"
                    GroupTable =12
                    LayoutCachedLeft =570
                    LayoutCachedTop =2085
                    LayoutCachedWidth =6870
                    LayoutCachedHeight =2475
                    RowStart =3
                    RowEnd =3
                    LayoutGroup =3
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin EmptyCell
                    Left =6930
                    Top =1185
                    Width =1920
                    Height =390
                    Name ="EmptyCell133"
                    GroupTable =12
                    LayoutCachedLeft =6930
                    LayoutCachedTop =1185
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =1575
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin EmptyCell
                    Left =6930
                    Top =1635
                    Width =1920
                    Height =390
                    Name ="EmptyCell134"
                    GroupTable =12
                    LayoutCachedLeft =6930
                    LayoutCachedTop =1635
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =2025
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin Label
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =570
                    Top =1635
                    Width =6300
                    Height =390
                    FontWeight =700
                    TopMargin =57
                    BorderColor =9732411
                    Name ="Label47"
                    Caption ="2. Udlæs stamkort fra Visma Løn"
                    GroupTable =12
                    LayoutCachedLeft =570
                    LayoutCachedTop =1635
                    LayoutCachedWidth =6870
                    LayoutCachedHeight =2025
                    RowStart =2
                    RowEnd =2
                    LayoutGroup =3
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin EmptyCell
                    Left =570
                    Top =735
                    Width =6300
                    Height =390
                    Name ="EmptyCell136"
                    GroupTable =12
                    LayoutCachedLeft =570
                    LayoutCachedTop =735
                    LayoutCachedWidth =6870
                    LayoutCachedHeight =1125
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin EmptyCell
                    Left =6930
                    Top =735
                    Width =1920
                    Height =390
                    Name ="EmptyCell137"
                    GroupTable =12
                    LayoutCachedLeft =6930
                    LayoutCachedTop =735
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =1125
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin EmptyCell
                    Left =9900
                    Top =1635
                    Width =885
                    Height =390
                    Name ="EmptyCell142"
                    GroupTable =12
                    LayoutCachedLeft =9900
                    LayoutCachedTop =1635
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =2025
                    RowStart =2
                    RowEnd =2
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin EmptyCell
                    Left =8910
                    Top =1635
                    Width =930
                    Height =390
                    Name ="EmptyCell143"
                    GroupTable =12
                    LayoutCachedLeft =8910
                    LayoutCachedTop =1635
                    LayoutCachedWidth =9840
                    LayoutCachedHeight =2025
                    RowStart =2
                    RowEnd =2
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =3
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8910
                    Top =2985
                    Width =1875
                    Height =675
                    TabIndex =3
                    TopMargin =170
                    BackColor =13485442
                    Name ="tbxButDate_1"
                    GroupTable =12

                    LayoutCachedLeft =8910
                    LayoutCachedTop =2985
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =3660
                    RowStart =5
                    RowEnd =5
                    ColumnStart =2
                    ColumnEnd =3
                    LayoutGroup =3
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8910
                    Top =4455
                    Width =1875
                    Height =675
                    TabIndex =7
                    TopMargin =170
                    BackColor =13485442
                    Name ="tbxButDate_3"
                    GroupTable =12

                    LayoutCachedLeft =8910
                    LayoutCachedTop =4455
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =5130
                    RowStart =7
                    RowEnd =7
                    ColumnStart =2
                    ColumnEnd =3
                    LayoutGroup =3
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8910
                    Top =3720
                    Width =1875
                    Height =675
                    TabIndex =5
                    TopMargin =170
                    BackColor =13485442
                    Name ="tbxButDate_2"
                    GroupTable =12

                    LayoutCachedLeft =8910
                    LayoutCachedTop =3720
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =4395
                    RowStart =6
                    RowEnd =6
                    ColumnStart =2
                    ColumnEnd =3
                    LayoutGroup =3
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8910
                    Top =5190
                    Width =1875
                    Height =675
                    TabIndex =9
                    TopMargin =170
                    BackColor =13485442
                    Name ="tbxButDate_4"
                    GroupTable =12

                    LayoutCachedLeft =8910
                    LayoutCachedTop =5190
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =5865
                    RowStart =8
                    RowEnd =8
                    ColumnStart =2
                    ColumnEnd =3
                    LayoutGroup =3
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6930
                    Top =5925
                    Width =1920
                    Height =885
                    TabIndex =10
                    Name ="btnIndsætFBUnic"
                    Caption ="Indlæs reguleringer i Uniconta"
                    OnClick ="[Event Procedure]"
                    GroupTable =12

                    LayoutCachedLeft =6930
                    LayoutCachedTop =5925
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =6810
                    RowStart =9
                    RowEnd =9
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =10637474
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    BorderColor =9732411
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =12
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =570
                            Top =5925
                            Width =6300
                            Height =885
                            FontWeight =700
                            TopMargin =57
                            BorderColor =9732411
                            Name ="Label179"
                            Caption ="9. Klik på knappen \"Indlæs reguleringer i Uniconta\""
                            GroupTable =12
                            LayoutCachedLeft =570
                            LayoutCachedTop =5925
                            LayoutCachedWidth =6870
                            LayoutCachedHeight =6810
                            RowStart =9
                            RowEnd =9
                            LayoutGroup =3
                            BorderThemeColorIndex =-1
                            BorderTint =100.0
                            ForeThemeColorIndex =1
                            ForeTint =100.0
                            GroupTable =12
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8910
                    Top =5925
                    Width =1875
                    Height =885
                    TabIndex =11
                    TopMargin =284
                    BackColor =13485442
                    Name ="tbxButDate_5"
                    GroupTable =12

                    LayoutCachedLeft =8910
                    LayoutCachedTop =5925
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =6810
                    RowStart =9
                    RowEnd =9
                    ColumnStart =2
                    ColumnEnd =3
                    LayoutGroup =3
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =0
            BackColor =14871513
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin FormFooter
            Height =0
            BackColor =4074796
            Name ="Formularfod"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
    End
End
CodeBehindForm
' See "frmSUF_FB_Real.cls"
