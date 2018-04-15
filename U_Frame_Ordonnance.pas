unit U_Frame_Ordonnance;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts,
  System.Generics.Collections, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFrame7 = class(TFrame)
    L_Top_Ordonnance: TLayout;
    Layout1: TLayout;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Edit2: TEdit;
    Layout4: TLayout;
    Edit1: TEdit;
    Layout5: TLayout;
    Edit4: TEdit;
    Layout6: TLayout;
    Edit3: TEdit;
    Layout7: TLayout;
    Button1: TButton;
    StringGridBindSourceDB1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button3: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

end.
