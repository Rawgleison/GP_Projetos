unit untNovoPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RotinasRaul;

type
  TfrmNomePerfil = class(TForm)
    edtDesc_Rateio: TLabeledEdit;
    butConfirma: TButton;
    butCancela: TButton;
    procedure butCancelaClick(Sender: TObject);
    procedure butConfirmaClick(Sender: TObject);
    procedure edtDesc_RateioKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNomePerfil: TfrmNomePerfil;

implementation

{$R *.dfm}

uses untDM, untPrincipal;

procedure TfrmNomePerfil.butCancelaClick(Sender: TObject);
begin
  DM.QR_Perfil.Cancel;
  Close;
end;

procedure TfrmNomePerfil.butConfirmaClick(Sender: TObject);
var
  Novo_Cod:Integer;
begin
  if Trim(edtDesc_Rateio.Text)='' then
  begin
    MessageRaul_ATENCAO('Indique um nome para o Perfil.');
    edtDesc_Rateio.SetFocus;
    Exit;
  end;
  DM.QR_Perfil.Append;
  DM.QR_Perfil.FieldByName('DESC_RATEIO').AsString:=edtDesc_Rateio.Text;
  DM.qr_Local.Close;
  DM.qr_Local.Open('SELECT GEN_ID(SGP_RATEIO,1) COD FROM RDB$DATABASE');
  DM.QR_Perfil.FieldByName('COD_RATEIO').AsInteger:=DM.qr_Local.FieldByName('COD').AsInteger;
  DM.QR_Perfil.Post;
  DM.QR_Perfil.ApplyUpdates();
  dm.QR_Perfil.last;
  frmPrincipal.dbcb_Perfil.ListFieldIndex:=1;
  frmPrincipal.dbcb_Perfil.KeyValue:=dm.QR_Perfil.FieldByName('COD_RATEIO').AsInteger;
  edtDesc_Rateio.Clear;
  frmPrincipal.edtQtdPeca.SetFocus;
  Close;
end;

procedure TfrmNomePerfil.edtDesc_RateioKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    butConfirma.SetFocus;
end;

procedure TfrmNomePerfil.FormShow(Sender: TObject);
begin
  edtDesc_Rateio.SetFocus;
end;

end.
