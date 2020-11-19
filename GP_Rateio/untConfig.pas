unit untConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmConfiguracoes = class(TForm)
    edtBandoDados: TButtonedEdit;
    Label1: TLabel;
    edtServer: TLabeledEdit;
    edtPorta: TLabeledEdit;
    edtUser: TLabeledEdit;
    edtSenha: TLabeledEdit;
    butConfirma: TSpeedButton;
    butRetorna: TSpeedButton;
    openDataBase: TOpenDialog;
    DBGrid1: TDBGrid;
    memoToDP: TMemo;
    procedure edtBandoDadosRightButtonClick(Sender: TObject);
    procedure butRetornaClick(Sender: TObject);
    procedure butConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LerConfig;
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

uses unDmImagensXE8, URotinasRaul_XE8, untDM;

procedure TfrmConfiguracoes.butConfirmaClick(Sender: TObject);
begin
  DM.cdsXMLConfig.Edit;
  DM.cdsXMLConfigDATABASE.AsString:=edtBandoDados.Text;
  DM.cdsXMLConfigSERVER.AsString:=edtServer.Text;
  DM.cdsXMLConfigPORTA.AsString:=edtPorta.Text;
  DM.cdsXMLConfigUSERNAME.AsString:=edtUser.Text;
  DM.cdsXMLConfigPASSWORD.AsString:=CriptoGramRaul(edtSenha.Text);
  DM.cdsXMLConfig.Post;
  DM.cdsXMLConfig.ApplyUpdates(-1);
  LerConfig;
end;

procedure TfrmConfiguracoes.butRetornaClick(Sender: TObject);
begin
  if MessageRaul_Confirma('Deseja retornar a tela principal?'+#13+'Toda mudança será perdida.') then
  begin
    LerConfig;
//    Close;
  end
end;

procedure TfrmConfiguracoes.edtBandoDadosRightButtonClick(Sender: TObject);
begin
  if openDataBase.Execute then
    edtBandoDados.Text:=openDataBase.FileName;
end;

procedure TfrmConfiguracoes.LerConfig;
begin
  DM.cdsXMLConfig.Close;
  DM.xmlConfig.XMLDataFile:=StringReplace(Application.ExeName,'.exe','.xml',[rfReplaceAll,rfIgnoreCase]);
  DM.cdsXMLConfig.Open;
  DM.cdsXMLConfig.Edit;
  edtBandoDados.Text:=DM.cdsXMLConfigDATABASE.AsString;
  edtServer.Text:=    DM.cdsXMLConfigSERVER.AsString;
  edtPorta.Text:=     DM.cdsXMLConfigPORTA.AsString;
  edtUser.Text:=      DM.cdsXMLConfigUSERNAME.AsString;
  edtSenha.Text:=     CriptoGramRaul(DM.cdsXMLConfigPASSWORD.AsString,true);
  DM.cdsXMLConfig.Post;
  DM.cdsXMLConfig.ApplyUpdates(-1);
end;

end.
