unit U_Frame_Principale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.DateTimeCtrls, FMX.Effects, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFrame1 = class(TFrame)
    GroupBox_Info: TGroupBox;
    Layout_Top_1: TLayout;
    Layout_Right1: TLayout;
    IP_Label8: TLabel;
    IP_ComboBox2: TComboBox;
    Layout_Left_1: TLayout;
    IP_Label4: TLabel;
    IP_ComboBox1: TComboBox;
    Layout_Top_3: TLayout;
    Layout_Right3: TLayout;
    IP_Label7: TLabel;
    IP_ComboBox3: TComboBox;
    InnerGlowEffect3Combo3: TInnerGlowEffect;
    Layout_Left_3: TLayout;
    IP_Label3: TLabel;
    Layout_Top_4: TLayout;
    Layout_Right4: TLayout;
    IP_Label6: TLabel;
    IP_Edit3: TEdit;
    InnerGlowEffectEdit3: TInnerGlowEffect;
    Layout_Left_4: TLayout;
    IP_Label2: TLabel;
    IP_Edit2: TEdit;
    InnerGlowEffectEdit2: TInnerGlowEffect;
    Layout_Top_2: TLayout;
    Layout_Right2: TLayout;
    IP_Label5: TLabel;
    Layout_Left_2: TLayout;
    IP_Label1: TLabel;
    IP_Edit1: TEdit;
    GroupBox_Liens: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    InnerGlowEffect2Combo2: TInnerGlowEffect;
    Edit_Date: TEdit;
    DateEdit1: TDateEdit;
    function SetEdit: Boolean;
    function Edit(): String;
    function Insert(): String;
    procedure Clear();
    procedure OnDataLoad;
    procedure FrameResize(Sender: TObject);
    procedure IP_ComboBox3Change(Sender: TObject);
    procedure IP_ComboBox2Change(Sender: TObject);
    procedure IP_ComboBox1Change(Sender: TObject);
    procedure IP_Edit2Change(Sender: TObject);
    procedure IP_Edit3Change(Sender: TObject);
    procedure IP_Edit2ChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TFrame1.OnDataLoad;
Var
  Existed: Boolean;
begin
  With Main do
  Begin
    if (Patient_ID <> '') then
    Begin
      With DataModule1.FDQuery2 do
      Begin
        Active := False;
        SQl.Clear;
        SQl.Text := 'Select * From Patient Where Patient_ID="' +
          Patient_ID + '";';
        Active := True;
        Open;
        IP_Edit1.Text := FieldByName('Patient_ID').AsString;
        IP_Edit2.Text := FieldByName('Nom').AsString;
        IP_Edit3.Text := FieldByName('Prenom').AsString;
        Edit_Date.Text := FieldByName('Date_de_Nai').AsString;
        DateEdit1.Text := FieldByName('date_de_Entre').AsString;
        try
          IP_ComboBox1.ItemIndex := FieldByName('Etat_Civil_Index').Value;
        except
          on E: Exception do
        end;
        try
          IP_ComboBox2.ItemIndex := FieldByName('Sexe_Index').Value;
        except
          on E: Exception do
        end;
        IP_ComboBox3.ItemIndex := FieldByName('Type_Index').Value;
        Close;
        Active := False;
      End;
    End
  End;
end;

function TFrame1.SetEdit: Boolean;
begin
  if ((IP_Edit2.Text = '') or (IP_Edit3.Text = '') or
    (IP_ComboBox3.ItemIndex = -1) or (IP_ComboBox2.ItemIndex = -1)) then
  Begin
    if (IP_Edit2.Text = '') then
      InnerGlowEffectEdit2.Enabled := True;
    if (IP_Edit3.Text = '') then
      InnerGlowEffectEdit3.Enabled := True;
    if (IP_ComboBox3.ItemIndex = -1) then
      InnerGlowEffect3Combo3.Enabled := True;
    if (IP_ComboBox2.ItemIndex = -1) then
      InnerGlowEffect2Combo2.Enabled := True;
    Result := False;
  End
  Else
    Result := True;
end;

function TFrame1.Edit: String;
Var
  Rand: String;
