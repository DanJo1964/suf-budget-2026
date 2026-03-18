Version =20
VersionRequired =20
Begin Form
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
    Width =31680
    DatasheetFontHeight =11
    ItemSuffix =216
    Left =-10665
    Top =1785
    Right =20685
    Bottom =14715
    Filter ="[Year_] = 2026 AND Afdeling = '1 ny_v0' AND ([BudgetIalt] <> 0 OR [KontoType] = "
        "'Overskrift' OR [EstimatFremskrevet] <> 0 OR [EstimatForrigeÅr] <> 0)"
    OrderBy ="Konto"
    RecSrcDt = Begin
        0xecef44b91108e640
    End
    RecordSource ="tblInterntBudget"
    Caption ="frmTmpAfdDebitorBudget"
    DatasheetFontName ="Calibri"
    OnActivate ="[Event Procedure]"
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
            Height =293
            BackColor =7616884
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Width =996
                    Height =293
                    Name ="Label32"
                    Caption ="Konto"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedWidth =996
                    LayoutCachedHeight =293
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =990
                    Width =3525
                    Height =293
                    Name ="Label35"
                    Caption ="Kontonavn"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =990
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =293
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =4515
                    Width =1725
                    Height =293
                    Name ="Label42"
                    Caption ="Estimat nuv. år"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =4515
                    LayoutCachedWidth =6240
                    LayoutCachedHeight =293
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =6240
                    Width =1755
                    Height =293
                    Name ="Label49"
                    Caption ="Budg. nuv. år"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =6240
                    LayoutCachedWidth =7995
                    LayoutCachedHeight =293
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =7995
                    Width =1875
                    Height =293
                    Name ="Label56"
                    Caption ="Budget fremsk."
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =7995
                    LayoutCachedWidth =9870
                    LayoutCachedHeight =293
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =9870
                    Width =1695
                    Height =293
                    Name ="Label63"
                    Caption ="Reguleringer"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =9870
                    LayoutCachedWidth =11565
                    LayoutCachedHeight =293
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =11565
                    Width =2205
                    Height =293
                    Name ="Label70"
                    Caption ="Bemærkninger"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =11565
                    LayoutCachedWidth =13770
                    LayoutCachedHeight =293
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =13770
                    Width =1440
                    Height =293
                    Name ="Label101"
                    Caption ="Budget nyt år"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =13770
                    LayoutCachedWidth =15210
                    LayoutCachedHeight =293
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =15210
                    Width =1140
                    Height =293
                    Name ="Label102"
                    Caption ="Jan"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =15210
                    LayoutCachedWidth =16350
                    LayoutCachedHeight =293
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =16350
                    Width =1140
                    Height =293
                    Name ="Label115"
                    Caption ="Feb"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =16350
                    LayoutCachedWidth =17490
                    LayoutCachedHeight =293
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =17490
                    Width =1140
                    Height =293
                    Name ="Label162"
                    Caption ="Mar"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =17490
                    LayoutCachedWidth =18630
                    LayoutCachedHeight =293
                    ColumnStart =10
                    ColumnEnd =10
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =18630
                    Width =1140
                    Height =293
                    Name ="Label163"
                    Caption ="Apr"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =18630
                    LayoutCachedWidth =19770
                    LayoutCachedHeight =293
                    ColumnStart =11
                    ColumnEnd =11
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =19770
                    Width =1140
                    Height =293
                    Name ="Label164"
                    Caption ="Maj"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =19770
                    LayoutCachedWidth =20910
                    LayoutCachedHeight =293
                    ColumnStart =12
                    ColumnEnd =12
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =20910
                    Width =1140
                    Height =293
                    Name ="Label165"
                    Caption ="Jun"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =20910
                    LayoutCachedWidth =22050
                    LayoutCachedHeight =293
                    ColumnStart =13
                    ColumnEnd =13
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =22050
                    Width =1140
                    Height =293
                    Name ="Label166"
                    Caption ="Jul"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =22050
                    LayoutCachedWidth =23190
                    LayoutCachedHeight =293
                    ColumnStart =14
                    ColumnEnd =14
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =23190
                    Width =1140
                    Height =293
                    Name ="Label167"
                    Caption ="Aug"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =23190
                    LayoutCachedWidth =24330
                    LayoutCachedHeight =293
                    ColumnStart =15
                    ColumnEnd =15
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =24330
                    Width =1140
                    Height =293
                    Name ="Label168"
                    Caption ="Sep"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =24330
                    LayoutCachedWidth =25470
                    LayoutCachedHeight =293
                    ColumnStart =16
                    ColumnEnd =16
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =25470
                    Width =1140
                    Height =293
                    Name ="Label169"
                    Caption ="Okt"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =25470
                    LayoutCachedWidth =26610
                    LayoutCachedHeight =293
                    ColumnStart =17
                    ColumnEnd =17
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =26610
                    Width =1440
                    Height =293
                    Name ="Label170"
                    Caption ="Nov"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =26610
                    LayoutCachedWidth =28050
                    LayoutCachedHeight =293
                    ColumnStart =18
                    ColumnEnd =18
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =28050
                    Width =1140
                    Height =293
                    Name ="Label173"
                    Caption ="Dec"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =28050
                    LayoutCachedWidth =29190
                    LayoutCachedHeight =293
                    ColumnStart =19
                    ColumnEnd =19
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =29190
                    Width =120
                    Height =293
                    Name ="EmptyCell201"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =29190
                    LayoutCachedWidth =29310
                    LayoutCachedHeight =293
                    ColumnStart =20
                    ColumnEnd =20
                    LayoutGroup =1
                    GroupTable =1
                End
            End
        End
        Begin Section
            Height =300
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    TextAlign =2
                    IMESentenceMode =3
                    Width =996
                    Height =285
                    Name ="Konto"
                    ControlSource ="Konto"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedWidth =996
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =990
                    Width =3525
                    Height =285
                    TabIndex =1
                    Name ="Kontonavn"
                    ControlSource ="Kontonavn"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =990
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =4515
                    Width =1725
                    Height =285
                    TabIndex =2
                    Name ="EstimatForrigeÅr"
                    ControlSource ="EstimatForrigeÅr"
                    Format ="Standard"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =4515
                    LayoutCachedWidth =6240
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =6240
                    Width =1755
                    Height =285
                    TabIndex =3
                    Name ="RealForrigeÅr"
                    ControlSource ="RealForrigeÅr"
                    Format ="Standard"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =6240
                    LayoutCachedWidth =7995
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =7995
                    Width =1875
                    Height =285
                    TabIndex =4
                    Name ="EstimatFremskrevet"
                    ControlSource ="EstimatFremskrevet"
                    Format ="Standard"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =7995
                    LayoutCachedWidth =9870
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =9870
                    Width =1695
                    Height =285
                    TabIndex =5
                    Name ="Regulering"
                    ControlSource ="Regulering"
                    Format ="Standard"
                    OnDblClick ="[Event Procedure]"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =9870
                    LayoutCachedWidth =11565
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =11565
                    Width =2205
                    Height =285
                    TabIndex =6
                    Name ="Kommentarer"
                    ControlSource ="Kommentarer"
                    OnClick ="[Event Procedure]"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15
                    TextFormat =1

                    LayoutCachedLeft =11565
                    LayoutCachedWidth =13770
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =13770
                    Width =1440
                    Height =285
                    TabIndex =7
                    Name ="Text175"
                    ControlSource ="BudgetIalt"
                    Format ="Standard"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =13770
                    LayoutCachedWidth =15210
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =15210
                    Width =1140
                    Height =285
                    TabIndex =8
                    Name ="_1"
                    ControlSource ="_1"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_1"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =15210
                    LayoutCachedWidth =16350
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =16350
                    Width =1140
                    Height =285
                    TabIndex =9
                    Name ="_2"
                    ControlSource ="_2"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_2"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =16350
                    LayoutCachedWidth =17490
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =9
                    ColumnEnd =9
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =17490
                    Width =1140
                    Height =285
                    TabIndex =10
                    Name ="_3"
                    ControlSource ="_3"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_3"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =17490
                    LayoutCachedWidth =18630
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =10
                    ColumnEnd =10
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =18630
                    Width =1140
                    Height =285
                    TabIndex =11
                    Name ="_4"
                    ControlSource ="_4"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_4"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =18630
                    LayoutCachedWidth =19770
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =11
                    ColumnEnd =11
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =19770
                    Width =1140
                    Height =285
                    TabIndex =12
                    Name ="_5"
                    ControlSource ="_5"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_5"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =19770
                    LayoutCachedWidth =20910
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =12
                    ColumnEnd =12
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =20910
                    Width =1140
                    Height =285
                    TabIndex =13
                    Name ="_6"
                    ControlSource ="_6"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_6"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =20910
                    LayoutCachedWidth =22050
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =13
                    ColumnEnd =13
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =22050
                    Width =1140
                    Height =285
                    TabIndex =14
                    Name ="_7"
                    ControlSource ="_7"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_7"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =22050
                    LayoutCachedWidth =23190
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =14
                    ColumnEnd =14
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =23190
                    Width =1140
                    Height =285
                    TabIndex =15
                    Name ="_8"
                    ControlSource ="_8"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_8"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =23190
                    LayoutCachedWidth =24330
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =15
                    ColumnEnd =15
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =24330
                    Width =1140
                    Height =285
                    TabIndex =16
                    Name ="_9"
                    ControlSource ="_9"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_9"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =24330
                    LayoutCachedWidth =25470
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =16
                    ColumnEnd =16
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =25470
                    Width =1140
                    Height =285
                    TabIndex =17
                    Name ="_10"
                    ControlSource ="_10"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_10"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =25470
                    LayoutCachedWidth =26610
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =17
                    ColumnEnd =17
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =26610
                    Width =1440
                    Height =285
                    TabIndex =18
                    Name ="_11"
                    ControlSource ="_11"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_11"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =26610
                    LayoutCachedWidth =28050
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =18
                    ColumnEnd =18
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =95
                    TextAlign =3
                    IMESentenceMode =3
                    Left =28050
                    Width =1140
                    Height =285
                    TabIndex =19
                    Name ="_12"
                    ControlSource ="_12"
                    Format ="Standard"
                    EventProcPrefix ="Ctl_12"
                    ConditionalFormat = Begin
                        0x01000000be000000010000000100000000000000000000002e00000001010000 ,
                        0x00000000ffffff00000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x5b004b006f006e0074006f0074007900700065005d003d0022004f0076006500 ,
                        0x720073006b007200690066007400220020004f00720020005b004b006f006e00 ,
                        0x74006f0074007900700065005d003d002200530075006d00220000000000
                    End
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15

                    LayoutCachedLeft =28050
                    LayoutCachedWidth =29190
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =19
                    ColumnEnd =19
                    LayoutGroup =1
                    ConditionalFormat14 = Begin
                        0x01000100000001000000000000000101000000000000ffffff002d0000005b00 ,
                        0x4b006f006e0074006f0074007900700065005d003d0022004f00760065007200 ,
                        0x73006b007200690066007400220020004f00720020005b004b006f006e007400 ,
                        0x6f0074007900700065005d003d002200530075006d0022000000000000000000 ,
                        0x00000000000000000000000000
                    End
                    GroupTable =1
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =29535
                    Width =231
                    Height =285
                    TabIndex =20
                    Name ="ID"
                    ControlSource ="ID"

                    LayoutCachedLeft =29535
                    LayoutCachedWidth =29766
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =29925
                    Width =231
                    Height =285
                    TabIndex =21
                    Name ="ReguleringID"
                    ControlSource ="ReguleringID"

                    LayoutCachedLeft =29925
                    LayoutCachedWidth =30156
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =30330
                    Width =231
                    Height =285
                    TabIndex =22
                    Name ="Kontotype"
                    ControlSource ="Kontotype"

                    LayoutCachedLeft =30330
                    LayoutCachedWidth =30561
                    LayoutCachedHeight =285
                End
                Begin EmptyCell
                    Left =29190
                    Width =120
                    Height =285
                    Name ="EmptyCell213"
                    GroupTable =1
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =15
                    LayoutCachedLeft =29190
                    LayoutCachedWidth =29310
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =20
                    ColumnEnd =20
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =30614
                    Width =726
                    Height =286
                    TabIndex =23
                    Name ="tbxHiddenRegID"
                    Format ="General Number"

                    LayoutCachedLeft =30614
                    LayoutCachedWidth =31340
                    LayoutCachedHeight =286
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="Formularfod"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "frmTmpInterntBudget.cls"
