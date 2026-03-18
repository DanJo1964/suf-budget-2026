Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    FilterOn = NotDefault
    OrderByOn = NotDefault
    DataEntry = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =5
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =17575
    DatasheetFontHeight =11
    ItemSuffix =512
    Left =-120
    Top =-120
    Right =28620
    Bottom =14955
    AfterInsert ="[Event Procedure]"
    Filter ="[Year_] = 2026"
    OrderBy ="[tblAfdeling].[AfdNr Uniconta]"
    RecSrcDt = Begin
        0x3f1a13a8ab23e640
    End
    RecordSource ="tblAfdeling"
    BeforeInsert ="[Event Procedure]"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    SplitFormOrientation =1
    SplitFormSize =5955
    SplitFormPrinting =1
    SplitFormOrientation =1
    SplitFormSize =5955
    SplitFormPrinting =1
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =1203
            BackColor =13485442
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =1275
                    Top =105
                    Width =4245
                    Height =1065
                    FontSize =18
                    FontWeight =700
                    Name ="Auto_hoved0"
                    Caption ="Oversigt over alle afdelinger"
                    FontName ="Calibri Light"
                    GroupTable =3
                    LayoutCachedLeft =1275
                    LayoutCachedTop =105
                    LayoutCachedWidth =5520
                    LayoutCachedHeight =1170
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                    GroupTable =3
                End
                Begin Image
                    Left =30
                    Top =105
                    Width =1185
                    Height =1065
                    Name ="Auto_logo0"
                    Picture ="SUF logo.jpg"
                    GroupTable =3
                    ImageData = Begin
                        0xffd8ffe000104a46494600010201006000600000fffe00124c454144544f4f4c ,
                        0x53207632322e3000ffdb0084000505050805080c07070c0c0909090c0d0c0c0c ,
                        0x0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d ,
                        0x0d0d0d0d0d0d0d0d0d0d0d0d0d010508080a070a0c07070c0d0c0a0c0d0d0d0d ,
                        0x0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d ,
                        0x0d0d0d0d0d0d0d0d0d0d0d0d0d0dffc401a20000010501010101010100000000 ,
                        0x000000000102030405060708090a0b0100030101010101010101010000000000 ,
                        0x000102030405060708090a0b100002010303020403050504040000017d010203 ,
                        0x00041105122131410613516107227114328191a1082342b1c11552d1f0243362 ,
                        0x7282090a161718191a25262728292a3435363738393a434445464748494a5354 ,
                        0x55565758595a636465666768696a737475767778797a838485868788898a9293 ,
                        0x9495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8 ,
                        0xc9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9fa11 ,
                        0x0002010204040304070504040001027700010203110405213106124151076171 ,
                        0x1322328108144291a1b1c109233352f0156272d10a162434e125f11718191a26 ,
                        0x2728292a35363738393a434445464748494a535455565758595a636465666768 ,
                        0x696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5 ,
                        0xa6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9da ,
                        0xe2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffc0001108004400880301110002 ,
                        0x1101031101ffda000c03010002110311003f00f50af60f880a009e3b59a5198d ,
                        0x1d87aaa93fc852ba5bb45a84a5f0c5bf44c64913c27122b21f46047f3a69a7b0 ,
                        0x9a71d1a6bd5588e8242800a002800a002800a002800a002800a002800a009218 ,
                        0x9e7758a31b9dc8551ea4f0286ecaeca8c5c9a8c776ec8f55d27c396fa7a86914 ,
                        0x4b3639661900fa283c0c7af53ec0e2bce9d472db447d351c2c292bc9294bab7b ,
                        0x2f45faee745d2b03bc6491a4a36ba8653d98023f234f6d84d2968d26bcce07c5 ,
                        0x5a5d9594625897cb9646c055385231963b7a00381f2e0648aeca52949d9ea91e ,
                        0x1e32952a71528ab49bd96de7a7f958e634550f7b0ab004191720f20fe15d13d2 ,
                        0x2fd0f3a82bd5827b7323d7fec507fcf38ffef85ff0af3399f77f79f55ece1fcb ,
                        0x1fb91e41ad284bd995400048d803803f0af4e1f0af43e56bab559a5a2e666655 ,
                        0x9cc6ff00861164d4235701810fc1008fb8dd8d635748bb797e677611275a29ab ,
                        0xad77f467a9fd8a0ff9e71ffdf0bfe15e7f33eefef3e97d9c3f963f723c4a7189 ,
                        0x1c0fef37f335eaad91f1f2f89fab3d6b45b585ec61668d09318c92aa49fc715e ,
                        0x74db527abdcfa7a108ba506e2be15d11a7f6283fe79c7ff7c2ff008567ccfbbf ,
                        0xbce9f670fe58fdc83ec507fcf38ffef85ff0a399f77f787b387f2c7ee457bcd3 ,
                        0xe19609116340591802154104a9c638eb9aa8c9a69ddee673a517192515769ad9 ,
                        0x763c56bd43e40e97c271ac97ea5bf815987d718fe449ac2abb44f470693aaafd ,
                        0x136bd76fd4f56af38fa63c8753d66f269dc191e30acca11495000246303193ea ,
                        0x4f35e9c61149688f95ab5ea4a6ef26acdab276b59f9115aebf7d6872b2b30fee ,
                        0xb9de3f5e47e041a6e9c5f4fbb426189ab4f6937e4f55f8fe83757d5e4d5dd5dc ,
                        0x04d8bb4004e33d49e7d7d3b003934420a9ab2156acebb526ad656b2fc589a1ff ,
                        0x00c7f41ff5d1689fc2fd030ffc587f891ecd5e59f5a78ceb9ff1fd3ffd746af5 ,
                        0x21f0af43e4b11fc59ff899955a1ca743e15ff908c7f47ffd01ab1abf03f97e67 ,
                        0x7e0ff8d1f9fe4cf5aaf34fa83c2ae3fd6bff00bcdfccd7aeb647c5cbe27eaff3 ,
                        0x3d8343ff008f083feb9ad7993f89fa9f5787fe143fc28e7fc617735af91e43bc ,
                        0x7bbcccec62b9c6cc6704671938fad6f45277ba4f6fd4e0c6ce50e4e49357e6bd ,
                        0x9b5fcbd8e27fb5af3fe7bcdff7f1bfc6bab923d97dc8f1fdb54fe797fe04ff00 ,
                        0xcc3fb5af3fe7bcdff7f1bfc68e48f65f720f6d53f9e5ff00813ff333eacc0d0d ,
                        0x2af7fb3aea3b8e4843f301dd48c37e878f7c544e3cd17137a353d94e33e89ebe ,
                        0x8f467b343325c20962219186411fe7f31dba1af2dab68cfae8c9492945dd3d8c ,
                        0x3d5bc396fa9e645fdd4c7f8c0e0ffbcbc67ea307d738c56d0a8e1a6ebb1c55b0 ,
                        0xb0adef2f765dd75f55faee79d6a3a35ce967f7cb94ecebca9fc7b1f6383e95db ,
                        0x19a9edbf63c1ab42747e25a775b7fc0f99955a1ca6ae87ff001fd07fd745ace7 ,
                        0xf0bf43ab0ffc587f891ecd5e59f5a78ceb9ff1fd3ffd746af521f0af43e4b11f ,
                        0xc59ff899955a1ca743e15ff908c7f47ffd01ab1abf03f97e677e0ff8d1f9fe4c ,
                        0xf5aaf34fa83c2ae3fd6bff00bcdfccd7aeb647c5cbe27eaff33d8343ff008f08 ,
                        0x3feb9ad7993f89fa9f5787fe143fc28c7f14e9771a9793f665dfe5f99bb9518d ,
                        0xdb31d48f435ad29285f9bcbf5393174a75793d9abdb9afaa5bdbbfa1c87fc22f ,
                        0xa8ff00cf2ffc7d3ff8aae9f6b0eff833cafaa56fe5fc57f9987246d131461865 ,
                        0x2411e841c1fd6b6df5471b4e2da7bad1fc8650485006ae97acdc694d988e509f ,
                        0x991bee9f7f63ee3f1c8e2b39414f7dfb9d54abce83f776ea9edff01f99e93a67 ,
                        0x886d752c283e54a7f81f83ff00013d1bf9fb570ca9ca1e6bb9f414b134eae89f ,
                        0x2cbb3fd1f5fcfc8db745914a380cac304119047a1158edb1d8d26acf55d8f3ef ,
                        0x1078656dd5aeacc6117978ff00ba3bb2fb0ee3b751c703b69d5bfbb2f933c2c4 ,
                        0xe11413a94b65bc7b79af2f239cd0ff00e3fa0ffae8b5bcfe17e87061ff008b0f ,
                        0xf123d9abcb3eb4f19d73fe3fa7ff00ae8d5ea43e15e87c9623f8b3ff001332ab ,
                        0x4394e87c2bff002118fe8fff00a0356357e07f2fccefc1ff001a3f3fc99eb55e ,
                        0x69f507855c7fad7ff79bf99af5d6c8f8b97c4fd5fe67b0687ff1e107fd735af3 ,
                        0x27f13f53eaf0ff00c287f85166ef50b7b0dbf68711efcedce79c633d076c8fce ,
                        0xa545cbe157349d4852b73b4afb7c8a7ff09069ff00f3dd3f5ff0abf672eccc7e ,
                        0xb347f9d7e2797eb2627bc95edd83c6edb811d32c0337e4c48af42175149e8cf9 ,
                        0xcafcaea49c1de2ddefebabfc4ccab39828014a95382304763c503db4625023bc ,
                        0xf0b6b73cd30b39c9914a92ac7965da33827bae0719e41c0e95c956092e65a1ed ,
                        0xe12bca52f633d559d9f556fd0ef994302a46411820f706b88f6f7d19e3766459 ,
                        0xea29fdd8e703f00f8fe55ea3f7a0fcd7e87c9c2d4eb2eca76f95ec7b2d7967d6 ,
                        0x9e43e24b76b7bf9770c0721d4fa861d47e391f515e9d2778af2d0f95c545c2ac ,
                        0xafd755f3ff0083730ab5388eafc1f6c65bc337f0c28493eedf281f9127f0ae7a ,
                        0xced1b773d4c1439aa73748a7f7bd3fccf4f66080b31c00324fa015e79f44ddb5 ,
                        0x67844adbdd9bd493f99af61687c5b776df99ec7a1ffc7841ff005cd6bcb9fc4f ,
                        0xd4facc3ff0a1fe1472fe38ff00977ffb6bff00b4eba287daf97ea79b8fff0097 ,
                        0x7ff6f7feda7035d878614005005cd3edbed9711c1d048e01f619e4fe0326a64f ,
                        0x9537d91ad387b49c61dda5f2ebf81ec375a65ade80278d5f0300e30c07a06182 ,
                        0x07e35e6294a3b3b1f573a50a9a4e29fe7f7ad4c07f06d9939569547a0653fcd7 ,
                        0x3f9e6b6f6d2f2389e069f4725f35fe46c69ba2db69593003bc8c17639623d3b0 ,
                        0x03e807bd6529b9eff71d54a84287c0b5eef726d4afd34d81a77c7030a3fbcdd9 ,
                        0x47d7bfa0c9a518b93b22ead45460e6fe4bbbe88f15672ec5cf524927dcf35eae ,
                        0xda1f20dddddee7acf87f585d4a00ae7f7f18c383d4e380e3d73dfd0fe19f36a4 ,
                        0x391e9b3dbfc8fa8c35755a367f1adfcfcfe7f997f51d2adf544d93af2bf75870 ,
                        0xcbf43fcc1047b66a23370d8daad1856569af46b7473a3c156e0e4cb26df4c283 ,
                        0xf9e3fa56feddf64707d4217f8a56f91d45958c3a7c6218176af53ea4fa93dc9f ,
                        0xff00560573ca4e4eecf4a9d38d28f241597e7e6ce6bc53ac2dbc46ce220cb28c ,
                        0x3e3f810f5cfbb0e00f4c9f4cef4a177ccf65b7a9e7e2eba845d28fc4f7f25fe6 ,
                        0xff002f91e695de7ce9ecda1ffc7841ff005cd6bcb9fc4fd4faec3ff0a1fe1472 ,
                        0xfe38ff00977ffb6bff00b4eba287daf97ea79b8fff00977ff6f7feda7035d878 ,
                        0x61400500391da260e84ab29c820e083ea08e947931a6e2ee9d9aea8ea2d3c5f7 ,
                        0x96e36ca1661eadf2b7d32bc7e6a4fbd73ba317b687a50c6d48692b4bd747f7af ,
                        0xf236d3c6d091f3c2ea7d01523f33b7f9565ec1f468ec58f8f5835e8d3ff22bdc ,
                        0x78d8e3104383eaed9ffc7540ff00d0a9aa1ddfdc672c7ff243ef7fa2ff00338f ,
                        0xbed467d45fccb862c4741d1547a003a7f33dc9aea8c543489e554ab3aaf9a6ef ,
                        0xdbb2f4452aa31258667b771244c51d79041c114349e8f62a32707cd1766baa3a ,
                        0xeb4f19cf100b711acb8fe207631f73c15cfd0015cae8afb2edf89eac31d28e93 ,
                        0x8a979ad1feabf2344f8da1c710be7fde18fcf1fd2a3d83ee8e8fafc7f91fde8c ,
                        0x8bdf185d5c2948156007b83b9bf024003ebb73e86b48d18adf5392a636725682 ,
                        0x51f3ddfdff00f00e5198b92cc4924e493c927d49ae9d8f31bbeaf71b408ebacb ,
                        0xc5b25940900895846a172588ce3f0ae6951526ddf73d5a78c74e2a0a29d95b73 ,
                        0x3759d6db58f2f7208fcadd8c1273bb6fa81d36d69087b3bd9ee73d7c43c472dd ,
                        0x5b96fd6fbdbfc8c3ad4e20a002800a002800a002800a002800a002800a002800 ,
                        0xa002800a002800a002800a00ffd9
                    End

                    LayoutCachedLeft =30
                    LayoutCachedTop =105
                    LayoutCachedWidth =1215
                    LayoutCachedHeight =1170
                    TabIndex =3
                    LayoutGroup =2
                    GroupTable =3
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =10032
                    Top =282
                    Width =1632
                    Height =648
                    Name ="btnAddRecord"
                    Caption ="Opret ny afdeling"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =10032
                    LayoutCachedTop =282
                    LayoutCachedWidth =11664
                    LayoutCachedHeight =930
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
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =5669
                    Top =569
                    Width =1425
                    Height =468
                    FontSize =12
                    TabIndex =1
                    Name ="cboYear"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"
                    ColumnWidths ="1440"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =5669
                    LayoutCachedTop =569
                    LayoutCachedWidth =7094
                    LayoutCachedHeight =1037
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =5670
                    Top =105
                    Width =1440
                    Height =405
                    Name ="cboYear_navn"
                    Caption ="Budget år"
                    GroupTable =4
                    VerticalAnchor =1
                    LayoutCachedLeft =5670
                    LayoutCachedTop =105
                    LayoutCachedWidth =7110
                    LayoutCachedHeight =510
                    LayoutGroup =3
                    GroupTable =4
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    Left =7365
                    Top =390
                    Width =2340
                    Height =510
                    FontSize =18
                    FontWeight =700
                    ForeColor =2366701
                    Name ="lblArbejder"
                    Caption ="Arbejder..."
                    GroupTable =5
                    LayoutCachedLeft =7365
                    LayoutCachedTop =390
                    LayoutCachedWidth =9705
                    LayoutCachedHeight =900
                    LayoutGroup =4
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =5
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =15874
                    Top =283
                    Height =315
                    TabIndex =2
                    Name ="txtHiddenControl"

                    LayoutCachedLeft =15874
                    LayoutCachedTop =283
                    LayoutCachedWidth =17575
                    LayoutCachedHeight =598
                End
            End
        End
        Begin Section
            Height =4988
            BackColor =14871513
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3420
                    Top =1965
                    Width =3900
                    Height =630
                    ColumnWidth =2232
                    ColumnOrder =4
                    TabIndex =5
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Adresse"
                    ControlSource ="Adresse"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3420
                    LayoutCachedTop =1965
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =2595
                    RowStart =3
                    RowEnd =3
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =30
                            Top =1965
                            Width =3330
                            Height =630
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label6"
                            Caption ="Adresse"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =30
                            LayoutCachedTop =1965
                            LayoutCachedWidth =3360
                            LayoutCachedHeight =2595
                            RowStart =3
                            RowEnd =3
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3420
                    Top =885
                    Width =3900
                    Height =390
                    ColumnWidth =2955
                    ColumnOrder =1
                    TabIndex =1
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Afdeling"
                    ControlSource ="Afdeling"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3420
                    LayoutCachedTop =885
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =1275
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =30
                            Top =885
                            Width =3330
                            Height =390
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label9"
                            Caption ="Afdelingsnr. i Visma løn"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =30
                            LayoutCachedTop =885
                            LayoutCachedWidth =3360
                            LayoutCachedHeight =1275
                            RowStart =1
                            RowEnd =1
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10770
                    Top =885
                    Width =3765
                    Height =390
                    ColumnWidth =3024
                    ColumnOrder =2
                    TabIndex =2
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Afdelingsleder"
                    ControlSource ="Afdelingsleder"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10770
                    LayoutCachedTop =885
                    LayoutCachedWidth =14535
                    LayoutCachedHeight =1275
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =7380
                            Top =885
                            Width =3330
                            Height =390
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label12"
                            Caption ="Afdelingsleder"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =7380
                            LayoutCachedTop =885
                            LayoutCachedWidth =10710
                            LayoutCachedHeight =1275
                            RowStart =1
                            RowEnd =1
                            ColumnStart =2
                            ColumnEnd =2
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3420
                    Top =1455
                    Width =3900
                    Height =330
                    ColumnWidth =3555
                    ColumnOrder =3
                    TabIndex =3
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="AfdelingsNavn"
                    ControlSource ="AfdelingsNavn"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3420
                    LayoutCachedTop =1455
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =1785
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =30
                            Top =1455
                            Width =3330
                            Height =330
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label15"
                            Caption ="Afdelingsnavn"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =30
                            LayoutCachedTop =1455
                            LayoutCachedWidth =3360
                            LayoutCachedHeight =1785
                            RowStart =2
                            RowEnd =2
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3420
                    Top =315
                    Width =3900
                    Height =390
                    ColumnWidth =2625
                    ColumnOrder =0
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="AfdNr Uniconta"
                    ControlSource ="AfdNr Uniconta"
                    EventProcPrefix ="AfdNr_Uniconta"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3420
                    LayoutCachedTop =315
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =705
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =30
                            Top =315
                            Width =3330
                            Height =390
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label18"
                            Caption ="Afdelingsnr. i Uniconta"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =30
                            LayoutCachedTop =315
                            LayoutCachedWidth =3360
                            LayoutCachedHeight =705
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3420
                    Top =2775
                    Width =3900
                    Height =570
                    ColumnWidth =2820
                    ColumnOrder =5
                    TabIndex =7
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="PostBy"
                    ControlSource ="PostBy"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3420
                    LayoutCachedTop =2775
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =3345
                    RowStart =4
                    RowEnd =4
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =30
                            Top =2775
                            Width =3330
                            Height =570
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label42"
                            Caption ="Postnummer og By"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =30
                            LayoutCachedTop =2775
                            LayoutCachedWidth =3360
                            LayoutCachedHeight =3345
                            RowStart =4
                            RowEnd =4
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3420
                    Top =3525
                    Width =3900
                    Height =885
                    ColumnWidth =3888
                    ColumnOrder =6
                    TabIndex =10
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Tlf_Mail"
                    ControlSource ="Tlf_Mail"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =3420
                    LayoutCachedTop =3525
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =4410
                    RowStart =5
                    RowEnd =5
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =30
                            Top =3525
                            Width =3330
                            Height =885
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label57"
                            Caption ="Telefonnr./Mail adresse \015\012(husk skråstreg)"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =30
                            LayoutCachedTop =3525
                            LayoutCachedWidth =3360
                            LayoutCachedHeight =4410
                            RowStart =5
                            RowEnd =5
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =12660
                    Top =2775
                    Width =1875
                    Height =570
                    ColumnWidth =2220
                    ColumnOrder =8
                    TabIndex =9
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="UnicontaFirmanavn"
                    ControlSource ="UnicontaFirmanavn"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =12660
                    LayoutCachedTop =2775
                    LayoutCachedWidth =14535
                    LayoutCachedHeight =3345
                    RowStart =4
                    RowEnd =4
                    ColumnStart =5
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =11805
                            Top =2775
                            Width =795
                            Height =570
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label63"
                            Caption ="Uniconta Navn \015\012"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =11805
                            LayoutCachedTop =2775
                            LayoutCachedWidth =12600
                            LayoutCachedHeight =3345
                            RowStart =4
                            RowEnd =4
                            ColumnStart =4
                            ColumnEnd =4
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10770
                    Top =1455
                    Width =3765
                    Height =330
                    ColumnOrder =9
                    TabIndex =4
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Text384"
                    ControlSource ="Year_"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10770
                    LayoutCachedTop =1455
                    LayoutCachedWidth =14535
                    LayoutCachedHeight =1785
                    RowStart =2
                    RowEnd =2
                    ColumnStart =3
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =7380
                            Top =1455
                            Width =3330
                            Height =330
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label385"
                            Caption ="Budgetår"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =7380
                            LayoutCachedTop =1455
                            LayoutCachedWidth =10710
                            LayoutCachedHeight =1785
                            RowStart =2
                            RowEnd =2
                            ColumnStart =2
                            ColumnEnd =2
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10770
                    Top =1965
                    Width =1830
                    Height =630
                    TabIndex =6
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="DatoFra"
                    ControlSource ="DatoFra"
                    Format ="Short Date"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10770
                    LayoutCachedTop =1965
                    LayoutCachedWidth =12600
                    LayoutCachedHeight =2595
                    RowStart =3
                    RowEnd =3
                    ColumnStart =3
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =7380
                            Top =1965
                            Width =3330
                            Height =630
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label415"
                            Caption ="DatoFra"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =7380
                            LayoutCachedTop =1965
                            LayoutCachedWidth =10710
                            LayoutCachedHeight =2595
                            RowStart =3
                            RowEnd =3
                            ColumnStart =2
                            ColumnEnd =2
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =10770
                    Top =2775
                    Width =975
                    Height =570
                    ColumnWidth =1965
                    TabIndex =8
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Text440"
                    ControlSource ="UnicontaFirmaID"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =10770
                    LayoutCachedTop =2775
                    LayoutCachedWidth =11745
                    LayoutCachedHeight =3345
                    RowStart =4
                    RowEnd =4
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =7380
                            Top =2775
                            Width =3330
                            Height =570
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label441"
                            Caption ="Uniconta FirmaID"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =7380
                            LayoutCachedTop =2775
                            LayoutCachedWidth =10710
                            LayoutCachedHeight =3345
                            RowStart =4
                            RowEnd =4
                            ColumnStart =2
                            ColumnEnd =2
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =13665
                    Top =3525
                    Width =870
                    Height =885
                    TabIndex =12
                    Name ="FB_Aktiv"
                    ControlSource ="FB_Aktiv"
                    DefaultValue ="1"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =13665
                    LayoutCachedTop =3525
                    LayoutCachedWidth =14535
                    LayoutCachedHeight =4410
                    RowStart =5
                    RowEnd =5
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =12660
                            Top =3525
                            Width =945
                            Height =885
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label477"
                            Caption ="Aktiv = 1"
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =12660
                            LayoutCachedTop =3525
                            LayoutCachedWidth =13605
                            LayoutCachedHeight =4410
                            RowStart =5
                            RowEnd =5
                            ColumnStart =5
                            ColumnEnd =5
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =11805
                    Top =3525
                    Width =795
                    Height =885
                    TabIndex =11
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="FB_AfdNr"
                    ControlSource ="FB_AfdNr"
                    GroupTable =1
                    BottomPadding =150

                    LayoutCachedLeft =11805
                    LayoutCachedTop =3525
                    LayoutCachedWidth =12600
                    LayoutCachedHeight =4410
                    RowStart =5
                    RowEnd =5
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =10770
                            Top =3525
                            Width =975
                            Height =885
                            FontWeight =700
                            LeftMargin =44
                            TopMargin =22
                            RightMargin =44
                            BottomMargin =22
                            Name ="Label482"
                            Caption ="Afd. Nr."
                            GroupTable =1
                            BottomPadding =150
                            LayoutCachedLeft =10770
                            LayoutCachedTop =3525
                            LayoutCachedWidth =11745
                            LayoutCachedHeight =4410
                            RowStart =5
                            RowEnd =5
                            ColumnStart =3
                            ColumnEnd =3
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    Left =7380
                    Top =3525
                    Width =3330
                    Height =885
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="Label487"
                    Caption ="Fællesbidrag oplysninger"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =7380
                    LayoutCachedTop =3525
                    LayoutCachedWidth =10710
                    LayoutCachedHeight =4410
                    RowStart =5
                    RowEnd =5
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =7380
                    Top =315
                    Width =3330
                    Height =390
                    Name ="EmptyCell494"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =7380
                    LayoutCachedTop =315
                    LayoutCachedWidth =10710
                    LayoutCachedHeight =705
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =10770
                    Top =315
                    Width =3765
                    Height =390
                    Name ="EmptyCell495"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =10770
                    LayoutCachedTop =315
                    LayoutCachedWidth =14535
                    LayoutCachedHeight =705
                    ColumnStart =3
                    ColumnEnd =6
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =12660
                    Top =1965
                    Width =945
                    Height =630
                    Name ="EmptyCell509"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =12660
                    LayoutCachedTop =1965
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =2595
                    RowStart =3
                    RowEnd =3
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =13665
                    Top =1965
                    Width =870
                    Height =630
                    Name ="EmptyCell510"
                    GroupTable =1
                    BottomPadding =150
                    LayoutCachedLeft =13665
                    LayoutCachedTop =1965
                    LayoutCachedWidth =14535
                    LayoutCachedHeight =2595
                    RowStart =3
                    RowEnd =3
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
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
' See "frmAfdeling.cls"
