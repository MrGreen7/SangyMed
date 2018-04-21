unit U_Base_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TBase_Form = class(TForm)
    Windows10SlateGrey: TStyleBook;
    Windows10: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Base_Form: TBase_Form;

implementation
{$R *.fmx}

end.