begin
  With DataModule1.FDQuery1 do
  Begin
    // Anitialize The Query
    Rand := FieldByName('Patient_ID').AsString;
    FieldByName('Nom').AsString := IP_Edit2.Text;
    FieldByName('Prenom').AsString := IP_Edit3.Text;
    // FieldByName('Date_de_Entre').AsString := DateEdit1.Text;
    if (IP_ComboBox1.ItemIndex <> -1) then
    Begin
      FieldByName('Etat_Civil').AsString := IP_ComboBox1.Selected.Text;
      FieldByName('Etat_Civil_Index').AsString :=
        IntToStr(IP_ComboBox1.ItemIndex);
    End
    else
    Begin
      FieldByName('Etat_Civil').AsString := '';
      FieldByName('Etat_Civil_Index').Value := -1;
    End;
    if (IP_ComboBox2.ItemIndex <> -1) then
    Begin
      FieldByName('Sexe').AsString := IP_ComboBox2.Selected.Text;
      FieldByName('Sexe_Index').AsString := IntToStr(IP_ComboBox2.ItemIndex);
    End
    else
    Begin
      FieldByName('Sexe').AsString := '';
      FieldByName('Sexe_Index').Value := -1;
    End;
    if (IP_ComboBox3.ItemIndex <> -1) then
    begin
      FieldByName('Type').AsString := IP_ComboBox3.Selected.Text;
      FieldByName('type_Index').AsString := IntToStr(IP_ComboBox2.ItemIndex);
    end
    else
    Begin
      FieldByName('Type').AsString := '';
      FieldByName('Type_Index').Value := -1;
    End;
  End;
  Result := Rand;
end;

procedure TFrame1.FrameResize(Sender: TObject);
begin
  // Align The Tops
  Layout_Top_1.Height := (GroupBox_Info.Height - 20) / 4;
  Layout_Top_2.Height := (GroupBox_Info.Height - 20) / 4;
  Layout_Top_3.Height := (GroupBox_Info.Height - 20) / 4;
  Layout_Top_4.Height := (GroupBox_Info.Height - 20) / 4;
  // Align Right and Left
  Layout_Right1.Width := Layout_Top_1.Width / 2;
  Layout_Left_1.Width := Layout_Top_1.Width / 2;

  Layout_Right2.Width := Layout_Top_2.Width / 2;
  Layout_Left_2.Width := Layout_Top_2.Width / 2;

  Layout_Right3.Width := Layout_Top_3.Width / 2;
  Layout_Left_3.Width := Layout_Top_3.Width / 2;

  Layout_Right4.Width := Layout_Top_4.Width / 2;
  Layout_Left_4.Width := Layout_Top_4.Width / 2;
end;

function TFrame1.Insert: String;
Var
  Rand: String;
  bol: Boolean;
begin
  bol := False;
  With DataModule1.FDQuery1 do
  Begin
    // Anitialize The Query
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'P' + Rand;
        FieldByName('Patient_ID').AsString := Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Nom').AsString := IP_Edit2.Text;
    FieldByName('Prenom').AsString := IP_Edit3.Text;
    FieldByName('Date_de_Nai').AsString := Edit_Date.Text;
    FieldByName('Date_de_Entre').AsString := DateEdit1.Text;
    if (IP_ComboBox1.ItemIndex <> -1) then
    Begin
      FieldByName('Etat_Civil').AsString := IP_ComboBox1.Selected.Text;
      FieldByName('Etat_Civil_Index').AsString :=
        IntToStr(IP_ComboBox1.ItemIndex);
    End;
    if (IP_ComboBox2.ItemIndex <> -1) then
    Begin
      FieldByName('Sexe').AsString := IP_ComboBox2.Selected.Text;
      FieldByName('Sexe_Index').AsString := IntToStr(IP_ComboBox2.ItemIndex);
    End;
    if (IP_ComboBox3.ItemIndex <> -1) then
    begin
      FieldByName('Type').AsString := IP_ComboBox3.Selected.Text;
      FieldByName('type_Index').AsString := IntToStr(IP_ComboBox2.ItemIndex);
    end;
  End;
  Result := Rand;
end;

procedure TFrame1.IP_ComboBox1Change(Sender: TObject);
begin
  InnerGlowEffectEdit3.Enabled := False;
end;

procedure TFrame1.IP_ComboBox2Change(Sender: TObject);
begin
  InnerGlowEffect2Combo2.Enabled := False;
end;

procedure TFrame1.IP_ComboBox3Change(Sender: TObject);
begin
  InnerGlowEffect3Combo3.Enabled := False;
end;

procedure TFrame1.IP_Edit2Change(Sender: TObject);
begin
  InnerGlowEffectEdit2.Enabled := False;
end;

procedure TFrame1.IP_Edit2ChangeTracking(Sender: TObject);
begin
  DateEdit1.Text := DateToStr(Date);
end;

procedure TFrame1.IP_Edit3Change(Sender: TObject);
begin
  InnerGlowEffectEdit3.Enabled := False;
end;

procedure TFrame1.Clear();
Begin
  InnerGlowEffect3Combo3.Enabled := False;
  InnerGlowEffectEdit2.Enabled := False;
  InnerGlowEffectEdit3.Enabled := False;
  IP_Edit1.Text := '';
  IP_Edit2.Text := '';
  IP_Edit3.Text := '';
  Edit_Date.Text := '';
  DateEdit1.Date := Date;
  IP_ComboBox1.ItemIndex := -1;
  IP_ComboBox2.ItemIndex := -1;
  IP_ComboBox3.ItemIndex := -1;
End;

end.
