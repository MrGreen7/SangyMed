unit U_Frame_Principale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.DateTimeCtrls, FMX.Effects, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation;

type
  TFrame1 = class(TFrame)
    GroupBox_Info: TGroupBox;
    Layout_Top_1: TLayout;
    Layout_Right1: TLayout;
    IP_Label8: TLabel;
    IP_ComboBox2: TComboBox;
    Layout_Left_1: TLayout;
    IP_Label4: TLabel;
    IP_ComboBox1: TComboBox;
    Layout_Top_3: TLayout;
    Layout_Right3: TLayout;
    IP_Label7: TLabel;
    IP_ComboBox3: TComboBox;
    InnerGlowEffect3Combo3: TInnerGlowEffect;
    Layout_Left_3: TLayout;
    IP_Label3: TLabel;
    IP_DateEdit1: TDateEdit;
    Layout_Top_4: TLayout;
    Layout_Right4: TLayout;
    IP_Label6: TLabel;
    IP_Edit3: TEdit;
    InnerGlowEffectEdit3: TInnerGlowEffect;
    Layout_Left_4: TLayout;
    IP_Label2: TLabel;
    IP_Edit2: TEdit;
    InnerGlowEffectEdit2: TInnerGlowEffect;
    Layout_Top_2: TLayout;
    Layout_Right2: TLayout;
    IP_Label5: TLabel;
    IP_DateEdit2: TDateEdit;
    Layout_Left_2: TLayout;
    IP_Label1: TLabel;
    IP_Edit1: TEdit;
    GroupBox_Liens: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ImageControl1: TImageControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
