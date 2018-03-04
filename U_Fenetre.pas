unit U_Fenetre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,U_Base_Form,
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
    F_Ordonnance: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Fla_Ordonnace: TFloatAnimation;
    Btn_Ordonnace: TButton;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fenetre: TFenetre;

implementation

{$R *.fmx}

end.
