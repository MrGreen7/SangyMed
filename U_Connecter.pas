unit U_Connecter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.Effects, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  IdHashMessageDigest, FMX.Objects;

type
  TConnecter = class(TBase_Form)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    InnerGlowEffect1: TInnerGlowEffect;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    InnerGlowEffect2: TInnerGlowEffect;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    Label2: TLabel;
    ShadowEffect2: TShadowEffect;
    Label3: TLabel;
    ShadowEffect3: TShadowEffect;
    Label4: TLabel;
    ShadowEffect4: TShadowEffect;
    Label5: TLabel;
    GlowEffect1: TGlowEffect;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Connecter: TConnecter;

implementation

Uses
  U_Main, U_Inscription, U_DataModule, Winapi.Messages, U_Parametre, U_Remontre;
{$R *.fmx}

procedure TConnecter.Button1Click(Sender: TObject);
var
  HexPass: string;
  Msg: Integer;
begin
  inherited;
  if ((Edit1.Text = '') or (Edit2.Text = '')) then
  begin
    if ((Edit1.Text = '') and (Edit2.Text = '')) then
    begin
      MessageDlg('les deux champs sont obligatoire', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect1.Enabled := True;
      InnerGlowEffect2.Enabled := True;
      Edit1.SetFocus;
    end
    else if (Edit1.Text = '') then
    begin
      MessageDlg('š''il vous plaît saisir votre pseudo', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect1.Enabled := True;
      Edit1.SetFocus;
    end
    else
    begin
      MessageDlg('š''il vous plaît saisir votre mot de pass',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
      InnerGlowEffect2.Enabled := True;
      Edit2.SetFocus;
    end;
  end
  else
  begin
    with DataModule1 do
    begin
      HexPass := Encryt(Edit2.Text);
      FDQuery1.Active := False;
      FDQuery1.SQL.Text := ('SELECT * FROM Medecin');
      FDQuery1.Active := True;
      FDQuery1.Open;
      if not(FDQuery1.Locate('Pseudo;Mot_de_pass',
        VarArrayOf([Edit1.Text, HexPass]), [])) then
      begin
        InnerGlowEffect1.Enabled := True;
        InnerGlowEffect2.Enabled := True;
        Msg := MessageDlg('Pseudo ou Mot de pass est incorrect !',
          TMsgDlgType.mtError, [TMsgDlgBtn.mbRetry, TMsgDlgBtn.mbCancel], 0);
        if (Msg = mrRetry) then
        begin
          Edit1.Text := '';
          Edit2.Text := '';
          Edit1.SetFocus;
          InnerGlowEffect1.Enabled := False;
          InnerGlowEffect2.Enabled := False;
        end
        else
          ModalResult := mrCancel;
      end
      else
      begin
        Main.Nom := Edit1.Text;
        Main.ID_Medecin := FDQuery1.FieldByName('ID').AsString;
        Main.Privilege := FDQuery1.FieldByName('Privilege').AsBoolean;
        ModalResult := mrOk;
      end;
    end;
  end;
end;

procedure TConnecter.Edit1Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect1.Enabled := False;
end;

procedure TConnecter.Edit2Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect2.Enabled := False;
end;

procedure TConnecter.Label1Click(Sender: TObject);
Var
  RemontreDlg: TRemontre;
begin
  inherited;
  RemontreDlg := TRemontre.Create(Self);
  if (RemontreDlg.ShowModal = mrCancel) then
    RemontreDlg.Free;
end;

procedure TConnecter.Label3Click(Sender: TObject);
var
  InsDlg: TInscription;
begin
  inherited;
  InsDlg := TInscription.Create(Self);
  if (InsDlg.ShowModal = mrCancel) then
    InsDlg.Close;
end;

procedure TConnecter.SpeedButton1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit2.Password := False;
end;

procedure TConnecter.SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit2.Password := True;
end;

end.
