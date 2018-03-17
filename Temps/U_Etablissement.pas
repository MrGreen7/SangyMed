unit U_Etablissement;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.StdCtrls, FMX.TabControl, FMX.Edit, FMX.ListBox,
  FMX.Controls.Presentation;

type
  TEtablissement = class(TBase_Form)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ID_Contact: TTabControl;
    TabItem1: TTabItem;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Edit_Code_Wilaya: TEdit;
    Edit_Code_Postal: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Edit_Code_WilayaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Etablissement: TEtablissement;

implementation

uses
  U_DataModule;
{$R *.fmx}

procedure WiliyaLoad(const Combo: TComboBox);
begin
  // Open Alg
  with DataModule1.FDQ_Wilaya do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('SELECT Nom FROM wilayas');
    Active := True;
    while not Eof do
    begin
      Combo.Items.Add(Fields.Fields[0].AsString);
      Next;
    end;
    SQL.Clear;
    Active := False;
  end;
end;

procedure CommuneLoad(const Edit: TEdit; const Combo: TComboBox);
var
  Code_P: string;
begin
  Code_P := Edit.Text; // Edit_Code_Wiliya
  Combo.Items.Clear; // Combobox3
  with DataModule1.FDQ_Commune do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('SELECT Nom FROM communes WHERE `Code_Wilaya`="' +
      Code_P + '"');
    Active := True;
    while not Eof do
    begin
      Combo.Items.Add(Fields.Fields[0].AsString); // Combobox3
      Next;
    end;
    SQL.Clear;
    Active := False;
  end;
end;

procedure TEtablissement.Button1Click(Sender: TObject);
begin
  inherited;
  if ((ComboBox1.Items.Text <> '') and (ComboBox2.Items.Text <> '') and
    (ComboBox3.Items.Text <> '') and (Edit1.Text <> '') and (Edit3.Text <> '')
    and (Edit_Code_Wilaya.Text <> '') and (Edit_Code_Postal.Text <> '')) then
  begin
    with DataModule1.FDQ_Entreprise do
    begin
      SQL.Clear;
      SQL.Text := (' Select * From Entreprise ');
      Active := True;
      Edit;
      FieldByName('Form_Juridique').AsString := ComboBox1.Selected.Text;
      FieldByName('Wilaya').AsString := ComboBox2.Selected.Text;
      FieldByName('Commune').AsString := ComboBox3.Selected.Text;
      FieldByName('Libelle').AsString := Edit1.Text;
      FieldByName('Libelle_Sec').AsString := Edit2.Text;
      FieldByName('Adresse').AsString := Edit3.Text;
      FieldByName('Telephone').AsString := Edit4.Text;
      FieldByName('Mobile').AsString := Edit5.Text;
      FieldByName('Fax').AsString := Edit6.Text;
      FieldByName('Email').AsString := Edit7.Text;
      FieldByName('Web').AsString := Edit8.Text;
      FieldByName('Code_de_Wilaya').Value := Edit_Code_Wilaya.Text;
      FieldByName('Code_Postal').Value := Edit_Code_Postal.Text;
      Post;
      SQL.Clear;
      Active := False;
    end;
  end;
  Showmessage('Les iformation a été Enregistrer');
  ModalResult := mrClose;
end;

procedure TEtablissement.Button2Click(Sender: TObject);
begin
  inherited;
  try
    ModalResult := mrCancel;
  except
    on E: Exception do
    begin
      Etablissement.Close;
    end;
  end;
end;

procedure TEtablissement.Button3Click(Sender: TObject);
begin
  inherited;
  ComboBox1.HitTest := True;
  ComboBox2.HitTest := True;
  ComboBox3.HitTest := True;
  ComboBox1.Clear;
  ComboBox2.Clear;
  ComboBox3.Clear;
  ComboBox1.Items.Add('EPH');
  ComboBox1.Items.Add('EPHP');
  WiliyaLoad(ComboBox2);
  CommuneLoad(Edit_Code_Wilaya, ComboBox3);
  Edit1.HitTest := True;
  Edit2.HitTest := True;
  Edit3.HitTest := True;
  Edit4.HitTest := True;
  Edit5.HitTest := True;
  Edit6.HitTest := True;
  Edit7.HitTest := True;
  Edit8.HitTest := True;
  ComboBox1.SetFocus;
end;

procedure TEtablissement.ComboBox2Change(Sender: TObject);
begin
  inherited;
  with DataModule1.FDQ_Wilaya do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('SELECT Code_Wilaya, Nom FROM wilayas');
    Active := True;
    Locate('Nom', ComboBox2.Selected.Text, []);
    Edit_Code_Wilaya.Text := FieldByName('Code_Wilaya').AsString;
    SQL.Clear;
    Active := False;
  end;
end;

procedure TEtablissement.ComboBox2MouseEnter(Sender: TObject);
begin
  inherited;
  if (ComboBox2.Items.Capacity = 0) then
    WiliyaLoad(ComboBox2);
end;

procedure TEtablissement.ComboBox3Change(Sender: TObject);
begin
  inherited;
  with DataModule1.FDQ_Commune do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('SELECT Code_Postal, Nom FROM communes');
    Active := True;
    Locate('Nom', ComboBox3.Selected.Text, []);
    Edit_Code_Postal.Text := FieldByName('Code_Postal').Value;
    Active := False;
  end;
end;

procedure TEtablissement.Edit_Code_WilayaChange(Sender: TObject);
var
  Code_P: string;
begin
  inherited;
  CommuneLoad(Edit_Code_Wilaya, ComboBox3);
end;

procedure TEtablissement.FormShow(Sender: TObject);
var
  Existed: boolean;
begin
  inherited;
  with DataModule1.FDQ_Entreprise do
  begin
    SQL.Text := ('Select * From Entreprise');
    Active := True;
    if (FieldByName('ID_EntreP').AsString <> '') then
      Existed := True
    else
      Existed := False;
    if (Existed = True) then
    begin
      Open;
      ComboBox1.Items.Text := FieldByName('Form_Juridique').AsString;
      ComboBox1.ItemIndex := 0;
      ComboBox2.Items.Text := FieldByName('Wilaya').AsString;
      ComboBox2.ItemIndex := 0;
      Edit1.Text := FieldByName('Libelle').AsString;
      Edit2.Text := FieldByName('Libelle_Sec').AsString;
      Edit3.Text := FieldByName('Adresse').AsString;
      Edit4.Text := FieldByName('Telephone').AsString;
      Edit5.Text := FieldByName('Mobile').AsString;
      Edit6.Text := FieldByName('Fax').AsString;
      Edit7.Text := FieldByName('Email').AsString;
      Edit8.Text := FieldByName('Web').AsString;
      Edit_Code_Wilaya.Text := FieldByName('Code_de_Wilaya').Value;
      Edit_Code_Postal.Text := FieldByName('Code_Postal').Value;
      if (Edit_Code_Wilaya.Text <> '') then
      begin
        ComboBox3.Items.Text := FieldByName('Commune').AsString;
        ComboBox3.ItemIndex := 0;
      end;
      ComboBox1.HitTest := False;
      ComboBox2.HitTest := False;
      ComboBox3.HitTest := False;
      Edit1.HitTest := False;
      Edit2.HitTest := False;
      Edit3.HitTest := False;
      Edit4.HitTest := False;
      Edit5.HitTest := False;
      Edit6.HitTest := False;
      Edit7.HitTest := False;
      Edit8.HitTest := False;
    end;
  end;
end;

end.
