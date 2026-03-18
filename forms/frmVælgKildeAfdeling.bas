Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    Modal = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    ControlBox = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =3514
    DatasheetFontHeight =11
    ItemSuffix =6
    Left =14535
    Top =4470
    Right =28725
    Bottom =18720
    RecSrcDt = Begin
        0xd19a82060f63e640
    End
    Caption =" "
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
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
        Begin Section
            Height =2607
            BackColor =13485442
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin CommandButton
                    Cancel = NotDefault
                    OverlapFlags =85
                    Left =1809
                    Top =1650
                    Width =1251
                    Height =405
                    Name ="Command0"
                    Caption ="Annullér"
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
                                "nterfaceMacro For=\"Command0\" xmlns=\"http://schemas.microsoft.com/office/acces"
                                "sservices/2009/11/application\"><Statements><Action Name=\"CloseWindow\"/></Stat"
                                "ements></UserInterfaceMacro>"
                        End
                    End

                    LayoutCachedLeft =1809
                    LayoutCachedTop =1650
                    LayoutCachedWidth =3060
                    LayoutCachedHeight =2055
                    PictureCaptionArrangement =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                End
                Begin CommandButton
                    Default = NotDefault
                    OverlapFlags =85
                    Left =340
                    Top =1650
                    Width =1251
                    Height =405
                    TabIndex =1
                    Name ="cmdOK"
                    Caption ="OK"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =340
                    LayoutCachedTop =1650
                    LayoutCachedWidth =1591
                    LayoutCachedHeight =2055
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =4472
                    Left =225
                    Top =1026
                    Width =2955
                    Height =315
                    TabIndex =2
                    Name ="cboSrcAfd"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [tblAfdeling].[AfdNr Uniconta], [tblAfdeling].[AfdelingsNavn] FROM tblAfd"
                        "eling ORDER BY [AfdNr Uniconta]; "
                    ColumnWidths ="1680;2790"

                    LayoutCachedLeft =225
                    LayoutCachedTop =1026
                    LayoutCachedWidth =3180
                    LayoutCachedHeight =1341
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =225
                    Top =570
                    Width =2955
                    Height =345
                    FontSize =12
                    FontWeight =700
                    Name ="lblBudgetAar"
                    Caption ="Vælg afdeling som grundlag"
                    GroupTable =1
                    VerticalAnchor =1
                    LayoutCachedLeft =225
                    LayoutCachedTop =570
                    LayoutCachedWidth =3180
                    LayoutCachedHeight =915
                    LayoutGroup =1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    GroupTable =1
                End
            End
        End
    End
End
CodeBehindForm
' See "frmVælgKildeAfdeling.cls"
