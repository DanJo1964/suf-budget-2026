Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    Modal = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =19643
    DatasheetFontHeight =11
    ItemSuffix =74
    Left =4650
    Top =3630
    Right =19785
    Bottom =14325
    RecSrcDt = Begin
        0x21ab825bf170e640
    End
    RecordSource ="tblTmpOpretAfd"
    Caption ="Opret nyt budgetår"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =1807
            BackColor =13485442
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =345
                    Top =1200
                    Width =735
                    Height =585
                    ForeColor =16777215
                    Name ="AfdID_Label"
                    Caption ="\015\012Afd Nr"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =345
                    LayoutCachedTop =1200
                    LayoutCachedWidth =1080
                    LayoutCachedHeight =1785
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =1920
                    Top =1200
                    Width =2655
                    Height =585
                    ForeColor =16777215
                    Name ="AfdNavn_Label"
                    Caption ="\015\012Afdelings navn"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =1920
                    LayoutCachedTop =1200
                    LayoutCachedWidth =4575
                    LayoutCachedHeight =1785
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =4635
                    Top =1200
                    Width =2445
                    Height =585
                    ForeColor =16777215
                    Name ="UnderAfdID_Label"
                    Caption ="\015\012Angiv Underafdeling"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =4635
                    LayoutCachedTop =1200
                    LayoutCachedWidth =7080
                    LayoutCachedHeight =1785
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =1140
                    Top =1200
                    Width =720
                    Height =585
                    ForeColor =16777215
                    Name ="AfdVismaID_Label"
                    Caption ="Visma Afd Nr"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =1140
                    LayoutCachedTop =1200
                    LayoutCachedWidth =1860
                    LayoutCachedHeight =1785
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =7140
                    Top =1200
                    Width =2880
                    Height =585
                    ForeColor =16777215
                    Name ="Adresse_Label"
                    Caption ="\015\012Adresse"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =7140
                    LayoutCachedTop =1200
                    LayoutCachedWidth =10020
                    LayoutCachedHeight =1785
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =10080
                    Top =1200
                    Width =2490
                    Height =585
                    ForeColor =16777215
                    Name ="PostBy_Label"
                    Caption ="\015\012Postnummer og By"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =10080
                    LayoutCachedTop =1200
                    LayoutCachedWidth =12570
                    LayoutCachedHeight =1785
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =12630
                    Top =1200
                    Width =2490
                    Height =585
                    ForeColor =16777215
                    Name ="TlfMail_Label"
                    Caption ="Telefon/Mail\015\012(Vigtigt: Husk skråstreg!)"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =12630
                    LayoutCachedTop =1200
                    LayoutCachedWidth =15120
                    LayoutCachedHeight =1785
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =15180
                    Top =1200
                    Width =2970
                    Height =585
                    ForeColor =16777215
                    Name ="Leder_Label"
                    Caption ="Afdelingsleder\015\012Navn"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =15180
                    LayoutCachedTop =1200
                    LayoutCachedWidth =18150
                    LayoutCachedHeight =1785
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =18210
                    Top =1200
                    Width =795
                    Height =585
                    ForeColor =16777215
                    Name ="FBafdNr_Label"
                    Caption ="FB\015\012Afd Nr"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =18210
                    LayoutCachedTop =1200
                    LayoutCachedWidth =19005
                    LayoutCachedHeight =1785
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =19065
                    Top =1200
                    Width =540
                    Height =585
                    ForeColor =16777215
                    Name ="FBaktiv_Label"
                    Caption ="FB\015\0120 / 1"
                    Tag ="DetachedLabel"
                    GroupTable =2
                    LayoutCachedLeft =19065
                    LayoutCachedTop =1200
                    LayoutCachedWidth =19605
                    LayoutCachedHeight =1785
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =30
                    Top =30
                    Width =4275
                    Height =630
                    FontSize =24
                    FontWeight =700
                    Name ="Auto_hoved0"
                    Caption ="Opret nyt budget år: "
                    GroupTable =3
                    LayoutCachedLeft =30
                    LayoutCachedTop =30
                    LayoutCachedWidth =4305
                    LayoutCachedHeight =660
                    LayoutGroup =3
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =3
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =4365
                    Top =30
                    Width =1620
                    Height =630
                    FontSize =24
                    FontWeight =700
                    Name ="lblYear"
                    GroupTable =3
                    LayoutCachedLeft =4365
                    LayoutCachedTop =30
                    LayoutCachedWidth =5985
                    LayoutCachedHeight =660
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =3
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =3
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =8280
                    Top =60
                    Width =621
                    Height =570
                    Name ="btnCancel"
                    Caption ="Command256"
                    ControlTipText ="Close Form"
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

                    LayoutCachedLeft =8280
                    LayoutCachedTop =60
                    LayoutCachedWidth =8901
                    LayoutCachedHeight =630
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
                    Left =6180
                    Top =60
                    Width =1920
                    Height =570
                    TabIndex =1
                    Name ="btnOpret"
                    Caption ="Opret nyt budgetår"
                    OnClick ="[Event Procedure]"
                    GroupTable =4
                    VerticalAnchor =1

                    LayoutCachedLeft =6180
                    LayoutCachedTop =60
                    LayoutCachedWidth =8100
                    LayoutCachedHeight =630
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
                    GroupTable =4
                    Overlaps =1
                End
            End
        End
        Begin Section
            Height =405
            BackColor =14871513
            Name ="Detail"
            AlternateBackColor =14871513
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =345
                    Top =60
                    Width =735
                    Height =315
                    ColumnWidth =2460
                    Name ="AfdID"
                    ControlSource ="AfdID"
                    GroupTable =1

                    LayoutCachedLeft =345
                    LayoutCachedTop =60
                    LayoutCachedWidth =1080
                    LayoutCachedHeight =375
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1935
                    Top =60
                    Width =2655
                    Height =315
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="AfdNavn"
                    ControlSource ="AfdNavn"
                    GroupTable =1

                    LayoutCachedLeft =1935
                    LayoutCachedTop =60
                    LayoutCachedWidth =4590
                    LayoutCachedHeight =375
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1140
                    Top =60
                    Width =735
                    Height =315
                    ColumnWidth =2460
                    TabIndex =1
                    Name ="AfdVismaID"
                    ControlSource ="AfdVismaID"
                    GroupTable =1

                    LayoutCachedLeft =1140
                    LayoutCachedTop =60
                    LayoutCachedWidth =1875
                    LayoutCachedHeight =375
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7155
                    Top =60
                    Width =2880
                    Height =315
                    ColumnWidth =3000
                    TabIndex =4
                    Name ="Adresse"
                    ControlSource ="Adresse"
                    GroupTable =1

                    LayoutCachedLeft =7155
                    LayoutCachedTop =60
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =375
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =10095
                    Top =60
                    Width =2490
                    Height =315
                    ColumnWidth =3000
                    TabIndex =5
                    Name ="PostBy"
                    ControlSource ="PostBy"
                    GroupTable =1

                    LayoutCachedLeft =10095
                    LayoutCachedTop =60
                    LayoutCachedWidth =12585
                    LayoutCachedHeight =375
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =12645
                    Top =60
                    Width =2490
                    Height =315
                    ColumnWidth =3000
                    TabIndex =6
                    Name ="TlfMail"
                    ControlSource ="TlfMail"
                    GroupTable =1

                    LayoutCachedLeft =12645
                    LayoutCachedTop =60
                    LayoutCachedWidth =15135
                    LayoutCachedHeight =375
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =15195
                    Top =60
                    Width =2955
                    Height =315
                    ColumnWidth =3000
                    TabIndex =7
                    Name ="Leder"
                    ControlSource ="Leder"
                    GroupTable =1

                    LayoutCachedLeft =15195
                    LayoutCachedTop =60
                    LayoutCachedWidth =18150
                    LayoutCachedHeight =375
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =19065
                    Top =60
                    Width =540
                    Height =315
                    ColumnWidth =1050
                    TabIndex =9
                    Name ="FBaktiv"
                    ControlSource ="FBaktiv"
                    GroupTable =1

                    LayoutCachedLeft =19065
                    LayoutCachedTop =60
                    LayoutCachedWidth =19605
                    LayoutCachedHeight =375
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =18210
                    Top =60
                    Width =795
                    Height =315
                    ColumnWidth =2460
                    TabIndex =8
                    Name ="FBafdNr"
                    ControlSource ="FBafdNr"
                    GroupTable =1

                    LayoutCachedLeft =18210
                    LayoutCachedTop =60
                    LayoutCachedWidth =19005
                    LayoutCachedHeight =375
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =4650
                    Top =60
                    Width =2445
                    Height =315
                    TabIndex =3
                    Name ="UnderAfdID"
                    ControlSource ="UnderAfdID"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT tmpAfdUnder_48928.Dimension, tmpAfdUnder_48928.Name FROM tmpAfdUnder_4892"
                        "8 WHERE (((tmpAfdUnder_48928.Blocked)=\"0\")) ORDER BY tmpAfdUnder_48928.Name; "
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =1

                    LayoutCachedLeft =4650
                    LayoutCachedTop =60
                    LayoutCachedWidth =7095
                    LayoutCachedHeight =375
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
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
' See "frmSUF_OpretNytBudgetår.cls"
