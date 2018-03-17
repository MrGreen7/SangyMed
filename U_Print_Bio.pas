unit U_Print_Bio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.Printer;

type
  TPrint_Bio = class(TForm)
    PrintDialog: TPrintDialog;
    ScrollBox: TScrollBox;
    ToolBar: TToolBar;
    Cancel_Button: TButton;
    Print_Button: TButton;
    Rectangle1: TRectangle;
    Text9: TText;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    Text4: TText;
    Text5: TText;
    Text6: TText;
    Text7: TText;
    Text8: TText;
    Layout1: TLayout;
    Line1: TLine;
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
    Text13: TText;
    Text14: TText;
    Text15: TText;
    Text16: TText;
    Text19: TText;
    Text20: TText;
    Text21: TText;
    Text22: TText;
    Text23: TText;
    Text24: TText;
    Text17: TText;
    Text18: TText;
    Text33: TText;
    Text34: TText;
    Text35: TText;
    Text36: TText;
    Text37: TText;
    Text38: TText;
    Text39: TText;
    Text40: TText;
    Text25: TText;
    Text26: TText;
    Text27: TText;
    Text28: TText;
    Text29: TText;
    Text30: TText;
    Text31: TText;
    Text32: TText;
    Text41: TText;
    Line9: TLine;
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
      Text1.Text := ('Etablissement Publique Hospitalier de ')
    else if (JRDQ = 'EPSP') then
      Text1.Text := ('Etablessement Publique de Santé de Proximité de ');
    Text1.Text := Text1.Text + FieldByName('Commune').AsString;
    Text2.Text := FieldByName('Libelle').AsString;
    Text4.Text := FieldByName('Mobile').AsString;
    Text7.Text := DateToStr(date);
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
    SQL.Text := ('Select * From Biochimie Where Patient_ID="' +
      Main.Patient_ID + '";');
    Active := True;
    Open;
    Close;
    Active := False;
    SQL.Clear
  End;
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
