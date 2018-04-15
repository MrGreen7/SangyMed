object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 523
  Width = 818
  object FDCmnd_Drop_Patient: TFDCommand
    Connection = FDConnection1
    CommandKind = skDrop
    Left = 288
    Top = 192
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
    Left = 536
    Top = 32
  end
  object FDQ_Commune: TFDQuery
    Connection = FDConnection2
    Left = 592
    Top = 64
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
    Left = 616
    Top = 192
  end
  object FDQ_Wilaya: TFDQuery
    Connection = FDConnection2
    Left = 392
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 120
    Top = 88
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 224
    Top = 104
  end
  object FDSQLiteSecurity1: TFDSQLiteSecurity
    Left = 216
    Top = 24
  end
  object FDSQLiteBackup1: TFDSQLiteBackup
    Catalog = 'MAIN'
    DestCatalog = 'MAIN'
    Left = 592
    Top = 296
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 424
    Top = 288
  end
  object FDConnection3: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Kacemo\Desktop\Data.db'
      'ConnectionDef=sQLite_Demo')
    LoginPrompt = False
    Left = 416
    Top = 216
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
end
