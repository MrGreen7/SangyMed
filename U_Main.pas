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
  FMX.Edit;

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
    TreeViewItem1: TTreeViewItem;
    TreeViewItem6: TTreeViewItem;
    TreeViewItem2: TTreeViewItem;
    TreeViewItem3: TTreeViewItem;
    TreeViewItem4: TTreeViewItem;
    TreeViewItem5: TTreeViewItem;
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
    Label77: TLabel;
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
    H_Gen_RDV: TTabItem;
    Panel11: TPanel;
    Layout27: TLayout;
    Layout10: TLayout;
    Label35: TLabel;
    ShadowEffect27: TShadowEffect;
    Label36: TLabel;
    ColorAnimation19: TColorAnimation;
    ShadowEffect28: TShadowEffect;
    Layout11: TLayout;
    Label37: TLabel;
    ColorAnimation20: TColorAnimation;
    ShadowEffect29: TShadowEffect;
    Label38: TLabel;
    ShadowEffect30: TShadowEffect;
    Layout4: TLayout;
    Label21: TLabel;
    ShadowEffect17: TShadowEffect;
    Label22: TLabel;
    ColorAnimation9: TColorAnimation;
    ShadowEffect18: TShadowEffect;
    Layout9: TLayout;
    Label33: TLabel;
    ShadowEffect25: TShadowEffect;
    Label34: TLabel;
    ShadowEffect26: TShadowEffect;
    ColorAnimation18: TColorAnimation;
    Line24: TLine;
    Line25: TLine;
    Line26: TLine;
    Line27: TLine;
    H_Gen_Ordo: TTabItem;
    Panel9: TPanel;
    Layout28: TLayout;
    Layout12: TLayout;
    Label39: TLabel;
    ShadowEffect31: TShadowEffect;
    Label40: TLabel;
    ShadowEffect32: TShadowEffect;
    ColorAnimation21: TColorAnimation;
    Layout13: TLayout;
    Label41: TLabel;
    ShadowEffect33: TShadowEffect;
    Label42: TLabel;
    ColorAnimation22: TColorAnimation;
    ShadowEffect34: TShadowEffect;
    Layout14: TLayout;
    Label43: TLabel;
    ColorAnimation23: TColorAnimation;
    ShadowEffect35: TShadowEffect;
    Label44: TLabel;
    ShadowEffect36: TShadowEffect;
    Layout21: TLayout;
    Label57: TLabel;
    ShadowEffect49: TShadowEffect;
    Label58: TLabel;
    ColorAnimation30: TColorAnimation;
    ShadowEffect50: TShadowEffect;
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
    Label24: TLabel;
    ColorAnimation12: TColorAnimation;
    FloatAnimation3: TFloatAnimation;
    L_Right_P_Accueil: TLayout;
    GrouBox2_Table: TGroupBox;
    Label23: TLabel;
    ColorAnimation11: TColorAnimation;
    FloatAnimation2: TFloatAnimation;
    GrouBox4_Table: TGroupBox;
    Label25: TLabel;
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
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    Frame_Principale: TFrame1;
    RDV: TTabItem;
    Ordonnance: TTabItem;
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
    TabItem13: TTabItem;
    TabItem14: TTabItem;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  private
    { Private declarations }
    WidthX, HeightX: Integer;
  public
    { Public declarations }
    Patient_ID, IDs: String;
  end;

var
  Main: TMain;

implementation

Uses
  U_Option, U_Log, U_Entreprise, Winapi.Windows, U_DataModule,
  FireDAC.Comp.Client;
{$R *.fmx}

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
begin
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
  //StringGrid5ColResize;
end;

procedure TMain.FormShow(Sender: TObject);
var
  LogDlg: TLog;
begin
  inherited;
  P_Accueil.IsSelected := True;
  LogDlg := TLog.Create(self);
  if (LogDlg.ShowModal = mrCancel) then
    Application.Terminate;
  LogDlg.Free;
  // StatusBar;
end;

end.
