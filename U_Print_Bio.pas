unit U_Print_Bio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, U_Base_Form,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.Printer, FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Comp.UI;

type
  TPrint_Bio = class(TBase_Form)
    PrintDialog: TPrintDialog;
    ToolBar: TToolBar;
    Cancel_Button: TButton;
    Print_Button: TButton;
    RectangleM: TRectangle;
    Text9: TText;
    Text5: TText;
    Layout1: TLayout;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    Line5: TLine;
    Line6: TLine;
    Line7: TLine;
    Line8: TLine;
    Text10: TText;
    Text11: TText;
    Text12: TText;
    Text17: TText;
    Text25: TText;
    Line9: TLine;
    Text18: TText;
    Text19: TText;
    Text20: TText;
    Text21: TText;
    Text22: TText;
    Text23: TText;
    Text44: TText;
    Text45: TText;
    Text46: TText;
    Text47: TText;
    Text48: TText;
    Text49: TText;
    Text50: TText;
    Text51: TText;
    Text52: TText;
    Text53: TText;
    Text54: TText;
    Text55: TText;
    Line1: TLine;
    Line10: TLine;
    Line11: TLine;
    Line12: TLine;
    Line13: TLine;
    Line14: TLine;
    Line15: TLine;
    Line16: TLine;
    Line17: TLine;
    Line18: TLine;
    Line19: TLine;
    Line20: TLine;
    Line21: TLine;
    Line22: TLine;
    Line23: TLine;
    Line24: TLine;
    Line25: TLine;
    Line26: TLine;
    Layout_Analyses: TLayout;
    Layout_resultats: TLayout;
    Layout_Valuers: TLayout;
    Text24: TText;
    Text26: TText;
    Text27: TText;
    Text28: TText;
    Text29: TText;
    Text30: TText;
    Text31: TText;
    Text32: TText;
    Text33: TText;
    Text34: TText;
    Text35: TText;
    Text36: TText;
    Text37: TText;
    Text38: TText;
    Text39: TText;
    Text40: TText;
    Text41: TText;
    Text56: TText;
    Text57: TText;
    Text58: TText;
    Text59: TText;
    Text60: TText;
    Text61: TText;
    Text62: TText;
    Text63: TText;
    Text64: TText;
    Text65: TText;
    Text66: TText;
    Text67: TText;
    Text68: TText;
    Text69: TText;
    Text70: TText;
    Text71: TText;
    Text72: TText;
    Text73: TText;
    Text74: TText;
    Text75: TText;
    Text76: TText;
    ScrollBox: TScrollBox;
    Layout_Header: TLayout;
    Rectangle5: TRectangle;
    Text4: TText;
    Text: TText;
    Text1: TText;
    Text2: TText;
    Text7: TText;
    Text6: TText;
    Text82: TText;
    Text15: TText;
    Text84: TText;
    Text85: TText;
    Text86: TText;
    Text43: TText;
    Text13: TText;
    Text89: TText;
    Text90: TText;
    Text91: TText;
    Text3: TText;
    Text93: TText;
    Text94: TText;
    Rectangle6: TRectangle;
    Image1: TImage;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    procedure Rez();
    procedure OnLoad;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Print_ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Print_Bio: TPrint_Bio;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TPrint_Bio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrCancel;
end;

procedure TPrint_Bio.FormCreate(Sender: TObject);
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

procedure TPrint_Bio.Rez();
Begin
  Resiz(Text43, '');
  Resiz(Text13, '');
  Resiz(Text94, '');
  Resiz(Text3, '');
  Resiz(Text91, '');
  LabelRez(Text2);
  //
  Resiz(Text57, '');
  Resiz(Text56, '');
  Resiz(Text37, '');
  Resiz(Text36, '');
  Resiz(Text35, '');
  Resiz(Text38, '');
  Resiz(Text28, '');
  Resiz(Text41, '');
  Resiz(Text39, '');
  Resiz(Text34, '');
  Resiz(Text29, '');
  Resiz(Text30, '');
  Resiz(Text31, '');
  Resiz(Text26, '');
  Resiz(Text32, '');
  Resiz(Text33, '');
  Resiz(Text40, '');
  Resiz(Text27, '');
  Resiz(Text24, '');
end;

procedure TPrint_Bio.OnLoad();
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
      Text1.Text := ('Établissement Publique Hospitalier de ')
    else if (JRDQ = 'EPSP') then
      Text1.Text := ('Établissement Publique de Santé de Proximité de ');
    Text1.Text := Text1.Text + FieldByName('Commune').AsString;
    Text2.Text := FieldByName('Libelle').AsString;
    Text4.Text := FieldByName('Telephone').AsString;
    Text7.Text := DateToStr(date);
    Text3.Text := FieldByName('Email').AsString;
    Text91.Text := FieldByName('Adresse').AsString;;
    Text94.Text := FieldByName('Web').AsString;
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
    Text43.Text := FieldByName('Nom').AsString + ' ' +
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
    SQL.Text := ('Select * From Biochimie Where Patient_ID="' +
      Main.Patient_ID + '";');
    Active := True;
    Open;
    Text57.Text := FieldByName('Glycemie').AsString;
    Text56.Text := FieldByName('Uree_Sang').AsString;
    Text37.Text := FieldByName('Createnine').AsString;
    Text36.Text := FieldByName('Cholesterole').AsString;
    Text35.Text := FieldByName('Triglycerides').AsString;
    Text38.Text := FieldByName('HDL').AsString;
    Text28.Text := FieldByName('LDL').AsString;
    Text41.Text := FieldByName('Acide_Urique').AsString;
    Text39.Text := FieldByName('CRP').AsString;
    Text34.Text := FieldByName('TGO').AsString;
    Text29.Text := FieldByName('TGP').AsString;
    Text30.Text := FieldByName('PAL').AsString;
    Text31.Text := FieldByName('TP').AsString;
    Text26.Text := FieldByName('INR').AsString;
    Text32.Text := FieldByName('BilirubineT').AsString;
    Text33.Text := FieldByName('BilirubineD').AsString;
    Text40.Text := FieldByName('ASLO').AsString;
    Text27.Text := FieldByName('Calcemie').AsString;
    Text24.Text := FieldByName('Albuminemie').AsString;
    Close;
    Active := False;
    SQL.Clear;
    SQL.Text := ('Select Nom From Medecin Where ID="' + Main.ID_Medecin + '"');
    Active := True;
    Open;
    Text13.Text := FieldByName('Nom').AsString;
    Close;
    SQL.Clear;
    Active := False;
  End;
  Resiz(Text1, JRDQ);
  Rez();
End;

procedure TPrint_Bio.Print_ButtonClick(Sender: TObject);
Var
  DestRect: TRectF;
begin
  if (PrintDialog.Execute) then
  Begin
    SetPrinter(Printer);
    Printer.Orientation := TPrinterOrientation.poPortrait;
    Printer.Title := 'Analyse Biochimique';
    Printer.ActivePrinter.SelectDPI(1200, 1200);
    Printer.BeginDoc;
    DestRect := TRectF.Create(0, 0, Printer.PageWidth, Printer.PageHeight);
    Rectangle1.PaintTo(Printer.Canvas, DestRect);
    Printer.EndDoc;
    ModalResult := mrCancel;
  End;
end;

end.
