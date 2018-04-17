unit U_Inscription;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.StdCtrls, FMX.Effects, FMX.Edit, FMX.Controls.Presentation,
  IdHashMessageDigest, FMX.Objects, FMX.ListBox;

type
  TInscription = class(TBase_Form)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    InnerGlowEffect1: TInnerGlowEffect;
    Edit2: TEdit;
    InnerGlowEffect2: TInnerGlowEffect;
    Edit3: TEdit;
    InnerGlowEffect3: TInnerGlowEffect;
    SpeedButton1: TSpeedButton;
    Edit4: TEdit;
    InnerGlowEffect4: TInnerGlowEffect;
    SpeedButton2: TSpeedButton;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    InnerGlowEffect6: TInnerGlowEffect;
    Label1: TLabel;
    GlowEffect1: TGlowEffect;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Inscription: TInscription;

implementation

uses
  U_DataModule;
{$R *.fmx}

function Encrypt(Str: string): string;
var
  MD5: TIdHashMessageDigest5;
  Hash: string;
begin
  MD5 := TIdHashMessageDigest5.Create;
  Hash := MD5.HashStringAsHex(Str);
  Result := Hash;
end;

procedure TInscription.Button1Click(Sender: TObject);
var
  Rand, HexPass: string;
  bol: Boolean;
