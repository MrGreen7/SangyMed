unit U_Frame_Hemostase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrame4 = class(TFrame)
    Layout_Frame: TLayout;
    GroupBox3: TGroupBox;
    Hemos_Edit1: TEdit;
    Label23: TLabel;
    Hemos_Edit2: TEdit;
    Label24: TLabel;
    Hemos_Edit3: TEdit;
    Label25: TLabel;
    Hemos_Label3: TLabel;
    Hemos_Label2: TLabel;
    Hemos_Label1: TLabel;
    GroupBox4: TGroupBox;
    L_topVs: TLayout;
    Label17: TLabel;
    Hemos_Edit4: TEdit;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    Memo1: TMemo;
    function Pret: Boolean;
    procedure Clear;
    procedure Insert(const RandD: String);
    procedure Edit(const RandD: String);
    procedure OnDataLoad;
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TFrame4.OnDataLoad;
begin
  With Main do
  Begin
    if (Patient_ID <> '') then
    Begin
      With DataModule1.FDQuery2 do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := ('Select * From Hemostase_VS Where Patient_ID="' +
          Patient_ID + '"');
        Active := True;
        Open;
        Hemos_Edit1.Text := FieldByName('TS').AsString;
        Hemos_Edit2.Text := FieldByName('TCK').AsString;
        Hemos_Edit3.Text := FieldByName('TP').AsString;
        Hemos_Edit4.Text := FieldByName('VS').AsString;
        Memo1.Text := FieldByName('Note').AsString;
        Close;
        Active := False;
        SQL.Clear;
      end;
    End;
  End;
end;

function TFrame4.Pret;
begin
  if ((Hemos_Edit1.Text = '') and (Hemos_Edit2.Text = '') and
    (Hemos_Edit3.Text = '') and (Hemos_Edit4.Text = '') and (Memo1.Text = ''))
  then
  begin
    Result := False;
  end
  else
    Result := True;

end;

procedure TFrame4.Clear;
begin
  Hemos_Edit1.Text := '';
  Hemos_Edit2.Text := '';
  Hemos_Edit3.Text := '';
  Hemos_Edit4.Text := '';
  Memo1.Text := '';
end;

procedure TFrame4.Insert(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Hemostase_VS Where Patient_ID="' +
      Main.Patient_ID + '"';
    Active := True;
    Insert;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'V' + Rand;
        FieldByName('HemoS_VS_ID').AsString := Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Patient_ID').AsString := RandD;
    FieldByName('TS').AsString := Hemos_Edit1.Text;
    FieldByName('TCK').AsString := Hemos_Edit2.Text;
    FieldByName('TP').AsString := Hemos_Edit3.Text;
    FieldByName('VS').AsString := Hemos_Edit4.Text;
    FieldByName('Note').AsString := Memo1.Text;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame4.Edit(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Hemostase_VS Where Patient_ID="' +
      Main.Patient_ID + '"';
    Active := True;
    Edit;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'V' + Rand;
        FieldByName('HemoS_VS_ID').AsString := Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Patient_ID').AsString := RandD;
    FieldByName('TS').AsString := Hemos_Edit1.Text;
    FieldByName('TCK').AsString := Hemos_Edit2.Text;
    FieldByName('TP').AsString := Hemos_Edit3.Text;
    FieldByName('VS').AsString := Hemos_Edit4.Text;
    FieldByName('Note').AsString := Memo1.Text;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame4.FrameResize(Sender: TObject);
begin
  GroupBox3.Width := Layout_Frame.Width / 2;
  GroupBox4.Width := Layout_Frame.Width / 2;
end;

end.
