unit untLocalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmLocalizar = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    edtLocalizar: TEdit;
    rgLocalizar: TRadioGroup;
    procedure edtLocalizarChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocalizarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizar: TfrmLocalizar;

implementation

{$R *.dfm}

uses untDM, untPrincipal;

procedure TfrmLocalizar.edtLocalizarChange(Sender: TObject);
var
  Pi, Pf: string;
begin
  case rgLocalizar.ItemIndex of
    0:begin
      Pi:='';
      Pf:='%';
    end;
    1:begin
      Pi:='%';
      Pf:='%';
    end;
    2:begin
      Pi:='%';
      Pf:='';
    end;
  end;
  DM.QR_Localizar.Close;
  DM.QR_Localizar.ParamByName('DESC').AsString:=Pi+edtLocalizar.Text+Pf;
  DM.QR_Localizar.Open;
end;

procedure TfrmLocalizar.edtLocalizarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_UP then
    DM.QR_Localizar.Prior;
  if Key=VK_DOWN then
    DM.QR_Localizar.Next;
end;

procedure TfrmLocalizar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edtLocalizar.Clear;
end;

procedure TfrmLocalizar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    frmPrincipal.edtProduto.Text:=DM.QR_LocalizarCOD_PRODUTO.AsString;
    ModalResult:=mrOk;
    //Close;
  end;
  if Key=VK_F12 then
    if rgLocalizar.ItemIndex=2 then
      rgLocalizar.ItemIndex:=0
    else
      rgLocalizar.ItemIndex:=rgLocalizar.ItemIndex+1;
end;

end.
