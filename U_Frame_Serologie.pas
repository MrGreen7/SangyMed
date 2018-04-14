unit U_Frame_Serologie;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
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
    function Pret: Boolean;
    procedure Clear;
    procedure Insert(const RandD: String);
    procedure Edit(const RandD: String);
    procedure OnDataLoad;
    procedure CB_HA_Anit_VHAChange(Sender: TObject);
    procedure FrameResize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TFrame5.OnDataLoad;
begin
  With Main do
  Begin
    if (Patient_ID <> '') then
    Begin
      With DataModule1.FDQuery2 do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := ('Select * From Serologie Where Patient_ID="' +
          Patient_ID + '"');
        Active := True;
        Open;
        // HA - #VHA
        if (FieldByName('HA_Anti-VHA').AsBoolean = True) then
          CB_HA_Anit_VHA.IsChecked := True
        else
          CB_HA_Anit_VHA.IsChecked := False;
        // HA - IgM
        if (FieldByName('HA_IgM').AsBoolean = True) then
          RB_HA_IgM.IsChecked := True
        else
          RB_HA_IgM.IsChecked := False;
        // Ha - IgG
        if (FieldByName('HA_IgG').AsBoolean = True) then
          RB_HA_IgG.IsChecked := True
        else
          RB_HA_IgG.IsChecked := False;
        // HB - #VHB
        if (FieldByName('HB_Anti-VHB').AsBoolean = True) then
          CB_HB_Anti_VHB.IsChecked := True
        else
          CB_HB_Anti_VHB.IsChecked := False;
        // HB - #HBs
        if (FieldByName('HB_Antigene_HBs').AsBoolean = True) then
          CB_HB_Antigene_BHs.IsChecked := True
        else
          CB_HB_Antigene_BHs.IsChecked := False;
        // HC
        if (FieldByName('HC_Anit-VHC').AsBoolean = True) then
          CB_HC_Anti_VHC.IsChecked := True
        else
          CB_HC_Anti_VHC.IsChecked := False;
        // VIH
        if (FieldByName('VIH_Anti-VIH').AsBoolean = True) then
          CB_VIH_Anti_VIH.IsChecked := True
        else
          CB_VIH_Anti_VIH.IsChecked := False;
        // RUB - IgA
        if (FieldByName('RUB_Anti_A').AsBoolean = True) then
          CB_RUB_IgA.IsChecked := True
        else
          CB_RUB_IgA.IsChecked := False;
        // RUB - IgG
        if (FieldByName('RUB_Anti_G').AsBoolean = True) then
          CB_RUB_IgG.IsChecked := True
        else
          CB_RUB_IgG.IsChecked := False;
        // RUB - IgM
        if (FieldByName('RUB_Anti_M').AsBoolean = True) then
          CB_RUB_IgM.IsChecked := True
        else
          CB_RUB_IgM.IsChecked := False;
        // Salmonelloses - #O
        if (FieldByName('Salm_Anti_O').AsBoolean = True) then
          CB_SFT_Anti_O.IsChecked := True
        else
          CB_SFT_Anti_O.IsChecked := False;
        // Salmonelloses - #H
        if (FieldByName('Salm_Anti_H').AsBoolean = True) then
          CB_SFT_Anti_H.IsChecked := True
        else
          CB_SFT_Anti_H.IsChecked := False;
        // Mono - #EBV
        if (FieldByName('Mono_Anti_EBV').AsBoolean = True) then
          CB_MI_Anti_EBV.IsChecked := True
        else
          CB_MI_Anti_EBV.IsChecked := False;
        // Mono - EBNA
        if (FieldByName('Mono_Anti_G_Anti_EBNA').AsBoolean = True) then
          CB_MI_EBNA.IsChecked := True
        else
          CB_MI_EBNA.IsChecked := False;
        // Mono - VCA
        if (FieldByName('Mono_Anti_G_Anti_VCA').AsBoolean = True) then
          CB_MI_VCA.IsChecked := True
        else
          CB_MI_VCA.IsChecked := False;
        // Mono - EA
        if (FieldByName('Mono_Anti_G_Anti_EA').AsBoolean = True) then
          CB_MI_EA.IsChecked := True
        else
          CB_MI_EA.IsChecked := False;
        // Toxo
        if (FieldByName('Toxo_Anti_M').AsBoolean = True) then
          CB_Toxo_Anti_IgM.IsChecked := True
        else
          CB_Toxo_Anti_IgM.IsChecked := False;
        Close;
        Active := False;
        SQL.Clear;
      end;
    End;
  End;
