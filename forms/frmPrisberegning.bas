Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    Modal = NotDefault
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
    Width =15477
    DatasheetFontHeight =11
    ItemSuffix =387
    Left =-24795
    Top =1080
    Right =-5460
    Bottom =14745
    OnUnload ="[Event Procedure]"
    RecSrcDt = Begin
        0x2914ad7d715de640
    End
    RecordSource ="tblPrisberegning"
    Caption ="SUF Prisberegningsmodel"
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
        Begin BoundObjectFrame
            AddColon = NotDefault
            SizeMode =3
            SpecialEffect =2
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
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
            Height =1644
            BackColor =13485442
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =300
                    Top =60
                    Width =3975
                    Height =630
                    FontSize =24
                    FontWeight =700
                    Name ="Auto_hoved0"
                    Caption ="Prisberegning"
                    GroupTable =1
                    LayoutCachedLeft =300
                    LayoutCachedTop =60
                    LayoutCachedWidth =4275
                    LayoutCachedHeight =690
                    LayoutGroup =1
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =12990
                    Top =120
                    Width =1920
                    Height =795
                    TabIndex =4
                    Name ="btnOpretNyPrisberegning"
                    Caption ="Opret ny prisberegning"
                    OnClick ="[Event Procedure]"
                    GroupTable =11
                    VerticalAnchor =1

                    LayoutCachedLeft =12990
                    LayoutCachedTop =120
                    LayoutCachedWidth =14910
                    LayoutCachedHeight =915
                    LayoutGroup =4
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
                    Left =6345
                    Top =120
                    Width =1080
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblBudgetAar"
                    Caption ="Budget år"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =6345
                    LayoutCachedTop =120
                    LayoutCachedWidth =7425
                    LayoutCachedHeight =465
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =7485
                    Top =120
                    Width =3420
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblAfdeling"
                    Caption ="Prisberegninger"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =7485
                    LayoutCachedTop =120
                    LayoutCachedWidth =10905
                    LayoutCachedHeight =465
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =6345
                    Top =525
                    Width =1080
                    Height =315
                    Name ="cboBudgetår"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"
                    GroupTable =12

                    LayoutCachedLeft =6345
                    LayoutCachedTop =525
                    LayoutCachedWidth =7425
                    LayoutCachedHeight =840
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    GroupTable =12
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =10725
                    Top =1020
                    Width =2085
                    Height =570
                    TabIndex =11
                    Name ="btnRedigerBudget"
                    Caption ="Rediger budget"
                    OnClick ="[Event Procedure]"
                    VerticalAnchor =1

                    LayoutCachedLeft =10725
                    LayoutCachedTop =1020
                    LayoutCachedWidth =12810
                    LayoutCachedHeight =1590
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =12870
                    Top =1020
                    Width =2085
                    Height =570
                    TabIndex =12
                    Name ="btnTilbudsskabelon"
                    Caption ="Tilbudsskabelon"
                    OnClick ="[Event Procedure]"
                    VerticalAnchor =1

                    LayoutCachedLeft =12870
                    LayoutCachedTop =1020
                    LayoutCachedWidth =14955
                    LayoutCachedHeight =1590
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6300
                    Top =1020
                    Width =2265
                    Height =570
                    TabIndex =9
                    Name ="btnRedigerMedarbejder"
                    Caption ="Rediger medarbejder "
                    OnClick ="[Event Procedure]"
                    GroupTable =15
                    VerticalAnchor =1

                    LayoutCachedLeft =6300
                    LayoutCachedTop =1020
                    LayoutCachedWidth =8565
                    LayoutCachedHeight =1590
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
                    GroupTable =15
                    Overlaps =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =10965
                    Top =120
                    Width =945
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label306"
                    Caption ="Version"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =10965
                    LayoutCachedTop =120
                    LayoutCachedWidth =11910
                    LayoutCachedHeight =465
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =283
                    Top =858
                    Width =3981
                    Height =735
                    TabIndex =6
                    Name ="txtBeskrivelse"

                    LayoutCachedLeft =283
                    LayoutCachedTop =858
                    LayoutCachedWidth =4264
                    LayoutCachedHeight =1593
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =11970
                    Top =120
                    Width =825
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label328"
                    Caption ="Pladser"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =11970
                    LayoutCachedTop =120
                    LayoutCachedWidth =12795
                    LayoutCachedHeight =465
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =7485
                    Top =525
                    Width =3420
                    Height =315
                    TabIndex =1
                    Name ="txtPrisberegningNavn"
                    GroupTable =12

                    LayoutCachedLeft =7485
                    LayoutCachedTop =525
                    LayoutCachedWidth =10905
                    LayoutCachedHeight =840
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10965
                    Top =525
                    Width =945
                    Height =315
                    TabIndex =2
                    Name ="txtVersion"
                    GroupTable =12

                    LayoutCachedLeft =10965
                    LayoutCachedTop =525
                    LayoutCachedWidth =11910
                    LayoutCachedHeight =840
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =11970
                    Top =525
                    Width =825
                    Height =315
                    TabIndex =3
                    Name ="txtAntalPladser"
                    GroupTable =12

                    LayoutCachedLeft =11970
                    LayoutCachedTop =525
                    LayoutCachedWidth =12795
                    LayoutCachedHeight =840
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =12
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =14971
                    Top =170
                    Width =456
                    Height =315
                    TabIndex =5
                    Name ="ID"

                    LayoutCachedLeft =14971
                    LayoutCachedTop =170
                    LayoutCachedWidth =15427
                    LayoutCachedHeight =485
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =8625
                    Top =1020
                    Width =2040
                    Height =570
                    TabIndex =10
                    Name ="btnRedigerDebitor"
                    Caption ="Rediger debitor "
                    OnClick ="[Event Procedure]"
                    GroupTable =16
                    VerticalAnchor =1

                    LayoutCachedLeft =8625
                    LayoutCachedTop =1020
                    LayoutCachedWidth =10665
                    LayoutCachedHeight =1590
                    LayoutGroup =5
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =16
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =4365
                    Top =1020
                    Width =855
                    Height =570
                    TabIndex =7
                    Name ="btnHelp"
                    Caption ="Hjælp!"
                    OnClick ="[Event Procedure]"
                    GroupTable =17
                    VerticalAnchor =1

                    LayoutCachedLeft =4365
                    LayoutCachedTop =1020
                    LayoutCachedWidth =5220
                    LayoutCachedHeight =1590
                    LayoutGroup =6
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =17
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =5325
                    Top =1020
                    Width =855
                    Height =570
                    TabIndex =8
                    Name ="btnExcel"
                    Caption ="Til Excel"
                    OnClick ="[Event Procedure]"
                    GroupTable =18
                    VerticalAnchor =1

                    LayoutCachedLeft =5325
                    LayoutCachedTop =1020
                    LayoutCachedWidth =6180
                    LayoutCachedHeight =1590
                    LayoutGroup =7
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackThemeColorIndex =9
                    BackTint =100.0
                    BackShade =75.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =18
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =7029
            BackColor =14871513
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Subform
                    OverlapFlags =85
                    Left =283
                    Top =113
                    Width =14685
                    Height =6570
                    Name ="frmPrisberegning_subform"
                    SourceObject ="Form.frmPrisberegning_subform"
                    LinkChildFields ="BudgetAar"
                    LinkMasterFields ="cboBudgetår"

                    LayoutCachedLeft =283
                    LayoutCachedTop =113
                    LayoutCachedWidth =14968
                    LayoutCachedHeight =6683
                End
            End
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
' See "frmPrisberegning.cls"
