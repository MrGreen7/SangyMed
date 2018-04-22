unit U_Parametre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.Layouts, FMX.TreeView, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Edit, FMX.Effects, FMX.Objects, FMX.ListBox;

type
  TParametre = class(TBase_Form)
    Panel1: TPanel;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    TabControl1: TTabControl;
    Tab_Compte: TTabItem;
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
    Tree_Sub_Pref: TTreeViewItem;
    Tab_Pref: TTabItem;
    Mod_Edit3: TEdit;
    InnerGlowEffect3: TInnerGlowEffect;
    TreeViewItem1: TTreeViewItem;
    Mod_Button3: TButton;
    Label1: TLabel;
    TreeViewItem3: TTreeViewItem;
    Tree_Sub_Patient: TTreeViewItem;
    Tree_Sub_PAccueil: TTreeViewItem;
    Tab_Patient: TTabItem;
    Tab_PAccueil: TTabItem;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TrackBar1: TTrackBar;
    TrackBar4: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar2: TTrackBar;
    Edit_ST_1: TEdit;
    Edit_ST_2: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Switch1: TSwitch;
    Switch2: TSwitch;
    Switch3: TSwitch;
    Switch4: TSwitch;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Tree_Sub_CompteDel: TTreeViewItem;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit5: TEdit;
    SpeedButton1: TSpeedButton;
    Tab_Del: TTabItem;
    Label3: TLabel;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Edit_ST_3: TEdit;
    Edit_ST_4: TEdit;
    procedure CompteClick(Sender: TObject);
    procedure Tree_Sub_CompteModClick(Sender: TObject);
    procedure Tree_Sub_CompteRemClick(Sender: TObject);
    procedure Mod_Button1Click(Sender: TObject);
    procedure Mod_Button2Click(Sender: TObject);
    procedure Mod_Edit1Change(Sender: TObject);
    procedure Mod_Edit2Change(Sender: TObject);
    procedure GeneraleClick(Sender: TObject);
    procedure Tree_Sub_PrefClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeViewItem1Click(Sender: TObject);
    procedure Tree_Sub_PAccueilClick(Sender: TObject);
    procedure Tree_Sub_PatientClick(Sender: TObject);
    procedure Tree_Sub_EtabClick(Sender: TObject);
    procedure TreeViewItem2Click(Sender: TObject);
    procedure TreeViewItem3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Tree_Sub_CompteDelClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
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
  With DataModule1.FDQuery1 do
  Begin
    SQl.Clear;
    SQl.Text := ('Select Nom, Pseudo, Telephone From Medecin Where ID="' +
      Main.ID_Medecin + '"');
    Open;
    Mod_Edit1.Text := FieldByName('Nom').AsString;
    Mod_Edit2.Text := FieldByName('Pseudo').AsString;
    Mod_Edit3.Text := FieldByName('Telephone').AsString;
    Close;
    SQl.Clear;
  End;
end;

procedure TParametre.FormShow(Sender: TObject);
begin
  inherited;
  GeneraleClick(self);
end;

procedure TParametre.GeneraleClick(Sender: TObject);
begin
  inherited;
  Tree_Sub_Pref.Visible := True;
  Tree_Sub_PrefClick(self);
  Tree_Sub_CompteMod.Visible := False;
  Tree_Sub_CompteRem.Visible := False;
  Tree_Sub_Patient.Visible := False;
  Tree_Sub_CompteDel.Visible := False;
  Tree_Sub_PAccueil.Visible := False;
end;

procedure TParametre.Button2Click(Sender: TObject);
begin
  inherited;
  With DataModule1.FDQuery1 do
  Begin
    SQl.Clear;
    SQl.Text := ('Select * From Parametre Where ID="' + Main.ID_Medecin + '";');
    Active := True;
    Edit;
    if (Switch1.IsChecked = True) then
      FieldByName('HM').AsBoolean := True
    else
      FieldByName('HM').AsBoolean := False;

    if (Switch2.IsChecked = True) then
      FieldByName('HS').AsBoolean := True
    else
      FieldByName('HS').AsBoolean := False;

    if (Switch3.IsChecked = True) then
      FieldByName('Bio').AsBoolean := True
    else
      FieldByName('Bio').AsBoolean := False;

    if (Switch4.IsChecked = True) then
      FieldByName('Serlg').AsBoolean := True
    else
      FieldByName('Serlg').AsBoolean := False;
    Post;
    Active := False;
    SQl.Clear;
  End;
  Main.LoadParam;
end;

procedure TParametre.Button3Click(Sender: TObject);
begin
  inherited;
  With DataModule1.FDQuery1 do
  Begin
    SQl.Clear;
    SQl.Text := ('Select * From Parametre Where ID="' + Main.ID_Medecin + '";');
    Active := True;
    Edit;
    FieldByName('Bar1').AsInteger := Edit_ST_1.Text.ToInteger;
    FieldByName('Bar2').AsInteger := Edit_ST_2.Text.ToInteger;
    FieldByName('Bar3').AsInteger := Edit_ST_3.Text.ToInteger;
    FieldByName('Bar4').AsInteger := Edit_ST_4.Text.ToInteger;
    Post;
    Active := False;
    SQl.Clear;
  End;
  Main.LoadParam;
