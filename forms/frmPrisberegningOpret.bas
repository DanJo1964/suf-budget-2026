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
    Width =8787
    DatasheetFontHeight =11
    ItemSuffix =413
    Left =4005
    Top =3030
    Right =28545
    Bottom =14895
    RecSrcDt = Begin
        0x817c930a2e5ae640
    End
    RecordSource ="tblPrisberegning"
    Caption =" "
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
        Begin OptionButton
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
            BackThemeColorIndex =1
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
            Height =5725
            BackColor =13485442
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =285
                    Top =120
                    Width =4020
                    Height =630
                    FontSize =24
                    FontWeight =700
                    Name ="Auto_hoved0"
                    Caption ="Opret prisberegning"
                    GroupTable =1
                    LayoutCachedLeft =285
                    LayoutCachedTop =120
                    LayoutCachedWidth =4305
                    LayoutCachedHeight =750
                    LayoutGroup =1
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6690
                    Top =225
                    Width =1920
                    Height =720
                    TabIndex =1
                    Name ="btnOpretNyPrisberegning"
                    Caption ="Opret prisberegning"
                    OnClick ="[Event Procedure]"
                    GroupTable =11
                    VerticalAnchor =1

                    LayoutCachedLeft =6690
                    LayoutCachedTop =225
                    LayoutCachedWidth =8610
                    LayoutCachedHeight =945
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =11
                    Overlaps =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =285
                    Top =2325
                    Width =1365
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblBudgetAar"
                    Caption ="Budget år"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =285
                    LayoutCachedTop =2325
                    LayoutCachedWidth =1650
                    LayoutCachedHeight =2670
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =1710
                    Top =2325
                    Width =3525
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblAfdeling"
                    Caption ="Vælg eksisterende prisberegning"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =1710
                    LayoutCachedTop =2325
                    LayoutCachedWidth =5235
                    LayoutCachedHeight =2670
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =93
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1710
                    Top =2730
                    Width =3525
                    Height =315
                    TabIndex =3
                    Name ="cboPrisberegning"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT PrisberegningNavn FROM tblPrisberegning WHERE BudgetAar = 2026 ORDER BY P"
                        "risberegningNavn; "
                    ColumnWidths ="2835"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =12

                    LayoutCachedLeft =1710
                    LayoutCachedTop =2730
                    LayoutCachedWidth =5235
                    LayoutCachedHeight =3045
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =12
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =285
                    Top =2730
                    Width =1365
                    Height =315
                    TabIndex =2
                    Name ="cboBudgetår"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =12

                    LayoutCachedLeft =285
                    LayoutCachedTop =2730
                    LayoutCachedWidth =1650
                    LayoutCachedHeight =3045
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =12
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5295
                    Top =2730
                    Width =825
                    Height =315
                    TabIndex =5
                    Name ="cboAntalPladser"
                    RowSourceType ="Value List"
                    RowSource ="1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20"
                    GroupTable =12

                    ShowOnlyRowSourceValues =255
                    LayoutCachedLeft =5295
                    LayoutCachedTop =2730
                    LayoutCachedWidth =6120
                    LayoutCachedHeight =3045
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =5295
                    Top =2325
                    Width =825
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblPladser"
                    Caption ="Pladser"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =5295
                    LayoutCachedTop =2325
                    LayoutCachedWidth =6120
                    LayoutCachedHeight =2670
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin OptionGroup
                    SpecialEffect =0
                    OldBorderStyle =0
                    OverlapFlags =85
                    Left =283
                    Top =907
                    Width =5842
                    Height =1081
                    Name ="fraOpretValg"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =283
                    LayoutCachedTop =907
                    LayoutCachedWidth =6125
                    LayoutCachedHeight =1988
                    Begin
                        Begin OptionButton
                            OverlapFlags =87
                            Left =497
                            Top =1001
                            OptionValue =3
                            Name ="Option411"

                            LayoutCachedLeft =497
                            LayoutCachedTop =1001
                            LayoutCachedWidth =757
                            LayoutCachedHeight =1241
                            Begin
                                Begin Label
                                    OverlapFlags =119
                                    Left =737
                                    Top =971
                                    Width =5325
                                    Height =315
                                    Name ="Label412"
                                    Caption ="Model 1: Grundlag fra godkendt budget"
                                    LayoutCachedLeft =737
                                    LayoutCachedTop =971
                                    LayoutCachedWidth =6062
                                    LayoutCachedHeight =1286
                                End
                            End
                        End
                        Begin OptionButton
                            SpecialEffect =2
                            OverlapFlags =87
                            Left =497
                            Top =1329
                            TabIndex =1
                            OptionValue =1
                            Name ="Option386"

                            LayoutCachedLeft =497
                            LayoutCachedTop =1329
                            LayoutCachedWidth =757
                            LayoutCachedHeight =1569
                            Begin
                                Begin Label
                                    OverlapFlags =119
                                    Left =737
                                    Top =1301
                                    Width =5325
                                    Height =315
                                    Name ="Label387"
                                    Caption ="Model 2: Grundlag fra eksisterende prisberegning"
                                    LayoutCachedLeft =737
                                    LayoutCachedTop =1301
                                    LayoutCachedWidth =6062
                                    LayoutCachedHeight =1616
                                End
                            End
                        End
                        Begin OptionButton
                            SpecialEffect =2
                            OverlapFlags =87
                            Left =497
                            Top =1659
                            TabIndex =2
                            OptionValue =2
                            Name ="Option388"

                            LayoutCachedLeft =497
                            LayoutCachedTop =1659
                            LayoutCachedWidth =757
                            LayoutCachedHeight =1899
                            Begin
                                Begin Label
                                    OverlapFlags =119
                                    Left =737
                                    Top =1631
                                    Width =5325
                                    Height =315
                                    Name ="Label389"
                                    Caption ="Model 3: Døgntakst på ny opgave"
                                    LayoutCachedLeft =737
                                    LayoutCachedTop =1631
                                    LayoutCachedWidth =6062
                                    LayoutCachedHeight =1946
                                End
                            End
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    OverlapFlags =247
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1711
                    Top =2731
                    Width =3525
                    Height =315
                    TabIndex =4
                    Name ="txtPrisberegningNavn"

                    LayoutCachedLeft =1711
                    LayoutCachedTop =2731
                    LayoutCachedWidth =5236
                    LayoutCachedHeight =3046
                End
            End
        End
        Begin Section
            Visible = NotDefault
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
' See "frmPrisberegningOpret.cls"