end;

function TFrame5.Pret;
begin
  if ((CB_HA_Anit_VHA.IsChecked = False) and (RB_HA_IgG.IsChecked = False) and
    (RB_HA_IgM.IsChecked = False) and (CB_HB_Anti_VHB.IsChecked = False) and
    (CB_HB_Antigene_BHs.IsChecked = False) and
    (CB_HC_Anti_VHC.IsChecked = False) and (CB_VIH_Anti_VIH.IsChecked = False)
    and (CB_MI_Anti_EBV.IsChecked = False) and (CB_MI_EA.IsChecked = False) and
    (CB_MI_VCA.IsChecked = False) and (CB_MI_EBNA.IsChecked = False) and
    (CB_SFT_Anti_H.IsChecked = False) and (CB_SFT_Anti_O.IsChecked = False) and
    (CB_RUB_IgM.IsChecked = False) and (CB_RUB_IgA.IsChecked = False) and
    (CB_RUB_IgG.IsChecked = False) and (CB_Toxo_Anti_IgM.IsChecked = False))
  then
  Begin
    Result := False;
  End
  Else
    Result := True;
end;

procedure TFrame5.CB_HA_Anit_VHAChange(Sender: TObject);
begin
  if (CB_HA_Anit_VHA.IsChecked = True) then
  Begin
    RB_HA_IgM.Enabled := True;
    RB_HA_IgG.Enabled := True;
  End
  else
  Begin
    RB_HA_IgM.IsChecked := False;
    RB_HA_IgG.IsChecked := False;
    RB_HA_IgM.Enabled := False;
    RB_HA_IgG.Enabled := False;
  End;
end;

procedure TFrame5.Clear;
BEgin
  // Hépatite A
  CB_HA_Anit_VHA.IsChecked := False;
  RB_HA_IgG.IsChecked := False;
  RB_HA_IgM.IsChecked := False;
  // Hépatite B
  CB_HB_Anti_VHB.IsChecked := False;
  CB_HB_Antigene_BHs.IsChecked := False;
  // Hépatite C
  CB_HC_Anti_VHC.IsChecked := False;
  // VIH
  CB_VIH_Anti_VIH.IsChecked := False;
  // mononucléos infectieus
  CB_MI_Anti_EBV.IsChecked := False;
  CB_MI_EA.IsChecked := False;
  CB_MI_VCA.IsChecked := False;
  CB_MI_EBNA.IsChecked := False;
  // salmonelloses
  CB_SFT_Anti_H.IsChecked := False;
  CB_SFT_Anti_O.IsChecked := False;
  // Rubéole
  CB_RUB_IgM.IsChecked := False;
  CB_RUB_IgA.IsChecked := False;
  CB_RUB_IgG.IsChecked := False;
  // Toxoplasme
  CB_Toxo_Anti_IgM.IsChecked := False;
End;

