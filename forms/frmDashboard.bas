Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    FilterOn = NotDefault
    OrderByOn = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    PictureType =2
    GridY =10
    Width =22950
    DatasheetFontHeight =11
    ItemSuffix =358
    Left =405
    Top =2190
    Right =23085
    Bottom =17340
    Filter ="Year_ = 2026"
    OrderBy ="[AfdNr Uniconta]"
    RecSrcDt = Begin
        0xe4fe9ae56b0ce640
    End
    RecordSource ="tblDashboard"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
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
        Begin OptionButton
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
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
        Begin Chart
            SpecialEffect =2
            OldBorderStyle =1
            Width =4536
            Height =2835
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
            Height =435
            BackColor =7616884
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =60
                    Top =60
                    Width =2547
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Auto_Header0"
                    Caption ="Afdeling"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =60
                    LayoutCachedTop =60
                    LayoutCachedWidth =2607
                    LayoutCachedHeight =405
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    WidthStretch =33
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =3975
                    Top =60
                    Width =1680
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label46"
                    Caption ="Internt budget"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =3975
                    LayoutCachedTop =60
                    LayoutCachedWidth =5655
                    LayoutCachedHeight =405
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    WidthStretch =25
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =5715
                    Top =60
                    Width =915
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label53"
                    Caption ="Debitor"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =5715
                    LayoutCachedTop =60
                    LayoutCachedWidth =6630
                    LayoutCachedHeight =405
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    WidthStretch =20
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =6690
                    Top =60
                    Width =1530
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label54"
                    Caption ="Medarbejder"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =6690
                    LayoutCachedTop =60
                    LayoutCachedWidth =8220
                    LayoutCachedHeight =405
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    WidthStretch =12
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =8280
                    Top =60
                    Width =1260
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label56"
                    Caption ="Parametre"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =8280
                    LayoutCachedTop =60
                    LayoutCachedWidth =9540
                    LayoutCachedHeight =405
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =9600
                    Top =60
                    Width =1500
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label58"
                    Caption ="Gng m Leder"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =9600
                    LayoutCachedTop =60
                    LayoutCachedWidth =11100
                    LayoutCachedHeight =405
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =11160
                    Top =60
                    Width =1695
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label60"
                    Caption ="Afventer leder"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =11160
                    LayoutCachedTop =60
                    LayoutCachedWidth =12855
                    LayoutCachedHeight =405
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =12915
                    Top =60
                    Width =1500
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label156"
                    Caption ="IB afsluttet"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =12915
                    LayoutCachedTop =60
                    LayoutCachedWidth =14415
                    LayoutCachedHeight =405
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =14475
                    Top =60
                    Width =1935
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label224"
                    Caption ="TP til SharePoint"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =14475
                    LayoutCachedTop =60
                    LayoutCachedWidth =16410
                    LayoutCachedHeight =405
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =16470
                    Top =60
                    Width =1740
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label233"
                    Caption ="TP sendt Tilsyn"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =16470
                    LayoutCachedTop =60
                    LayoutCachedWidth =18210
                    LayoutCachedHeight =405
                    ColumnStart =10
                    ColumnEnd =10
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =18270
                    Top =60
                    Width =1950
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label240"
                    Caption ="IB sendt til leder"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =18270
                    LayoutCachedTop =60
                    LayoutCachedWidth =20220
                    LayoutCachedHeight =405
                    ColumnStart =11
                    ColumnEnd =11
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =20280
                    Top =60
                    Width =1665
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label273"
                    Caption ="Uni Afd Nøgle"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =20280
                    LayoutCachedTop =60
                    LayoutCachedWidth =21945
                    LayoutCachedHeight =405
                    ColumnStart =12
                    ColumnEnd =12
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =2670
                    Top =60
                    Width =1245
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="Label348"
                    Caption ="O grad"
                    FontName ="Calibri Light"
                    GroupTable =1
                    LayoutCachedLeft =2670
                    LayoutCachedTop =60
                    LayoutCachedWidth =3915
                    LayoutCachedHeight =405
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
            End
        End
        Begin Section
            Height =413
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Locked = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =960
                    Top =60
                    Width =2115
                    Height =315
                    Name ="Konto"
                    ControlSource ="Afdeling"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =960
                    LayoutCachedTop =60
                    LayoutCachedWidth =3075
                    LayoutCachedHeight =375
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =4650
                    Top =60
                    Width =1350
                    Height =315
                    TabIndex =2
                    Name ="InterntBudget"
                    ControlSource ="InterntBudget"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =4650
                    LayoutCachedTop =60
                    LayoutCachedWidth =6000
                    LayoutCachedHeight =375
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6060
                    Top =60
                    Width =1185
                    Height =315
                    TabIndex =3
                    Name ="Debitor"
                    ControlSource ="Debitor"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =6060
                    LayoutCachedTop =60
                    LayoutCachedWidth =7245
                    LayoutCachedHeight =375
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =7305
                    Top =60
                    Width =1440
                    Height =315
                    ColumnWidth =1620
                    TabIndex =4
                    Name ="Medarbejder"
                    ControlSource ="Medarbejder"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =7305
                    LayoutCachedTop =60
                    LayoutCachedWidth =8745
                    LayoutCachedHeight =375
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =8805
                    Top =60
                    Width =1725
                    Height =315
                    TabIndex =5
                    Name ="Parametre"
                    ControlSource ="Parametre"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =8805
                    LayoutCachedTop =60
                    LayoutCachedWidth =10530
                    LayoutCachedHeight =375
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =10590
                    Top =60
                    Width =1200
                    Height =315
                    TabIndex =6
                    Name ="Fordeling"
                    ControlSource ="Fordeling"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =10590
                    LayoutCachedTop =60
                    LayoutCachedWidth =11790
                    LayoutCachedHeight =375
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =11850
                    Top =60
                    Width =825
                    Height =315
                    TabIndex =7
                    Name ="KoncernNote"
                    ControlSource ="KoncernNote"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =11850
                    LayoutCachedTop =60
                    LayoutCachedWidth =12675
                    LayoutCachedHeight =375
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =13515
                    Top =60
                    Width =660
                    Height =315
                    TabIndex =8
                    Name ="GngLeder"
                    ControlSource ="GngMLeder"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =13515
                    LayoutCachedTop =60
                    LayoutCachedWidth =14175
                    LayoutCachedHeight =375
                    ColumnStart =10
                    ColumnEnd =10
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin EmptyCell
                    Left =12735
                    Top =60
                    Width =720
                    Height =315
                    Name ="EmptyCell170"
                    GroupTable =2
                    VerticalAnchor =2
                    LayoutCachedLeft =12735
                    LayoutCachedTop =60
                    LayoutCachedWidth =13455
                    LayoutCachedHeight =375
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin EmptyCell
                    Left =14235
                    Top =60
                    Width =1230
                    Height =315
                    Name ="EmptyCell223"
                    GroupTable =2
                    VerticalAnchor =2
                    LayoutCachedLeft =14235
                    LayoutCachedTop =60
                    LayoutCachedWidth =15465
                    LayoutCachedHeight =375
                    ColumnStart =11
                    ColumnEnd =11
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin EmptyCell
                    Left =16155
                    Top =60
                    Width =1185
                    Height =315
                    Name ="EmptyCell228"
                    GroupTable =2
                    VerticalAnchor =2
                    LayoutCachedLeft =16155
                    LayoutCachedTop =60
                    LayoutCachedWidth =17340
                    LayoutCachedHeight =375
                    ColumnStart =13
                    ColumnEnd =13
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin EmptyCell
                    Left =18105
                    Top =60
                    Width =1110
                    Height =315
                    Name ="EmptyCell229"
                    GroupTable =2
                    VerticalAnchor =2
                    LayoutCachedLeft =18105
                    LayoutCachedTop =60
                    LayoutCachedWidth =19215
                    LayoutCachedHeight =375
                    ColumnStart =15
                    ColumnEnd =15
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =15525
                    Top =60
                    Width =570
                    Height =315
                    TabIndex =9
                    Name ="TPprint"
                    ControlSource ="TP_BudgetPrint"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =15525
                    LayoutCachedTop =60
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =375
                    ColumnStart =12
                    ColumnEnd =12
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =17400
                    Top =60
                    Width =645
                    Height =315
                    TabIndex =10
                    Name ="TPTilsyn"
                    ControlSource ="TP_BudgetSendtTilsyn"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =17400
                    LayoutCachedTop =60
                    LayoutCachedWidth =18045
                    LayoutCachedHeight =375
                    ColumnStart =14
                    ColumnEnd =14
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =19275
                    Top =60
                    Width =645
                    Height =315
                    TabIndex =11
                    Name ="IBLeder"
                    ControlSource ="IB_SendtLeder"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =19275
                    LayoutCachedTop =60
                    LayoutCachedWidth =19920
                    LayoutCachedHeight =375
                    ColumnStart =16
                    ColumnEnd =16
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =21075
                    Top =60
                    Width =675
                    Height =315
                    TabIndex =12
                    Name ="TilUnicontaBudget"
                    ControlSource ="TilUnicontaBudget"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =21075
                    LayoutCachedTop =60
                    LayoutCachedWidth =21750
                    LayoutCachedHeight =375
                    ColumnStart =18
                    ColumnEnd =18
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin EmptyCell
                    Left =19980
                    Top =60
                    Width =1035
                    Height =315
                    Name ="EmptyCell307"
                    GroupTable =2
                    VerticalAnchor =2
                    LayoutCachedLeft =19980
                    LayoutCachedTop =60
                    LayoutCachedWidth =21015
                    LayoutCachedHeight =375
                    ColumnStart =17
                    ColumnEnd =17
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =1
                    OverlapFlags =85
                    TextAlign =3
                    IMESentenceMode =3
                    Left =3135
                    Top =60
                    Width =780
                    Height =315
                    TabIndex =1
                    Name ="OverskudsGrad"
                    ControlSource ="OverskudsGrad"
                    Format ="Percent"
                    GroupTable =2
                    VerticalAnchor =2

                    LayoutCachedLeft =3135
                    LayoutCachedTop =60
                    LayoutCachedWidth =3915
                    LayoutCachedHeight =375
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin EmptyCell
                    Left =3975
                    Top =60
                    Width =615
                    Height =315
                    Name ="EmptyCell355"
                    GroupTable =2
                    VerticalAnchor =2
                    LayoutCachedLeft =3975
                    LayoutCachedTop =60
                    LayoutCachedWidth =4590
                    LayoutCachedHeight =375
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Top =56
                    Width =906
                    Height =315
                    ColumnWidth =1845
                    TabIndex =13
                    Name ="AfdNr Uniconta"
                    ControlSource ="AfdNr Uniconta"
                    EventProcPrefix ="AfdNr_Uniconta"

                    LayoutCachedTop =56
                    LayoutCachedWidth =906
                    LayoutCachedHeight =371
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
' See "frmDashboard.cls"