end;

procedure TParametre.Button5Click(Sender: TObject);
Var
  LogDlg: TConnecter;
  HexCode: String;
begin
  inherited;
  if (Edit5.Text <> '') then
  Begin
    LogDlg := TConnecter.Create(self);
    Begin
      LogDlg.Label1.Visible := False;
      LogDlg.Label2.Visible := False;
      LogDlg.Label3.Visible := False;
      LogDlg.Label4.Visible := False;
      LogDlg.Label5.Visible := True;
    End;
    if (LogDlg.ShowModal = mrOk) then
    Begin
      HexCode := DataModule1.Encryt(Edit5.Text);
      With DataModule1.FDQuery1 do
      Begin
        Active := False;
        SQl.Clear;
        SQl.Text := ('Select * From Medecin Where ID="' +
          Main.ID_Medecin + '"');
        Active := True;
        Edit;
        FieldByName('Mot_de_pass').AsString := HexCode;
        Post;
        Active := False;
        SQl.Clear;
      End;
      LogDlg.Free;
      ShowMessage('Vos informations ont été modifiées avec succès');
    End
    else
      LogDlg.Free;
  End
  else
  Begin
    ShowMessage('Veuillez entrer un nouveau mot de passe');
    Edit5.SetFocus;
  End;
end;

procedure TParametre.Button8Click(Sender: TObject);
Var
  LogDlg: TConnecter;
  Msg: Integer;
begin
  inherited;
  Msg := MessageDlg('Etes-vous sûr de cette action', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);
  if (Msg = mrYes) then
  Begin
    LogDlg := TConnecter.Create(self);
    With LogDlg do
    Begin
      Label1.Visible := False;
      Label2.Visible := False;
      Label3.Visible := False;
      Label4.Visible := False;
      Label5.Visible := True;
    End;
    if (LogDlg.ShowModal = mrOk) then
    Begin
      With DataModule1.FDCmnd_Drop_Patient do
      Begin
        Active := False;
        CommandText.Clear;
        CommandText.Text := ('DELETE FROM Medecin WHERE ID="' +
          Main.ID_Medecin + '";');
        Active := True;
        Execute();
        Active := False;
        CommandText.Clear;
      End;
    End;
    LogDlg.Free;
    ModalResult := mrOk;
  End;
end;

procedure TParametre.Button9Click(Sender: TObject);
begin
  inherited;
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQl.Clear;
    SQl.Text := ('Select * From Parametre Where ID="' + Main.ID_Medecin + '";');
    Active := True;
    Edit;
    FieldByName('Theme').AsInteger := ComboBox1.ItemIndex;
    Post;
    Active := False;
    SQl.Clear;
  End;
  Main.LoadParam;
end;

procedure TParametre.CompteClick(Sender: TObject);
begin
  inherited;
  Tree_Sub_CompteMod.Visible := True;
  Tree_Sub_CompteModClick(self);
  Tree_Sub_CompteRem.Visible := True;
end;

procedure TParametre.Mod_Button1Click(Sender: TObject);
Var
  LogDlg: TConnecter;
begin
  inherited;
  if ((Mod_Edit1.Text <> '') and (Mod_Edit2.Text <> '')) then
  Begin
    LogDlg := TConnecter.Create(self);

    Begin
      LogDlg.Label1.Visible := False;
      LogDlg.Label2.Visible := False;
      LogDlg.Label3.Visible := False;
      LogDlg.Label4.Visible := False;
      LogDlg.Label5.Visible := True;
    End;
    if (LogDlg.ShowModal = mrOk) then
    Begin
      With DataModule1.FDQuery1 do
      Begin
        Active := False;
        SQl.Clear;
        SQl.Text := ('Select * From Medecin Where ID="' +
          Main.ID_Medecin + '"');
        Active := True;
        Edit;
        FieldByName('Nom').AsString := Mod_Edit1.Text;
        FieldByName('Pseudo').AsString := Mod_Edit2.Text;
        Post;
        Active := False;
        SQl.Clear;
      End;
      LogDlg.Free;
      ShowMessage('Vos informations ont été modifiées avec succès');
    End
    else
      LogDlg.Free;
  End
  else
  Begin
    InnerGlowEffect1.Enabled := True;
    InnerGlowEffect2.Enabled := True;
  End;
end;

procedure TParametre.Mod_Button2Click(Sender: TObject);
begin
  inherited;
  Mod_Edit1.Text := '';
  Mod_Edit2.Text := '';
  Mod_Edit3.Text := '';
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

procedure TParametre.SpeedButton1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit5.Password := False;
end;

procedure TParametre.SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit5.Password := True;
end;

procedure TParametre.SpeedButton2Click(Sender: TObject);
Var
  LogDlg: TConnecter;
  Msg: Integer;
