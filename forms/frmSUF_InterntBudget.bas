Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =31680
    DatasheetFontHeight =11
    ItemSuffix =319
    Left =4005
    Top =3030
    Right =23340
    Bottom =14895
    OnUnload ="[Event Procedure]"
    RecSrcDt = Begin
        0xcab52c20537ce640
    End
    RecordSource ="tblPrisberegning"
    Caption ="Internt Budget"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
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
        Begin OptionButton
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
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            BorderThemeColorIndex =1
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            BorderShade =65.0
            ShowPageHeaderAndPageFooter =1
        End
        Begin UnboundObjectFrame
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
        Begin CustomControl
            OldBorderStyle =1
            Width =4536
            Height =2835
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ToggleButton
            Width =283
            Height =283
            FontName ="Calibri"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =2
            Bevel =1
            BackThemeColorIndex =4
            BackTint =60.0
            OldBorderStyle =0
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
            PressedForeThemeColorIndex =1
        End
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            CanGrow = NotDefault
            Height =3514
            BackColor =13485442
            Name ="Formularhoved"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    BackStyle =0
                    IMESentenceMode =3
                    Left =21477
                    Width =2898
                    Height =315
                    ColumnOrder =0
                    Name ="Auto_dato"
                    ControlSource ="=Date()"
                    Format ="Long Date"

                    LayoutCachedLeft =21477
                    LayoutCachedWidth =24375
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                End
                Begin Image
                    Left =300
                    Top =60
                    Width =1185
                    Height =880
                    Name ="Auto_logo0"
                    Picture ="SUF logo.jpg"
                    GroupTable =1
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

                    LayoutCachedLeft =300
                    LayoutCachedTop =60
                    LayoutCachedWidth =1485
                    LayoutCachedHeight =940
                    TabIndex =21
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8895
                    Top =2640
                    Width =1140
                    Height =345
                    ColumnOrder =1
                    TabIndex =17
                    Name ="txtBoxFBSamlet"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =8895
                    LayoutCachedTop =2640
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =2985
                    RowStart =5
                    RowEnd =5
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =2
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =5160
                            Top =2640
                            Width =3675
                            Height =345
                            FontSize =12
                            FontWeight =700
                            ForeColor =16777215
                            Name ="Label36"
                            Caption ="Samlet fællesbidrag"
                            GroupTable =2
                            LayoutCachedLeft =5160
                            LayoutCachedTop =2640
                            LayoutCachedWidth =8835
                            LayoutCachedHeight =2985
                            RowStart =5
                            RowEnd =5
                            ColumnEnd =2
                            LayoutGroup =2
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =2
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8895
                    Top =3045
                    Width =1140
                    Height =345
                    ColumnOrder =2
                    TabIndex =18
                    Name ="txtBoxFBpct"
                    Format ="Percent"
                    AfterUpdate ="[Event Procedure]"
                    GroupTable =2

                    LayoutCachedLeft =8895
                    LayoutCachedTop =3045
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =3390
                    RowStart =6
                    RowEnd =6
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =2
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =5160
                            Top =3045
                            Width =3675
                            Height =345
                            FontSize =12
                            FontWeight =700
                            ForeColor =16777215
                            Name ="Label38"
                            Caption ="Fællesbidr. % af omsætning"
                            GroupTable =2
                            LayoutCachedLeft =5160
                            LayoutCachedTop =3045
                            LayoutCachedWidth =8835
                            LayoutCachedHeight =3390
                            RowStart =6
                            RowEnd =6
                            ColumnEnd =2
                            LayoutGroup =2
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =2
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =2610
                    Left =5442
                    Top =56
                    Width =3126
                    Height =450
                    ColumnOrder =8
                    FontSize =12
                    TabIndex =1
                    Name ="cboAfdelingUni"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT PrisberegningNavn FROM tblPrisberegning WHERE BudgetAar = 2026 ORDER BY P"
                        "risberegningNavn; "
                    ColumnWidths ="5"
                    AfterUpdate ="[Event Procedure]"

                    LayoutCachedLeft =5442
                    LayoutCachedTop =56
                    LayoutCachedWidth =8568
                    LayoutCachedHeight =506
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =8670
                    Top =60
                    Width =1365
                    Height =450
                    ColumnOrder =7
                    FontSize =12
                    TabIndex =2
                    Name ="cboYearIntBud"
                    RowSourceType ="Value List"
                    RowSource ="2023;2024;2025;2026;2027;2028;2029;2030;2031;2032;2033;2034;2035;2036;2037;2038;"
                        "2039;2040"
                    ColumnWidths ="1442"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Vælg det budgetår du ønsker at se!"
                    GroupTable =3
                    VerticalAnchor =1

                    LayoutCachedLeft =8670
                    LayoutCachedTop =60
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =510
                    LayoutGroup =3
                    GroupTable =3
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =17580
                    Top =510
                    Width =1935
                    Height =360
                    TabIndex =4
                    Name ="btnCreateLines"
                    Caption ="Opret nyt år"
                    OnClick ="[Event Procedure]"
                    GroupTable =4
                    VerticalAnchor =1

                    LayoutCachedLeft =17580
                    LayoutCachedTop =510
                    LayoutCachedWidth =19515
                    LayoutCachedHeight =870
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
                Begin CommandButton
                    OverlapFlags =85
                    Left =17580
                    Top =930
                    Width =1935
                    Height =570
                    TabIndex =5
                    Name ="btnIndt"
                    Caption ="Overfør / Opdatér Indtægter"
                    OnClick ="[Event Procedure]"
                    GroupTable =4
                    VerticalAnchor =1

                    LayoutCachedLeft =17580
                    LayoutCachedTop =930
                    LayoutCachedWidth =19515
                    LayoutCachedHeight =1500
                    RowStart =1
                    RowEnd =1
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
                Begin CommandButton
                    OverlapFlags =85
                    Left =17580
                    Top =1560
                    Width =1935
                    Height =570
                    TabIndex =6
                    Name ="btnLøn"
                    Caption ="Overfør / Opdatér Lønninger"
                    OnClick ="[Event Procedure]"
                    GroupTable =4
                    VerticalAnchor =1

                    LayoutCachedLeft =17580
                    LayoutCachedTop =1560
                    LayoutCachedWidth =19515
                    LayoutCachedHeight =2130
                    RowStart =2
                    RowEnd =2
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
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =19575
                    Top =510
                    Width =1395
                    Height =360
                    FontSize =12
                    FontWeight =700
                    LeftMargin =57
                    TopMargin =57
                    ForeColor =16777215
                    Name ="lblUpdDte01"
                    GroupTable =4
                    VerticalAnchor =1
                    LayoutCachedLeft =19575
                    LayoutCachedTop =510
                    LayoutCachedWidth =20970
                    LayoutCachedHeight =870
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =4
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =4
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =19575
                    Top =930
                    Width =1395
                    Height =570
                    FontSize =12
                    FontWeight =700
                    TopMargin =113
                    ForeColor =16777215
                    Name ="lblUpdDte02"
                    Caption ="28-01-2026"
                    GroupTable =4
                    VerticalAnchor =1
                    LayoutCachedLeft =19575
                    LayoutCachedTop =930
                    LayoutCachedWidth =20970
                    LayoutCachedHeight =1500
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =4
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =4
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =19575
                    Top =1560
                    Width =1395
                    Height =570
                    FontSize =12
                    FontWeight =700
                    TopMargin =113
                    ForeColor =16777215
                    Name ="lblUpdDte03"
                    Caption ="28-01-2026"
                    GroupTable =4
                    VerticalAnchor =1
                    LayoutCachedLeft =19575
                    LayoutCachedTop =1560
                    LayoutCachedWidth =20970
                    LayoutCachedHeight =2130
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =4
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =4
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =19575
                    Top =2190
                    Width =1395
                    Height =360
                    FontSize =12
                    FontWeight =700
                    TopMargin =113
                    ForeColor =16777215
                    Name ="lblUpdDte04"
                    GroupTable =4
                    VerticalAnchor =1
                    LayoutCachedLeft =19575
                    LayoutCachedTop =2190
                    LayoutCachedWidth =20970
                    LayoutCachedHeight =2550
                    RowStart =3
                    RowEnd =3
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =4
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =4
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =10771
                    Top =400
                    Width =6066
                    Height =2940
                    TabIndex =3
                    Name ="tbxKommentarer"
                    TextFormat =1

                    LayoutCachedLeft =10771
                    LayoutCachedTop =400
                    LayoutCachedWidth =16837
                    LayoutCachedHeight =3340
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =10771
                            Width =6060
                            Height =315
                            FontWeight =700
                            ForeColor =16777215
                            Name ="Label113"
                            Caption ="Indtast kommentarer"
                            LayoutCachedLeft =10771
                            LayoutCachedWidth =16831
                            LayoutCachedHeight =315
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                        End
                    End
                End
                Begin ToggleButton
                    OverlapFlags =85
                    TextFontCharSet =177
                    TextFontFamily =0
                    Left =17580
                    Top =2190
                    Width =1935
                    Height =360
                    FontSize =11
                    FontWeight =400
                    TabIndex =7
                    Name ="tglSumOnOff"
                    Caption ="ALLE linjer"
                    OnClick ="[Event Procedure]"
                    GroupTable =4
                    VerticalAnchor =1

                    LayoutCachedLeft =17580
                    LayoutCachedTop =2190
                    LayoutCachedWidth =19515
                    LayoutCachedHeight =2550
                    RowStart =3
                    RowEnd =3
                    LayoutGroup =4
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Shape =1
                    Bevel =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    OldBorderStyle =1
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedColor =12219066
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    GroupTable =4
                    Overlaps =1
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =23754
                    Top =566
                    Height =315
                    TabIndex =8
                    Name ="tbxIBRecId"

                    LayoutCachedLeft =23754
                    LayoutCachedTop =566
                    LayoutCachedWidth =25455
                    LayoutCachedHeight =881
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =23754
                    Top =963
                    Height =315
                    TabIndex =20
                    Name ="tbxRegRecID"

                    LayoutCachedLeft =23754
                    LayoutCachedTop =963
                    LayoutCachedWidth =25455
                    LayoutCachedHeight =1278
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8895
                    Top =2235
                    Width =1140
                    Height =345
                    TabIndex =16
                    Name ="tbxOverskudsGrad"
                    Format ="Standard"
                    OnGotFocus ="[Event Procedure]"
                    GroupTable =2

                    LayoutCachedLeft =8895
                    LayoutCachedTop =2235
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =2580
                    RowStart =4
                    RowEnd =4
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =2
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =5160
                            Top =2235
                            Width =3675
                            Height =345
                            FontSize =12
                            FontWeight =700
                            ForeColor =16777215
                            Name ="Label135"
                            Caption ="Overskudsgrad"
                            GroupTable =2
                            LayoutCachedLeft =5160
                            LayoutCachedTop =2235
                            LayoutCachedWidth =8835
                            LayoutCachedHeight =2580
                            RowStart =4
                            RowEnd =4
                            ColumnEnd =2
                            LayoutGroup =2
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =2
                        End
                    End
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    Left =345
                    Top =1185
                    Width =2895
                    Height =1695
                    FontSize =18
                    FontWeight =700
                    ForeColor =2366701
                    Name ="lblArbejder"
                    Caption ="Overfører \015\012debitorposter... "
                    GroupTable =5
                    LayoutCachedLeft =345
                    LayoutCachedTop =1185
                    LayoutCachedWidth =3240
                    LayoutCachedHeight =2880
                    LayoutGroup =5
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =5
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =21480
                    Top =900
                    Width =1935
                    Height =630
                    TabIndex =19
                    Name ="btnExpToExcel"
                    Caption ="Overfør til \015\012hovedbudget"
                    OnClick ="[Event Procedure]"
                    GroupTable =6
                    VerticalAnchor =1

                    LayoutCachedLeft =21480
                    LayoutCachedTop =900
                    LayoutCachedWidth =23415
                    LayoutCachedHeight =1530
                    LayoutGroup =6
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =7616884
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    HoverColor =12219066
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    GroupTable =6
                End
                Begin TextBox
                    Locked = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8895
                    Top =630
                    Width =1140
                    Height =345
                    TabIndex =9
                    Name ="txtPBAntalPladser"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =8895
                    LayoutCachedTop =630
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =975
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =2
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            TextAlign =1
                            Left =5160
                            Top =630
                            Width =3675
                            Height =345
                            FontSize =12
                            FontWeight =700
                            ForeColor =16777215
                            Name ="lblPBAntalPladser"
                            Caption ="Antal ønskede pladser"
                            GroupTable =2
                            LayoutCachedLeft =5160
                            LayoutCachedTop =630
                            LayoutCachedWidth =8835
                            LayoutCachedHeight =975
                            ColumnEnd =2
                            LayoutGroup =2
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =2
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6495
                    Top =1425
                    Width =1140
                    Height =345
                    TabIndex =10
                    Name ="txtPBMdrTakstMO"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =6495
                    LayoutCachedTop =1425
                    LayoutCachedWidth =7635
                    LayoutCachedHeight =1770
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    GroupTable =2
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            TextAlign =1
                            Left =5160
                            Top =1425
                            Width =1275
                            Height =345
                            FontSize =12
                            FontWeight =700
                            ForeColor =16777215
                            Name ="lblMoverskud"
                            Caption ="m overskud"
                            GroupTable =2
                            LayoutCachedLeft =5160
                            LayoutCachedTop =1425
                            LayoutCachedWidth =6435
                            LayoutCachedHeight =1770
                            RowStart =2
                            RowEnd =2
                            LayoutGroup =2
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =2
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8895
                    Top =1425
                    Width =1140
                    Height =345
                    TabIndex =12
                    Name ="txtPBTimePrisMO"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =8895
                    LayoutCachedTop =1425
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =1770
                    RowStart =2
                    RowEnd =2
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7695
                    Top =1425
                    Width =1140
                    Height =345
                    TabIndex =11
                    Name ="txtPBDøgnTakstMO"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =7695
                    LayoutCachedTop =1425
                    LayoutCachedWidth =8835
                    LayoutCachedHeight =1770
                    RowStart =2
                    RowEnd =2
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8895
                    Top =1830
                    Width =1140
                    Height =345
                    TabIndex =15
                    Name ="txtPBTimePrisUO"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =8895
                    LayoutCachedTop =1830
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =2175
                    RowStart =3
                    RowEnd =3
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7695
                    Top =1830
                    Width =1140
                    Height =345
                    TabIndex =14
                    Name ="txtPBDøgnTakstUO"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =7695
                    LayoutCachedTop =1830
                    LayoutCachedWidth =8835
                    LayoutCachedHeight =2175
                    RowStart =3
                    RowEnd =3
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    GroupTable =2
                End
                Begin TextBox
                    DecimalPlaces =0
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6495
                    Top =1830
                    Width =1140
                    Height =345
                    TabIndex =13
                    Name ="txtPBMdrTakstUO"
                    Format ="Standard"
                    GroupTable =2

                    LayoutCachedLeft =6495
                    LayoutCachedTop =1830
                    LayoutCachedWidth =7635
                    LayoutCachedHeight =2175
                    RowStart =3
                    RowEnd =3
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    GroupTable =2
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            TextAlign =1
                            Left =5160
                            Top =1830
                            Width =1275
                            Height =345
                            FontSize =12
                            FontWeight =700
                            ForeColor =16777215
                            Name ="lblUoverskud"
                            Caption ="u overskud"
                            GroupTable =2
                            LayoutCachedLeft =5160
                            LayoutCachedTop =1830
                            LayoutCachedWidth =6435
                            LayoutCachedHeight =2175
                            RowStart =3
                            RowEnd =3
                            LayoutGroup =2
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GroupTable =2
                        End
                    End
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    Left =8895
                    Top =1035
                    Width =1140
                    Height =330
                    FontSize =12
                    FontWeight =700
                    ForeColor =16777215
                    Name ="lblTimePris"
                    Caption ="Time"
                    GroupTable =2
                    LayoutCachedLeft =8895
                    LayoutCachedTop =1035
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =1365
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    Left =7695
                    Top =1035
                    Width =1140
                    Height =330
                    FontSize =12
                    FontWeight =700
                    ForeColor =16777215
                    Name ="lblDagPris"
                    Caption ="Dag"
                    GroupTable =2
                    LayoutCachedLeft =7695
                    LayoutCachedTop =1035
                    LayoutCachedWidth =8835
                    LayoutCachedHeight =1365
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    TextAlign =2
                    Left =6495
                    Top =1035
                    Width =1140
                    Height =330
                    FontSize =12
                    FontWeight =700
                    ForeColor =16777215
                    Name ="lblMdrPris"
                    Caption ="Mdr"
                    GroupTable =2
                    LayoutCachedLeft =6495
                    LayoutCachedTop =1035
                    LayoutCachedWidth =7635
                    LayoutCachedHeight =1365
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    Left =5160
                    Top =1035
                    Width =1275
                    Height =330
                    FontSize =12
                    FontWeight =700
                    ForeColor =16777215
                    Name ="lblPrisPr"
                    Caption ="Pris pr."
                    GroupTable =2
                    LayoutCachedLeft =5160
                    LayoutCachedTop =1035
                    LayoutCachedWidth =6435
                    LayoutCachedHeight =1365
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =2
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    GroupTable =2
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =13823
            BackColor =14871513
            Name ="Detaljesektion"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Subform
                    OverlapFlags =247
                    Width =31615
                    Height =13200
                    Name ="frmTmpInterntBudget"
                    SourceObject ="Form.frmTmpInterntBudget"

                    LayoutCachedWidth =31615
                    LayoutCachedHeight =13200
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =29707
                    Top =1303
                    Height =315
                    TabIndex =1
                    Name ="tbxHiddenRegID"

                    LayoutCachedLeft =29707
                    LayoutCachedTop =1303
                    LayoutCachedWidth =31408
                    LayoutCachedHeight =1618
                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =4074796
            Name ="Formularfod"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
    End
End
CodeBehindForm
' See "frmSUF_InterntBudget.cls"
