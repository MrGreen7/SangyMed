program SangyMed;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Main in 'U_Main.pas' {Main},
  U_Base_Form in 'U_Base_Form.pas' {Base_Form},
  U_DataModule in 'U_DataModule.pas' {DataModule1: TDataModule},
  U_Frame_Principale in 'U_Frame_Principale.pas' {Frame1: TFrame},
  U_Frame_Information in 'U_Frame_Information.pas' {Frame2: TFrame},
  U_Frame_Hemogramme in 'U_Frame_Hemogramme.pas' {Frame3: TFrame},
  U_Frame_Hemostase in 'U_Frame_Hemostase.pas' {Frame4: TFrame},
  U_Frame_Serologie in 'U_Frame_Serologie.pas' {Frame5: TFrame},
  U_Frame_Biochimic in 'U_Frame_Biochimic.pas' {Frame6: TFrame},
  U_Frame_Ordonnance in 'U_Frame_Ordonnance.pas' {Frame7: TFrame},
  U_Entreprise in 'U_Entreprise.pas' {Etablissement},
  U_Fenetre in 'U_Fenetre.pas' {Fenetre},
  U_Parametre in 'U_Parametre.pas' {Parametre},
  U_Connecter in 'U_Connecter.pas' {Connecter},
  U_Inscription in 'U_Inscription.pas' {Inscription},
  U_Print_HM in 'U_Print_HM.pas' {Print_HM},
  U_Print_Bio in 'U_Print_Bio.pas' {Print_Bio},
  U_Print_HS in 'U_Print_HS.pas' {Print_HS},
  U_Print_Ordo in 'U_Print_Ordo.pas' {Print_Ordo},
  U_Print_SR in 'U_Print_SR.pas' {Print_SR},
  U_Remontre in 'U_Remontre.pas' {Remontre};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TBase_Form, Base_Form);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TRemontre, Remontre);
  Application.Run;
end.
