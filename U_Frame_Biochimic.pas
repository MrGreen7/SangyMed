unit U_Frame_Biochimic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TFrame6 = class(TFrame)
    Layout0: TLayout;
    Layout1: TLayout;
    Bio_Edit11: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Bio_Edit12: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Bio_Edit13: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Bio_Edit14: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Bio_Edit15: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Layout2: TLayout;
    Bio_Edit16: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Bio_Edit17: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Bio_Edit18: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Bio_Edit19: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Layout3: TLayout;
    Bio_Edit1: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Bio_Edit2: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Bio_Edit3: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Bio_Edit4: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Bio_Edit5: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Layout4: TLayout;
    Bio_Edit6: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Bio_Edit7: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Bio_Edit8: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Bio_Edit9: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    Bio_Edit10: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
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

procedure TFrame6.OnDataLoad;
begin
  With Main do
  Begin
    if (Patient_ID <> '') then
    Begin
      With DataModule1.FDQuery2 do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := ('Select * From Biochimie Where Patient_ID="' +
          Patient_ID + '"');
        Active := True;
        Open;
        Bio_Edit1.Text := FieldByName('Glycemie').AsString;
        Bio_Edit2.Text := FieldByName('Uree_Sang').AsString;
        Bio_Edit3.Text := FieldByName('Createnine').AsString;
        Bio_Edit4.Text := FieldByName('Cholesterole').AsString;
        Bio_Edit5.Text := FieldByName('Triglycerides').AsString;
        Bio_Edit6.Text := FieldByName('HDL').AsString;
        Bio_Edit7.Text := FieldByName('LDL').AsString;
        Bio_Edit8.Text := FieldByName('Acide_Urique').AsString;
        Bio_Edit9.Text := FieldByName('CRP').AsString;
        Bio_Edit10.Text := FieldByName('TGO').AsString;
        Bio_Edit11.Text := FieldByName('TGP').AsString;
        Bio_Edit12.Text := FieldByName('PAL').AsString;
        Bio_Edit13.Text := FieldByName('TP').AsString;
        Bio_Edit14.Text := FieldByName('INR').AsString;
        Bio_Edit15.Text := FieldByName('BilirubineT').AsString;
        Bio_Edit16.Text := FieldByName('BilirubineD').AsString;
        Bio_Edit17.Text := FieldByName('ASLO').AsString;
        Bio_Edit18.Text := FieldByName('Calcemie').AsString;
        Bio_Edit19.Text := FieldByName('Albuminemie').AsString;
        Close;
        Active := False;
        SQL.Clear;
      end;
    End;
  End;
end;

function TFrame6.IsSet;
begin
  if ((Bio_Edit1.Text = '') and (Bio_Edit2.Text = '') and (Bio_Edit3.Text = '')
    and (Bio_Edit4.Text = '') and (Bio_Edit5.Text = '') and
    (Bio_Edit6.Text = '') and (Bio_Edit7.Text = '') and (Bio_Edit8.Text = '')
    and (Bio_Edit9.Text = '') and (Bio_Edit10.Text = '') and
    (Bio_Edit11.Text = '') and (Bio_Edit12.Text = '') and (Bio_Edit13.Text = '')
    and (Bio_Edit14.Text = '') and (Bio_Edit15.Text = '') and
    (Bio_Edit16.Text = '') and (Bio_Edit17.Text = '') and (Bio_Edit18.Text = '')
    and (Bio_Edit19.Text = '')) then
  begin
    result := False;
  end
  else
    result := True;

end;

