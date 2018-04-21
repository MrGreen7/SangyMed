unit U_Remontre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls,
  FMX.Effects, FMX.Objects;

type
  TRemontre = class(TBase_Form)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    InnerGlowEffect1: TInnerGlowEffect;
    Edit2: TEdit;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    InnerGlowEffect2: TInnerGlowEffect;
    InnerGlowEffect3: TInnerGlowEffect;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SpeedButton2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Remontre: TRemontre;

implementation

Uses
  U_DataModule;
{$R *.fmx}

procedure TRemontre.Button1Click(Sender: TObject);

var
  HexCode: String;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQl.Clear;
    SQl.Text := ('SELECT * FROM Medecin');
    Active := True;
    Open;
    if not(Locate('Pseudo', Edit1.Text, [])) then
    Begin
      InnerGlowEffect1.Enabled := True;
      ShowMessage('Un compte avec ce nom d''utilisateur n''existe pas');
      Active := False;
      SQl.Clear;
    End
    else
    Begin
      TabItem2.IsSelected := True;
    End;
  End;
end;

procedure TRemontre.Button3Click(Sender: TObject);
Var
  HexCode: String;
  Msg: Integer;
begin
  With DataModule1 do
  Begin
    if ((Edit2.Text = '') or (Edit3.Text = '')) then
    Begin
      Msg := MessageDlg('š''il vous plaît remplir les champs',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbRetry], 0);
      Edit2.SetFocus;
    End
    else if (Edit2.Text <> Edit3.Text) then
    Begin
      InnerGlowEffect2.Enabled := True;
      InnerGlowEffect3.Enabled := True;
      ShowMessage
        ('Votre mot de pass ne pas Identique veuillez réessayer de nouveau');
    End
    else
    Begin
      HexCode := Encryt(Edit2.Text);
      FDQuery1.Active := False;
      FDQuery1.SQl.Clear;
      FDQuery1.SQl.Text := ('Update Medecin Set Mot_de_pass="" Where Pseudo="' +
        Edit1.Text + '";');
      FDQuery1.Execute;
      FDQuery1.SQl.Text := ('Update Medecin Set Mot_de_pass="' + HexCode +
        '" Where Pseudo="' + Edit1.Text + '";');
      FDQuery1.Execute;
      FDQuery1.Active := False;
      FDQuery1.SQl.Clear;
      ShowMessage('Vos modifications ont été enregistrées');
      ModalResult := mrCancel;
    End;
  End;
end;

procedure TRemontre.Edit1Change(Sender: TObject);
begin
  InnerGlowEffect1.Enabled := False;
end;

procedure TRemontre.Edit2Change(Sender: TObject);
begin
  InnerGlowEffect2.Enabled := False;
end;

procedure TRemontre.Edit3Change(Sender: TObject);
begin
  InnerGlowEffect3.Enabled := False;
end;

procedure TRemontre.FormCreate(Sender: TObject);
begin
  TabItem1.IsSelected := True;
end;

procedure TRemontre.SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Edit2.Password := False;
end;

procedure TRemontre.SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Edit2.Password := True;
end;

procedure TRemontre.SpeedButton2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Edit3.Password := False;
end;

procedure TRemontre.SpeedButton2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Edit3.Password := True;
end;

end.