procedure TFrame5.Insert(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Serologie';
    Active := True;
    Insert;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'S' + Rand;
        FieldByName('Serologie_ID').AsString := Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Patient_ID').AsString := RandD;
    FieldByName('HA_Anti-VHA').AsBoolean := CB_HA_Anit_VHA.IsChecked;
    FieldByName('HA_IgG').AsBoolean := RB_HA_IgG.IsChecked;
    FieldByName('HA_IgM').AsBoolean := RB_HA_IgM.IsChecked;
    FieldByName('HB_Anti-VHB').AsBoolean := CB_HB_Anti_VHB.IsChecked;
    FieldByName('HB_Antigene_HBs').AsBoolean := CB_HB_Antigene_BHs.IsChecked;
    FieldByName('HC_Anit-VHC').AsBoolean := CB_HC_Anti_VHC.IsChecked;
    FieldByName('VIH_Anti-VIH').AsBoolean := CB_VIH_Anti_VIH.IsChecked;
    FieldByName('RUB_Anti_M').AsBoolean := CB_RUB_IgM.IsChecked;
    FieldByName('RUB_Anti_A').AsBoolean := CB_RUB_IgA.IsChecked;
    FieldByName('RUB_Anti_G').AsBoolean := CB_RUB_IgG.IsChecked;
    FieldByName('Salm_Anti_H').AsBoolean := CB_SFT_Anti_H.IsChecked;
    FieldByName('Salm_Anti_O').AsBoolean := CB_SFT_Anti_O.IsChecked;
    FieldByName('Mono_Anti_EBV').AsBoolean := CB_MI_Anti_EBV.IsChecked;
    FieldByName('Mono_Anti_G_Anti_VCA').AsBoolean := CB_MI_VCA.IsChecked;
    FieldByName('Mono_Anti_G_Anti_EBNA').AsBoolean := CB_MI_EBNA.IsChecked;
    FieldByName('Mono_Anti_G_Anti_EA').AsBoolean := CB_MI_EA.IsChecked;
    FieldByName('Toxo_Anti_M').AsBoolean := CB_Toxo_Anti_IgM.IsChecked;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame5.Edit(const RandD: String);
Var
  Rand: String;
  bol: Boolean;
begin
  With DataModule1.FDQuery1 do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'Select * From Serologie Where Patient_ID="' +
      Main.Patient_ID + '"';
    Active := True;
    Edit;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'S' + Rand;
        FieldByName('Serologie_ID').AsString := Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Patient_ID').AsString := RandD;
    FieldByName('HA_Anti-VHA').AsBoolean := CB_HA_Anit_VHA.IsChecked;
    FieldByName('HA_IgG').AsBoolean := RB_HA_IgG.IsChecked;
    FieldByName('HA_IgM').AsBoolean := RB_HA_IgM.IsChecked;
    FieldByName('HB_Anti-VHB').AsBoolean := CB_HB_Anti_VHB.IsChecked;
    FieldByName('HB_Antigene_HBs').AsBoolean := CB_HB_Antigene_BHs.IsChecked;
    FieldByName('HC_Anit-VHC').AsBoolean := CB_HC_Anti_VHC.IsChecked;
    FieldByName('VIH_Anti-VIH').AsBoolean := CB_VIH_Anti_VIH.IsChecked;
    FieldByName('RUB_Anti_M').AsBoolean := CB_RUB_IgM.IsChecked;
    FieldByName('RUB_Anti_A').AsBoolean := CB_RUB_IgA.IsChecked;
    FieldByName('RUB_Anti_G').AsBoolean := CB_RUB_IgG.IsChecked;
    FieldByName('Salm_Anti_H').AsBoolean := CB_SFT_Anti_H.IsChecked;
    FieldByName('Salm_Anti_O').AsBoolean := CB_SFT_Anti_O.IsChecked;
    FieldByName('Mono_Anti_EBV').AsBoolean := CB_MI_Anti_EBV.IsChecked;
    FieldByName('Mono_Anti_G_Anti_VCA').AsBoolean := CB_MI_VCA.IsChecked;
    FieldByName('Mono_Anti_G_Anti_EBNA').AsBoolean := CB_MI_EBNA.IsChecked;
    FieldByName('Mono_Anti_G_Anti_EA').AsBoolean := CB_MI_EA.IsChecked;
    FieldByName('Toxo_Anti_M').AsBoolean := CB_Toxo_Anti_IgM.IsChecked;
    Post;
    Active := False;
    SQL.Clear;
  End;
end;

procedure TFrame5.FrameResize(Sender: TObject);
begin
  // Viral
  GroupBox6.Width := TabControl1.Width / 4;
  GroupBox7.Width := TabControl1.Width / 4;
  GroupBox8.Width := TabControl1.Width / 4;
  GroupBox9.Width := TabControl1.Width / 4;
  // Bact | Para
  GroupBox10.Width := GroupBox16.Width / 3;
  GroupBox11.Width := GroupBox16.Width / 3;
  GroupBox13.Width := GroupBox16.Width / 3;
end;

end.
