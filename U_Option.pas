unit U_Option;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,U_Base_Form,
  FMX.Layouts, FMX.TreeView, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TOption = class(TBase_Form)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Option: TOption;

implementation

{$R *.fmx}

end.
