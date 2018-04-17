unit U_DataModule;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, FMX.Types,
  FMX.Controls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  IdHashMessageDigest, FireDAC.Phys.MSAccDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSAcc, FireDAC.Phys.ODBC, FireDAC.VCLUI.Wait;

type
  TDataModule1 = class(TDataModule)
    FDCmnd_Drop_Patient: TFDCommand;
    FDCommand1: TFDCommand;
    FDConnection1: TFDConnection;
    FDConnection2: TFDConnection;
    FDQ_Commune: TFDQuery;
    FDQ_Entreprise: TFDQuery;
    FDQ_Groupage: TFDQuery;
    FDQ_Patient: TFDQuery;
    FDQ_Patient_Table: TFDQuery;
    FDQ_Recherche: TFDQuery;
    FDQ_Status_Patient: TFDQuery;
    FDQ_Wilaya: TFDQuery;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDSQLiteSecurity1: TFDSQLiteSecurity;
    FDSQLiteBackup1: TFDSQLiteBackup;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConnection3: TFDConnection;
    FDQ_Homme: TFDQuery;
    FDQ_Femme: TFDQuery;
    procedure Init();
    procedure Param(const ID: String);
    function GenerateID: String;
    function Encryt(Str: string): string;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

Uses U_Main;
{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

function TDataModule1.GenerateID: String;
Var
  i, num: Integer;
  numbers: TList<Integer>;
  output: String;
Begin
  numbers := TList<Integer>.Create;
  for i := 1 to 6 do
  Begin
    num := random(9) + 1;
    numbers.Add(num);
  End;
  output := '';
  for num in numbers do
  Begin
    output := output + IntToStr(num);
  End;
  Result := output;
End;

function TDataModule1.Encryt(Str: string): string;
var
  Md5: TIdHashMessageDigest5;
  Hash: string;
begin
  Md5 := TIdHashMessageDigest5.Create;
  Hash := Md5.HashStringAsHex(Str);
  Result := Hash;
end;

procedure TDataModule1.Init();
Begin
  FDQ_Groupage.SQL.Text :=
    ('Select Nom, Prenom, Groupage From Patient Where Patient_ID="Null";');
  FDQ_Groupage.Active := True;
  // Patient Table
  FDQ_Patient.SQL.Clear;
  FDQ_Patient.SQL.Text :=
    ('Select Nom, Prenom,Type From Patient Where Patient_ID="Null";');
  FDQ_Patient.Active := True;
  // Main patient Table
  FDQ_Patient_Table.SQL.Clear;
  FDQ_Patient_Table.SQL.Text :=
    ('Select Patient_ID, Nom, Prenom, Date_de_Nai, Date_de_Entre, Type, Sexe, Etat_Civil, Wilaya, Commune, Adresse, Mobile, Email, Groupage, Telephone, Fax From Patient Where Patient_ID="Null";');
  FDQ_Patient_Table.Active := True;
  FDQ_Homme.SQL.Clear;
  FDQ_Homme.SQL.Text :=
    ('Select Nom,Prenom, Date_de_Entre From Patient Where Patient_ID="Null";');
  FDQ_Homme.Active := True;
  FDQ_Femme.SQL.Clear;
  FDQ_Femme.SQL.Text :=
    ('Select Nom,Prenom, Date_de_Entre From Patient Where Patient_ID="Null";');
  FDQ_Femme.Active := True;
End;

procedure TDataModule1.Param(const ID: String);
Var
  Rand: String;
  bol: Boolean;
Begin
  With FDQuery1 do
  Begin
    bol := False;
    SQL.Clear;
    SQL.Text := ('Select * From Parametre');
    Active := True;
    Insert;
    repeat
    Begin
      try
        Rand := GenerateID;
        Rand := 'R' + Rand;
        FieldByName('Param_ID').AsString := Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
      bol := False;
    End;
    until bol = False;
    FieldByName('Bar1').AsInteger := 10;
    FieldByName('Bar2').AsInteger := 10;
    FieldByName('Bar3').AsInteger := 10;
    FieldByName('Bar4').AsInteger := 10;
    FieldByName('HM').AsBoolean := True;
    FieldByName('HS').AsBoolean := True;
    FieldByName('Bio').AsBoolean := True;
    FieldByName('Serlg').AsBoolean := True;
    FieldByName('Theme').AsInteger := 0;
    FieldByName('Lang').AsString := ('FR');
    FieldByName('ID').AsString := ID;
    Post;
    Active := False;
    SQL.Clear;
  End;
End;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  Path, PathInf, DirPath, HexPass, Db_Entrprise: string;
  Contact, Patient, Biochimie, Entreprise, Hemogramme, Hemostase_VS, Serologie,
    Parametre: String;
  Rand: String;
  bol: Boolean;
begin
  // Asigne Tables to Varibales
  Entreprise :=
    ('CREATE TABLE `Etablissement` (`Etab_ID` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,`Form_Juridique`	varchar ( 10 ),'
    + '`Libelle`	varchar ( 40 ),`Libelle_Sec`	varchar ( 40 ),`Wilaya`	varchar ( 20 ),`Code_de_Wilaya`	Integer ( 3 ),`Commune`	varchar ( 20 ),'
    + '`Code_Postal`	Integer ( 7 ),`Adresse`	varchar ( 100 ),`Telephone`	Integer ( 9 ),`Mobile`	Integer ( 10 ),`Fax`	Integer ( 9 ),`Email`	varchar ( 30 ),`Web`	varchar ( 40 ));');
  Contact :=
    ('CREATE TABLE `Medecin` (`ID`	varchar( 7 ) NOT NULL UNIQUE,`Nom`	varchar ( 20 ),`Pseudo`	varchar ( 10 ),`Mot_de_pass`	varchar ( 64 ), `Privilege` boolean,Telephone Integer( 10 ),PRIMARY KEY(`ID`));');
  Patient :=
    ('CREATE TABLE `Patient` (`Patient_ID`	varchar ( 7 ) NOT NULL UNIQUE,`Nom`	Varchar ( 15 ),`Prenom`	varchar ( 20 ),`Date_de_Nai`	varchar ( 10 ),`Date_de_Entre`	varchar ( 10 ),`Type`	varchar ( 7 ),`Sexe`	varchar ( 5 ),`Etat_Civil`	varchar ( 13 ),'
    + '`Wilaya`	varchar ( 20 ),`Commune`	varchar ( 20 ),`Adresse`	varchar ( 100 ),`Mobile`	INTEGER,`Email`	varchar ( 35 ),`Groupage`	varchar ( 5 ),`Telephone`	Integer ( 9 ),`Fax`	Integer (13),`Type_Index`	INTEGER,`Sexe_Index`	INTEGER,`Etat_Civil_Index`	INTEGER,'
    + '`Groupage_Index`	INTEGER,`Wilaya_Index`	Integer,`Commune_Index`	Integer,`Image` BLOB,`ID`	varchar(7) NOT NULL, PRIMARY KEY(`Patient_ID`),FOREIGN KEY(`ID`) REFERENCES `Medecin`(`ID`) ON DELETE CASCADE);');
  Biochimie :=
    ('CREATE TABLE `Biochimie` (`Biochimi_ID`	varchar ( 7 ) NOT NULL UNIQUE,`Glycemie`	REAL,`Uree_Sang`	REAL,`Createnine`	REAL,`Cholesterole`	REAL,`Triglycerides`	REAL,`HDL`	REAL,'
    + '`LDL`	REAL,`Acide_Urique`	REAL,`CRP`	REAL,`TGO`	REAL,`TGP`	REAL,`PAL`	REAL,`TP`	REAL,`INR`	REAL,`BilirubineT`	REAL,`BilirubineD`	REAL,`ASLO`	REAL,'
    + '	`Calcemie`	REAL,`Albuminemie`	REAL,`Patient_ID`	varchar ( 7 ),PRIMARY KEY(`Biochimi_ID`),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE);');
  Hemogramme :=
    ('CREATE TABLE `Hemogramme` (`HemoG_ID`	varchar ( 7 ) NOT NULL UNIQUE,`Hematies`	REAL,`Hemoglobine`	REAL,`Hematocrite`	REAL,`VGM`	REAL,`TCMH`	REAL,`CCMH`	REAL,'
    + '`Leucocytes`	REAL,`Reticulocytes`	REAL,`Patient_ID`	varchar ( 7 ),PRIMARY KEY(`HemoG_ID`),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE);');
  Hemostase_VS :=
    ('CREATE TABLE `Hemostase_VS` (`HemoS_VS_ID` varchar ( 7 ) NOT NULL UNIQUE,`TS`	REAL,`TCK`	REAL,`TP`	REAL,'
    + '`VS`	REAL,`Note`	BLOB,`Patient_ID`	varchar ( 7 ),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE,PRIMARY KEY(`HemoS_VS_ID`));');
  Serologie :=
    ('CREATE TABLE `Serologie` (`Serologie_ID`	varchar ( 7 ) NOT NULL UNIQUE,`HA_Anti-VHA`	boolean,`HA_IgG`	boolean,`HA_IgM`	boolean,'
    + '`HB_Anti-VHB`	Boolean,`HB_Antigene_HBs`	boolean,`HC_Anit-VHC`	boolean,`VIH_Anti-VIH`	boolean,`RUB_Anti_M`	boolean,`RUB_Anti_A`	boolean,'
    + '`RUB_Anti_G`	boolean,`Salm_Anti_H`	boolean,`Salm_Anti_O`	boolean,`Mono_Anti_EBV`	boolean,`Mono_Anti_G_Anti_VCA`	boolean,`Mono_Anti_G_Anti_EBNA`	boolean,`Mono_Anti_G_Anti_EA`	boolean,'
    + '`Toxo_Anti_M`	boolean,`Patient_ID` varchar ( 7 ),PRIMARY KEY(`Serologie_ID`),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE);');
  Parametre :=
    ('CREATE TABLE `Parametre` (`Param_ID`	varchar ( 7 ) NOT NULL UNIQUE,`Bar1`	INTEGER,`Bar2`	INTEGER,`Bar3`	INTEGER,`Bar4`	INTEGER,`HM`	boolean,`HS`	boolean,`Bio`	boolean,'
    + '`Serlg`	boolean,`Theme`	INTEGER,`Lang`	varchar(20),`ID`	varchar(7),PRIMARY KEY(`Param_ID`),FOREIGN KEY(`ID`) REFERENCES `Medecin`(`ID`) ON DELETE CASCADE);');
  // Database Anitialse and Location
  DirPath := GetEnvironmentVariable('AppData');
  Path := (DirPath + '\SangyMed\Data.db');
  Db_Entrprise := ExpandFileName(GetCurrentDir() + '\Data\Entreprise.db');
  PathInf := ExpandFileName(DirPath + '\SangyMed\Alg_info.db');
  FDConnection1.Params.Add('Database=' + Path);
  FDConnection2.Params.Add('Database=' + PathInf);
  FDConnection1.Connected := True;
  FDConnection2.Connected := True;

  { ---------------| Test Database and Tables |------------------- }
  // Account Database and Tabes
  bol := False;
  try
    FDQuery1.Close;
    FDQuery1.SQL.Text := ('Select * From Medecin');
    FDQuery1.Active := True;
  except
    on E: Exception do
    begin
      FDQuery1.Close;
      try
        FDCommand1.Connection := FDConnection1;
        FDCommand1.CommandText.Text :=
          (Contact + Patient + Biochimie + Entreprise + Hemogramme +
          Hemostase_VS + Serologie + Parametre);
        FDCommand1.Execute();
        with FDQuery1 do
        begin
          // Anitialise the Admin account
          HexPass := Encryt('admin'); // Encrypt Admin password
          SQL.Text := ('Select * From Medecin');
          Active := True;
          Insert;
          repeat
          Begin
            try
              Rand := GenerateID;
              Rand := 'U' + Rand;
              FieldByName('ID').AsString := Rand;
            except
              on E: Exception do
              Begin
                bol := True;
              End;
            end;
            bol := False;
          End;
          until bol = False;
          FieldByName('Nom').AsString := ('Computer');
          FieldByName('Pseudo').AsString := ('admin');
          FieldByName('Mot_de_pass').AsString := HexPass;
          FieldByName('Privilege').AsBoolean := True;
          Post;
          Active := False;
          SQL.Clear;
          Param(Rand);
        end;
      except
        on E: Exception do
      end;
    end;
  end;
  // Groupage Table  Groupage_Index!="-1"
  Init();
  // Search Query
  // FDQ_Recherche.Active := True;
end;

end.
