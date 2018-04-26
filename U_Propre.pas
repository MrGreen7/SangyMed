unit U_Propre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, U_Base_Form,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Objects;

type
  TPropre = class(TBase_Form)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image3: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Propre: TPropre;

implementation

{$R *.fmx}

end.
