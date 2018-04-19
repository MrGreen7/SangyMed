unit U_Print_HS;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, U_Base_Form,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Printer,
  FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TPrint_HS = class(TBase_Form)
    PrintDialog: TPrintDialog;
    ScrollBox: TScrollBox;
    ToolBar: TToolBar;
    Cancel_Button: TButton;
    Print_Button: TButton;
    Rectangle1: TRectangle;
    Text9: TText;
    Text5: TText;
    Layout1: TLayout;
    Text25: TText;
    Line9: TLine;
    Layout_Header: TLayout;
    Rectangle5: TRectangle;
    Text4: TText;
    Text: TText;
    Text1: TText;
    Text2: TText;
    Text7: TText;
    Text6: TText;
    Text8: TText;
    Text15: TText;
    Text16: TText;
    Text14: TText;
    Text42: TText;
    Text43: TText;
    Text13: TText;
    Text3: TText;
    Text44: TText;
    Text45: TText;
    Text10: TText;
    Text46: TText;
    Text47: TText;
    Rectangle6: TRectangle;
    Rectangle3: TRectangle;
    Text11: TText;
    Rectangle2: TRectangle;
    Text12: TText;
    Text17: TText;
    Text20: TText;
    Text18: TText;
    Text19: TText;
    Text21: TText;
    Text22: TText;
    Text23: TText;
    Text24: TText;
    Text26: TText;
    Text27: TText;
    Text28: TText;
    Text29: TText;
    Image1: TImage;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure Rez();
    procedure OnLoad;
    procedure Print_ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Print_HS: TPrint_HS;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TPrint_HS.FormCreate(Sender: TObject);
begin
  OnLoad;
end;

procedure Resiz(const Obj: TText; const JRDQ: String);
Var
  i, n, n1, w, w1: integer;
Begin
  n := 0;
  for i := 0 to Obj.Text.Length do
    n := i;
  if (JRDQ = '') then
  Begin
    if (n > 5) then
    Begin
      n1 := 7;
      w1 := 84;
      n := n - n1;
      w := 12 * n;
      w1 := w1 + w;
      Obj.Width := w1;
    End
    else if ((n <= 5) and (n > 0)) then
    Begin
      n1 := 1;
      w1 := 10;
      n := n - n1;
      w := 10 * n;
      w1 := w1 + w;
      Obj.Width := w1;
    End;
  End
  else
  Begin
    if (JRDQ = 'EPH') then
    Begin
      n1 := 38;
      w1 := 453;
      n := n - n1;
      w := 11 * n;
      w1 := w1 + w;
      Obj.Width := w1;
      Obj.Position.X := ((794 - w1) / 2);
    End
    else if (JRDQ = 'EPSP') then
    Begin
      n1 := 49;
      w1 := 511;
      n := n - n1;
      w := 10 * n;
      w1 := w1 + w;
      Obj.Width := w1;
      Obj.Position.X := ((794 - w1) / 2);
    End;
  End;
End;

procedure LabelRez(const Obj: TText);
Var
  i, n, n1, w, w1: integer;
Begin
  n := 0;
  for i := 0 to Obj.Text.Length do
    n := i;
  n1 := 3;
  w1 := 11;
  n := n - n1;
  w := w1 * n;
  w1 := w1 + w;
  Obj.Width := w1;
  Obj.Position.X := ((794 - w1) / 2);
End;

procedure TPrint_HS.Rez();
Begin
  LabelRez(Text2);
  Resiz(Text13, '');
  Resiz(Text43, '');
  Resiz(Text45, '');
  Resiz(Text10, '');
  Resiz(Text47, '');
  Resiz(Text20,'');
  Resiz(Text21,'');
  Resiz(Text22,'');
  Resiz(Text24,'');
End;

procedure TPrint_HS.OnLoad();
Var
  JRDQ: String;
Begin
  With DataModule1.FDQ_Entreprise Do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('Select * From Etablissement');
    Active := True;
    Open;
    JRDQ := FieldByName('Form_Juridique').AsString;
    if (JRDQ = 'EPH') then
      Text1.Text := ('Etablissement Publique Hospitalier de ')
    else if (JRDQ = 'EPSP') then
      Text1.Text := ('Etablessement Publique de Santé de Proximité de ');
    Text1.Text := Text1.Text + FieldByName('Commune').AsString;
    Text2.Text := FieldByName('Libelle').AsString;
    Text4.Text := FieldByName('Mobile').AsString;
    Text7.Text := DateToStr(date);
    Text10.Text := FieldByName('Email').AsString;
    Text45.Text := FieldByName('Adresse').AsString;;
    Text47.Text := FieldByName('Web').AsString;
    Close;
    Active := False;
    SQL.Clear;
  End;
  With DataModule1.FDQuery2 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('Select Nom,Prenom From Patient Where Patient_ID="' +
      Main.Patient_ID + '";');
    Active := True;
    Open;
    Text13.Text := FieldByName('Nom').AsString + ' ' +
      FieldByName('Prenom').AsString;
    Text15.Text := Main.Patient_ID;
    Close;
    Active := False;
    SQL.Clear
  End;
  With DataModule1.FDQuery2 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := ('Select * From Hemostase_VS Where Patient_ID="' +
      Main.Patient_ID + '";');
    Active := True;
    Open;
    Text20.Text := FieldByName('TS').AsString;
    Text21.Text := FieldByName('TCK').AsString;
    Text22.Text := FieldByName('TP').AsString;
    Text24.Text := FieldByName('VS').AsString;
    Close;
    Active := False;
    SQL.Clear;
    SQL.Text := ('Select Nom From Medecin Where ID="' + Main.ID_Medecin + '";');
    Active := True;
    Open;
    Text43.Text := FieldByName('Nom').AsString;
    Close;
    SQL.Clear;
    Active := False;
  End;
  Rez();
   Resiz(Text1,JRDQ);
End;

procedure TPrint_HS.Print_ButtonClick(Sender: TObject);
Var
  DestRect: TRectF;
begin
  if (PrintDialog.Execute) then
  Begin
    SetPrinter(Printer);
    Printer.Orientation := TPrinterOrientation.poPortrait;
    Printer.Title := 'Hémostase VS';
    Printer.ActivePrinter.SelectDPI(1200, 1200);
    Printer.BeginDoc;
    DestRect := TRectF.Create(0, 0, Printer.PageWidth, Printer.PageHeight);
    Rectangle1.PaintTo(Printer.Canvas, DestRect);
    Printer.EndDoc;
    ModalResult := mrCancel;
  End;
end;

end.
