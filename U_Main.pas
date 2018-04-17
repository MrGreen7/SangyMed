unit U_Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.TabControl, FMX.TreeView, FMX.Layouts, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Ani, FMX.Effects, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.Grid, U_Frame_Principale, U_Frame_Serologie,
  U_Frame_Biochimic, U_Frame_Hemostase, U_Frame_Hemogramme, U_Frame_Information,
  FMX.Edit, U_Frame_Ordonnance, FMX.Menus, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, FMX.Bind.Grid, FMX.Bind.Editors, FireDAC.Stan.Def,
  FireDAC.FMXUI.Wait, FireDAC.Phys.SQLiteWrapper, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.SQLite, FMX.ListBox;

type
  TMain = class(TBase_Form)
    ListT: TTabControl;
    Medical: TTabItem;
    Panel5: TPanel;
    TreeView1: TTreeView;
    T_Accueil: TTreeViewItem;
    T_Patient: TTreeViewItem;
    Patient_Recherche: TTreeViewItem;
    New_Patient: TTreeViewItem;
    T_RDV: TTreeViewItem;
    HeaderT: TTabControl;
    H_Accueil: TTabItem;
    Panel4: TPanel;
    Layout6: TLayout;
    Layout22: TLayout;
    Label5: TLabel;
    ShadowEffect7: TShadowEffect;
    Label8: TLabel;
    Label4: TLabel;
    ShadowEffect9: TShadowEffect;
    ColorAnimation2: TColorAnimation;
    Layout24: TLayout;
    Label11: TLabel;
    ShadowEffect6: TShadowEffect;
    Label14: TLabel;
    Label10: TLabel;
    ShadowEffect3: TShadowEffect;
    ColorAnimation5: TColorAnimation;
    Layout25: TLayout;
    Label2: TLabel;
    ShadowEffect2: TShadowEffect;
    Label3: TLabel;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    ColorAnimation1: TColorAnimation;
    Line6: TLine;
    Line7: TLine;
    Line8: TLine;
    Line9: TLine;
    Layout23: TLayout;
    Label12: TLabel;
    ShadowEffect12: TShadowEffect;
    ColorAnimation4: TColorAnimation;
    Label13: TLabel;
    ShadowEffect13: TShadowEffect;
    Label7: TLabel;
    ShadowEffect5: TShadowEffect;
    Label9: TLabel;
    Line1: TLine;
    Label6: TLabel;
    ShadowEffect4: TShadowEffect;
    ColorAnimation3: TColorAnimation;
    H_Editeur: TTabItem;
    Panel6: TPanel;
    Layout26: TLayout;
    Layout32: TLayout;
    Label67: TLabel;
    ShadowEffect54: TShadowEffect;
    Label68: TLabel;
    Label69: TLabel;
    ColorAnimation32: TColorAnimation;
    ShadowEffect57: TShadowEffect;
    Layout33: TLayout;
    Label70: TLabel;
    ShadowEffect58: TShadowEffect;
    Label71: TLabel;
    ColorAnimation34: TColorAnimation;
    ShadowEffect59: TShadowEffect;
    Layout34: TLayout;
    Label72: TLabel;
    ShadowEffect60: TShadowEffect;
    Label73: TLabel;
    ShadowEffect61: TShadowEffect;
    ColorAnimation35: TColorAnimation;
    Line17: TLine;
    Line18: TLine;
    Line19: TLine;
    Layout35: TLayout;
    Label74: TLabel;
    ShadowEffect62: TShadowEffect;
    Label75: TLabel;
    ColorAnimation36: TColorAnimation;
    ShadowEffect63: TShadowEffect;
    Line16: TLine;
    H_Gen_Patient: TTabItem;
    Panel10: TPanel;
    Layout: TLayout;
    Layout_Exit_Patient: TLayout;
    Label16: TLabel;
    ShadowEffect10: TShadowEffect;
    Label15: TLabel;
    ColorAnimation6: TColorAnimation;
    ShadowEffect8: TShadowEffect;
    Layout5: TLayout;
    Label28: TLabel;
    ShadowEffect19: TShadowEffect;
    Label27: TLabel;
    ShadowEffect20: TShadowEffect;
    ColorAnimation15: TColorAnimation;
    Layout7: TLayout;
    Label29: TLabel;
    ShadowEffect21: TShadowEffect;
    Label30: TLabel;
    ColorAnimation16: TColorAnimation;
    ShadowEffect22: TShadowEffect;
    Layout8: TLayout;
    Label31: TLabel;
    ShadowEffect23: TShadowEffect;
    Label64: TLabel;
    Label32: TLabel;
    ColorAnimation17: TColorAnimation;
    ShadowEffect24: TShadowEffect;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    Line5: TLine;
    Layout18: TLayout;
    Label51: TLabel;
    ShadowEffect43: TShadowEffect;
    Label63: TLabel;
    ShadowEffect53: TShadowEffect;
    Label66: TLabel;
    ShadowEffect56: TShadowEffect;
    Label62: TLabel;
    ShadowEffect52: TShadowEffect;
    Line14: TLine;
    Line15: TLine;
    Label61: TLabel;
    ShadowEffect51: TShadowEffect;
    ColorAnimation31: TColorAnimation;
    Label65: TLabel;
    ShadowEffect55: TShadowEffect;
    ColorAnimation33: TColorAnimation;
    Label52: TLabel;
    ShadowEffect44: TShadowEffect;
    ColorAnimation27: TColorAnimation;
    Line10: TLine;
    H_Gen_RechercheP: TTabItem;
    Panel12: TPanel;
    Layout29: TLayout;
    Layout_Exit_RechercheP: TLayout;
    Label17: TLabel;
    ShadowEffect11: TShadowEffect;
    Label18: TLabel;
    ColorAnimation7: TColorAnimation;
    ShadowEffect14: TShadowEffect;
    Layout15: TLayout;
    Label45: TLabel;
    ShadowEffect37: TShadowEffect;
    Label46: TLabel;
    ShadowEffect38: TShadowEffect;
    ColorAnimation24: TColorAnimation;
    Layout16: TLayout;
    Label47: TLabel;
    ShadowEffect39: TShadowEffect;
    Label48: TLabel;
    ColorAnimation25: TColorAnimation;
    ShadowEffect40: TShadowEffect;
    Layout17: TLayout;
    Label50: TLabel;
    ShadowEffect42: TShadowEffect;
    Label49: TLabel;
    ColorAnimation26: TColorAnimation;
    ShadowEffect41: TShadowEffect;
    Line20: TLine;
    Line21: TLine;
    Line22: TLine;
    Line23: TLine;
    H_Gen_NouveauP: TTabItem;
    Panel13: TPanel;
    Layout30: TLayout;
    Layout20: TLayout;
    Label56: TLabel;
    ShadowEffect48: TShadowEffect;
    Label55: TLabel;
    ColorAnimation29: TColorAnimation;
    ShadowEffect47: TShadowEffect;
    Layout3: TLayout;
    Label19: TLabel;
    ShadowEffect15: TShadowEffect;
    Label20: TLabel;
    ColorAnimation8: TColorAnimation;
    ShadowEffect16: TShadowEffect;
    Layout19: TLayout;
    Label53: TLabel;
    ShadowEffect45: TShadowEffect;
    Label54: TLabel;
    ColorAnimation28: TColorAnimation;
    ShadowEffect46: TShadowEffect;
    Line11: TLine;
    Line12: TLine;
    Line13: TLine;
    MainT: TTabControl;
    P_Accueil: TTabItem;
    L_Left_P_Accueil: TLayout;
    GrouBox1_Table: TGroupBox;
    Label_Refresh1: TLabel;
    ColorAnimation10: TColorAnimation;
    FloatAnimation1: TFloatAnimation;
    GrouBox3_Table: TGroupBox;
    Label_Refresh3: TLabel;
    ColorAnimation12: TColorAnimation;
    FloatAnimation3: TFloatAnimation;
    L_Right_P_Accueil: TLayout;
    GrouBox2_Table: TGroupBox;
    Label_Refresh2: TLabel;
    ColorAnimation11: TColorAnimation;
    FloatAnimation2: TFloatAnimation;
    GrouBox4_Table: TGroupBox;
    Label_Refresh4: TLabel;
    ColorAnimation13: TColorAnimation;
    FloatAnimation4: TFloatAnimation;
    Patient: TTabItem;
    StatusBar1: TStatusBar;
    Label26: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Status_Edit1: TEdit;
    Status_Edit2: TEdit;
    Status_Edit3: TEdit;
    Refresh_Patient_Table: TLabel;
    ColorAnimation14: TColorAnimation;
    FloatAnimation5: TFloatAnimation;
    Recherche_Patient: TTabItem;
    Layout1: TLayout;
    Layout2: TLayout;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RB_Nom: TRadioButton;
    RB_Prenom: TRadioButton;
    GroupBox3: TGroupBox;
    RB_Interne: TRadioButton;
    RB_Externe: TRadioButton;
    Label76: TLabel;
    GroupBox4: TGroupBox;
    Edit_Search_Commune: TEdit;
    Edit_Search_Wilaya: TEdit;
    Layout31: TLayout;
    Edit1: TEdit;
    Nouveau_Patient: TTabItem;
    TabControl_NouveauP: TTabControl;
    TabItem1: TTabItem;
    Frame_Information: TFrame2;
    TabItem2: TTabItem;
    Frame_Hemogramme: TFrame3;
    TabItem3: TTabItem;
    Frame_Hemostase: TFrame4;
    TabItem4: TTabItem;
    Frame_Biochimic: TFrame6;
    TabItem5: TTabItem;
    Frame_Serologie: TFrame5;
    Frame_Principale: TFrame1;
    Edit_Patient: TTabItem;
    Frame_EP_Principale: TFrame1;
    TabControl1: TTabControl;
    TabItem8: TTabItem;
    Frame_EP_Information: TFrame2;
    TabItem9: TTabItem;
    Frame_EP_Hemogramme: TFrame3;
    TabItem10: TTabItem;
    Frame_EP_Hemostase: TFrame4;
    TabItem11: TTabItem;
    Frame_EP_Biochimic: TFrame6;
    TabItem12: TTabItem;
    Frame_EP_Serologie: TFrame5;
    PopupMenu1: TPopupMenu;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    PoP_Hemogramme: TMenuItem;
    PoP_Biochimic: TMenuItem;
    PoP_Serologie: TMenuItem;
    PoP_Hemostase: TMenuItem;
    Label23: TLabel;
    PopupMenu2: TPopupMenu;
    PoP2_Hemog: TMenuItem;
    PoP2_Hemos: TMenuItem;
    PoP2_Boi: TMenuItem;
    PoP2_Serologie: TMenuItem;
    BindSourceDB4: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    Edit2: TEdit;
    Layout4: TLayout;
    Label21: TLabel;
    ShadowEffect17: TShadowEffect;
    Label223: TLabel;
    ColorAnimation9: TColorAnimation;
    ShadowEffect18: TShadowEffect;
    BindSourceDB5: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB5: TLinkGridToDataSource;
    BindSourceDB6: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB6: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure Label12Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure T_AccueilClick(Sender: TObject);
    procedure T_PatientClick(Sender: TObject);
    procedure Patient_RechercheClick(Sender: TObject);
    procedure New_PatientClick(Sender: TObject);
    procedure T_RDVClick(Sender: TObject);
    procedure P_AccueilClick(Sender: TObject);
    procedure PatientClick(Sender: TObject);
    procedure Recherche_PatientClick(Sender: TObject);
    procedure Nouveau_PatientClick(Sender: TObject);
    procedure RDVClick(Sender: TObject);
    procedure OrdonnanceClick(Sender: TObject);
    procedure Label52Click(Sender: TObject);
    procedure Label65Click(Sender: TObject);
    procedure Label61Click(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label32Click(Sender: TObject);
    procedure Label223Click(Sender: TObject);
    procedure Label48Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label55Click(Sender: TObject);
    procedure Frame_PrincipaleButton1Click(Sender: TObject);
    procedure Label54Click(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Frame_EP_PrincipaleButton1Click(Sender: TObject);
    procedure Frame_EP_PrincipaleButton3Click(Sender: TObject);
    procedure Frame_EP_PrincipaleButton2Click(Sender: TObject);
    procedure Frame_PrincipaleButton2Click(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
    procedure FloatAnimation4Finish(Sender: TObject);
    procedure FloatAnimation5Finish(Sender: TObject);
    procedure StringGrid5CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid5CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure StringGrid6CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid6CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure FormResize(Sender: TObject);
    procedure Nouveau_PatientResize(Sender: TObject);
    procedure Edit_PatientResize(Sender: TObject);
    procedure P_AccueilResize(Sender: TObject);
    procedure Label_Refresh2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label_Refresh2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label_Refresh4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label_Refresh4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label_Refresh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label_Refresh1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label_Refresh3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label_Refresh3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Refresh_Patient_TableMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label27Click(Sender: TObject);
    procedure PoP2_HemosClick(Sender: TObject);
    procedure Refresh_Patient_TableMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure PoP2_HemogClick(Sender: TObject);
    procedure PoP2_BoiClick(Sender: TObject);
    procedure PoP2_SerologieClick(Sender: TObject);
    procedure Label71Click(Sender: TObject);
    procedure PoP_BiochimicClick(Sender: TObject);
    procedure PoP_HemogrammeClick(Sender: TObject);
    procedure PoP_HemostaseClick(Sender: TObject);
    procedure PoP_SerologieClick(Sender: TObject);
    procedure Edit1ChangeTracking(Sender: TObject);
    procedure RB_NomChange(Sender: TObject);
    procedure RB_PrenomChange(Sender: TObject);
    procedure RB_InterneChange(Sender: TObject);
    procedure RB_ExterneChange(Sender: TObject);
    procedure Label76Click(Sender: TObject);
    procedure Edit_Search_WilayaChangeTracking(Sender: TObject);
    procedure Edit_Search_CommuneChangeTracking(Sender: TObject);
    procedure Edit2ChangeTracking(Sender: TObject);
    procedure Label49Click(Sender: TObject);
    procedure Label46Click(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FloatAnimation3Finish(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure LoadParam;
  private
    { Private declarations }
    WidthX, HeightX: Integer;
  public
    { Public declarations }
    Patient_ID, ID_Medecin, Nom: String;
    Pass, Privilege: Boolean;
  end;

var
  Main: TMain;

implementation

Uses
  U_Parametre, U_Connecter, U_Entreprise, Winapi.Windows, U_DataModule,
  FireDAC.Comp.Client, U_Fenetre, U_Print_HM, U_Print_Bio, U_Print_HS,
  U_Print_SR, U_Propre;
{$R *.fmx}
{$R Alg_Res.RES}

procedure TMain.LoadParam();
Var
  Bar1, Bar2, Bar3, Bar4, Theme: Integer;
  HM, HS, Bio, Serlg: Boolean;
  Lang: String;
Begin
  With Main Do
  Begin
    With DataModule1.FDQuery1 do
    Begin
      Active := False;
      SQl.Clear;
      SQl.Text := ('Select * From Parametre Where Id="' + ID_Medecin + '"');
      Open;
      Bar1 := FieldByName('Bar1').AsInteger;
      Bar2 := FieldByName('Bar2').AsInteger;
      Bar3 := FieldByName('Bar3').AsInteger;
      Bar4 := FieldByName('Bar4').AsInteger;
      Theme := FieldByName('Theme').AsInteger;
      HM := FieldByName('HM').AsBoolean;
      HS := FieldByName('HS').AsBoolean;
      Bio := FieldByName('Bio').AsBoolean;
      Serlg := FieldByName('Serlg').AsBoolean;
      Lang := FieldByName('Lang').AsString;
      Close;
      SQl.Clear;
    End;
    // Setting the Tables
    Begin
      GrouBox1_Table.Text :=
        ('Les ' + Bar1.ToString + ' dernières homme ajouter');
      GrouBox2_Table.Text := ('Les ' + Bar2.ToString + ' dernières groupage');
      GrouBox3_Table.Text :=
        ('Les ' + Bar3.ToString + ' dernières femmes ajouter');
      GrouBox4_Table.Text :=
        ('Les ' + Bar4.ToString + ' dernières patient ajouter');
      // StringGrids
      Begin
        StringGrid1.RowCount := Bar1;
        StringGrid2.RowCount := Bar2;
        StringGrid3.RowCount := Bar3;
        StringGrid4.RowCount := Bar4;
      End;
    End;
    // Setting The Tabs Visibility
    Begin
      TabItem2.Visible := HM;
      TabItem3.Visible := HS;
      TabItem4.Visible := Bio;
      TabItem5.Visible := Serlg;
      TabItem9.Visible := HM;
      TabItem10.Visible := HS;
      TabItem11.Visible := Bio;
      TabItem12.Visible := Serlg;
    End;
  End;
End;

procedure LoadParam2(const Dlg: TParametre);
Var
  Bar1, Bar2, Bar3, Bar4, Theme: Integer;
  HM, HS, Bio, Serlg: Boolean;
  Lang: String;
Begin
  With Dlg Do
  Begin
    With DataModule1.FDQuery1 do
    Begin
      Active := False;
      SQl.Clear;
      SQl.Text := ('Select * From Parametre Where Id="' +
        Main.ID_Medecin + '"');
      Open;
      Bar1 := FieldByName('Bar1').AsInteger;
      Bar2 := FieldByName('Bar2').AsInteger;
      Bar3 := FieldByName('Bar3').AsInteger;
      Bar4 := FieldByName('Bar4').AsInteger;
      Theme := FieldByName('Theme').AsInteger;
      HM := FieldByName('HM').AsBoolean;
      HS := FieldByName('HS').AsBoolean;
      Bio := FieldByName('Bio').AsBoolean;
      Serlg := FieldByName('Serlg').AsBoolean;
      Lang := FieldByName('Lang').AsString;
      Close;
      SQl.Clear;
    End;
    // Visibility
    Begin
      if (HM = True) then
        Switch1.IsChecked := True;
      if (HS = True) then
        Switch2.IsChecked := True;
      if (Bio = True) then
        Switch3.IsChecked := True;
      if (Serlg = True) then
        Switch4.IsChecked := True;
    End;
    // Bars & Edit's
    Begin
      // Edit
      Edit1.Text := Bar1.ToString;
      Edit2.Text := Bar2.ToString;
      Edit3.Text := Bar3.ToString;
      Edit4.Text := Bar4.ToString;
      // Bars
      TrackBar1.Value := Bar1.ToSingle;
      TrackBar2.Value := Bar2.ToSingle;
      TrackBar3.Value := Bar3.ToSingle;
      TrackBar4.Value := Bar4.ToSingle;
    End;
  End;
End;

procedure StatusBar;
Begin
  With Main Do
  Begin
    With DataModule1.FDQ_Status_Patient do
    Begin
      Active := False;
      SQl.Clear;
      SQl.Text := 'Select count(*) From Patient';
      Active := True;
      Open;
      Status_Edit1.Text := IntToStr(Fields[0].AsInteger);
      Active := False;
      SQl.Clear;
      SQl.Text := 'Select Count(*) From Patient Where Type="Externe"';
      Active := True;
      Open;
      Status_Edit2.Text := IntToStr(Fields[0].AsInteger);
      Active := False;
      SQl.Clear;
      SQl.Text := 'Select Count(*) From Patient Where type="Interne"';
      Active := True;
      Open;
      Status_Edit3.Text := IntToStr(Fields[0].AsInteger);
      Active := False;
      SQl.Clear;
    End;
  End;
End;

procedure TMain.StringGrid5CellClick(const Column: TColumn; const Row: Integer);
Var
  tRow: Integer;
begin
  inherited;
  Patient_ID := '';
  tRow := StringGrid5.Row;
  Patient_ID := StringGrid5.Cells[0, tRow];
end;

procedure TMain.StringGrid5CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  inherited;
  inherited;
  Label65Click(Self);
end;

procedure StringGrid5ColResize;
Var
  i: Integer;
Begin
  With Main do
  Begin
    for i := 0 to 15 do
    Begin
      StringGrid5.Columns[i].Width := 120;
      if (i = 0) then
        StringGrid5.Columns[i].Width := 80;
      if (i = 5) then
        StringGrid5.Columns[i].Width := 70;
      if (i = 6) then
        StringGrid5.Columns[i].Width := 70;
    End;
    for i := 0 to 2 do
    Begin
      StringGrid1.Columns[i].Width := 140;
      StringGrid3.Columns[i].Width := 140;
      StringGrid2.Columns[i].Width := 140;
      StringGrid4.Columns[i].Width := 140;
    End;
  End;
End;

procedure StringGrid6ColResize();
Var
  i: Integer;
Begin
  With Main do
  Begin
    for i := 0 to 15 do
    Begin
      StringGrid6.Columns[i].Width := 120;
      if (i = 0) then
        StringGrid6.Columns[i].Width := 80;
      if (i = 5) then
        StringGrid6.Columns[i].Width := 70;
      if (i = 6) then
        StringGrid6.Columns[i].Width := 70;
    End;
  End;
End;

procedure TMain.StringGrid6CellClick(const Column: TColumn; const Row: Integer);
Var
  tRow: Integer;
begin
  inherited;
  Patient_ID := '';
  tRow := StringGrid6.Row;
  Patient_ID := StringGrid6.Cells[0, tRow];
end;

procedure TMain.StringGrid6CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  inherited;
  Label48Click(Self);
end;

procedure Resources();
Var
  ResStream: TResourceStream;
  AppData: String;
Begin
  AppData := GetEnvironmentVariable('AppData');
  CreateDir(AppData + '\SangyMed');
  AppData := AppData + '\SangyMed\Alg_info.db';
  ResStream := TResourceStream.Create(HInstance, 'Alg_Res', 'db');
  try
    ResStream.Position := 0;
    ResStream.SaveToFile(AppData);
  finally
    ResStream.Free;
  end;
End;

Procedure Recherche(Recherche, filtre, typ, wilaya, commune, groupage: String);
Var
  typs, wila, comn, Grp: String;
Begin
  With DataModule1.FDQ_Recherche do
  Begin
    if (Main.Privilege = False) then
      SQl.Text :=
        ('Select Patient_ID, Nom,Prenom,Type,Wilaya,Commune,Groupage,Date_de_Nai,Date_de_Entre,Sexe,Etat_Civil,Adresse,Mobile,Email,Telephone,Fax From patient Where ID="'
        + Main.ID_Medecin + '";')
    else
      SQl.Text :=
        ('Select Patient_ID, Nom,Prenom,Type,Wilaya,Commune,Groupage,Date_de_Nai,Date_de_Entre,Sexe,Etat_Civil,Adresse,Mobile,Email,Telephone,Fax From patient;');
    // Where type="' + typ + '";');
    { if (Recherche = '') then
      Filtered := False
      else }
    Begin
      if (typ = '') then
        typs := ''
      else
        typs := (' And (Type LIKE ''%' + typ + '%'')');
      if (wilaya = '') then
        wila := ''
      else
        wila := (' And (Wilaya LIKE ''%' + wilaya + '%'')');
      if (commune = '') then
        comn := ''
      else
        comn := (' And (Commune LIKE ''%' + commune + '%'')');
      if (groupage = '') then
        Grp := ''
      else
        Grp := (' And (Groupage LIKE ''%' + groupage + '%'')');
      //
      Filter := ('(' + filtre + ' LIKE ''%' + Recherche + '%'')') + typs + wila
        + comn + Grp;
      Filtered := True;
    End;
  End;
End;

procedure TMain.Edit1ChangeTracking(Sender: TObject);
Var
  Filter, typ: String;
begin
  inherited;
  // Searh By
  if (RB_Nom.IsChecked = True) then
    Filter := ('Nom')
  else if (RB_Prenom.IsChecked = True) then
    Filter := ('Prenom');
  // Show By
  if (RB_Interne.IsChecked = True) then
    typ := ('Interne')
  else if (RB_Externe.IsChecked = True) then
    typ := ('Externe');
  if ((RB_Interne.IsChecked = False) and (RB_Externe.IsChecked = False) and
    (Edit_Search_Wilaya.Text = '') and (Edit2.Text = '') and
    (Edit_Search_Commune.Text = '') and (Edit1.Text = '')) then
    DataModule1.FDQ_Recherche.Active := False
  else
  Begin
    Recherche(Edit1.Text, Filter, typ, Edit_Search_Wilaya.Text,
      Edit_Search_Commune.Text, Edit2.Text);
    DataModule1.FDQ_Recherche.Active := True;
    StringGrid6ColResize;
  End
end;

procedure TMain.Edit2ChangeTracking(Sender: TObject);
begin
  inherited;
  Edit1.OnChangeTracking(Self);
end;

procedure TMain.Edit_PatientResize(Sender: TObject);
begin
  inherited;
  Frame_EP_Principale.OnResize(Frame_EP_Principale);
  Frame_EP_Information.OnResize(Frame_EP_Information);
  Frame_EP_Hemogramme.OnResize(Frame_EP_Hemogramme);
  Frame_EP_Hemostase.OnResize(Frame_EP_Hemostase);
  Frame_EP_Biochimic.OnResize(Frame_EP_Biochimic);
  Frame_EP_Serologie.OnResize(Frame_EP_Serologie);
  // Frame_EP_Ordonnance.OnResize(Frame_EP_Ordonnance);
end;

procedure TMain.Edit_Search_CommuneChangeTracking(Sender: TObject);
begin
  inherited;
  Edit1.OnChangeTracking(Self);
end;

procedure TMain.Edit_Search_WilayaChangeTracking(Sender: TObject);
begin
  inherited;
  Edit1.OnChangeTracking(Self);
end;

procedure TMain.FloatAnimation1Finish(Sender: TObject);
begin
  inherited;
  DataModule1.FDQ_Homme.Active := False;
  DataModule1.FDQ_Homme.Active := True;
  StringGrid5ColResize;
end;

procedure TMain.FloatAnimation2Finish(Sender: TObject);
begin
  inherited;
  DataModule1.FDQ_Groupage.Active := False;
  DataModule1.FDQ_Groupage.Active := True;
  StringGrid5ColResize;
end;

procedure TMain.FloatAnimation3Finish(Sender: TObject);
begin
  inherited;
  DataModule1.FDQ_Femme.Active := False;
  DataModule1.FDQ_Femme.Active := True;
  StringGrid5ColResize;
end;

procedure TMain.FloatAnimation4Finish(Sender: TObject);
begin
  inherited;
  DataModule1.FDQ_Patient.Active := False;
  DataModule1.FDQ_Patient.Active := True;
  StringGrid5ColResize;
end;

procedure TMain.FloatAnimation5Finish(Sender: TObject);
begin
  inherited;
  DataModule1.FDQ_Patient_Table.Active := False;
  DataModule1.FDQ_Patient_Table.Active := True;
  StringGrid5ColResize;
  StatusBar;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Msg: Integer;
begin
  inherited;
  Msg := MessageDlg('Vous etez sure !', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);
  if (Msg = mrNo) then
    CanClose := False;
end;

procedure TMain.FormCreate(Sender: TObject);
Var
  AppData: String;
  Num: Integer;
begin
  AppData := GetEnvironmentVariable('AppData');
  AppData := AppData + '\SangyMed\Alg_info.db';
  if (FileExists(AppData) = False) then
  Begin
    Resources();
  End;
  inherited;
  WidthX := 1280;
  HeightX := 688;
end;

procedure TMain.FormPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  inherited;
  WidthX := Main.Width;
  HeightX := Main.Height;
  StringGrid5ColResize;
end;

procedure TMain.FormResize(Sender: TObject);
begin
  inherited;
  // Frame resize
  Nouveau_Patient.OnResize(Nouveau_Patient);
  Edit_Patient.OnResize(Edit_Patient);
  //
  P_Accueil.OnResize(P_Accueil);
  // Minmum Size for MainForm -- U_Main.pas --
  if ((Main.Width <= Screen.Width) or (Main.Height <= Screen.Height)) then
  begin
    // Setting Main form Sizes
    if (Main.Width <= ((Screen.Width div 2) + (Screen.Width div 4))) then
    begin
      Main.Width := ((Screen.Width div 2) + (Screen.Width div 4));
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    end;
    if (Main.Height <= (Screen.Height div 2) + (Screen.Height div 4)) then
    begin
      Main.Height := ((Screen.Height div 2) + (Screen.Height div 4));
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    end;
  end;
end;

procedure Load();
Begin
  if (Main.Privilege = True) then
  Begin
    With DataModule1 do
    Begin
      FDQ_Groupage.Active := False;
      FDQ_Patient.Active := False;
      FDQ_Patient_Table.Active := False;
      FDQ_Homme.Active := False;
      FDQ_Femme.Active := False;
      FDQ_Groupage.SQl.Clear;
      FDQ_Groupage.SQl.Text :=
        ('Select Nom, Prenom, Groupage From Patient Where Groupage !="Null" ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Groupage.Active := True;
      // Patient Table
      FDQ_Patient.SQl.Clear;
      FDQ_Patient.SQl.Text :=
        ('Select Nom, Prenom,Type From Patient ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Patient.Active := True;
      // Homme
      FDQ_Homme.SQl.Clear;
      FDQ_Homme.SQl.Text :=
        ('Select Nom, Prenom, Date_de_Entre From Patient Where Sexe="Homme" ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Homme.Active := True;
      // Femme
      FDQ_Femme.SQl.Clear;
      FDQ_Femme.SQl.Text :=
        ('Select Nom,Prenom, Date_de_Entre From Patient Where Sexe="Femme" ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Femme.Active := True;
      // Main patient Table
      FDQ_Patient_Table.SQl.Clear;
      FDQ_Patient_Table.SQl.Text :=
        ('Select Patient_ID, Nom, Prenom, Date_de_Nai, Date_de_Entre, Type, Sexe, Etat_Civil, Wilaya, Commune, Adresse, Mobile, Email, Groupage, Telephone, Fax From Patient ;');
      FDQ_Patient_Table.Active := True;
    End;
  End
  else
  Begin
    With DataModule1 do
    Begin
      FDQ_Groupage.Active := False;
      FDQ_Patient.Active := False;
      FDQ_Patient_Table.Active := False;
      FDQ_Groupage.SQl.Clear;
      FDQ_Groupage.SQl.Text :=
        ('Select Nom, Prenom, Groupage From Patient Where Groupage!="Null" And ID="'
        + Main.ID_Medecin + '" ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Groupage.Active := True;
      // Patient Table
      FDQ_Patient.SQl.Clear;
      FDQ_Patient.SQl.Text := ('Select Nom, Prenom,Type From Patient Where ID="'
        + Main.ID_Medecin + '" ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Patient.Active := True;
      // Homme
      FDQ_Homme.SQl.Clear;
      FDQ_Homme.SQl.Text :=
        ('Select Nom,Prenom, Date_de_Entre From Patient Where Sexe="Homme" And ID="'
        + Main.ID_Medecin + '"ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Homme.Active := True;
      // Femme
      FDQ_Femme.SQl.Clear;
      FDQ_Femme.SQl.Text :=
        ('Select Nom,Prenom, Date_de_Entre From Patient Where Sexe="Femme" And ID="'
        + Main.ID_Medecin + '"ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Femme.Active := True;
      // Main patient Table
      FDQ_Patient_Table.SQl.Clear;
      FDQ_Patient_Table.SQl.Text :=
        ('Select Patient_ID, Nom, Prenom, Date_de_Nai, Date_de_Entre, Type, Sexe, Etat_Civil, Wilaya, Commune, Adresse, Mobile, Email, Groupage, Telephone, Fax From Patient '
        + 'Where ID="' + Main.ID_Medecin +
        '" ORDER BY Date_de_Entre DESC LIMIT 10;');
      FDQ_Patient_Table.Active := True;
    End;
  End;
  StringGrid5ColResize;
End;

procedure TMain.FormShow(Sender: TObject);
var
  LogDlg: TConnecter;
begin
  inherited;
  P_Accueil.IsSelected := True;
  H_Accueil.IsSelected := True;
  LogDlg := TConnecter.Create(Self);
  if (LogDlg.ShowModal = mrOk) then
  Begin
    LogDlg.Free;
    ShowMessage('Bienvenue MR ''' + Nom);
    Load();
    LoadParam;
  End
  else
    Application.Terminate;
  // StatusBar;
end;

procedure TMain.Frame_EP_PrincipaleButton1Click(Sender: TObject);
Var
  ID: String;
begin
  inherited;
  if (Frame_EP_Principale.SetEdit = True) then
  Begin
    With DataModule1.FDQuery1 do
    Begin
      Active := False;
      SQl.Clear;
      SQl.Text := 'Select * From Patient Where Patient_ID="' +
        Patient_ID + '";';
      Active := True;
      Edit;
      ID := Frame_EP_Principale.Edit;
      Frame_EP_Principale.Edit;
      Frame_EP_Information.Edit;
      Post;
      Active := False;
      SQl.Clear;
      if (Frame_EP_Hemogramme.Pret = True) then
        Frame_EP_Hemogramme.Edit(ID);
      if (Frame_EP_Hemostase.Pret = True) then
        Frame_EP_Hemostase.Edit(ID);
      if (Frame_EP_Serologie.Pret = True) then
        Frame_EP_Serologie.Edit(ID);
      if (Frame_EP_Biochimic.Pret) then
        Frame_EP_Biochimic.Edit(ID);
      // Frame_EP_Ordonnance.Edit();
      // Frame_EP_Ordonnance.LoadGrid(ID);
      Frame_EP_PrincipaleButton3Click(Self);
    End;
  End;
end;

procedure TMain.Frame_EP_PrincipaleButton2Click(Sender: TObject);
begin
  inherited;
  Frame_Principale.Clear();
  if (TabItem8.IsSelected = True) then
    Frame_EP_Information.Clear;
  if (TabItem9.IsSelected = True) then
    Frame_EP_Hemogramme.Clear;
  if (TabItem10.IsSelected = True) then
    Frame_EP_Hemostase.Clear;
  if (TabItem11.IsSelected = True) then
    Frame_EP_Biochimic.Clear;
  if (TabItem12.IsSelected = True) then
    Frame_EP_Serologie.Clear;
end;

procedure TMain.Frame_EP_PrincipaleButton3Click(Sender: TObject);
begin
  inherited;
  Edit_Patient.Visible := False;
  Patient.IsSelected := True;
  H_Gen_Patient.IsSelected := True;
end;

procedure TMain.Frame_PrincipaleButton1Click(Sender: TObject);
Var
  ID: String;
begin
  inherited;
  if (Frame_Principale.SetEdit = True) then
  Begin
    with DataModule1.FDQuery1 do
    Begin
      Active := False;
      SQl.Clear;
      SQl.Text := ('Select * From Patient');
      Active := True;
      Insert;
      FieldByName('ID').AsString := ID_Medecin;
      ID := Frame_Principale.Insert;
      Frame_Information.Insert;
      Post;
      SQl.Clear;
      Active := False;
    End;
    if (Frame_Hemogramme.Pret = True) then
      Frame_Hemogramme.Insert(ID);
    if (Frame_Hemostase.Pret = True) then
      Frame_Hemostase.Insert(ID);
    if (Frame_Serologie.Pret = True) then
      Frame_Serologie.Insert(ID);
    if (Frame_Biochimic.Pret = True) then
      Frame_Biochimic.Insert(ID);
    Frame_PrincipaleButton2Click(Self);
  end;
end;

procedure TMain.Frame_PrincipaleButton2Click(Sender: TObject);
begin
  inherited;
  Frame_Information.Clear;
  Frame_Principale.Clear;
  Frame_Hemogramme.Clear;
  Frame_Hemostase.Clear;
  Frame_Biochimic.Clear;
  Frame_Serologie.Clear;
end;

procedure TMain.Label10Click(Sender: TObject);
Var
  PropreDlg: TPropre;
begin
  inherited;
  PropreDlg := TPropre.Create(Self);
  if (PropreDlg.ShowModal = mrCancel) then
    PropreDlg.Free;
end;

procedure TMain.Label12Click(Sender: TObject);
var
  EtablissementDlg: TEtablissement;
begin
  inherited;
  if (Privilege = True) then
  Begin
    EtablissementDlg := TEtablissement.Create(Self);
    if (EtablissementDlg.ShowModal = mrClose) then
      EtablissementDlg.Free;
  End
  else
    ShowMessage
      ('Ce type de compte n''est pas autorisé à afficher ce type de paramètre');
end;

procedure TMain.Label15Click(Sender: TObject);
begin
  inherited;
  Patient.Visible := False;
  H_Gen_Patient.Visible := False;
  H_Accueil.IsSelected := True;
end;

procedure TMain.Label18Click(Sender: TObject);
begin
  inherited;
  Recherche_Patient.Visible := False;
  H_Gen_RechercheP.Visible := False;
  H_Accueil.IsSelected := True;
end;

procedure TMain.Label1Click(Sender: TObject);
begin
  inherited;
  H_Accueil.Visible := True;
  H_Accueil.IsSelected := True;
  P_Accueil.Visible := True;
  P_Accueil.IsSelected := True;
  Patient.Visible := False;
  Nouveau_Patient.Visible := False;
  Recherche_Patient.Visible := False;
  H_Gen_Patient.Visible := False;
  H_Gen_NouveauP.Visible := False;
  H_Gen_RechercheP.Visible := False;
end;

procedure TMain.Label20Click(Sender: TObject);
begin
  inherited;
  Nouveau_Patient.Visible := False;
  H_Gen_NouveauP.Visible := False;
  H_Accueil.IsSelected := True;
end;

procedure TMain.Label223Click(Sender: TObject);
begin
  inherited;
  // H_Accueil.IsSelected := True;
  Edit1.Text := '';
  Edit2.Text := '';
  Edit_Search_Commune.Text := '';
  Edit_Search_Wilaya.Text := '';
  RB_Interne.IsChecked := False;
  RB_Externe.IsChecked := False;
  DataModule1.FDQ_Recherche.Active := False;
end;

procedure TMain.Label27Click(Sender: TObject);
Var
  P: TPointF;
begin
  inherited;
  P.X := (((Label27.Width) / 2) * (-1));
  P.Y := Label27.Height;
  P := Label27.LocalToAbsolute(P);
  P := ClientToScreen(P);
  PopupMenu2.Popup(P.X, P.Y);
end;

procedure TMain.Label_Refresh1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation1.enabled := False;
end;

procedure TMain.Label_Refresh1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation1.enabled := True;
end;

procedure TMain.Label_Refresh2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation2.enabled := False;
end;

procedure TMain.Label_Refresh2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation2.enabled := True;
end;

procedure TMain.Label_Refresh3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation3.enabled := False;
end;

procedure TMain.Label_Refresh3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation3.enabled := True;
end;

procedure TMain.Label_Refresh4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation4.enabled := False;
end;

procedure TMain.Label_Refresh4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation4.enabled := True;
end;

procedure TMain.Label30Click(Sender: TObject);
begin
  inherited;
  Patient_RechercheClick(Self);
end;

procedure TMain.Label32Click(Sender: TObject);
Var
  P: TPointF;
begin
  inherited;
  P.X := (((Label32.Width) / 2) * (-1));
  P.Y := Label32.Height;
  P := Label32.LocalToAbsolute(P);
  P := ClientToScreen(P);
  PopupMenu1.Popup(P.X, P.Y);
end;

procedure TMain.Label46Click(Sender: TObject);
begin
  inherited;
  Label61.OnClick(Self);
end;

procedure TMain.Label48Click(Sender: TObject);
begin
  inherited;
  Edit_Patient.Visible := True;
  Edit_Patient.IsSelected := True;
  H_Accueil.IsSelected := True;
  Frame_EP_Principale.OnDataLoad;
  Frame_EP_Information.OnDataLoad;
end;

procedure TMain.Label49Click(Sender: TObject);
begin
  inherited;
  Label76.OnClick(Self);
end;

procedure TMain.Label4Click(Sender: TObject);
Var
  FenetreDlg: TFenetre;
begin
  inherited;
  FenetreDlg := TFenetre.Create(Self);
  if (FenetreDlg.ShowModal = mrClose) then
    FenetreDlg.Free;
end;

procedure TMain.Label52Click(Sender: TObject);
begin
  inherited;
  New_PatientClick(Self);
end;

procedure TMain.Label54Click(Sender: TObject);
begin
  inherited;
  Frame_PrincipaleButton2Click(Self);
end;

procedure TMain.Label55Click(Sender: TObject);
begin
  inherited;
  Frame_PrincipaleButton1Click(Self);
end;

procedure TMain.Label61Click(Sender: TObject);
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    With DataModule1.FDCmnd_Drop_Patient do
    Begin
      Active := False;
      CommandText.Clear;
      CommandText.Text := ('DELETE FROM Patient WHERE Patient_ID="' +
        Patient_ID + '";');
      Active := True;
      Execute;
      Active := False;
      CommandText.Clear;
      FloatAnimation5.OnFinish(FloatAnimation5);
      Patient_ID := '';
    End;
  End
  else
  Begin
    ShowMessage
      ('Sil vous plait choisir une patient pour effectué cette action');
  End;
end;

procedure TMain.Label65Click(Sender: TObject);
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    Edit_Patient.Visible := True;
    Edit_Patient.IsSelected := True;
    H_Accueil.IsSelected := True;
    TabItem8.IsSelected := True;
    Frame_EP_Principale.OnDataLoad;
    Frame_EP_Information.OnDataLoad;
    Frame_EP_Hemogramme.OnDataLoad;
    Frame_EP_Hemostase.OnDataLoad;
    Frame_EP_Serologie.OnDataLoad;
    Frame_EP_Biochimic.OnDataLoad;
  End
  else
  Begin
    ShowMessage
      ('Sil vous plait choisir une patient ou double clicker sur un patient');
  End;
end;

procedure TMain.Label6Click(Sender: TObject);
var
  OptionDlg: TParametre;
  Result: Integer;
begin
  inherited;
  OptionDlg := TParametre.Create(Self);
  LoadParam2(OptionDlg);
  if (OptionDlg.ShowModal = mrOk) then
  Begin
    OptionDlg.Free;
    Pass := True;
    T_RDV.OnClick(T_RDV);
  End;
end;

procedure TMain.Label71Click(Sender: TObject);
Var
  output, Path, DirPath: String;
  SaveDialog1: TSaveDialog;
begin
  inherited;
  SaveDialog1 := TSaveDialog.Create(Self);
  SaveDialog1.Filter := ('db file|*.db|All|*.*');
  SaveDialog1.FileName := 'patient_backup';
  if (SaveDialog1.Execute) then
  Begin
    output := 'C:\Users\Kacemo\Desktop\Pateint_backup.db';
    FileCreate(output);
    With DataModule1 do
    Begin
      DirPath := GetEnvironmentVariable('AppData');
      Path := (DirPath + '\SangyMed\Data.db');
      FDConnection1.Open();
      FDSQLiteBackup1.DriverLink := FDPhysSQLiteDriverLink1;
      FDSQLiteBackup1.Database := output;
      FDSQLiteBackup1.DestDatabase := Path;
      FDSQLiteBackup1.Backup;
    End;
  End;
  SaveDialog1.Free;
end;

procedure TMain.Label76Click(Sender: TObject);
begin
  inherited;
  if (Label76.RotationAngle = 0) then
  Begin
    Label76.RotationAngle := 180;
    GroupBox1.Height := 112;
    GroupBox2.Visible := True;
    GroupBox3.Visible := True;
    GroupBox4.Visible := True;
    Layout2.Height := Layout31.Height + GroupBox1.Height;
  End
  else if (Label76.RotationAngle = 180) then
  Begin
    Label76.RotationAngle := 0;
    GroupBox1.Height := 33;
    GroupBox2.Visible := False;
    GroupBox3.Visible := False;
    GroupBox4.Visible := False;
    Layout2.Height := Layout31.Height + GroupBox1.Height;
  End;
end;

procedure TMain.New_PatientClick(Sender: TObject);
begin
  inherited;
  Nouveau_Patient.Visible := True;
  Nouveau_Patient.OnClick(Patient);
  Nouveau_Patient.IsSelected := True;
  TabItem1.IsSelected := True;
end;

procedure TMain.Nouveau_PatientClick(Sender: TObject);
begin
  inherited;
  H_Gen_Patient.Visible := False;
  H_Accueil.IsSelected := False;
  H_Gen_NouveauP.Visible := True;
  H_Gen_RechercheP.Visible := False;
  H_Gen_NouveauP.IsSelected := True;
end;

procedure TMain.Nouveau_PatientResize(Sender: TObject);
begin
  inherited;
  Frame_Principale.OnResize(Frame_Principale);
  Frame_Information.OnResize(Frame_Information);
  Frame_Hemogramme.OnResize(Frame_Hemogramme);
  Frame_Hemostase.OnResize(Frame_Hemostase);
  Frame_Biochimic.OnResize(Frame_Biochimic);
  Frame_Serologie.OnResize(Frame_Serologie);
  // Frame_Ordonnance.OnResize(Frame_Ordonnance);
end;

function TabExist(Tab: String): Boolean;
Begin
  With Main do
  Begin
    With DataModule1.FDQuery1 do
    Begin
      Active := False;
      SQl.Clear;
      SQl.Text := ('Select * From ' + Tab + ' Where Patient_ID="' +
        Patient_ID + '"');
      Active := True;
      Open;
      if (Locate('Patient_ID', Patient_ID, [])) then
        Result := True
      else
        Result := False;
      Active := False;
      SQl.Clear;
    End;
  End;
End;

procedure TMain.OrdonnanceClick(Sender: TObject);
begin
  inherited;
  H_Gen_Patient.Visible := False;
  H_Gen_RechercheP.Visible := False;
  H_Gen_NouveauP.Visible := False;
end;

procedure TMain.PatientClick(Sender: TObject);
begin
  inherited;
  H_Gen_Patient.Visible := True;
  H_Gen_Patient.IsSelected := True;
  H_Gen_RechercheP.Visible := False;
  H_Gen_NouveauP.Visible := False;
end;

procedure TMain.Patient_RechercheClick(Sender: TObject);
begin
  inherited;
  Recherche_Patient.Visible := True;
  Recherche_Patient.OnClick(Patient);
  Recherche_Patient.IsSelected := True;
end;

procedure TMain.PoP2_HemogClick(Sender: TObject);
Var
  Print_HMDlg: TPrint_HM;
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    if (TabExist('Hemogramme') = True) then
    Begin
      Print_HMDlg := TPrint_HM.Create(Self);
      if (Print_HMDlg.ShowModal = mrCancel) then
        Print_HMDlg.Free;
    End
    else
      ShowMessage('Ce patient ñ''a pas de dossier d''analyse de l''Hémogramme');
  End
  else
    ShowMessage('Sil vous plait choisir une patient');
end;

procedure TMain.PoP2_HemosClick(Sender: TObject);
Var
  PrintHSDlg: Tprint_HS;
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    if (TabExist('Hemostase_VS') = True) then
    Begin
      PrintHSDlg := Tprint_HS.Create(Self);
      if (PrintHSDlg.ShowModal = mrCancel) then
        PrintHSDlg.Free;
    End
    else
      ShowMessage
        ('Ce patient ñ''a pas de dossier d''analyse de l''Hémostase et VS');
  End
  else
    ShowMessage('Sil vous plait choisir une patient');
end;

procedure TMain.PoP2_BoiClick(Sender: TObject);
Var
  PrintBioDLg: TPrint_Bio;
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    if (TabExist('Biochimie') = True) then
    Begin
      PrintBioDLg := TPrint_Bio.Create(Self);
      if (PrintBioDLg.ShowModal = mrCancel) then
        PrintBioDLg.Free;
    End
    else
      ShowMessage('Ce patient ñ''a pas de dossier d''analyse de la Biochimie');
  end
  else
    ShowMessage('Sil vous plait choisir une patient');
end;

procedure TMain.PoP2_SerologieClick(Sender: TObject);
Var
  PrintSRDlg: TPrint_SR;
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    if (TabExist('Serologie') = True) then
    Begin
      PrintSRDlg := TPrint_SR.Create(Self);
      if (PrintSRDlg.ShowModal = mrCancel) then
        PrintSRDlg.Free;
    End
    else
      ShowMessage('Ce patient ñ''a pas de dossier d''analyse de la Sérologie');
  End
  else
    ShowMessage('Sil vous plait choisir une patient');
end;

procedure TMain.PoP_BiochimicClick(Sender: TObject);
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    Edit_Patient.Visible := True;
    Edit_Patient.IsSelected := True;
    H_Accueil.IsSelected := True;
    TabItem11.IsSelected := True;
    Frame_EP_Principale.OnDataLoad;
    Frame_EP_Information.OnDataLoad;
    Frame_EP_Hemogramme.OnDataLoad;
    Frame_EP_Hemostase.OnDataLoad;
    Frame_EP_Serologie.OnDataLoad;
    Frame_EP_Biochimic.OnDataLoad;
  End
  else
  Begin
    ShowMessage
      ('Sil vous plait choisir une patient ou double clicker sur un patient');
  End;
end;

procedure TMain.PoP_HemogrammeClick(Sender: TObject);
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    Edit_Patient.Visible := True;
    Edit_Patient.IsSelected := True;
    H_Accueil.IsSelected := True;
    TabItem9.IsSelected := True;
    Frame_EP_Principale.OnDataLoad;
    Frame_EP_Information.OnDataLoad;
    Frame_EP_Hemogramme.OnDataLoad;
    Frame_EP_Hemostase.OnDataLoad;
    Frame_EP_Serologie.OnDataLoad;
    Frame_EP_Biochimic.OnDataLoad;
  End
  else
  Begin
    ShowMessage
      ('Sil vous plait choisir une patient ou double clicker sur un patient');
  End;
end;

procedure TMain.PoP_HemostaseClick(Sender: TObject);
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    Edit_Patient.Visible := True;
    Edit_Patient.IsSelected := True;
    H_Accueil.IsSelected := True;
    TabItem10.IsSelected := True;
    Frame_EP_Principale.OnDataLoad;
    Frame_EP_Information.OnDataLoad;
    Frame_EP_Hemogramme.OnDataLoad;
    Frame_EP_Hemostase.OnDataLoad;
    Frame_EP_Serologie.OnDataLoad;
    Frame_EP_Biochimic.OnDataLoad;
  End
  else
  Begin
    ShowMessage
      ('Sil vous plait choisir une patient ou double clicker sur un patient');
  End;
end;

procedure TMain.PoP_SerologieClick(Sender: TObject);
begin
  inherited;
  if (Patient_ID <> '') then
  Begin
    Edit_Patient.Visible := True;
    Edit_Patient.IsSelected := True;
    H_Accueil.IsSelected := True;
    TabItem12.IsSelected := True;
    Frame_EP_Principale.OnDataLoad;
    Frame_EP_Information.OnDataLoad;
    Frame_EP_Hemogramme.OnDataLoad;
    Frame_EP_Hemostase.OnDataLoad;
    Frame_EP_Serologie.OnDataLoad;
    Frame_EP_Biochimic.OnDataLoad;
  End
  else
  Begin
    ShowMessage
      ('Sil vous plait choisir une patient ou double clicker sur un patient');
  End;
end;

procedure TMain.P_AccueilClick(Sender: TObject);
begin
  inherited;
  H_Gen_Patient.Visible := False;
  H_Accueil.IsSelected := True;
  H_Gen_RechercheP.Visible := False;
  H_Gen_NouveauP.Visible := False;
end;

procedure TMain.P_AccueilResize(Sender: TObject);
begin
  inherited;
  // Width
  L_Left_P_Accueil.Width := MainT.Width / 2;
  L_Right_P_Accueil.Width := MainT.Width / 2;
  // Height
  GrouBox1_Table.Height := L_Left_P_Accueil.Height / 2;
  GrouBox2_Table.Height := L_Right_P_Accueil.Height / 2;
  GrouBox3_Table.Height := L_Left_P_Accueil.Height / 2;
  GrouBox4_Table.Height := L_Right_P_Accueil.Height / 2;
end;

procedure TMain.RB_ExterneChange(Sender: TObject);
begin
  inherited;
  if (RB_Externe.IsChecked = True) then
    Edit1.OnChangeTracking(Self);
end;

procedure TMain.RB_InterneChange(Sender: TObject);
begin
  inherited;
  if (RB_Interne.IsChecked = True) then
    Edit1.OnChangeTracking(Self);
end;

procedure TMain.RB_NomChange(Sender: TObject);
begin
  inherited;
  Edit1.OnChangeTracking(Self);
end;

procedure TMain.RB_PrenomChange(Sender: TObject);
begin
  inherited;
  Edit1.OnChangeTracking(Self);
end;

procedure TMain.RDVClick(Sender: TObject);
begin
  inherited;
  H_Gen_Patient.Visible := False;
  H_Gen_RechercheP.Visible := False;
  H_Gen_NouveauP.Visible := False;
end;

procedure TMain.Recherche_PatientClick(Sender: TObject);
begin
  inherited;
  H_Gen_Patient.Visible := False;
  H_Accueil.IsSelected := False;
  H_Gen_NouveauP.Visible := False;
  H_Gen_RechercheP.Visible := True;
  H_Gen_RechercheP.IsSelected := True;
end;

procedure TMain.Refresh_Patient_TableMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation5.enabled := False;
end;

procedure TMain.Refresh_Patient_TableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FloatAnimation5.enabled := True;
end;

procedure TMain.T_AccueilClick(Sender: TObject);
begin
  inherited;
  P_Accueil.Visible := True;
  P_Accueil.OnClick(P_Accueil);
  P_Accueil.IsSelected := True;
end;

procedure TMain.T_PatientClick(Sender: TObject);
begin
  inherited;
  Patient.Visible := True;
  Patient.OnClick(Patient);
  Patient.IsSelected := True;
end;

procedure TMain.T_RDVClick(Sender: TObject);
Var
  ConnecterDlg: TConnecter;
  Msg: Integer;
begin
  inherited;
  if (Pass = False) then
    Msg := MessageDlg('êtes-vous sûr', TMsgDlgType.mtInformation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);
  if ((Msg = mrYes) or (Pass = True)) then
  Begin
    DataModule1.Init();
    ConnecterDlg := TConnecter.Create(Self);
    if (ConnecterDlg.ShowModal = mrOk) then
    Begin
      ShowMessage('Bienvenue MR ''' + Nom);
      Load();
      LoadParam;
      ConnecterDlg.Free;
    End
    else
      Application.Terminate;
  End;

end;

end.
