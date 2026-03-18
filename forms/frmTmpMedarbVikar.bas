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
    Width =8900
    DatasheetFontHeight =11
    ItemSuffix =447
    Left =4680
    Top =3030
    Right =13575
    Bottom =9870
    RecSrcDt = Begin
        0x7eaa8017cd57e640
    End
    RecordSource ="tblTmpMedarbVikar"
    Caption ="OPRET VIKARTIMER"
    OnOpen ="[Event Procedure]"
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
            Height =1587
            BackColor =13485442
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin CommandButton
                    OverlapFlags =85
                    Left =6120
                    Top =165
                    Width =1920
                    Height =795
                    TabIndex =4
                    Name ="btnAccept"
                    Caption ="Opdatér vikartimer"
                    OnClick ="[Event Procedure]"
                    GroupTable =11
                    VerticalAnchor =1

                    LayoutCachedLeft =6120
                    LayoutCachedTop =165
                    LayoutCachedWidth =8040
                    LayoutCachedHeight =960
                    LayoutGroup =1
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
                    Left =2025
                    Top =60
                    Width =1035
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblBudgetAar"
                    Caption ="Budget år"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =2025
                    LayoutCachedTop =60
                    LayoutCachedWidth =3060
                    LayoutCachedHeight =405
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =165
                    Top =60
                    Width =1800
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblAfdeling"
                    Caption ="Afdeling"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =165
                    LayoutCachedTop =60
                    LayoutCachedWidth =1965
                    LayoutCachedHeight =405
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =8160
                    Top =165
                    Width =621
                    Height =795
                    TabIndex =5
                    Name ="btnCancel"
                    Caption ="Command256"
                    ControlTipText ="Close Form"
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =8
                        Begin
                            Action ="Close"
                            Argument ="-1"
                            Argument =""
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"btnCancel\" xmlns=\"http://schemas.microsoft.com/office/acce"
                                "ssservices/2009/11/application\"><Statements><Action Name=\"CloseWindow\"/></Sta"
                                "tements></UserInterfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000003255d6273255d68d ,
                        0x3255d6cf3255d6ff3255d6ff3255d6cf3255d68d3255d6270000000000000000 ,
                        0x00000000000000000000000000000000000000003255d6723255d6f63255d6ff ,
                        0x3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6f63255d67200000000 ,
                        0x0000000000000000000000003255d6063255d6b73255d6ff3255d6ff3255d6ff ,
                        0x3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6b7 ,
                        0x3255d60600000000000000003255d6933255d6ff3255d6ff3759d7f94d6bdbe5 ,
                        0x3255d6ff3255d6ff3255d6ff3255d6ff4d6bdbe53759d7f93255d6ff3255d6ff ,
                        0x3255d690000000003255d62d3255d6fc3255d6ff3c5ed8f4eef1fccefcfcfee5 ,
                        0x4a69dbe73255d6ff3255d6ff4a69dbe7fcfcfee5eef1fcce3c5ed8f43255d6ff ,
                        0x3255d6fc3255d62d3255d6933255d6ff3255d6ff3457d6fce4e9fac8ffffffff ,
                        0xfafbfee04766dae94766dae9fafbfee0ffffffffe4e9fac83759d7f93255d6ff ,
                        0x3255d6ff3255d6903255d6db3255d6ff3255d6ff3255d6ff3759d7f9e8ecfaca ,
                        0xfffffffff9fafedcf8f9fedaffffffffe8ecfaca3759d7f93255d6ff3255d6ff ,
                        0x3255d6ff3255d6d53255d6f93255d6ff3255d6ff3255d6ff3255d6ff395bd7f6 ,
                        0xeceffbcdffffffffffffffffeceffbcd395bd7f63255d6ff3255d6ff3255d6ff ,
                        0x3255d6ff3255d6f33255d6f93255d6ff3255d6ff3255d6ff3255d6ff395bd7f6 ,
                        0xf2f4fcd3fffffffffffffffff2f4fcd33c5ed8f43255d6ff3255d6ff3255d6ff ,
                        0x3255d6ff3255d6f03255d6d83255d6ff3255d6ff3255d6ff395bd7f6eff2fcd0 ,
                        0xfffffffff5f6fdd4f5f6fdd4ffffffffeff2fcd0395bd7f63255d6ff3255d6ff ,
                        0x3255d6ff3255d6d53255d6903255d6ff3255d6ff3759d7f9ebeefbcbffffffff ,
                        0xf8f9feda4162d9ee4162d9eef8f9fedaffffffffebeefbcb3759d7f93255d6ff ,
                        0x3255d6ff3255d68d3255d62d3255d6fc3255d6ff395bd7f6ebeefbcbf9fafede ,
                        0x4464daec3255d6ff3255d6ff4464daecf9fafedeebeefbcb395bd7f63255d6ff ,
                        0x3255d6fc3255d62a000000003255d6903255d6ff3255d6ff3759d7f94766dae9 ,
                        0x3255d6ff3255d6ff3255d6ff3255d6ff4766dae93759d7f93255d6ff3255d6ff ,
                        0x3255d68d00000000000000003255d6063255d6b73255d6ff3255d6ff3255d6ff ,
                        0x3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6b7 ,
                        0x3255d606000000000000000000000000000000003255d6723255d6f63255d6ff ,
                        0x3255d6ff3255d6ff3255d6ff3255d6ff3255d6ff3255d6f63255d67200000000 ,
                        0x0000000000000000000000000000000000000000000000003255d6273255d68d ,
                        0x3255d6cc3255d6fc3255d6fc3255d6cc3255d68d3255d6270000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =8160
                    LayoutCachedTop =165
                    LayoutCachedWidth =8781
                    LayoutCachedHeight =960
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
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =165
                    Top =465
                    Width =1800
                    Height =600
                    Name ="tbxAfdeling"
                    GroupTable =12

                    LayoutCachedLeft =165
                    LayoutCachedTop =465
                    LayoutCachedWidth =1965
                    LayoutCachedHeight =1065
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =2
                    GroupTable =12
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2025
                    Top =465
                    Width =1035
                    Height =600
                    TabIndex =1
                    Name ="tbxYear_"
                    GroupTable =12

                    LayoutCachedLeft =2025
                    LayoutCachedTop =465
                    LayoutCachedWidth =3060
                    LayoutCachedHeight =1065
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =3120
                    Top =60
                    Width =1155
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label355"
                    Caption ="Vikartimer"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =3120
                    LayoutCachedTop =60
                    LayoutCachedWidth =4275
                    LayoutCachedHeight =405
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =3120
                    Top =465
                    Width =1155
                    Height =600
                    TabIndex =2
                    Name ="tbxAntalTimer"
                    Format ="Standard"
                    GroupTable =12

                    LayoutCachedLeft =3120
                    LayoutCachedTop =465
                    LayoutCachedWidth =4275
                    LayoutCachedHeight =1065
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =4335
                    Top =60
                    Width =1050
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label361"
                    Caption ="Beløb"
                    GroupTable =12
                    VerticalAnchor =1
                    LayoutCachedLeft =4335
                    LayoutCachedTop =60
                    LayoutCachedWidth =5385
                    LayoutCachedHeight =405
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =12
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4335
                    Top =465
                    Width =1050
                    Height =600
                    TabIndex =3
                    Name ="tbxTotalBeløb"
                    Format ="Standard"
                    GroupTable =12

                    LayoutCachedLeft =4335
                    LayoutCachedTop =465
                    LayoutCachedWidth =5385
                    LayoutCachedHeight =1065
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =12
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =1530
                    Top =1200
                    Width =1245
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label444"
                    Caption ="Antal timer"
                    GroupTable =13
                    VerticalAnchor =1
                    LayoutCachedLeft =1530
                    LayoutCachedTop =1200
                    LayoutCachedWidth =2775
                    LayoutCachedHeight =1545
                    LayoutGroup =3
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =13
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =2955
                    Top =1200
                    Width =825
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label445"
                    Caption ="Løntrin"
                    GroupTable =14
                    VerticalAnchor =1
                    LayoutCachedLeft =2955
                    LayoutCachedTop =1200
                    LayoutCachedWidth =3780
                    LayoutCachedHeight =1545
                    LayoutGroup =4
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =14
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =7140
                    Top =1200
                    Width =1440
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label446"
                    Caption ="Beløb pr. uge"
                    GroupTable =15
                    VerticalAnchor =1
                    LayoutCachedLeft =7140
                    LayoutCachedTop =1200
                    LayoutCachedWidth =8580
                    LayoutCachedHeight =1545
                    LayoutGroup =5
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =15
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =5272
            BackColor =14871513
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Subform
                    OverlapFlags =85
                    Left =225
                    Top =60
                    Width =8040
                    Height =5100
                    Name ="frmTmpMedarbVikarSub"
                    SourceObject ="Form.frmTmpMedarbVikarSub"

                    LayoutCachedLeft =225
                    LayoutCachedTop =60
                    LayoutCachedWidth =8265
                    LayoutCachedHeight =5160
                    ShowPageHeaderAndPageFooter =0
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
' See "frmTmpMedarbVikar.cls"