begin
  inherited;
  Msg := MessageDlg
    ('Cette action effacera votre compte avec tous les enregistrements du patient que vous avez ajouté ou modifier avec leurs dossiers d''analyse, nous vous encourageons à sauvegarder toutes les données au cas où vous le souhaitez.',
    TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0);
  if (Msg = mrOk) then
  Begin
    LogDlg := TConnecter.Create(self);
    With LogDlg do
    Begin
      Label1.Visible := False;
      Label2.Visible := False;
      Label3.Visible := False;
      Label4.Visible := False;
      Label5.Visible := True;
    End;
    if (LogDlg.ShowModal = mrOk) then
    Begin
      With DataModule1.FDCmnd_Drop_Patient do
      Begin
        Active := False;
        CommandText.Clear;
        CommandText.Text := ('DELETE FROM Medecin WHERE ID="' +
          Main.ID_Medecin + '";');
        Active := True;
        Execute();
        Active := False;
        CommandText.Clear;
      End;
    End;
    LogDlg.Free;
    ModalResult := mrOk;
  End;
end;

procedure TParametre.TrackBar1Change(Sender: TObject);
begin
  inherited;
  Edit_ST_1.Text := Int(TrackBar1.Value).ToString;
end;

procedure TParametre.TrackBar4Change(Sender: TObject);
begin
  inherited;
  Edit_ST_4.Text := Int(TrackBar4.Value).ToString;
end;

procedure TParametre.TrackBar3Change(Sender: TObject);
begin
  inherited;
  Edit_ST_3.Text := Int(TrackBar3.Value).ToString;
end;

procedure TParametre.TrackBar2Change(Sender: TObject);
begin
  inherited;
  Edit_ST_2.Text := Int(TrackBar2.Value).ToString;
end;

procedure TParametre.TreeViewItem1Click(Sender: TObject);
begin
  inherited;
  Tree_Sub_Pref.Visible := False;
  Tree_Sub_CompteMod.Visible := True;
  Tree_Sub_CompteDel.Visible := True;
  Tree_Sub_CompteModClick(self);
  Tree_Sub_CompteRem.Visible := True;
  Tree_Sub_Patient.Visible := False;
  Tree_Sub_PAccueil.Visible := False;
end;

procedure TParametre.TreeViewItem2Click(Sender: TObject);
begin
  inherited;
  Tree_Sub_Pref.Visible := False;
  Tree_Sub_CompteMod.Visible := False;
  Tree_Sub_CompteRem.Visible := False;
  Tree_Sub_EtabClick(self);
  Tree_Sub_Patient.Visible := False;
  Tree_Sub_PAccueil.Visible := False;
end;

procedure TParametre.TreeViewItem3Click(Sender: TObject);
begin
  inherited;
  Tree_Sub_Pref.Visible := False;
  Tree_Sub_CompteMod.Visible := False;
  Tree_Sub_CompteRem.Visible := False;
  Tree_Sub_Patient.Visible := True;
  Tree_Sub_PatientClick(self);
  Tree_Sub_CompteDel.Visible := False;
  Tree_Sub_PAccueil.Visible := True;
end;

procedure TParametre.Tree_Sub_CompteDelClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte.IsSelected := False;
  Tab_Compte_Rem.Visible := False;
  Tab_Patient.Visible := False;
  Tab_PAccueil.Visible := False;
  Tab_Pref.Visible := False;
  Tab_Del.Visible := True;
  Tab_Del.IsSelected := True;
end;

procedure TParametre.Tree_Sub_CompteModClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := True;
  Tab_Compte.IsSelected := True;
  Tab_Compte_Rem.Visible := False;
  Tab_Patient.Visible := False;
  Tab_PAccueil.Visible := False;
  Tab_Pref.Visible := False;
  Tab_Del.Visible := False;
end;

procedure TParametre.Tree_Sub_CompteRemClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := True;
  Tab_Compte_Rem.IsSelected := True;
  Tab_Patient.Visible := False;
  Tab_PAccueil.Visible := False;
  Tab_Pref.Visible := False;
  Tab_Del.Visible := False;
end;

procedure TParametre.Tree_Sub_EtabClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := False;
  Tab_Patient.Visible := False;
  Tab_PAccueil.Visible := False;
  Tab_Pref.Visible := False;
end;

procedure TParametre.Tree_Sub_PrefClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := False;
  Tab_Patient.Visible := False;
  Tab_PAccueil.Visible := False;
  Tab_Pref.Visible := True;
  Tab_Pref.IsSelected := True;
  Tab_Del.Visible := False;
end;

procedure TParametre.Tree_Sub_PAccueilClick(Sender: TObject);
begin
  inherited;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := False;
  Tab_Patient.Visible := False;
  Tab_PAccueil.Visible := True;
  Tab_PAccueil.IsSelected := True;
  Tab_Pref.Visible := False;
  Tab_Del.Visible := False;
end;

procedure TParametre.Tree_Sub_PatientClick(Sender: TObject);
begin
  inherited;
  Tab_Del.Visible := False;
  Tab_Compte.Visible := False;
  Tab_Compte_Rem.Visible := False;
  Tab_Patient.Visible := True;
  Tab_Patient.IsSelected := True;
  Tab_PAccueil.Visible := False;
  Tab_Pref.Visible := False;
end;

end.
