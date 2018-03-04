unit U_Frame_Information;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.Edit, FMX.Layouts, FMX.Controls.Presentation;

type
  TFrame2 = class(TFrame)
    GroupBox1: TGroupBox;
    L_Top_1: TLayout;
    AC_Edit1: TEdit;
    AC_Label1: TLabel;
    L_Top_2: TLayout;
    L_Right_2: TLayout;
    AC_Label5: TLabel;
    AC_ComboBox2: TComboBox;
    L_Left_2: TLayout;
    AC_Label2: TLabel;
    AC_ComboBox1: TComboBox;
    L_Top_3: TLayout;
    L_Left_3: TLayout;
    AC_Edit2: TEdit;
    AC_Label3: TLabel;
    L_Right_3: TLayout;
    AC_Label6: TLabel;
    AC_Edit4: TEdit;
    L_Top_4: TLayout;
    L_Left_4: TLayout;
    AC_Edit3: TEdit;
    AC_Label4: TLabel;
    L_Right_4: TLayout;
    AC_Label7: TLabel;
    AC_Edit5: TEdit;
    GroupBox2: TGroupBox;
    AC_ComboBox3: TComboBox;
    Label0: TLabel;
    Wilaya_Code: TEdit;
    function IsSet: Boolean;
    procedure WiliyaLoad(const Combo: TComboBox);
    procedure CommuneLoad(const Combo: TComboBox);
    procedure Insert();
    procedure Edit();
    procedure Clear();
    procedure OnDataLoad;
    procedure Wilaya_CodeChange(Sender: TObject);
    procedure AC_ComboBox1Change(Sender: TObject);
    procedure AC_ComboBox1MouseEnter(Sender: TObject);
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

procedure TFrame2.OnDataLoad;
begin
  With Main do
  Begin
    if (Patient_ID <> '') then
    Begin
      With DataModule1.FDQuery2 do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'Select * From Patient Where Patient_ID="' +
          Patient_ID + '";';
        Active := True;
        Open;
        AC_Edit1.Text := FieldByName('Adresse').AsString;
        AC_Edit2.Text := FieldByName('Telephone').AsString;
        AC_Edit3.Text := FieldByName('Email').AsString;
        AC_Edit4.Text := FieldByName('Mobile').AsString;
        AC_Edit5.Text := FieldByName('Fax').AsString;
        WiliyaLoad(AC_ComboBox1);
        try
          AC_ComboBox1.ItemIndex := FieldByName('Wilaya_Index').Value;
        except
          on E: Exception do
        end;
        Wilaya_Code.OnChange(Wilaya_Code);
        try
          AC_ComboBox2.ItemIndex := FieldByName('Commune_Index').Value;
        except
          on E: Exception do
        end;
        try
          AC_ComboBox3.ItemIndex := FieldByName('Groupage_Index').Value;
        except
          on E: Exception do
        end;
        Close;
        Active := False;
        SQL.Clear;
      end;
    End;
  End;
End;

procedure TFrame2.Wilaya_CodeChange(Sender: TObject);
begin
  CommuneLoad(AC_ComboBox2);
end;

function TFrame2.IsSet;
begin
  if ((AC_Edit1.Text = '') and (AC_Edit2.Text = '') and (AC_Edit3.Text = '') and
    (AC_Edit4.Text = '') and (AC_Edit5.Text = '') and
    (AC_ComboBox1.Selected.Text = '') and (AC_ComboBox2.Selected.Text = '') and
    (AC_ComboBox3.Selected.Text = '')) then
  Begin
    Result := False;
  End
  else
    Result := True;
end;

procedure TFrame2.WiliyaLoad(const Combo: TComboBox);
begin
  // Open Alg
  with DataModule1.FDQ_Wilaya do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('SELECT Nom FROM wilayas');
    Active := True;
    while not Eof do
    begin
      Combo.Items.Add(Fields.Fields[0].AsString);
      Next;
    end;
    SQL.Clear;
    Active := False;
  end;
end;

procedure TFrame2.AC_ComboBox1Change(Sender: TObject);
begin
  with DataModule1.FDQ_Wilaya do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('SELECT Code_Wilaya, Nom FROM wilayas');
    Active := True;
    Locate('Nom', AC_ComboBox1.Selected.Text, []);
    Wilaya_Code.Text := FieldByName('Code_Wilaya').AsString;
    SQL.Clear;
    Active := False;
  end;
end;

procedure TFrame2.AC_ComboBox1MouseEnter(Sender: TObject);
begin
  if (AC_ComboBox1.Items.Capacity = 0) then
    WiliyaLoad(AC_ComboBox1);
end;

procedure TFrame2.CommuneLoad(const Combo: TComboBox);
var
  Code_P: string;
