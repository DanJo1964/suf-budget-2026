Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    ControlBox = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10488
    DatasheetFontHeight =11
    ItemSuffix =20
    Left =1035
    Top =2250
    Right =15705
    Bottom =8550
    BeforeDelConfirm ="[Event Procedure]"
    RecSrcDt = Begin
        0x1630a8c9347ce640
    End
    RecordSource ="SELECT tblPrisberegning.PrisberegningNavn, tblPrisberegning.Version, tblPrisbere"
        "gning.Beskrivelse, tblPrisberegning.AntalPladser, tblPrisberegning.OprettetDato,"
        " tblPrisberegning.Status, tblPrisberegning.SendtDato, tblPrisberegning.ID, tblPr"
        "isberegning.BudgetAar, tblPrisberegning.KM, tblPrisberegning.Year_, tblPrisbereg"
        "ning.OGrad, tblPrisberegning.Afdeling, tblPrisberegning.BeregnType FROM tblPrisb"
        "eregning; "
    Caption ="tblPrisberegning subform"
    OnCurrent ="[Event Procedure]"
    OnDelete ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
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
        Begin FormHeader
            Height =0
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =4793
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =342
                    Width =7260
                    Height =600
                    ColumnWidth =3900
                    Name ="PrisberegningNavn"
                    ControlSource ="PrisberegningNavn"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =342
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =942
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =342
                            Width =2460
                            Height =330
                            Name ="PrisberegningNavn_Label"
                            Caption ="PrisberegningNavn"
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1026
                    Width =1200
                    Height =330
                    ColumnWidth =1200
                    TabIndex =2
                    Name ="Version"
                    ControlSource ="Version"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1026
                    LayoutCachedWidth =4092
                    LayoutCachedHeight =1356
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1026
                            Width =2460
                            Height =330
                            Name ="Version_Label"
                            Caption ="Version"
                            LayoutCachedLeft =342
                            LayoutCachedTop =1026
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1356
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1425
                    Width =7260
                    Height =600
                    ColumnWidth =3000
                    TabIndex =3
                    Name ="Beskrivelse"
                    ControlSource ="Beskrivelse"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1425
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =2025
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1425
                            Width =2460
                            Height =330
                            Name ="Beskrivelse_Label"
                            Caption ="Beskrivelse"
                            LayoutCachedLeft =342
                            LayoutCachedTop =1425
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1755
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2109
                    Width =1530
                    Height =330
                    ColumnWidth =1530
                    TabIndex =4
                    Name ="AntalPladser"
                    ControlSource ="AntalPladser"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2109
                    LayoutCachedWidth =4422
                    LayoutCachedHeight =2439
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2109
                            Width =2460
                            Height =330
                            Name ="AntalPladser_Label"
                            Caption ="AntalPladser"
                            LayoutCachedLeft =342
                            LayoutCachedTop =2109
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2439
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2508
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =7
                    Name ="OprettetDato"
                    ControlSource ="OprettetDato"
                    Format ="General Date"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2508
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =2838
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2508
                            Width =2460
                            Height =330
                            Name ="OprettetDato_Label"
                            Caption ="OprettetDato"
                            LayoutCachedLeft =342
                            LayoutCachedTop =2508
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2838
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2907
                    Width =1860
                    Height =330
                    ColumnWidth =1860
                    TabIndex =8
                    Name ="Status"
                    ControlSource ="Status"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2907
                    LayoutCachedWidth =4752
                    LayoutCachedHeight =3237
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2907
                            Width =2460
                            Height =330
                            Name ="Status_Label"
                            Caption ="Status"
                            LayoutCachedLeft =342
                            LayoutCachedTop =2907
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3237
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =3306
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =9
                    Name ="SendtDato"
                    ControlSource ="SendtDato"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3306
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =3636
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3306
                            Width =2460
                            Height =330
                            Name ="SendtDato_Label"
                            Caption ="SendtDato"
                            LayoutCachedLeft =342
                            LayoutCachedTop =3306
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3636
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =6859
                    Top =3344
                    Height =315
                    TabIndex =10
                    Name ="ID"
                    ControlSource ="ID"

                    LayoutCachedLeft =6859
                    LayoutCachedTop =3344
                    LayoutCachedWidth =8560
                    LayoutCachedHeight =3659
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8334
                    Top =2154
                    Height =315
                    TabIndex =6
                    Name ="KM"
                    ControlSource ="KM"

                    LayoutCachedLeft =8334
                    LayoutCachedTop =2154
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =2469
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6633
                            Top =2154
                            Width =375
                            Height =315
                            Name ="Label15"
                            Caption ="KM"
                            LayoutCachedLeft =6633
                            LayoutCachedTop =2154
                            LayoutCachedWidth =7008
                            LayoutCachedHeight =2469
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8277
                    Top =2777
                    Height =315
                    TabIndex =1
                    Name ="Year_"
                    ControlSource ="Year_"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"

                    LayoutCachedLeft =8277
                    LayoutCachedTop =2777
                    LayoutCachedWidth =9978
                    LayoutCachedHeight =3092
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6576
                            Top =2777
                            Width =1140
                            Height =315
                            Name ="Label16"
                            Caption ="År grundlag"
                            LayoutCachedLeft =6576
                            LayoutCachedTop =2777
                            LayoutCachedWidth =7716
                            LayoutCachedHeight =3092
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7143
                    Top =3968
                    Height =315
                    TabIndex =5
                    Name ="OGrad"
                    ControlSource ="OGrad"
                    Format ="Percent"
                    ControlTipText ="Indtast f.eks. \"4,5\" - ikke % tegn"

                    LayoutCachedLeft =7143
                    LayoutCachedTop =3968
                    LayoutCachedWidth =8844
                    LayoutCachedHeight =4283
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5442
                            Top =3968
                            Width =1200
                            Height =315
                            Name ="Label17"
                            Caption ="Oversk Grad"
                            LayoutCachedLeft =5442
                            LayoutCachedTop =3968
                            LayoutCachedWidth =6642
                            LayoutCachedHeight =4283
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =8333
                    Top =4478
                    Height =315
                    ColumnWidth =2055
                    TabIndex =11
                    Name ="Afdeling"
                    ControlSource ="Afdeling"

                    LayoutCachedLeft =8333
                    LayoutCachedTop =4478
                    LayoutCachedWidth =10034
                    LayoutCachedHeight =4793
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6632
                            Top =4478
                            Width =870
                            Height =315
                            Name ="Label18"
                            Caption ="Afdeling"
                            LayoutCachedLeft =6632
                            LayoutCachedTop =4478
                            LayoutCachedWidth =7502
                            LayoutCachedHeight =4793
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3458
                    Top =4025
                    Height =315
                    TabIndex =12
                    Name ="BeregnType"
                    ControlSource ="BeregnType"

                    LayoutCachedLeft =3458
                    LayoutCachedTop =4025
                    LayoutCachedWidth =5159
                    LayoutCachedHeight =4340
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1757
                            Top =4025
                            Width =1185
                            Height =315
                            Name ="Label19"
                            Caption ="BeregnType"
                            LayoutCachedLeft =1757
                            LayoutCachedTop =4025
                            LayoutCachedWidth =2942
                            LayoutCachedHeight =4340
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="FormFooter"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "frmPrisberegning_subform.cls"
