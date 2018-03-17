unit U_Frame_Hemogramme;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrame3 = class(TFrame)
    L_Top: TLayout;
    Label32: TLabel;
    Layout_Frame3: TLayout;
    L_Left: TLayout;
    Hemog_Edit4: TEdit;
    Hemog_LabelEdit4: TLabel;
    Hemog_Label4: TLabel;
    Hemog_Label3: TLabel;
    Hemog_Edit3: TEdit;
    Hemog_LabelEdit3: TLabel;
    Hemog_Edit2: TEdit;
    Hemog_LabelEdit2: TLabel;
    Hemog_Label2: TLabel;
    Hemog_Label1: TLabel;
    Hemog_Edit1: TEdit;
    Hemog_LabelEdit1: TLabel;
    L_Right: TLayout;
    Hemog_Edit6: TEdit;
    Label19: TLabel;
    Hemog_Label6: TLabel;
    Hemog_Edit5: TEdit;
    Label18: TLabel;
    Hemog_Label5: TLabel;
    Hemog_Label7: TLabel;
    Hemog_Edit7: TEdit;
    Label20: TLabel;
    Hemog_Edit8: TEdit;
    Label21: TLabel;
    Hemog_Label8: TLabel;
    function IsSet: Boolean;
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

procedure TFrame3.OnDataLoad;
begin
  With Main do
  Begin
    if (Patient_ID <> '') then
    Begin
      With DataModule1.FDQuery2 do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := ('Select * From Hemogramme Where Patient_ID="' +
          Patient_ID + '"');
        Active := True;
        Open;
        Hemog_Edit1.Text := FieldByName('Hematies').AsString;
        Hemog_Edit2.Text := FieldByName('Hemoglobine').AsString;
        Hemog_Edit3.Text := FieldByName('Hematocrite').AsString;
        Hemog_Edit4.Text := FieldByName('VGM').AsString;
        Hemog_Edit5.Text := FieldByName('TCMH').AsString;
        Hemog_Edit6.Text := FieldByName('CCMH').AsString;
        Hemog_Edit7.Text := FieldByName('Leucocytes').AsString;
        Hemog_Edit8.Text := FieldByName('Reticulocytes').AsString;
        Close;
        Active := False;
        SQL.Clear;
      end;
    End;
  End;
end;

function TFrame3.IsSet;
begin
  if ((Hemog_Edit1.Text = '') and (Hemog_Edit2.Text = '') and
    (Hemog_Edit3.Text = '') and (Hemog_Edit4.Text = '') and
    (Hemog_Edit5.Text = '') and (Hemog_Edit6.Text = '') and
    (Hemog_Edit7.Text = '') and (Hemog_Edit8.Text = '')) then
  Begin
    result := False;
  End
  else
    result := True;
end;

procedure TFrame3.Clear;
begin
  Hemog_Edit1.Text := '';
  Hemog_Edit2.Text := '';
  Hemog_Edit3.Text := '';
  Hemog_Edit4.Text := '';
  Hemog_Edit5.Text := '';
  Hemog_Edit6.Text := '';
  Hemog_Edit7.Text := '';
  Hemog_Edit8.Text := '';
end;

procedure TFrame3.Insert(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  bol := False;
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Hemogramme';
    Active := True;
    Insert;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'G' + Rand;
        FieldByName('HemoG_ID').AsString := Rand;
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
    FieldByName('Hematies').AsString := Hemog_Edit1.Text;
    FieldByName('Hemoglobine').AsString := Hemog_Edit2.Text;
    FieldByName('Hematocrite').AsString := Hemog_Edit3.Text;
    FieldByName('VGM').AsString := Hemog_Edit4.Text;
    FieldByName('TCMH').AsString := Hemog_Edit5.Text;
    FieldByName('CCMH').AsString := Hemog_Edit6.Text;
    FieldByName('leucocytes').AsString := Hemog_Edit7.Text;
    FieldByName('Reticulocytes').AsString := Hemog_Edit8.Text;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame3.Edit(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Hemogramme Where Patient_ID="' +
      Main.Patient_ID + '";';
    Active := True;
    Edit;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'G' + Rand;
        FieldByName('HemoG_ID').AsString := Rand;
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
    FieldByName('Hematies').AsString := Hemog_Edit1.Text;
    FieldByName('Hemoglobine').AsString := Hemog_Edit2.Text;
    FieldByName('Hematocrite').AsString := Hemog_Edit3.Text;
    FieldByName('VGM').AsString := Hemog_Edit4.Text;
    FieldByName('TCMH').AsString := Hemog_Edit5.Text;
    FieldByName('CCMH').AsString := Hemog_Edit6.Text;
    FieldByName('leucocytes').AsString := Hemog_Edit7.Text;
    FieldByName('Reticulocytes').AsString := Hemog_Edit8.Text;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame3.FrameResize(Sender: TObject);
begin
  L_Right.Width := Layout_Frame3.Width / 2;
  L_Left.Width := Layout_Frame3.Width / 2;
end;

end.
