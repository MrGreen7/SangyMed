unit U_Parametre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.Layouts, FMX.TreeView, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Edit, FMX.Effects;

type
  TParametre = class(TBase_Form)
    Panel1: TPanel;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    TabControl1: TTabControl;
    Tab_Compte: TTabItem;
    Compte: TTreeViewItem;
    Tree_Sub_CompteMod: TTreeViewItem;
    Tree_Sub_CompteRem: TTreeViewItem;
    Tab_Compte_Rem: TTabItem;
    Mod_Edit1: TEdit;
    Mod_Edit2: TEdit;
    Mod_Button1: TButton;
    Mod_Button2: TButton;
    InnerGlowEffect1: TInnerGlowEffect;
    InnerGlowEffect2: TInnerGlowEffect;
    Generale: TTreeViewItem;
    Tree_Sub_GenerAccueil: TTreeViewItem;
    Tab_Accueil: TTabItem;
    Switch1: TSwitch;
    procedure CompteClick(Sender: TObject);
    procedure Tree_Sub_CompteModClick(Sender: TObject);
    procedure Tree_Sub_CompteRemClick(Sender: TObject);
    procedure Mod_Button1Click(Sender: TObject);
    procedure Mod_Button2Click(Sender: TObject);
    procedure Mod_Edit1Change(Sender: TObject);
    procedure Mod_Edit2Change(Sender: TObject);
    procedure GeneraleClick(Sender: TObject);
    procedure Tree_Sub_GenerAccueilClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Parametre: TParametre;

implementation

Uses U_DataModule, U_Connecter, U_Main;
{$R *.fmx}

procedure TParametre.FormCreate(Sender: TObject);
begin
  inherited;
  Mod_Edit1.Text := Main.ID_Medecin;
end;

procedure TParametre.GeneraleClick(Sender: TObject);
begin
  inherited;
  Tree_Sub_CompteMod.Visible := False;
  Tree_Sub_CompteRem.Visible := False;
  Tree_Sub_GenerAccueil.Visible := true;
  Tree_Sub_GenerAccueilClick(self);
end;

procedure TParametre.CompteClick(Sender: TObject);
begin
  inherited;
  Tree_Sub_CompteMod.Visible := true;
  Tree_Sub_CompteModClick(self);
  Tree_Sub_CompteRem.Visible := true;
  Tree_Sub_GenerAccueil.Visible := False;
  Tab_Accueil.Visible := False;
end;

procedure TParametre.Mod_Button1Click(Sender: TObject);
Var
  LogDlg: TConnecter;
begin
  inherited;
  if ((Mod_Edit1.Text <> '') and (Mod_Edit2.Text <> '')) then
  Begin
    LogDlg := TConnecter.Create(self);
    if (LogDlg.ShowModal = mrCancel) then
      LogDlg.Free
    else if (LogDlg.ShowModal = mrOk) then
    Begin
      ShowMessage('Hello');
      With DataModule1.FDQuery1 do
      Begin
        Active := False;
        SQl.Clear;
        SQl.Text := ('Select Nom, Pseudo, Telephone From Medecin Where ID="' +
          Main.ID_Medecin + '"');
        Active := true;
        Edit;
        FieldByName('Nom').AsString := Mod_Edit1.Text;
        FieldByName('Pseudo').AsString := Mod_Edit2.Text;
        Post;
        Active := False;
        SQl.Clear;
        ShowMessage('Don!');
      End;
      LogDlg.Free;
    End;
  End
  else
  Begin
    InnerGlowEffect1.Enabled := true;
    InnerGlowEffect2.Enabled := true;
  End;
end;

procedure TParametre.Mod_Button2Click(Sender: TObject);
begin
  inherited;
  Mod_Edit1.Text := '';
  Mod_Edit2.Text := '';
  InnerGlowEffect1.Enabled := False;
  InnerGlowEffect2.Enabled := False;
end;

procedure TParametre.Mod_Edit1Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect1.Enabled := False;
end;

procedure TParametre.Mod_Edit2Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect2.Enabled := False;
end;

procedure TParametre.Tree_Sub_CompteModClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := true;
  Tab_Compte.IsSelected := true;
  Tab_Compte_Rem.Visible := False;
end;

procedure TParametre.Tree_Sub_CompteRemClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := true;
  Tab_Compte_Rem.IsSelected := true;
end;

procedure TParametre.Tree_Sub_GenerAccueilClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := False;
  Tab_Accueil.Visible := true;
  Tab_Accueil.IsSelected := true;
end;

end.
