unit U_Log;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.Effects, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  IdHashMessageDigest, FMX.Objects;

type
  TLog = class(TBase_Form)
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
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Log: TLog;

implementation

Uses
  U_Main, U_Ins, U_DataModule, Winapi.Messages, U_Option;
{$R *.fmx}

function Decrypt(Str: string): string;
var
  Md5: TIdHashMessageDigest5;
  Hash: string;
begin
  Md5 := TIdHashMessageDigest5.Create;
  Hash := Md5.HashStringAsHex(Str);
  Result := Hash;
end;

procedure TLog.Button1Click(Sender: TObject);
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
    HexPass := Decrypt(Edit2.Text);
    with DataModule1.FDQuery1 do
    begin
      Active := False;
      SQL.Text := ('SELECT * FROM User');
      Active := True;
      Open;
      Option.Label1.Text := FieldByName('ID').AsString;
      if not(Locate('Pseudo;Mot_de_pass', VarArrayOf([Edit1.Text, HexPass]), []))
      then
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
        ShowMessage('Bienvenu Mr.' + Edit1.Text);
        ModalResult := mrOk;
      end;
    end;
  end;
end;

procedure TLog.Edit1Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect1.Enabled := False;
end;

procedure TLog.Edit2Change(Sender: TObject);
begin
  inherited;
  InnerGlowEffect2.Enabled := False;
end;

procedure TLog.Label1Click(Sender: TObject);
var
  InsDlg: TIns;
begin
  inherited;
  InsDlg := TIns.Create(self);
  if (InsDlg.ShowModal = mrCancel) then
    InsDlg.Close;
end;

procedure TLog.SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit2.Password := False;
end;

procedure TLog.SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  Edit2.Password := True;
end;

end.
