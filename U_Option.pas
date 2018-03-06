unit U_Option;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.Layouts, FMX.TreeView, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Edit, FMX.Effects;

type
  TOption = class(TBase_Form)
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
    procedure CompteClick(Sender: TObject);
    procedure Tree_Sub_CompteModClick(Sender: TObject);
    procedure Tree_Sub_CompteRemClick(Sender: TObject);
    procedure Mod_Button1Click(Sender: TObject);
    procedure Mod_Button2Click(Sender: TObject);
    procedure Mod_Edit1Change(Sender: TObject);
    procedure Mod_Edit2Change(Sender: TObject);
    procedure GeneraleClick(Sender: TObject);
    procedure Tree_Sub_GenerAccueilClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Compte: Integer;
  end;

var
  Option: TOption;

implementation

Uses U_DataModule, U_Log;
{$R *.fmx}

procedure TOption.GeneraleClick(Sender: TObject);
begin
  inherited;
  Tree_Sub_CompteMod.Visible := False;
  Tree_Sub_CompteRem.Visible := False;
  Tree_Sub_GenerAccueil.Visible := true;
  Tree_Sub_GenerAccueilClick(self);
end;

procedure TOption.CompteClick(Sender: TObject);
begin
  inherited;
  Tree_Sub_CompteMod.Visible := true;
  Tree_Sub_CompteModClick(self);
  Tree_Sub_CompteRem.Visible := true;
  Tree_Sub_GenerAccueil.Visible := False;
  Tab_Accueil.Visible := False;
end;

procedure TOption.Mod_Button1Click(Sender: TObject);
Var
  LogDlg: TLog;
begin
  inherited;
  if ((Mod_Edit1.Text <> '') and (Mod_Edit2.Text <> '')) then
  Begin
    LogDlg := TLog.Create(self);
    if (LogDlg.ShowModal = mrClose) then
      LogDlg.Free
    else if (LogDlg.ShowModal = mrOk) then
    Begin
      ShowMessage('Hello');
      LogDlg.Hide;
    End;
  End
  else
  Begin
    InnerGlowEffect1.Enabled := true;
    InnerGlowEffect2.Enabled := true;
  End;
end;

procedure TOption.Mod_Button2Click(Sender: TObject);
begin
  inherited;
  Mod_Edit1.Text := '';
  Mod_Edit2.Text := '';
  InnerGlowEffect1.Enabled := False;
  InnerGlowEffect2.Enabled := False;
end;

procedure TOption.Mod_Edit1Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect1.Enabled := False;
end;

procedure TOption.Mod_Edit2Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect2.Enabled := False;
end;

procedure TOption.Tree_Sub_CompteModClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := true;
  Tab_Compte.IsSelected := true;
  Tab_Compte_Rem.Visible := False;
end;

procedure TOption.Tree_Sub_CompteRemClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := true;
  Tab_Compte_Rem.IsSelected := true;
end;

procedure TOption.Tree_Sub_GenerAccueilClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := False;
  Tab_Accueil.Visible := true;
  Tab_Accueil.IsSelected := true;
end;

end.
