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
  IdHashMessageDigest;

type
  TDataModule1 = class(TDataModule)
    Windows10: TStyleBook;
    Windows10StaleGrey: TStyleBook;
    FDCmnd_Drop_Patient: TFDCommand;
    FDCommand1: TFDCommand;
    FDConnection1: TFDConnection;
    FDConnection2: TFDConnection;
    FDQ_Commune: TFDQuery;
    FDQ_Entreprise: TFDQuery;
    FDQ_Groupage: TFDQuery;
    FDQ_Ordonnance: TFDQuery;
    FDQ_Patient: TFDQuery;
    FDQ_Patient_Table: TFDQuery;
    FDQ_Recherche: TFDQuery;
    FDQ_Status_Patient: TFDQuery;
    FDQ_Wilaya: TFDQuery;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    function GenerateID: String;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

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

function Encryt(Str: string): string;
var
  Md5: TIdHashMessageDigest5;
  Hash: string;
begin
  Md5 := TIdHashMessageDigest5.Create;
  Hash := Md5.HashStringAsHex(Str);
  Result := Hash;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  Path, PathInf, DirPath, HexPass, Db_Entrprise: string;
  Contact, Patient, Biochimie, Entreprise, Hemogramme, Hemostase_VS, Serologie,
    Ordonnance: String;
  Rand: String;
  bol: Boolean;
