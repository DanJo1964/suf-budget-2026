Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    PictureType =2
    GridY =10
    Width =7427
    DatasheetFontHeight =11
    ItemSuffix =52
    Right =20595
    Bottom =10950
    RecSrcDt = Begin
        0x98803795cb23e640
    End
    OnDirty ="[Event Procedure]"
    RecordSource ="tblUnicontaFirmaID"
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
        Begin FormHeader
            Height =315
            BackColor =7616884
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =93
                    Width =1710
                    Height =315
                    Name ="Label35"
                    Caption ="FirmaID"
                    LayoutCachedWidth =1710
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =223
                    Left =1700
                    Width =2835
                    Height =315
                    Name ="Label36"
                    Caption ="Firmanavn"
                    LayoutCachedLeft =1700
                    LayoutCachedWidth =4535
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =87
                    Left =4535
                    Width =1410
                    Height =315
                    Name ="Label49"
                    Caption ="Med i budget"
                    LayoutCachedLeft =4535
                    LayoutCachedWidth =5945
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =5952
                    Width =1410
                    Height =315
                    Name ="Label51"
                    Caption ="Fremskriv Pct"
                    LayoutCachedLeft =5952
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            Height =315
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =4535
                    Height =315
                    TabIndex =5
                    Name ="InklBudget"
                    ControlSource ="InklBudget"

                    LayoutCachedLeft =4535
                    LayoutCachedWidth =6236
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2777
                    Height =315
                    TabIndex =3
                    Name ="UserModified"
                    ControlSource ="UserModified"

                    LayoutCachedLeft =2777
                    LayoutCachedWidth =4478
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =2097
                    Height =315
                    TabIndex =2
                    Name ="DateModified"
                    ControlSource ="DateModified"

                    LayoutCachedLeft =2097
                    LayoutCachedWidth =3798
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =93
                    IMESentenceMode =3
                    Height =315
                    Name ="Konto"
                    ControlSource ="FirmaID"

                    LayoutCachedWidth =1701
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =1700
                    Width =2826
                    Height =315
                    TabIndex =1
                    Name ="Navn"
                    ControlSource ="FirmaNavn"

                    LayoutCachedLeft =1700
                    LayoutCachedWidth =4526
                    LayoutCachedHeight =315
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =255
                    DecimalPlaces =0
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2880
                    Left =4535
                    Height =315
                    TabIndex =4
                    Name ="cboInklBudget"
                    ControlSource ="InklBudget"
                    RowSourceType ="Value List"
                    RowSource ="0;\"Nej\";1;\"Ja\""
                    ColumnWidths ="0;567"
                    ControlTipText ="Skal dette firma med i budget beregningen for dette år?"
                    Format ="Standard"

                    LayoutCachedLeft =4535
                    LayoutCachedWidth =6236
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =119
                    IMESentenceMode =3
                    Left =6236
                    Width =1191
                    Height =315
                    TabIndex =6
                    Name ="FremskPct"
                    ControlSource ="FremskPct"
                    Format ="Standard"

                    LayoutCachedLeft =6236
                    LayoutCachedWidth =7427
                    LayoutCachedHeight =315
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
' See "frmParm_UnicontaFirmaID.cls"