begin
  inherited;
  bol := False;
  if ((Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or
    (ComboBox1.ItemIndex = -1)) then
  begin
    if ((Edit1.Text = '') and (Edit2.Text = '') and (Edit3.Text = '')) then
    begin
      MessageDlg
        ('�''il vous pla�t rempli les champs necessaire pour cr�en un compte',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect1.Enabled := True;
      InnerGlowEffect2.Enabled := True;
      InnerGlowEffect3.Enabled := True;
      Edit1.SetFocus;
      if (Edit4.Text = '') then
        InnerGlowEffect4.Enabled := True;
      if (ComboBox1.ItemIndex = -1) then
        InnerGlowEffect6.Enabled := True;
    end
    else if (((Edit1.Text = '') and (Edit2.Text = '')) or
      ((Edit1.Text = '') and (Edit3.Text = ''))) then
    begin
      if (Edit2.Text = '') then
      begin
        MessageDlg('�''il vous pla�t saisir votre nom et pseudo',
          TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
        InnerGlowEffect1.Enabled := True;
        InnerGlowEffect2.Enabled := True;
        Edit1.SetFocus;
        if (Edit4.Text = '') then
          InnerGlowEffect4.Enabled := True;
        if (ComboBox1.ItemIndex = -1) then
          InnerGlowEffect6.Enabled := True;
      end
      else if (Edit3.Text = '') then
      begin
        MessageDlg('�''il vous pla�t saisir votre nom et mot de pass',
          TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
        InnerGlowEffect1.Enabled := True;
        InnerGlowEffect3.Enabled := True;
        Edit1.SetFocus;
        if (Edit4.Text = '') then
          InnerGlowEffect4.Enabled := True;
        if (ComboBox1.ItemIndex = -1) then
          InnerGlowEffect6.Enabled := True;
      end;
    end
    else if ((Edit2.Text = '') and (Edit3.Text = '')) then
    begin
      MessageDlg('�''il vous pla�t saisir votre pseudo et mot de pass',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect2.Enabled := True;
      InnerGlowEffect3.Enabled := True;
      Edit2.SetFocus;
      if (Edit4.Text = '') then
        InnerGlowEffect4.Enabled := True;
      if (ComboBox1.ItemIndex = -1) then
        InnerGlowEffect6.Enabled := True;
    end
    else if (Edit1.Text = '') then
    begin
      MessageDlg('s''il vous pla�t entrer votre nom', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect1.Enabled := True;
      Edit1.SetFocus;
      if (Edit4.Text = '') then
        InnerGlowEffect4.Enabled := True;
      if (ComboBox1.ItemIndex = -1) then
        InnerGlowEffect6.Enabled := True;
    end
    else if (Edit2.Text = '') then
    begin
      MessageDlg('s''il vous pla�t entrer votre pseudo', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect2.Enabled := True;
      Edit2.SetFocus;
      if (Edit4.Text = '') then
        InnerGlowEffect4.Enabled := True;
      if (ComboBox1.ItemIndex = -1) then
        InnerGlowEffect6.Enabled := True;
    end
    else if (Edit3.Text = '') then
    begin
      MessageDlg('s''il vous pla�t entrer votre mot de pass',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect3.Enabled := True;
      Edit3.SetFocus;
      if (Edit4.Text = '') then
        InnerGlowEffect4.Enabled := True;
      if (ComboBox1.ItemIndex = -1) then
        InnerGlowEffect6.Enabled := True;
    end;
    if (ComboBox1.ItemIndex = -1) then
      InnerGlowEffect6.Enabled := True;
  end
  else
  begin
    if (Edit3.Text <> Edit4.Text) then
    begin
      MessageDlg
        ('Votre mot de pass ne pas Identique veuillez r�essayer de nouveau',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
      Edit3.Text := '';
      Edit4.Text := '';
      InnerGlowEffect3.Enabled := True;
      InnerGlowEffect4.Enabled := True;
      if (ComboBox1.ItemIndex = -1) then
        InnerGlowEffect6.Enabled := True;
      Edit3.SetFocus;
    end
    else
    begin
      with DataModule1 do
      begin
        FDQuery1.Active := False;
        FDQuery1.SQL.Text := ('SELECT * FROM Medecin;');
        FDQuery1.Active := True;
        FDQuery1.Open;
        if (FDQuery1.Locate('Pseudo', Edit2.Text, [])) then
        Begin
          InnerGlowEffect2.Enabled := True;
          ShowMessage('ce nom d''utilisateur est d�j� utilis�');
        End
        else if (Edit3.Text.Length <= 3) then
        Begin
          MessageDlg('Le mot de passe doit comporter au moins 4 caract�res',
            TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
          Edit3.Text := '';
          Edit4.Text := '';
          InnerGlowEffect3.Enabled := True;
          InnerGlowEffect4.Enabled := True;
          Edit3.SetFocus;
        End
        else
        Begin
          FDQuery1.Insert;
          repeat
          Begin
            try
              Rand := DataModule1.GenerateID;
              Rand := 'U' + Rand;
              FDQuery1.FieldByName('ID').AsString := Rand;
            except
              On E: Exception do
              Begin
                bol := True;
              End;
            end;
            bol := False;
          End;
          until bol = False;
          FDQuery1.FieldByName('Nom').AsString := Edit1.Text;
          FDQuery1.FieldByName('Pseudo').AsString := Edit2.Text;
          FDQuery1.FieldByName('Telephone').AsString := Edit5.Text;
          if (ComboBox1.ItemIndex = 0) then
            FDQuery1.FieldByName('Privilege').AsBoolean := True
          else if (ComboBox1.ItemIndex = 1) then
            FDQuery1.FieldByName('Privilege').AsBoolean := False;
          begin
            HexPass := Encrypt(Edit3.Text);
            FDQuery1.FieldByName('Mot_de_pass').AsString := HexPass;
          end;
          FDQuery1.Post;
          FDQuery1.Active := False;
          FDQuery1.SQL.Clear;
          DataModule1.Param(Rand);
          Button2.OnClick(Button2);
          MessageDlg('Votre compte a �t� engregistr�',
            TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
          ModalResult := mrCancel;
        end;
      End;
    end;
  end;
end;

procedure TInscription.Button2Click(Sender: TObject);
begin
  inherited;
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  ComboBox1.ItemIndex := -1;
  InnerGlowEffect1.Enabled := False;
  InnerGlowEffect2.Enabled := False;
  InnerGlowEffect3.Enabled := False;
  InnerGlowEffect4.Enabled := False;
  InnerGlowEffect6.Enabled := False;
end;

procedure TInscription.Button3Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TInscription.ComboBox1Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect6.Enabled := False;
end;

procedure TInscription.Edit1Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect1.Enabled := False;
end;

procedure TInscription.Edit2Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect2.Enabled := False;
end;

procedure TInscription.Edit3Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect3.Enabled := False;
end;

procedure TInscription.Edit4Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect4.Enabled := False;
end;

procedure TInscription.SpeedButton1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit3.Password := False;
end;

procedure TInscription.SpeedButton1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit3.Password := True;
end;

procedure TInscription.SpeedButton2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit4.Password := False;
end;

procedure TInscription.SpeedButton2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit4.Password := True;
end;

end.
