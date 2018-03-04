unit U_Frame_Ordonnance;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts,
  System.Generics.Collections;

type
  TFrame7 = class(TFrame)
    L_Top_Ordonnance: TLayout;
    Layout1: TLayout;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Edit2: TEdit;
    Layout4: TLayout;
    Edit1: TEdit;
    Layout5: TLayout;
    Edit4: TEdit;
    Layout6: TLayout;
    Edit3: TEdit;
    Layout7: TLayout;
    Button1: TButton;
    Button2: TButton;
    StringGridBindSourceDB1: TStringGrid;
    procedure OnDataLoad;
    procedure Insert;
    procedure Edit;
    procedure ID(const RandD: String);
    procedure StringGridResize;
    procedure LoadGrid(const RandD: string);
    procedure Button2Click(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tub: TList<String>;
  end;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TFrame7.OnDataLoad;
begin
  With Main do
  Begin
    With DataModule1.FDQ_Ordonnance do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Text :=
        ('Select Medicament,Dose,Prise,Jour,Pendent From Ordonnance Where Patient_ID="'
        + Patient_ID + '";');
      Active := True;
      StringGridResize;
    End;
  End;
end;

procedure TFrame7.StringGridResize;
Var
  i: Integer;
Begin
  StringGridBindSourceDB1.Columns[0].Width := 830;
  StringGridBindSourceDB1.Columns[1].Width := 50;
  StringGridBindSourceDB1.Columns[2].Width := 50;
  StringGridBindSourceDB1.Columns[3].Width := 50;
  StringGridBindSourceDB1.Columns[4].Width := 70;
end;

procedure TFrame7.ID(const RandD: string);
Var
  Rand: String;
begin
  With Main do
  begin
    With DataModule1.FDQ_Ordonnance do
    Begin
      try
        for Rand in Tub do
        Begin
          Active := False;
          SQL.Clear;
          SQL.Text := ('Select Patient_ID From Ordonnance Where Ordo_ID="' +
            Rand + '"');
          Active := True;
          Edit;
          FieldByName('Patient_ID').AsString := RandD;
          Post;
          Active := False;
          SQL.Clear;
        End;
      except
        on E: Exception do
      end;
    end;
  end;
end;

procedure TFrame7.LoadGrid(const RandD: string);
begin
  With DataModule1.FDQ_Ordonnance do
  Begin
    SQL.Clear;
    SQL.Text :=
      ('Select Medicament, Dose, Prise, Jour, Pendent From Ordonnance Where Patient_ID="'
      + RandD + '";');
    Active := True;
    StringGridResize;
  End;
end;

procedure TFrame7.Insert();
Var
  Rand: String;
  bol: Boolean;
begin
  Tub := TList<String>.Create;
  With DataModule1.FDQ_Ordonnance do
  Begin
    Active := False;
    SQL.Create;
    SQL.Text :=
      ('Select Ordo_ID, Medicament,Dose,Prise,Jour,Pendent From Ordonnance');
    Active := True;
    Insert;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'O' + Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Ordo_ID').AsString := Rand;
    Tub.add(Rand);
    FieldByName('Medicament').AsString := ComboBox1.Selected.Text;
    FieldByName('Dose').AsString := Edit1.Text;
    FieldByName('Prise').AsString := Edit2.Text;
    FieldByName('Jour').AsString := Edit3.Text;
    FieldByName('Pendent').AsString := Edit4.Text;
    Post;
    Active := False;
  End;
end;

procedure TFrame7.Button2Click(Sender: TObject);
begin
  Insert;
end;

procedure TFrame7.Edit;
Var
  Rand: String;
  bol: Boolean;
begin
  bol := False;
  Tub := TList<String>.Create;
  With DataModule1.FDQ_Ordonnance do
  Begin
    Active := False;
    SQL.Create;
    SQL.Text :=
      ('Select Ordo_ID, Medicament,Dose,Prise,Jour,Pendent From Ordonnance');
    Active := True;
    Edit;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'O' + Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Ordo_ID').AsString := Rand;
    Tub.add(Rand);
    if (ComboBox1.ItemIndex <> -1) then
      FieldByName('Medicament').AsString := ComboBox1.Selected.Text;
    FieldByName('Dose').AsString := Edit1.Text;
    FieldByName('Prise').AsString := Edit2.Text;
    FieldByName('Jour').AsString := Edit3.Text;
    FieldByName('Pendent').AsString := Edit4.Text;
    Post;
    Active := False;
  End;
end;

procedure TFrame7.FrameResize(Sender: TObject);
begin
  Layout1.Width := L_Top_Ordonnance.Width / 2;
  Layout2.Width := L_Top_Ordonnance.Width / 2;
  Layout3.Width := Layout2.Width / 4;
  Layout4.Width := Layout2.Width / 4;
  Layout5.Width := Layout2.Width / 4;
  Layout6.Width := Layout2.Width / 4;
end;

end.
