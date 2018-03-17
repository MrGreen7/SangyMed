unit U_Print_Ordo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Printer;

type
  TPrint_Ordo = class(TForm)
    PrintDialog: TPrintDialog;
    ScrollBox: TScrollBox;
    Rectangle1: TRectangle;
    ToolBar: TToolBar;
    Cancel_Button: TButton;
    Print_Button: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Print_Ordo: TPrint_Ordo;

implementation

{$R *.fmx}

end.
