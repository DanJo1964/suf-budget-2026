dbMemo "SQL" ="INSERT INTO tblTmpGLTrans ( [Date], Account, AccountType, Dimension1, Dimension2"
    ", Dimension3, Dimension4, Dimension5, Amount, Debit, Credit, Name, Year_, Date_,"
    " User_ )\015\012SELECT tmpGLTransClient_48928.Date, tmpGLTransClient_48928.Accou"
    "nt, tmpGLTransClient_48928.AccountType, tmpGLTransClient_48928.Dimension1, tmpGL"
    "TransClient_48928.Dimension2, tmpGLTransClient_48928.Dimension3, tmpGLTransClien"
    "t_48928.Dimension4, tmpGLTransClient_48928.Dimension5, tmpGLTransClient_48928.Am"
    "ount, tmpGLTransClient_48928.Debit, tmpGLTransClient_48928.Credit, tmpGLTransCli"
    "ent_48928.Text, tmpGLTransClient_48928.Year_, tmpGLTransClient_48928.Date_, tmpG"
    "LTransClient_48928.User_\015\012FROM tmpGLTransClient_48928;\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Dimension5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.User_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Dimension4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Date_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Dimension3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Year_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Dimension2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Text"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Dimension1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Credit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.AccountType"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Debit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Account"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Amount"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmpGLTransClient_48928.Date"
        dbLong "AggregateType" ="-1"
    End
End
