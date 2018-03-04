unit U_Base_Print;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.Printer;

type
  TBase_Print = class(TBase_Form)
    Base_PrintDialog: TPrintDialog;
    Base_ScrollBox: TScrollBox;
    ScaledLayout1: TScaledLayout;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    Text4: TText;
    Text6: TText;
    Text5: TText;
    Text10: TText;
    Text11: TText;
    Text12: TText;
    Text7: TText;
    Text8: TText;
    Text9: TText;
    Base_ToolBar: TToolBar;
    Base_Cancel_Button: TButton;
    Base_Print_Button: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Base_Print_ButtonClick(Sender: TObject);
    procedure Base_ScrollBoxCalcContentBounds(Sender: TObject;
      var ContentBounds: TRectF);
    procedure Base_ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; var Handled: Boolean);
    procedure ScaledLayout1Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Base_Print: TBase_Print;

implementation

{$R *.fmx}

procedure TBase_Print.Base_Print_ButtonClick(Sender: TObject);
var
  DestRect: TRectF;
begin
  inherited;
  if Base_PrintDialog.Execute then
  begin
    SetPrinter(Printer);
    Printer.Orientation := TPrinterOrientation.poPortrait;
    Printer.Title := 'Printer';
    Printer.ActivePrinter.SelectDPI(1200, 1200);
    Printer.BeginDoc;
    DestRect := TRectF.Create(0, 0, Printer.PageWidth, Printer.PageHeight);
    ScaledLayout1.PaintTo(Printer.Canvas, DestRect);
    Printer.EndDoc;
    Base_Print.Close;
  end;
end;

procedure TBase_Print.Base_ScrollBoxCalcContentBounds(Sender: TObject;
  var ContentBounds: TRectF);
begin
  inherited;
  with ScaledLayout1 do
  begin
    ContentBounds.Width := Position.X * 2 + OriginalWidth * Scale.X;
    ContentBounds.Height := Position.Y * 2 + OriginalHeight * Scale.Y;
  end;
end;

procedure TBase_Print.Base_ScrollBoxMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
var
  V, C: TPointF;
  Sn, So: Single;
begin
  inherited;
  V := Base_ScrollBox.ViewportPosition;
  C := Base_ScrollBox.AbsoluteToLocal(ScreenToClient(Screen.MousePos)) -
    ScaledLayout1.Position.Point;
  So := ScaledLayout1.Scale.X;
  Sn := So + (WheelDelta * So) / Base_ScrollBox.BoundsRect.BottomRight.Length;
  if Sn < 0.5 then
    Sn := 0.5;
  if So < 0.5 then
    So := 0.5;
  ScaledLayout1.Scale.Point := PointF(Sn, Sn);
  V := V + C;
  V := (V * (Sn / So)) - C;
  Base_ScrollBox.Content.BeginUpdate;
  Base_ScrollBox.ViewportPosition := V;
  Base_ScrollBox.Content.EndUpdate;
  Handled := True;
end;

procedure TBase_Print.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ModalResult := mrClose;
end;

procedure TBase_Print.ScaledLayout1Paint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
Var
  S: TStrokeBrush;
Begin
  inherited;
  S := TStrokeBrush.Create(TBrushKind.Solid, TAlphaColors.White);
  Canvas.FillRect(ARect, 0, 0, [], 1, S);
end;

end.
