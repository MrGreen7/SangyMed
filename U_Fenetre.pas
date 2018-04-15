unit U_Fenetre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_Base_Form,
  FMX.Ani, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFenetre = class(TBase_Form)
    F_Accueil: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Fla_Accueil: TFloatAnimation;
    Btn_Accueil: TButton;
    F_NouveauP: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Fla_NouveauP: TFloatAnimation;
    Btn_NouveauP: TButton;
    F_Patient: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Fla_Patient: TFloatAnimation;
    Btn_Patient: TButton;
    F_RDV: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Fla_RDV: TFloatAnimation;
    Btn_RDV: TButton;
    F_RechercheP: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Fla_RechercheP: TFloatAnimation;
    Btn_RechercheP: TButton;
    Label1: TLabel;
    Label14: TLabel;
    ColorAnimation1: TColorAnimation;
    procedure Btn_PatientClick(Sender: TObject);
    procedure Btn_RDVClick(Sender: TObject);
    procedure Btn_RecherchePClick(Sender: TObject);
    procedure Btn_AccueilClick(Sender: TObject);
    procedure Btn_NouveauPClick(Sender: TObject);
    procedure Fla_PatientFinish(Sender: TObject);
    procedure Fla_RDVFinish(Sender: TObject);
    procedure Fla_RecherchePFinish(Sender: TObject);
    procedure Fla_AccueilFinish(Sender: TObject);
    procedure Fla_NouveauPFinish(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fenetre: TFenetre;

implementation

uses
  U_Main;

{$R *.fmx}

procedure TFenetre.Btn_AccueilClick(Sender: TObject);
begin
  inherited;
  Fla_Accueil.Enabled := True;
  Main.P_Accueil.Visible := False;
end;

procedure TFenetre.Btn_NouveauPClick(Sender: TObject);
begin
  inherited;
  Fla_NouveauP.Enabled := True;
  Main.Nouveau_Patient.Visible := False;
  Main.H_Gen_NouveauP.Visible := False;
end;

procedure TFenetre.Btn_PatientClick(Sender: TObject);
begin
  inherited;
  Fla_Patient.Enabled := True;
  Main.Patient.Visible := False;
  Main.H_Gen_Patient.Visible := False;
end;

procedure TFenetre.Btn_RDVClick(Sender: TObject);
begin
  inherited;
  Fla_RDV.Enabled := True;
  Main.Edit_Patient.Visible:=False;
end;

procedure TFenetre.Btn_RecherchePClick(Sender: TObject);
begin
  inherited;
  Fla_RechercheP.Enabled := True;
  Main.Recherche_Patient.Visible := False;
  Main.H_Gen_RechercheP.Visible := False;
end;

procedure TFenetre.Fla_AccueilFinish(Sender: TObject);
begin
  inherited;
  F_Accueil.Visible := False;
end;

procedure TFenetre.Fla_NouveauPFinish(Sender: TObject);
begin
  inherited;
  F_NouveauP.Visible := False;
end;

procedure TFenetre.Fla_PatientFinish(Sender: TObject);
begin
  inherited;
  F_Patient.Visible := False;
end;

procedure TFenetre.Fla_RDVFinish(Sender: TObject);
begin
  inherited;
  F_RDV.Visible := False
end;

procedure TFenetre.Fla_RecherchePFinish(Sender: TObject);
begin
  inherited;
  F_RechercheP.Visible := False;
end;

procedure TFenetre.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  ModalResult := mrClose;
end;

procedure TFenetre.FormShow(Sender: TObject);
begin
  inherited;
  if (Main.P_Accueil.Visible = True) then
    F_Accueil.Visible := True
  else
    F_Accueil.Visible := False;
  if (Main.Patient.Visible = True) then
    F_Patient.Visible := True
  else
    F_Patient.Visible := False;
  if (Main.Nouveau_Patient.Visible = True) then
    F_NouveauP.Visible := True
  else
    F_NouveauP.Visible := False;
  if (Main.Recherche_Patient.Visible = True) then
    F_RechercheP.Visible := True
  else
    F_RechercheP.Visible := False;
end;

procedure TFenetre.Label14Click(Sender: TObject);
begin
  inherited;
  Btn_Accueil.OnClick(Btn_Accueil);
  Btn_RDV.OnClick(Btn_RDV);
  Btn_Patient.OnClick(Btn_Patient);
  Btn_NouveauP.OnClick(Btn_NouveauP);
  Btn_RechercheP.OnClick(Btn_RechercheP);
  Fla_Accueil.OnFinish(Fla_Accueil);
  Fla_RDV.OnFinish(Fla_RDV);
  Fla_Patient.OnFinish(Fla_Patient);
  Fla_NouveauP.OnFinish(Fla_NouveauP);
  Fla_RechercheP.OnFinish(Fla_RechercheP);
end;

end.
