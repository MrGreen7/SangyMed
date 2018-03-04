unit U_Entreprise;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,U_Base_Form,
  FMX.StdCtrls, FMX.TabControl, FMX.Edit, FMX.ListBox, FMX.Controls.Presentation;

type
  TEntreprise = class(TBase_Form)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Entreprise: TEntreprise;

implementation

{$R *.fmx}

end.