procedure TFrame6.Clear;
begin
  Bio_Edit1.Text := '';
  Bio_Edit2.Text := '';
  Bio_Edit3.Text := '';
  Bio_Edit4.Text := '';
  Bio_Edit5.Text := '';
  Bio_Edit6.Text := '';
  Bio_Edit7.Text := '';
  Bio_Edit8.Text := '';
  Bio_Edit9.Text := '';
  Bio_Edit10.Text := '';
  Bio_Edit11.Text := '';
  Bio_Edit12.Text := '';
  Bio_Edit13.Text := '';
  Bio_Edit14.Text := '';
  Bio_Edit15.Text := '';
  Bio_Edit16.Text := '';
  Bio_Edit17.Text := '';
  Bio_Edit18.Text := '';
  Bio_Edit19.Text := '';
end;

procedure TFrame6.Insert(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Biochimie';
    Active := True;
    Insert;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'B' + Rand;
        FieldByName('Biochimi_ID').AsString := Rand;
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
    FieldByName('Glycemie').AsString := Bio_Edit1.Text;
    FieldByName('Uree_Sang').AsString := Bio_Edit2.Text;
    FieldByName('Createnine').AsString := Bio_Edit3.Text;
    FieldByName('Cholesterole').AsString := Bio_Edit4.Text;
    FieldByName('Triglycerides').AsString := Bio_Edit5.Text;
    FieldByName('HDL').AsString := Bio_Edit6.Text;
    FieldByName('LDL').AsString := Bio_Edit7.Text;
    FieldByName('Acide_Urique').AsString := Bio_Edit8.Text;
    FieldByName('CRP').AsString := Bio_Edit9.Text;
    FieldByName('TGO').AsString := Bio_Edit10.Text;
    FieldByName('TGP').AsString := Bio_Edit11.Text;
    FieldByName('PAL').AsString := Bio_Edit12.Text;
    FieldByName('TP').AsString := Bio_Edit13.Text;
    FieldByName('INR').AsString := Bio_Edit14.Text;
    FieldByName('BilirubineT').AsString := Bio_Edit15.Text;
    FieldByName('BilirubineD').AsString := Bio_Edit16.Text;
    FieldByName('ASLO').AsString := Bio_Edit17.Text;
    FieldByName('Calcemie').AsString := Bio_Edit18.Text;
    FieldByName('Albuminemie').AsString := Bio_Edit19.Text;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame6.Edit(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Biochimie Where Patient_ID="' +
      Main.Patient_ID + '"';
    Active := True;
    Edit;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'B' + Rand;
        FieldByName('Biochimi_ID').AsString := Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Glycemie').AsString := Bio_Edit1.Text;
    FieldByName('Uree_Sang').AsString := Bio_Edit2.Text;
    FieldByName('Createnine').AsString := Bio_Edit3.Text;
    FieldByName('Cholesterole').AsString := Bio_Edit4.Text;
    FieldByName('Triglycerides').AsString := Bio_Edit5.Text;
    FieldByName('HDL').AsString := Bio_Edit6.Text;
    FieldByName('LDL').AsString := Bio_Edit7.Text;
    FieldByName('Acide_Urique').AsString := Bio_Edit8.Text;
    FieldByName('CRP').AsString := Bio_Edit9.Text;
    FieldByName('TGO').AsString := Bio_Edit10.Text;
    FieldByName('TGP').AsString := Bio_Edit11.Text;
    FieldByName('PAL').AsString := Bio_Edit12.Text;
    FieldByName('TP').AsString := Bio_Edit13.Text;
    FieldByName('INR').AsString := Bio_Edit14.Text;
    FieldByName('BilirubineT').AsString := Bio_Edit15.Text;
    FieldByName('BilirubineD').AsString := Bio_Edit16.Text;
    FieldByName('ASLO').AsString := Bio_Edit17.Text;
    FieldByName('Calcemie').AsString := Bio_Edit18.Text;
    FieldByName('Albuminemie').AsString := Bio_Edit19.Text;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame6.FrameResize(Sender: TObject);
begin
  Layout1.Width := Layout0.Width / 4;
  Layout2.Width := Layout0.Width / 4;
  Layout3.Width := Layout0.Width / 4;
  Layout4.Width := Layout0.Width / 4;
end;

end.