begin
  Code_P := Wilaya_Code.Text; // Edit_Code_Wiliya
  Combo.Items.Clear; // Combobox3
  with DataModule1.FDQ_Commune do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('SELECT Nom FROM communes WHERE `Code_Wilaya`="' +
      Code_P + '"');
    Active := True;
    while not Eof do
    begin
      Combo.Items.Add(Fields.Fields[0].AsString); // Combobox3
      Next;
    end;
    SQL.Clear;
    Active := False;
  end;
end;

procedure TFrame2.Insert;
begin
  with DataModule1.FDQuery1 do
  Begin
    FieldByName('Adresse').AsString := AC_Edit1.Text;
    FieldByName('Telephone').AsString := AC_Edit2.Text;
    FieldByName('Email').AsString := AC_Edit3.Text;
    FieldByName('Mobile').AsString := AC_Edit4.Text;
    FieldByName('Fax').AsString := AC_Edit5.Text;
    if (AC_ComboBox1.ItemIndex <> -1) then
    Begin
      FieldByName('Wilaya').AsString := AC_ComboBox1.Selected.Text;
      FieldByName('Wilaya_Index').AsString := IntToStr(AC_ComboBox1.ItemIndex);
    End;
    if (AC_ComboBox2.ItemIndex <> -1) then
    Begin
      FieldByName('Commune').AsString := AC_ComboBox2.Selected.Text;
      FieldByName('Commune_Index').AsString := IntToStr(AC_ComboBox2.ItemIndex);
    End;
    if (AC_ComboBox3.ItemIndex <> -1) then
    Begin
      FieldByName('Groupage').AsString := AC_ComboBox3.Selected.Text;
      FieldByName('groupage_Index').AsString :=
        IntToStr(AC_ComboBox3.ItemIndex);
    End;
  End;
end;

procedure TFrame2.Edit;
begin
  with DataModule1.FDQuery1 do
  Begin
    FieldByName('Adresse').AsString := AC_Edit1.Text;
    FieldByName('Telephone').AsString := AC_Edit2.Text;
    FieldByName('Email').AsString := AC_Edit3.Text;
    FieldByName('Mobile').AsString := AC_Edit4.Text;
    FieldByName('Fax').AsString := AC_Edit5.Text;
    if (AC_ComboBox1.ItemIndex <> -1) then
    Begin
      FieldByName('Wilaya').AsString := AC_ComboBox1.Selected.Text;
      FieldByName('Wilaya_Index').AsString := IntToStr(AC_ComboBox1.ItemIndex);
    End
    else
    Begin
      FieldByName('Wilaya').AsString := '';
      FieldByName('Wilaya_Index').Value := -1;
    End;
    if (AC_ComboBox2.ItemIndex <> -1) then
    Begin
      FieldByName('Commune').AsString := AC_ComboBox2.Selected.Text;
      FieldByName('Commune_Index').AsString := IntToStr(AC_ComboBox2.ItemIndex);
    End
    else
    Begin
      FieldByName('Commune').AsString := '';
      FieldByName('Commune_Index').Value := -1;
    End;
    if (AC_ComboBox3.ItemIndex <> -1) then
    Begin
      FieldByName('Groupage').AsString := AC_ComboBox3.Selected.Text;
      FieldByName('Groupage_Index').AsString :=
        IntToStr(AC_ComboBox3.ItemIndex);
    End
    else
    Begin
      FieldByName('Groupage').AsString := '';
      FieldByName('Groupage_Index').Value := -1;
    End;
  End;
end;

procedure TFrame2.FrameResize(Sender: TObject);
begin
  // Align The Tops
  L_Top_1.Height := GroupBox1.Height / 4;
  L_Top_2.Height := GroupBox1.Height / 4;
  L_Top_3.Height := GroupBox1.Height / 4;
  L_Top_4.Height := GroupBox1.Height / 4;

  // Aline The Right and Left
  L_Left_2.Width := L_Top_2.Width / 2;
  L_Right_2.Width := L_Top_2.Width / 2;

  L_Left_3.Width := L_Top_3.Width / 2;
  L_Right_3.Width := L_Top_3.Width / 2;

  L_Left_4.Width := L_Top_4.Width / 2;
  L_Right_4.Width := L_Top_4.Width / 2;
end;

procedure TFrame2.Clear;
Begin
  AC_Edit1.Text := '';
  AC_Edit2.Text := '';
  AC_Edit3.Text := '';
  AC_Edit4.Text := '';
  AC_Edit5.Text := '';
  if (AC_ComboBox1.ItemIndex <> -1) then
    AC_ComboBox1.ItemIndex := 0;
  if (AC_ComboBox2.ItemIndex <> -1) then
    AC_ComboBox2.ItemIndex := 0;
  AC_ComboBox3.ItemIndex := -1;
End;

end.
