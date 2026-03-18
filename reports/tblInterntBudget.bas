Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =31680
    DatasheetFontHeight =11
    ItemSuffix =33
    Filter ="([tblInterntBudget].[Konto]='1040')"
    RecSrcDt = Begin
        0xb16bb68c6d1ee640
    End
    RecordSource ="tblInterntBudget"
    Caption ="tblInterntBudget"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    FitToPage =1
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
            ShowDatePicker =0
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin BreakLevel
            ControlSource ="Konto"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =909
            Name ="ReportHeader"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    Left =57
                    Top =57
                    Width =2775
                    Height =510
                    FontSize =20
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Label30"
                    Caption ="tblInterntBudget"
                    GridlineColor =10921638
                    LayoutCachedLeft =57
                    LayoutCachedTop =57
                    LayoutCachedWidth =2832
                    LayoutCachedHeight =567
                End
            End
        End
        Begin PageHeader
            Height =407
            Name ="PageHeaderSection"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    OverlapFlags =4
                    TextAlign =1
                    Left =342
                    Top =57
                    Width =3477
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Konto_Label"
                    Caption ="Konto"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =342
                    LayoutCachedTop =57
                    LayoutCachedWidth =3819
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =1
                    Left =3876
                    Top =57
                    Width =3477
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="KontoNavn_Label"
                    Caption ="KontoNavn"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =3876
                    LayoutCachedTop =57
                    LayoutCachedWidth =7353
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =7410
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="BudgetIalt_Label"
                    Caption ="BudgetIalt"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =7410
                    LayoutCachedTop =57
                    LayoutCachedWidth =9177
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =9234
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_1_Label"
                    Caption ="_1"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_1_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9234
                    LayoutCachedTop =57
                    LayoutCachedWidth =11001
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =11058
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_2_Label"
                    Caption ="_2"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_2_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =11058
                    LayoutCachedTop =57
                    LayoutCachedWidth =12825
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =12882
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_3_Label"
                    Caption ="_3"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_3_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =12882
                    LayoutCachedTop =57
                    LayoutCachedWidth =14649
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =14706
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_4_Label"
                    Caption ="_4"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_4_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =14706
                    LayoutCachedTop =57
                    LayoutCachedWidth =16473
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =16530
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_5_Label"
                    Caption ="_5"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_5_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =16530
                    LayoutCachedTop =57
                    LayoutCachedWidth =18297
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =18354
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_6_Label"
                    Caption ="_6"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_6_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =18354
                    LayoutCachedTop =57
                    LayoutCachedWidth =20121
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =20178
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_7_Label"
                    Caption ="_7"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_7_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =20178
                    LayoutCachedTop =57
                    LayoutCachedWidth =21945
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =22002
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_8_Label"
                    Caption ="_8"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_8_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =22002
                    LayoutCachedTop =57
                    LayoutCachedWidth =23769
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =23826
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_9_Label"
                    Caption ="_9"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_9_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =23826
                    LayoutCachedTop =57
                    LayoutCachedWidth =25593
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =25650
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_10_Label"
                    Caption ="_10"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_10_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =25650
                    LayoutCachedTop =57
                    LayoutCachedWidth =27417
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =27474
                    Top =57
                    Width =1767
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_11_Label"
                    Caption ="_11"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_11_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =27474
                    LayoutCachedTop =57
                    LayoutCachedWidth =29241
                    LayoutCachedHeight =350
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =3
                    Left =29298
                    Top =57
                    Width =2325
                    Height =293
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="_12_Label"
                    Caption ="_12"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Ctl_12_Label"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =29298
                    LayoutCachedTop =57
                    LayoutCachedWidth =31623
                    LayoutCachedHeight =350
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =416
            Name ="Detail"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =342
                    Top =57
                    Width =3477
                    Height =302
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Konto"
                    ControlSource ="Konto"
                    GridlineColor =10921638

                    LayoutCachedLeft =342
                    LayoutCachedTop =57
                    LayoutCachedWidth =3819
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =3876
                    Top =57
                    Width =3477
                    Height =302
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="KontoNavn"
                    ControlSource ="KontoNavn"
                    GridlineColor =10921638

                    LayoutCachedLeft =3876
                    LayoutCachedTop =57
                    LayoutCachedWidth =7353
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =7410
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="BudgetIalt"
                    ControlSource ="BudgetIalt"
                    GridlineColor =10921638

                    LayoutCachedLeft =7410
                    LayoutCachedTop =57
                    LayoutCachedWidth =9177
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =9234
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_1"
                    ControlSource ="_1"
                    EventProcPrefix ="Ctl_1"
                    GridlineColor =10921638

                    LayoutCachedLeft =9234
                    LayoutCachedTop =57
                    LayoutCachedWidth =11001
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =11058
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_2"
                    ControlSource ="_2"
                    EventProcPrefix ="Ctl_2"
                    GridlineColor =10921638

                    LayoutCachedLeft =11058
                    LayoutCachedTop =57
                    LayoutCachedWidth =12825
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =12882
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_3"
                    ControlSource ="_3"
                    EventProcPrefix ="Ctl_3"
                    GridlineColor =10921638

                    LayoutCachedLeft =12882
                    LayoutCachedTop =57
                    LayoutCachedWidth =14649
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =14706
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_4"
                    ControlSource ="_4"
                    EventProcPrefix ="Ctl_4"
                    GridlineColor =10921638

                    LayoutCachedLeft =14706
                    LayoutCachedTop =57
                    LayoutCachedWidth =16473
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =16530
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_5"
                    ControlSource ="_5"
                    EventProcPrefix ="Ctl_5"
                    GridlineColor =10921638

                    LayoutCachedLeft =16530
                    LayoutCachedTop =57
                    LayoutCachedWidth =18297
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =18354
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_6"
                    ControlSource ="_6"
                    EventProcPrefix ="Ctl_6"
                    GridlineColor =10921638

                    LayoutCachedLeft =18354
                    LayoutCachedTop =57
                    LayoutCachedWidth =20121
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =20178
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =9
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_7"
                    ControlSource ="_7"
                    EventProcPrefix ="Ctl_7"
                    GridlineColor =10921638

                    LayoutCachedLeft =20178
                    LayoutCachedTop =57
                    LayoutCachedWidth =21945
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =22002
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_8"
                    ControlSource ="_8"
                    EventProcPrefix ="Ctl_8"
                    GridlineColor =10921638

                    LayoutCachedLeft =22002
                    LayoutCachedTop =57
                    LayoutCachedWidth =23769
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =23826
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =11
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_9"
                    ControlSource ="_9"
                    EventProcPrefix ="Ctl_9"
                    GridlineColor =10921638

                    LayoutCachedLeft =23826
                    LayoutCachedTop =57
                    LayoutCachedWidth =25593
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =25650
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =12
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_10"
                    ControlSource ="_10"
                    EventProcPrefix ="Ctl_10"
                    GridlineColor =10921638

                    LayoutCachedLeft =25650
                    LayoutCachedTop =57
                    LayoutCachedWidth =27417
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =27474
                    Top =57
                    Width =1767
                    Height =302
                    TabIndex =13
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_11"
                    ControlSource ="_11"
                    EventProcPrefix ="Ctl_11"
                    GridlineColor =10921638

                    LayoutCachedLeft =27474
                    LayoutCachedTop =57
                    LayoutCachedWidth =29241
                    LayoutCachedHeight =359
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    IMESentenceMode =3
                    Left =29298
                    Top =57
                    Width =2325
                    Height =302
                    TabIndex =14
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="_12"
                    ControlSource ="_12"
                    EventProcPrefix ="Ctl_12"
                    GridlineColor =10921638

                    LayoutCachedLeft =29298
                    LayoutCachedTop =57
                    LayoutCachedWidth =31623
                    LayoutCachedHeight =359
                End
            End
        End
        Begin PageFooter
            Height =530
            Name ="PageFooterSection"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    TextAlign =1
                    IMESentenceMode =3
                    Left =57
                    Top =228
                    Width =5040
                    Height =302
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Text31"
                    ControlSource ="=Now()"
                    Format ="Long Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =57
                    LayoutCachedTop =228
                    LayoutCachedWidth =5097
                    LayoutCachedHeight =530
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    TextAlign =3
                    IMESentenceMode =3
                    Left =26583
                    Top =228
                    Width =5040
                    Height =302
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Text32"
                    ControlSource ="=\"Page \" & [Page] & \" of \" & [Pages]"
                    GridlineColor =10921638

                    LayoutCachedLeft =26583
                    LayoutCachedTop =228
                    LayoutCachedWidth =31623
                    LayoutCachedHeight =530
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =0
            Name ="ReportFooter"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
