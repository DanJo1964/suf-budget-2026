Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    FilterOn = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =17744
    DatasheetFontHeight =11
    ItemSuffix =33
    Left =4125
    Top =3045
    Right =21870
    Bottom =14760
    Filter ="[Year_] = 2026"
    RecSrcDt = Begin
        0x0854b02cf247e640
    End
    RecordSource ="tblAfdelingRevision"
    Caption ="_"
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
            Height =1020
            BackColor =7616884
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =630
                    Top =684
                    Width =1638
                    Height =315
                    Name ="Afdeling_Label"
                    Caption ="Afdeling"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =630
                    LayoutCachedTop =684
                    LayoutCachedWidth =2268
                    LayoutCachedHeight =999
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =93
                    TextAlign =1
                    Left =9075
                    Top =684
                    Width =1485
                    Height =315
                    Name ="Date__Label"
                    Caption ="Dato overført"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =9075
                    LayoutCachedTop =684
                    LayoutCachedWidth =10560
                    LayoutCachedHeight =999
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =223
                    TextAlign =1
                    Left =10545
                    Top =684
                    Width =1254
                    Height =315
                    Name ="User__Label"
                    Caption ="Bruger"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =10545
                    LayoutCachedTop =684
                    LayoutCachedWidth =11799
                    LayoutCachedHeight =999
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =223
                    TextAlign =1
                    Left =11790
                    Top =684
                    Width =2508
                    Height =315
                    Name ="MsgBudgHead_Label"
                    Caption ="Meddelelse header"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =11790
                    LayoutCachedTop =684
                    LayoutCachedWidth =14298
                    LayoutCachedHeight =999
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =340
                    Width =4650
                    Height =555
                    FontSize =20
                    Name ="Label16"
                    Caption ="Overfør budget til Uniconta"
                    LayoutCachedLeft =340
                    LayoutCachedWidth =4990
                    LayoutCachedHeight =555
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =1
                    Left =14298
                    Top =684
                    Width =2430
                    Height =315
                    Name ="MsgBudgLine_Label"
                    Caption ="Meddelelse linjer"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =14298
                    LayoutCachedTop =684
                    LayoutCachedWidth =16728
                    LayoutCachedHeight =999
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =7086
                    Top =113
                    Width =1425
                    Height =468
                    FontSize =12
                    Name ="cboYear"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"
                    ColumnWidths ="1441"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =7086
                    LayoutCachedTop =113
                    LayoutCachedWidth =8511
                    LayoutCachedHeight =581
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =5490
                    Top =120
                    Width =1440
                    Height =405
                    Name ="cboYear_navn"
                    Caption ="Budget år"
                    GroupTable =1
                    VerticalAnchor =1
                    LayoutCachedLeft =5490
                    LayoutCachedTop =120
                    LayoutCachedWidth =6930
                    LayoutCachedHeight =525
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =8730
                    Top =735
                    TabIndex =1
                    Name ="chkAll"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =8730
                    LayoutCachedTop =735
                    LayoutCachedWidth =8990
                    LayoutCachedHeight =975
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =12585
                    Top =113
                    Width =2442
                    Height =468
                    FontWeight =900
                    TabIndex =2
                    ForeColor =8210719
                    Name ="btnToUniconta"
                    Caption ="Overfør til Uniconta"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =12585
                    LayoutCachedTop =113
                    LayoutCachedWidth =15027
                    LayoutCachedHeight =581
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =13485442
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    Overlaps =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =3004
                    Top =680
                    Width =1845
                    Height =315
                    Name ="Label27"
                    Caption ="Afdeling Uniconta"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    LayoutCachedLeft =3004
                    LayoutCachedTop =680
                    LayoutCachedWidth =4849
                    LayoutCachedHeight =995
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =9061
                    Top =113
                    Width =3462
                    Height =468
                    FontWeight =900
                    TabIndex =3
                    ForeColor =8210719
                    Name ="btnImpAfd"
                    Caption ="Indlæs afd. til dette skærmbillede"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =9061
                    LayoutCachedTop =113
                    LayoutCachedWidth =12523
                    LayoutCachedHeight =581
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =13485442
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    Overlaps =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =7086
                    Top =680
                    Width =1455
                    Height =315
                    Name ="Label30"
                    Caption ="ModerSelsk. Id"
                    LayoutCachedLeft =7086
                    LayoutCachedTop =680
                    LayoutCachedWidth =8541
                    LayoutCachedHeight =995
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            Height =318
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =14298
                    Width =2430
                    Height =317
                    ColumnWidth =3000
                    Name ="MsgBudgLine"
                    ControlSource ="MsgBudgLine"

                    LayoutCachedLeft =14298
                    LayoutCachedWidth =16728
                    LayoutCachedHeight =317
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =11790
                    Width =2508
                    Height =317
                    ColumnWidth =3000
                    TabIndex =1
                    Name ="MsgBudgHead"
                    ControlSource ="MsgBudgHead"

                    LayoutCachedLeft =11790
                    LayoutCachedWidth =14298
                    LayoutCachedHeight =317
                End
                Begin TextBox
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =10545
                    Width =1254
                    Height =317
                    ColumnWidth =3000
                    TabIndex =2
                    Name ="User_"
                    ControlSource ="User_"

                    LayoutCachedLeft =10545
                    LayoutCachedWidth =11799
                    LayoutCachedHeight =317
                End
                Begin TextBox
                    OverlapFlags =247
                    TextAlign =1
                    IMESentenceMode =3
                    Left =9075
                    Width =1485
                    Height =317
                    ColumnWidth =1620
                    TabIndex =3
                    Name ="Date_"
                    ControlSource ="Date_"

                    LayoutCachedLeft =9075
                    LayoutCachedWidth =10560
                    LayoutCachedHeight =317
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =630
                    Width =2373
                    Height =315
                    ColumnWidth =3000
                    TabIndex =4
                    Name ="Afdeling"
                    ControlSource ="Afdeling"

                    LayoutCachedLeft =630
                    LayoutCachedWidth =3003
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =342
                    Width =282
                    Height =317
                    ColumnWidth =1701
                    TabIndex =5
                    Name ="ID"
                    ControlSource ="ID"

                    LayoutCachedLeft =342
                    LayoutCachedWidth =624
                    LayoutCachedHeight =317
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =4260
                    Width =2826
                    Height =318
                    ColumnWidth =3180
                    TabIndex =6
                    Name ="txtAfdelingsNavn"
                    ControlSource ="=IIf(IsNull([Afdeling]),\"\",DLookUp(\"AfdelingsNavn\",\"tblAfdeling\",\"Afdelin"
                        "g = '\" & [Afdeling] & \"' And Year_ = \" & [Year_]))"

                    LayoutCachedLeft =4260
                    LayoutCachedWidth =7086
                    LayoutCachedHeight =318
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =8730
                    Top =60
                    TabIndex =7
                    Name ="chkSelect"
                    ControlSource ="Transferred"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =8730
                    LayoutCachedTop =60
                    LayoutCachedWidth =8990
                    LayoutCachedHeight =300
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =113
                    Width =171
                    Height =315
                    TabIndex =8
                    Name ="Year_"
                    ControlSource ="Year_"

                    LayoutCachedLeft =113
                    LayoutCachedWidth =284
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =3004
                    Width =1251
                    Height =315
                    TabIndex =9
                    Name ="Afdeling_Uniconta"
                    ControlSource ="Afdeling_Uniconta"

                    LayoutCachedLeft =3004
                    LayoutCachedWidth =4255
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =7086
                    Width =1476
                    Height =315
                    ColumnWidth =1725
                    TabIndex =10
                    Name ="MotherComp"
                    ControlSource ="MotherComp"

                    LayoutCachedLeft =7086
                    LayoutCachedWidth =8562
                    LayoutCachedHeight =315
                End
                Begin ComboBox
                    OverlapFlags =247
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2880
                    Left =7086
                    Width =1476
                    Height =315
                    TabIndex =11
                    Name ="cboMotherCompId"
                    ControlSource ="MotherComp"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT tblUnicontaFirmaID.FirmaID, tblUnicontaFirmaID.FirmaNavn FROM tblUniconta"
                        "FirmaID ORDER BY tblUnicontaFirmaID.[FirmaID]; "
                    ColumnWidths ="1441;2835"

                    LayoutCachedLeft =7086
                    LayoutCachedWidth =8562
                    LayoutCachedHeight =315
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
' See "frmSUF_IB_Til_Uniconta.cls"
