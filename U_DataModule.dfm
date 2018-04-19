object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 444
  Width = 687
  object FDCmnd_Drop_Patient: TFDCommand
    Connection = FDConnection1
    CommandKind = skDrop
    Left = 16
    Top = 144
  end
  object FDCommand1: TFDCommand
    Connection = FDConnection1
    Left = 104
    Top = 8
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=sQLite')
    Connected = True
    LoginPrompt = False
    Left = 120
    Top = 160
  end
  object FDConnection2: TFDConnection
    Params.Strings = (
      'DriverID=sQLite')
    LoginPrompt = False
    Left = 296
    Top = 8
  end
  object FDQ_Commune: TFDQuery
    Connection = FDConnection2
    Left = 208
    Top = 232
  end
  object FDQ_Entreprise: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 64
  end
  object FDQ_Groupage: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'Select Nom, Prenom, Groupage From Patient Where Patient_ID="Null' +
        '"')
    Left = 128
    Top = 280
  end
  object FDQ_Patient: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select Nom, Prenom,Type From Patient Where Patient_ID="Null"')
    Left = 32
    Top = 336
  end
  object FDQ_Patient_Table: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'Select Patient_ID, Nom, Prenom, Date_de_Nai, Date_de_Entre, Type' +
        ', Sexe, Etat_Civil, Wilaya, Commune, Adresse, Mobile, Email, Gro' +
        'upage, Telephone, Fax From Patient Where Patient_ID="Null";')
    Left = 40
    Top = 280
  end
  object FDQ_Recherche: TFDQuery
    FilterOptions = [foCaseInsensitive]
    Connection = FDConnection1
    Left = 120
    Top = 336
  end
  object FDQ_Status_Patient: TFDQuery
    Connection = FDConnection1
    Left = 48
    Top = 224
  end
  object FDQ_Wilaya: TFDQuery
    Connection = FDConnection2
    Left = 136
    Top = 232
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 120
    Top = 88
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 176
    Top = 80
  end
  object FDSQLiteSecurity1: TFDSQLiteSecurity
    Left = 424
    Top = 360
  end
  object FDSQLiteBackup1: TFDSQLiteBackup
    WaitForLocks = False
    Catalog = 'MAIN'
    DestCatalog = 'MAIN'
    Left = 608
    Top = 352
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    OnDriverCreated = DataModuleCreate
    OnDriverDestroying = DataModuleCreate
    Left = 520
    Top = 376
  end
  object FDConnection3: TFDConnection
    Params.Strings = (
      'DriverID=sQLite')
    ResourceOptions.AssignedValues = [rvBackup]
    ResourceOptions.Backup = True
    LoginPrompt = False
    Left = 504
    Top = 24
  end
  object FDQ_Homme: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 384
  end
  object FDQ_Femme: TFDQuery
    Connection = FDConnection1
    Left = 120
    Top = 392
  end
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveDataSetReader1
    Writer = FDBatchMoveDataSetWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 592
    Top = 168
  end
  object FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter
    Left = 520
    Top = 208
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    Left = 536
    Top = 96
  end
  object FDConnection4: TFDConnection
    Params.Strings = (
      'DriverID=sQLite')
    LoginPrompt = False
    Left = 608
    Top = 24
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection3
    Left = 384
    Top = 88
  end
  object FDQuery4: TFDQuery
    Connection = FDConnection4
    Left = 440
    Top = 80
  end
end