begin
  // Asigne Tables to Varibales
  Entreprise :=
    ('CREATE TABLE `Entreprise` (`ID_EntreP` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,`Form_Juridique`	varchar ( 10 ),'
    + '`Libelle`	varchar ( 40 ),`Libelle_Sec`	varchar ( 40 ),`Wilaya`	varchar ( 20 ),`Code_de_Wilaya`	Integer ( 3 ),`Commune`	varchar ( 20 ),'
    + '`Code_Postal`	Integer ( 7 ),`Adresse`	varchar ( 100 ),`Telephone`	Integer ( 13 ),`Mobile`	Integer ( 13 ),`Fax`	Integer ( 13 ),`Email`	varchar ( 30 ),`Web`	varchar ( 40 ));');
  Contact :=
    ('CREATE TABLE `User` (`ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,`Nom`	varchar ( 20 ),`Pseudo`	varchar ( 10 ),`Mot_de_pass`	varchar ( 12 ));');
  Patient :=
    ('CREATE TABLE `Patient` (`Patient_ID` varchar ( 7 ) NOT NULL UNIQUE,`Nom`	Varchar ( 15 ),`Prenom`	varchar ( 20 ),`Date_de_Nai`	varchar ( 10 ),`Date_de_Entre`	varchar ( 10 ),`Type`	varchar ( 100 ),`Sexe`	varchar ( 5 ),`Etat_Civil`	varchar ( 13 ),'
    + '`Wilaya`	varchar ( 20 ),`Commune`	varchar ( 20 ),`Adresse`	varchar ( 50 ),`Mobile`	INTEGER,`Email`	varchar ( 35 ),`Groupage`	varchar ( 5 ),`Telephone`	Integer ( 9 ),`Fax`	Integer ( 13 ),`Type_Index`	INTEGER,`Sexe_Index`	INTEGER,`Etat_Civil_Index`	INTEGER,'
    + '`Groupage_Index`	INTEGER,`Wilaya_Index`	Integer,`Commune_Index`	Integer, PRIMARY KEY(`Patient_ID`));');
  Biochimie :=
    ('CREATE TABLE `Biochimie` (`Biochimi_ID`	varchar ( 7 ) NOT NULL UNIQUE,`Glycemie`	INTEGER,`Uree_Sang`	INTEGER,`Createnine`	INTEGER,`Cholesterole`	INTEGER,`Triglycerides`	INTEGER,`HDL`	INTEGER,'
    + '`LDL`	INTEGER,`Acide_Urique`	INTEGER,`CRP`	INTEGER,`TGO`	INTEGER,`TGP`	INTEGER,`PAL`	INTEGER,`TP`	INTEGER,`INR`	INTEGER,`BilirubineT`	INTEGER,`BilirubineD`	INTEGER,`ASLO`	INTEGER,'
    + '	`Calcemie`	INTEGER,`Albuminemie`	INTEGER,`Patient_ID`	varchar ( 7 ),PRIMARY KEY(`Biochimi_ID`),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE);');
  Hemogramme :=
    ('CREATE TABLE `Hemogramme` (`HemoG_ID`	varchar ( 7 ) NOT NULL UNIQUE,`Hematies`	INTEGER,`Hemoglobine`	INTEGER,`Hematocrite`	INTEGER,`VGM`	INTEGER,`TCMH`	INTEGER,`CCMH`	INTEGER,'
    + '`Leucocytes`	INTEGER,`Reticulocytes`	INTEGER,`Patient_ID`	varchar ( 7 ),PRIMARY KEY(`HemoG_ID`),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE);');
  Hemostase_VS :=
    ('CREATE TABLE `Hemostase_VS` (`HemoS_VS_ID` varchar ( 7 ) NOT NULL UNIQUE,`TS`	INTEGER,`TCK`	INTEGER,`TP`	INTEGER,'
    + '`VS`	INTEGER,`Note`	BLOB,`Patient_ID`	varchar ( 7 ),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE,PRIMARY KEY(`HemoS_VS_ID`));');
  Serologie :=
    ('CREATE TABLE `Serologie` (`Serologie_ID`	varchar ( 7 ) NOT NULL UNIQUE,`HA_Anti-VHA`	boolean,`HA_IgG`	boolean,`HA_IgM`	boolean,'
    + '`HB_Anti-VHB`	Boolean,`HB_Antigene_HBs`	boolean,`HC_Anit-VHC`	boolean,`VIH_Anti-VIH`	boolean,`RUB_Anti_M`	boolean,`RUB_Anti_A`	boolean,'
    + '`RUB_Anti_G`	boolean,`Salm_Anti_H`	boolean,`Salm_Anti_O`	boolean,`Mono_Anti_EBV`	boolean,`Mono_Anti_G_Anti_VCA`	boolean,`Mono_Anti_G_Anti_EBNA`	boolean,`Mono_Anti_G_Anti_EA`	boolean,'
    + '`Toxo_Anti_M`	boolean,`Patient_ID` varchar ( 7 ),PRIMARY KEY(`Serologie_ID`),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE);');
  Ordonnance :=
    ('CREATE TABLE `Ordonnance` (`Ordo_ID`	varchar(7) NOT NULL UNIQUE,`Medicament`	varchar(150),`Dose`	INTEGER,`Prise`	INTEGER,`Jour`	INTEGER,`Pendent`	INTEGER,'
    + '`Patient_ID`	varchar(7),PRIMARY KEY(`Ordo_ID`),FOREIGN KEY(`Patient_ID`) REFERENCES `Patient`(`Patient_ID`) ON DELETE CASCADE);');
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
    FDQuery1.SQL.Text := ('Select * From User');
    FDQuery1.Active := True;
  except
    on E: Exception do
    begin
      FDQuery1.Close;
      try
        FDCommand1.Connection := FDConnection1;
        FDCommand1.CommandText.Text :=
          (Contact + Patient + Biochimie + Entreprise + Hemogramme +
          Hemostase_VS + Serologie + Ordonnance);
        FDCommand1.Execute();
        with FDQuery1 do
        begin
          // Anitialise the Admin account
          HexPass := Encryt('admin'); // Encrypt Admin password
          SQL.Text := ('Select * From User');
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
          Post;
          Active := False;
        end;
      except
        on E: Exception do

      end;
    end;
  end;
  // Groupage Table
  FDQ_Groupage.Active := True;
  // Patient Table
  FDQ_Patient.Active := True;
  // Main patient Table
  FDQ_Patient_Table.Active := True;
  // Search Query
  // FDQ_Recherche.Active := True;
end;

end.
