program GP_Rateio;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDM in 'untDM.pas' {DM: TDataModule},
  untNovoPerfil in 'untNovoPerfil.pas' {frmNomePerfil},
  untSplash in 'untSplash.pas' {frmSplash},
  untLocalizar in 'untLocalizar.pas' {frmLocalizar},
  Vcl.Themes,
  Vcl.Styles,
  untTelaStilos in '..\public\untTelaStilos.pas' {frmThema},
  untMsgErro in 'untMsgErro.pas' {ExceptionDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmNomePerfil, frmNomePerfil);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmLocalizar, frmLocalizar);
  Application.CreateForm(TfrmThema, frmThema);
  Application.Run;
end.
