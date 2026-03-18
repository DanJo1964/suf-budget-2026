Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    FilterOn = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    PictureType =2
    GridY =10
    Width =7426
    DatasheetFontHeight =11
    ItemSuffix =73
    Left =570
    Top =2550
    Right =7785
    Bottom =8460
    Filter ="Year_ = 2025"
    RecSrcDt = Begin
        0x3fa6a126af40e640
    End
    OnDirty ="[Event Procedure]"
    RecordSource ="tblParm_FB_Excel_Kti"
    Caption ="FirmaID"
    DatasheetFontName ="Calibri"
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =369
            BackColor =7616884
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    Left =180
                    Top =60
                    Width =1245
                    Height =285
                    Name ="Label49"
                    Caption ="Konto_1"
                    GroupTable =2
                    LayoutCachedLeft =180
                    LayoutCachedTop =60
                    LayoutCachedWidth =1425
                    LayoutCachedHeight =345
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    Left =1485
                    Top =60
                    Width =840
                    Height =285
                    Name ="Label52"
                    Caption ="Konto_2"
                    GroupTable =2
                    LayoutCachedLeft =1485
                    LayoutCachedTop =60
                    LayoutCachedWidth =2325
                    LayoutCachedHeight =345
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    Left =2385
                    Top =60
                    Width =3165
                    Height =285
                    Name ="Label59"
                    Caption ="KontoNavn"
                    GroupTable =2
                    LayoutCachedLeft =2385
                    LayoutCachedTop =60
                    LayoutCachedWidth =5550
                    LayoutCachedHeight =345
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    OverlapFlags =85
                    Left =5610
                    Top =60
                    Width =1710
                    Height =285
                    Name ="Label66"
                    Caption ="Special Minds Ref"
                    GroupTable =2
                    LayoutCachedLeft =5610
                    LayoutCachedTop =60
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =345
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =2
                End
            End
        End
        Begin Section
            Height =348
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =180
                    Top =30
                    Width =1245
                    Height =288
                    Name ="Konto_1"
                    ControlSource ="Konto_1"
                    GroupTable =2

                    LayoutCachedLeft =180
                    LayoutCachedTop =30
                    LayoutCachedWidth =1425
                    LayoutCachedHeight =318
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1485
                    Top =30
                    Width =840
                    Height =288
                    TabIndex =1
                    Name ="Konto_2"
                    ControlSource ="Konto_2"
                    GroupTable =2

                    LayoutCachedLeft =1485
                    LayoutCachedTop =30
                    LayoutCachedWidth =2325
                    LayoutCachedHeight =318
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2385
                    Top =30
                    Width =3165
                    Height =288
                    ColumnWidth =3855
                    TabIndex =2
                    Name ="KontoNavn"
                    ControlSource ="KontoNavn"
                    GroupTable =2

                    LayoutCachedLeft =2385
                    LayoutCachedTop =30
                    LayoutCachedWidth =5550
                    LayoutCachedHeight =318
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =2
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5610
                    Top =30
                    Width =1710
                    Height =288
                    TabIndex =3
                    Name ="Budg_Overskud"
                    ControlSource ="SpecialMinds_Ref"
                    GroupTable =2

                    LayoutCachedLeft =5610
                    LayoutCachedTop =30
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =318
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =2
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
' See "frmParm_FB_Excel_Kti.cls"
