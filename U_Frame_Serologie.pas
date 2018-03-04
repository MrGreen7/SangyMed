unit U_Frame_Serologie;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl;

type
  TFrame5 = class(TFrame)
    TabControl1: TTabControl;
    TabItem8: TTabItem;
    GroupBox6: TGroupBox;
    RB_HA_IgM: TRadioButton;
    RB_HA_IgG: TRadioButton;
    CB_HA_Anit_VHA: TCheckBox;
    GroupBox7: TGroupBox;
    CB_HB_Anti_VHB: TCheckBox;
    CB_HB_Antigene_BHs: TCheckBox;
    GroupBox8: TGroupBox;
    CB_HC_Anti_VHC: TCheckBox;
    GroupBox9: TGroupBox;
    CB_VIH_Anti_VIH: TCheckBox;
    TabItem9: TTabItem;
    GroupBox16: TGroupBox;
    GroupBox10: TGroupBox;
    CB_MI_Anti_EBV: TCheckBox;
    CB_MI_VCA: TCheckBox;
    CB_MI_EBNA: TCheckBox;
    CB_MI_EA: TCheckBox;
    GroupBox13: TGroupBox;
    CB_RUB_IgM: TCheckBox;
    CB_RUB_IgA: TCheckBox;
    CB_RUB_IgG: TCheckBox;
    GroupBox11: TGroupBox;
    CB_SFT_Anti_O: TCheckBox;
    CB_SFT_Anti_H: TCheckBox;
    GroupBox17: TGroupBox;
    GroupBox15: TGroupBox;
    CB_Toxo_Anti_IgM: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
