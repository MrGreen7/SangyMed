unit U_Frame_Hemostase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrame4 = class(TFrame)
    Layout_Frame: TLayout;
    GroupBox3: TGroupBox;
    Hemos_Edit1: TEdit;
    Label23: TLabel;
    Hemos_Edit2: TEdit;
    Label24: TLabel;
    Hemos_Edit3: TEdit;
    Label25: TLabel;
    Hemos_Label3: TLabel;
    Hemos_Label2: TLabel;
    Hemos_Label1: TLabel;
    GroupBox4: TGroupBox;
    L_topVs: TLayout;
    Label17: TLabel;
    Hemos_Edit4: TEdit;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
