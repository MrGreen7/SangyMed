unit U_Print_SR;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, U_Base_Form,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Printer,
  FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TPrint_SR = class(TBase_Form)
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
    Rectangle6: TRectangle;
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
    Text46: TText;
    Text47: TText;
    Text48: TText;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Text11: TText;
    Text12: TText;
    Text17: TText;
    Text18: TText;
    Text19: TText;
    Text20: TText;
    Text21: TText;
    Text22: TText;
    Text23: TText;
    Text24: TText;
    Text26: TText;
    Text28: TText;
    Text27: TText;
    Text29: TText;
    Text30: TText;
    Text31: TText;
    Text32: TText;
    Text33: TText;
    Text34: TText;
    Text36: TText;
    Text37: TText;
    Text38: TText;
    Text39: TText;
    Text35: TText;
    Text40: TText;
    Text41: TText;
    Text49: TText;
    Text50: TText;
    Text51: TText;
    Text52: TText;
    Text53: TText;
    Text54: TText;
    Text55: TText;
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
    Image1: TImage;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle2: TRectangle;
    Text10: TText;
    procedure Rez();
    procedure Print_ButtonClick(Sender: TObject);
    procedure OnLoad;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Print_SR: TPrint_SR;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TPrint_SR.Print_ButtonClick(Sender: TObject);
Var
  DestRect: TRectF;
begin
  if (PrintDialog.Execute) then
  Begin
    SetPrinter(Printer);
    Printer.Orientation := TPrinterOrientation.poPortrait;
    Printer.Title := 'Sérologie';
    Printer.ActivePrinter.SelectDPI(1200, 1200);
    Printer.BeginDoc;
    DestRect := TRectF.Create(0, 0, Printer.PageWidth, Printer.PageHeight);
    Rectangle1.PaintTo(Printer.Canvas, DestRect);
    Printer.EndDoc;
    ModalResult := mrCancel;
  End;
end;

procedure TPrint_SR.FormCreate(Sender: TObject);
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

procedure TPrint_SR.Rez();
Begin
  LabelRez(Text2);
  Resiz(Text13, '');
  Resiz(Text43, '');
  Resiz(Text45, '');
  Resiz(Text46, '');
  Resiz(Text48, '');
End;

procedure TPrint_SR.OnLoad();
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
    Text4.Text := FieldByName('Telephone').AsString;
    Text7.Text := DateToStr(date);
    Text46.Text := FieldByName('Email').AsString;
    Text45.Text := FieldByName('Adresse').AsString;;
    Text48.Text := FieldByName('Web').AsString;
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
    SQL.Text := ('Select * From Serologie Where Patient_ID="' +
      Main.Patient_ID + '";');
    Active := True;
    Open;
    // Anti-HVA
    if (FieldByName('HA_Anti-VHA').AsBoolean = True) then
      Text29.Text := 'Positif'
    else
      Text29.Text := 'Négatif';
    // IgA
    if (FieldByName('HA_IgM').AsBoolean = True) then
      Text30.Text := 'Positif'
    else
      Text30.Text := 'Négatif';
    // IgG
    if (FieldByName('HA_IgG').AsBoolean = True) then
      Text31.Text := 'Positif'
    else
      Text31.Text := 'Négatif';
    // Anti-VHB
    if (FieldByName('HB_Anti-VHB').AsBoolean = True) then
      Text34.Text := 'Positif'
    else
      Text34.Text := 'Négatif';
    // Anti-VHB
    if (FieldByName('HB_Antigene_HBs').AsBoolean = True) then
      Text39.Text := 'Positif'
    else
      Text39.Text := 'Négatif';
    // Anti-VHC
    if (FieldByName('HC_Anit-VHC').AsBoolean = True) then
      Text38.Text := 'Positif'
    else
      Text38.Text := 'Négatif';
    // Anti-HIV
    if (FieldByName('VIH_Anti-VIH').AsBoolean = True) then
      Text40.Text := 'Positif'
    else
      Text40.Text := 'Négatif';
    // Anti-Rub-M
    if (FieldByName('RUB_Anti_M').AsBoolean = True) then
      Text52.Text := 'Positif'
    else
      Text52.Text := 'Négatif';
    // Anti-Rub-G
    if (FieldByName('RUB_Anti_G').AsBoolean = True) then
      Text53.Text := 'Positif'
    else
      Text53.Text := 'Négatif';
    // Anti-Rub-A
    if (FieldByName('RUB_Anti_A').AsBoolean = True) then
      Text55.Text := 'Positif'
    else
      Text55.Text := 'Négatif';
    // Salm-Anti-H
    if (FieldByName('Salm_Anti_H').AsBoolean = True) then
      Text59.Text := 'Positif'
    else
      Text59.Text := 'Négatif';
    // Salm-Anti-O
    if (FieldByName('Salm_Anti_O').AsBoolean = True) then
      Text58.Text := 'Positif'
    else
      Text58.Text := 'Négatif';
    // EBNA
    if (FieldByName('Mono_Anti_G_Anti_EBNA').AsBoolean = True) then
      Text62.Text := 'Positif'
    else
      Text62.Text := 'Négatif';
    // VCA
    if (FieldByName('Mono_Anti_G_Anti_VCA').AsBoolean = True) then
      Text64.Text := 'Positif'
    else
      Text64.Text := 'Négatif';
    // EA
    if (FieldByName('Mono_Anti_G_Anti_EA').AsBoolean = True) then
      Text68.Text := 'Positif'
    else
      Text68.Text := 'Négatif';
    // VCA
    if (FieldByName('Mono_Anti_EBV').AsBoolean = True) then
      Text66.Text := 'Positif'
    else
      Text66.Text := 'Négatif';
    // TOXO
    if (FieldByName('Toxo_Anti_M').AsBoolean = True) then
      Text23.Text := 'Positif'
    else
      Text23.Text := 'Négatif';
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
  Resiz(Text1, JRDQ);
End;

end.
