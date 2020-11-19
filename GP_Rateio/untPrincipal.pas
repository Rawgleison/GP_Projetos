unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, IniFiles, JvExStdCtrls, JvEdit, JvValidateEdit,
  JvExControls, JvDBLookup, RotinasRaul;

type
  TfrmPrincipal = class(TForm)
    pn_Rateio: TPanel;
    pn_Finaliza: TPanel;
    pn_Itens: TPanel;
    Perfil: TLabel;
    but_Itens: TButton;
    but_NovoPerfil: TButton;
    edt_Data: TMaskEdit;
    lbData: TLabel;
    DBGrid1: TDBGrid;
    pnProduto: TPanel;
    edtProduto: TEdit;
    Label3: TLabel;
    lbDesc_Prod: TLabel;
    butConfirmaItem: TButton;
    butConfirmar: TButton;
    butRetornar: TButton;
    butGravarPerfil: TButton;
    butSairItem: TButton;
    dbcb_Perfil: TDBLookupComboBox;
    pmGrid: TPopupMenu;
    Excluir1: TMenuItem;
    edtCodEmpresa: TLabeledEdit;
    lbEmpresa: TLabel;
    edtNF: TLabeledEdit;
    MainMenu1: TMainMenu;
    hema1: TMenuItem;
    Label1: TLabel;
    edtTotalPorcentagem: TDBEdit;
    edtTotalPesoRateio: TDBEdit;
    edtTotalCustoCompra: TDBEdit;
    edtTotalVenda: TDBEdit;
    edtPercentualAgregado: TDBEdit;
    lbTotalPorcentagem: TLabel;
    lbTotalPesoRateio: TLabel;
    lbTotalCusto: TLabel;
    lbTotalVenda: TLabel;
    lbPorcentagemAgregado: TLabel;
    cbAlteraCusto: TCheckBox;
    butCalcular: TButton;
    edtQtdPeca: TJvValidateEdit;
    lbQtdPeca: TLabel;
    lbPesoPEca: TLabel;
    edtPesoTotal: TJvValidateEdit;
    edtPeso: TJvValidateEdit;
    lbPesoTotal: TLabel;
    lbVrKG: TLabel;
    edtVrKg: TJvValidateEdit;
    edtVrTotal: TJvValidateEdit;
    lbVrTotal: TLabel;
    dblookTabelaPreco: TJvDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butConfirmarClick(Sender: TObject);
    procedure but_ItensClick(Sender: TObject);
    procedure but_NovoPerfilClick(Sender: TObject);
    procedure dbcb_PerfilCloseUp(Sender: TObject);
    procedure edt_DataEnter(Sender: TObject);
    procedure butSairItemClick(Sender: TObject);
    procedure butConfirmaItemClick(Sender: TObject);
    procedure butGravarPerfilClick(Sender: TObject);
    procedure edtPesoTotalEnter(Sender: TObject);
    procedure butRetornarClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure edtQtdPecaKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdPecaEnter(Sender: TObject);
    procedure edtPesoEnter(Sender: TObject);
    procedure edtQtdPecaChange(Sender: TObject);
    procedure edt_DataExit(Sender: TObject);
    procedure edtCodEmpresaExit(Sender: TObject);
    procedure hema1Click(Sender: TObject);
    procedure dbcb_PerfilExit(Sender: TObject);
    procedure edtPesoTotalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtVrTotalEnter(Sender: TObject);
    procedure edtVrTotalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure butCalcularClick(Sender: TObject);
    procedure edtPesoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtVrKgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    _CNPJ_CPF: String;
    { Private declarations }
    procedure LimpaItem;
    procedure LimpaTudo;
    function BuscaItens: Boolean;
    procedure BuscaProduto(Apelido: String);
    procedure GravaPerfil;
    procedure LerCofig;
    procedure GravaConfig;
    procedure BuscaEmpresa;
    procedure ListaTabPreco;
    procedure AtualizaGrid;
  public
    { Variaveis Globais }
    _Editando          : Boolean;
    _Cod_tabela        : Integer;
    _GigaPath          : String;
    _PercentualAgregado: Real;
    { Public declarations }
    procedure Editando(Editando: Boolean = True);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untDM, untNovoPerfil, untSplash, untLocalizar,
  untTelaStilos, untMsgErro;

{ TfrmPrincipal }

procedure TfrmPrincipal.AtualizaGrid;
begin
  DM.qrPreco_Venda.Close;
  DM.qrPreco_Venda.ParamByName('COD_EMPRESA').AsString := edtCodEmpresa.Text;
  DM.qrPreco_Venda.ParamByName('COD_TABELA').AsInteger := DM.qrTabPrecoCOD_TABELA.AsInteger;
  DM.qrPreco_Venda.Open;

  DM.QR_Rateio_Itens.Close;
  DM.QR_Rateio_Itens.Open;
  DM.QR_Rateio_Itens.Last;
  DM.QR_Rateio_Itens.First;

end;

procedure TfrmPrincipal.BuscaEmpresa;
begin
  if edtCodEmpresa.Text = '' then
  begin
    MessageRaul_ATENCAO('Uma empresa deve ser indicada.');
    edtCodEmpresa.SetFocus;
    Exit;
  end
  else
  begin
    DM.qrGigaERP.Close;
    DM.qrGigaERP.Open('SELECT CNPJ_CPF,RAZAO_SOCIAL FROM EMPRESAS WHERE COD_EMPRESA = ' + edtCodEmpresa.Text);
    if DM.qrGigaERP.RecordCount > 0 then
    begin
      lbEmpresa.Caption := DM.qrGigaERP.FieldByName('RAZAO_SOCIAL').AsString;
      _CNPJ_CPF         := DM.qrGigaERP.FieldByName('CNPJ_CPF').AsString;
      DM.QR_Produtos_Detalhes.Close;
      DM.QR_Produtos_Detalhes.ParamByName('COD_EMPRESA').AsString := edtCodEmpresa.Text;
      // DM.QR_Produtos_Detalhes.ParamByName('COD_TABELA').AsInteger:=_Cod_tabela;
    end
    else
    begin
      MessageRaul_ATENCAO('Empresa não encontrada com esse codigo, reveja a informação.');
      edtCodEmpresa.SetFocus;
    end;
  end;
end;

function TfrmPrincipal.BuscaItens: Boolean;
begin
  try
    with DM do
    begin

    end;
  finally

  end;
end;

procedure TfrmPrincipal.BuscaProduto(Apelido: String);
begin
  DM.QR_Busca_prod.Close;
  DM.QR_Busca_prod.ParamByName('APELIDO').AsString := Apelido;
  DM.QR_Busca_prod.Open;
  case DM.QR_Busca_prod.RecordCount of
    0:
      begin
        MessageRaul_ATENCAO('Nenhum Produto encontrado com esse codigo.');
        edtProduto.SetFocus;
      end;
    1:
      begin
        lbDesc_Prod.Caption := DM.QR_Busca_prodCOD_PRODUTO.AsString + ' - ' + DM.QR_Busca_prodCOD_GRADE.AsString + ' - ' + DM.QR_Busca_prodDESC_PRODUTO.AsString;
        // butConfirmaItem.SetFocus;
      end;
  else
    begin
      frmSplash.ShowModal;
      lbDesc_Prod.Caption := DM.QR_Busca_prodCOD_PRODUTO.AsString + ' - ' + DM.QR_Busca_prodCOD_GRADE.AsString + ' - ' + DM.QR_Busca_prodDESC_PRODUTO.AsString;
      // butConfirmaItem.SetFocus;
    end;
  end;
end;

procedure TfrmPrincipal.butCalcularClick(Sender: TObject);
begin
  if (edtPesoTotal.Value > 0) and (edtVrTotal.Value > 0) and (edtQtdPeca.Value > 0) and (DM.QR_Rateio_Itens.RecordCount > 0) and (Trim(edtTotalPorcentagem.Text) = '100,00') then
  begin
    DM.QR_Rateio_Itens.CachedUpdates := False;
    DM.QR_Rateio_Itens.Refresh;
    DM.QR_Rateio_Itens.Last;
    DM.QR_Rateio_Itens.First;
    _PercentualAgregado := StrToFloat(edtPercentualAgregado.Text) / 100;
    DM.QR_Rateio_Itens.Refresh;
    DM.QR_Rateio_Itens.Last;
    DM.QR_Rateio_Itens.First;
    DM.QR_Rateio_Itens.CachedUpdates := True;
    Editando(True);
  end
  else
  begin
    MessageRaul_AVISO('Quantidade de peça, Peso e valor devem ser passados e a distribuição deve ser de 100%.');
    edtQtdPeca.SetFocus;
  end;
end;

procedure TfrmPrincipal.butConfirmaItemClick(Sender: TObject);
begin
  try
    if lbDesc_Prod.Caption = '' then
      Exit;
    DM.QR_Rateio_Itens.Append;
    DM.QR_Rateio_ItensCOD_RATEIO.AsInteger      := DM.QR_PerfilCOD_RATEIO.AsInteger;
    DM.QR_Rateio_ItensCOD_RATEIO_ITEM.AsInteger := DM.QR_Rateio_Itens.RecordCount + 1;
    DM.QR_Rateio_ItensCOD_PRODUTO.AsString      := DM.QR_Busca_prodCOD_PRODUTO.AsString;
    DM.QR_Rateio_ItensCOD_GRADE.AsString        := DM.QR_Busca_prodCOD_GRADE.AsString;
    DM.QR_Rateio_ItensPORCENTAGEM.AsFloat       := 0.00;
    DM.QR_Rateio_Itens.Post;
    DM.QR_Rateio_Itens.Last;
    DM.QR_Rateio_Itens.First;
    LimpaItem;
    edtProduto.SetFocus;
  except
    on E: Exception do
      MessageRaul_ERRO('butConfirmaItemClick - Error ai inserir item' + #13 + E.Message);
  end;
end;

procedure TfrmPrincipal.butConfirmarClick(Sender: TObject);
begin
  if DM.QR_Rateio_ItensTOTAL_PORCENTAGEM.Value < 100 then
  begin
    MessageRaul_ATENCAO('Ainda faltam ' + FloatToStr(100 - DM.QR_Rateio_ItensTOTAL_PORCENTAGEM.AsFloat) + '% do peso a ser distribuida');
    but_Itens.SetFocus;
    Exit;
  end;
  if _Editando then
    GravaPerfil;
  if trim(edtNF.Text) <> '' then
    if not MessageRaul_Confirma('Um numero de Nota Fiscal foi passado, por isso será gerado movimento nos estoques Físico e Contábil.' + #13 + 'Você confirma os dois movimentos?') then
      Exit;
  DM.EntraEstoque;
  LimpaTudo;
end;

procedure TfrmPrincipal.butGravarPerfilClick(Sender: TObject);
begin
  GravaPerfil;
end;

procedure TfrmPrincipal.butRetornarClick(Sender: TObject);
begin
  if MessageRaul_Confirma('Desja realmente voltar, todo progresso não gravado será perdido.') then
    LimpaTudo
end;

procedure TfrmPrincipal.butSairItemClick(Sender: TObject);
begin

  pn_Rateio.Enabled   := True;
  pn_Finaliza.Enabled := True;
  pn_Itens.Enabled    := False;
  edtPesoTotal.SetFocus;
end;

procedure TfrmPrincipal.but_ItensClick(Sender: TObject);
begin
  if (dbcb_Perfil.Text = '') or (edtPesoTotal.Text = '') or (Length(trim(edt_Data.Text)) < 10) then
  begin
    MessageRaul_ATENCAO('Reveja as informações.');
    dbcb_Perfil.SetFocus;
    Exit;
  end;
  pn_Rateio.Enabled   := False;
  pn_Finaliza.Enabled := False;
  pn_Itens.Enabled    := True;
  edtProduto.SetFocus;
  Editando(True);
//  AtualizaGrid;
end;

procedure TfrmPrincipal.but_NovoPerfilClick(Sender: TObject);
begin
  frmNomePerfil.ShowModal;
end;

procedure TfrmPrincipal.dbcb_PerfilCloseUp(Sender: TObject);
begin
  if dbcb_Perfil.Text <> '' then
  begin
    AtualizaGrid;
    ListaTabPreco;
  end;
end;

procedure TfrmPrincipal.dbcb_PerfilExit(Sender: TObject);
begin
  if dbcb_Perfil.Text <> '' then
  begin
    AtualizaGrid;
    ListaTabPreco;
  end;
end;

procedure TfrmPrincipal.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if DM.QR_Rateio_Itens.Eof then
  begin
    DM.QR_Rateio_Itens.Cancel;
    DM.QR_Rateio_Itens.First;
  end;
end;

procedure TfrmPrincipal.Editando(Editando: Boolean = True);
begin
  _Editando               := Editando;
  butGravarPerfil.Enabled := Editando;
  butConfirmar.Enabled    := Editando;
end;

procedure TfrmPrincipal.edtProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  if Key = VK_RETURN then
  begin
    if (trim(edtProduto.Text) = '') then
    begin
      frmLocalizar.ShowModal;
      if frmLocalizar.ModalResult = mrOk then
        BuscaProduto(edtProduto.Text)
      else
        edtProduto.SetFocus;
    end
    else
      BuscaProduto(edtProduto.Text);
  end;
end;

procedure TfrmPrincipal.edtPesoEnter(Sender: TObject);
begin
  if not(edtQtdPeca.Value > 0) then
  begin
    MessageRaul_ATENCAO('Antes, indique uma quantidade de peça.');
    edtQtdPeca.SetFocus;
    Exit;
  end;
end;

procedure TfrmPrincipal.edtPesoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  edtPesoTotal.Value := edtPeso.Value * edtQtdPeca.Value;
end;

procedure TfrmPrincipal.edtQtdPecaChange(Sender: TObject);
begin
  edtPeso.Text      := '0,00';
  edtPesoTotal.Text := '0,00';
end;

procedure TfrmPrincipal.edtQtdPecaEnter(Sender: TObject);
begin
  if dbcb_Perfil.Text = '' then
  begin
    MessageRaul_ATENCAO('Antes, selecione um perfil.');
    dbcb_Perfil.SetFocus;
  end;
end;

procedure TfrmPrincipal.edtQtdPecaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtPeso.SetFocus;
end;

procedure TfrmPrincipal.edtVrKgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  edtVrTotal.Value := edtVrKg.Value * edtPesoTotal.Value;
end;

procedure TfrmPrincipal.edtVrTotalEnter(Sender: TObject);
begin
  edtVrTotal.ReadOnly := edtVrKg.Value > 0;
end;

procedure TfrmPrincipal.edtVrTotalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  edtVrKg.Value := edtVrTotal.Value / edtPesoTotal.Value;
end;

procedure TfrmPrincipal.edt_DataEnter(Sender: TObject);
begin
  // ShowMessage(edt_Data.Text+' - '+inttostr(length(trim(edt_Data.Text))));
  if dbcb_Perfil.Text = '' then
  begin
    MessageRaul_ATENCAO('Antes, indique um Perfil.');
    dbcb_Perfil.SetFocus;
    Exit;
  end;
  // if trim(edt_Data.Text)='/  /' then
  // edt_Data.Text:=FormatDateTime('dd/mm/yyyy',now);
end;

procedure TfrmPrincipal.edt_DataExit(Sender: TObject);
begin
  edt_Data.Text := FiltraData(edt_Data.Text);
end;

procedure TfrmPrincipal.edtPesoTotalEnter(Sender: TObject);
begin
  edtPesoTotal.ReadOnly := edtPeso.Value <> 0;
end;

procedure TfrmPrincipal.edtPesoTotalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  edtPeso.Value := edtPesoTotal.Value / edtQtdPeca.Value;
end;

procedure TfrmPrincipal.Excluir1Click(Sender: TObject);
begin
  if MessageRaul_Confirma('Desejá realmente excluir o produto ' + DM.QR_Rateio_ItensDESC_PRODUTO.AsString + '?') then
  begin
    DM.QR_Rateio_Itens.Delete;
    // if DM.QR_Rateio_Itens.Locate('COD_RATEIO_ITEM',dm.QR_GridCOD_RATEIO_ITEM.AsInteger,[]) then
    // begin
    // DM.QR_Rateio_Itens.Delete;
    // DM.QR_Rateio_Itens.ApplyUpdates(-1);
    // DM.QR_Rateio_Itens.Close;
    // DM.QR_Rateio_Itens.Open;
    // DM.QR_Grid.Refresh;
    // end;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if _Editando then
  begin
    MessageRaul_ATENCAO('Primeiro, encerre a edição');
    Action := caNone;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  versao: String;
begin
  try
    autoupdate;
    while ChecaVersaoSimple<>'OK' do
      Sleep(1000);

    Self.Caption := 'Versão: ' + VersaoEXE(Application.ExeName) + ' Tela para gerar entrada no estoque ';

    LerCofig;
    with DM do
    begin
      ConectaGigaERP(DM.ConexaoGigaERP, _GigaPath);
      QR_Perfil.Open();
      ListaTabPreco;
    end;
    BuscaEmpresa;
    DM.VerifLicenca;
  except
    on E: Exception do
    begin
      ExceptionDialogClass.ShowException(E, nil);
      Application.Terminate;
    end;
  end;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) and not(ActiveControl is TJvDBLookupCombo) then
    Perform(WM_NEXTDLGCTL, 0, 1);
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  if Self.Width > 1060 then
  begin
    pn_Rateio.Height := 145;
    edtVrKg.Top      := 104;
    edtVrKg.Left     := 399;
  end
  else
  begin
    pn_Rateio.Height := 200;
    edtVrKg.Top      := 160;
    edtVrKg.Left     := 8;
  end;
  edtVrTotal.Top     := edtVrKg.Top;
  edt_Data.Top       := edtVrKg.Top;
  edtNF.Top          := edtVrKg.Top;
  cbAlteraCusto.Top  := edtVrKg.Top + 7;
  edtVrTotal.Left    := edtVrKg.Left + 95;
  edt_Data.Left      := edtVrTotal.Left + 95;
  edtNF.Left         := edt_Data.Left + 95;
  cbAlteraCusto.Left := edtNF.Left + 95;
  lbVrTotal.Left     := edtVrTotal.Left;
  lbData.Left        := edt_Data.Left;
  lbVrKG.Left        := edtVrKg.Left;
  lbVrTotal.Top      := edtVrTotal.Top - 23;
  lbData.Top         := edt_Data.Top - 23;
  lbVrKG.Top         := edtVrKg.Top - 23;

  if Self.Width > 970 then
  begin
    pn_Finaliza.Height       := 72;
    edtTotalPorcentagem.Top  := 32;
    edtTotalPorcentagem.Left := 396;
  end
  else
  begin
    pn_Finaliza.Height       := 116;
    edtTotalPorcentagem.Top  := 83;
    edtTotalPorcentagem.Left := 11;
  end;
  edtTotalPesoRateio.Top     := edtTotalPorcentagem.Top;
  edtTotalCustoCompra.Top    := edtTotalPorcentagem.Top;
  edtTotalVenda.Top          := edtTotalPorcentagem.Top;
  edtPercentualAgregado.Top  := edtTotalPorcentagem.Top;
  edtTotalPesoRateio.Left    := edtTotalPorcentagem.Left + 112;
  edtTotalCustoCompra.Left   := edtTotalPesoRateio.Left + 112;
  edtTotalVenda.Left         := edtTotalCustoCompra.Left + 112;
  edtPercentualAgregado.Left := edtTotalVenda.Left + 112;
  //
  lbTotalPorcentagem.Left    := edtTotalPorcentagem.Left;
  lbTotalPesoRateio.Left     := edtTotalPesoRateio.Left;
  lbTotalCusto.Left          := edtTotalCustoCompra.Left;
  lbTotalVenda.Left          := edtTotalVenda.Left;
  lbPorcentagemAgregado.Left := edtPercentualAgregado.Left;
  lbTotalPorcentagem.Top     := edtTotalPorcentagem.Top - 22;
  lbTotalPesoRateio.Top      := edtTotalPesoRateio.Top - 22;
  lbTotalCusto.Top           := edtTotalCustoCompra.Top - 22;
  lbTotalVenda.Top           := edtTotalVenda.Top - 22;
  lbPorcentagemAgregado.Top  := edtPercentualAgregado.Top - 22;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  LimpaTudo;
  edtCodEmpresa.SetFocus;
end;

procedure TfrmPrincipal.GravaConfig;
var
  ArqName: String;
  ArqIni : TIniFile;
begin
  ArqName := StringReplace(Application.ExeName, '.exe', '.ini', [rfReplaceAll, rfIgnoreCase]);
  ArqIni.Create(ArqName);
  try
    ArqIni.WriteString('CONFIG', 'empresapadrao', edtCodEmpresa.Text);
  finally
    ArqIni.Free;
  end;
end;

procedure TfrmPrincipal.GravaPerfil;
var
  Cod_Rateio, Cod_Item: String;
begin
  if MessageRaul_Confirma('Deseja gravar as alterações realizadas no perfil?') then
  begin
    DM.QR_Perfil.ApplyUpdates(-1);
    DM.QR_Rateio_Itens.ApplyUpdates(-1);
    DM.QR_Rateio_Itens.First;
    Editando(False);
  end;
end;

procedure TfrmPrincipal.hema1Click(Sender: TObject);
begin
  frmThema.ShowModal;
end;

procedure TfrmPrincipal.edtCodEmpresaExit(Sender: TObject);
begin
  BuscaEmpresa;
end;

procedure TfrmPrincipal.LerCofig;
var
  ArqName: String;
  ArqIni : TIniFile;
  cnpj   : string;
begin
  //Montando o nome do arquivo ini de configuração
  ArqName := StringReplace(Application.ExeName, '.exe', '.ini', [rfReplaceAll, rfIgnoreCase]);

  //Verificando a existencia do arquivo
  if not FileExists(ArqName) then
    raise Exception.Create('Arquivo de configuração não encontrado.');

  //Conectando no banco Local
  ConectaFireBird(DM.conexaoLocal, ArqName);


  //Crindo o arquivo ini na memória
  ArqIni := TIniFile.Create(ArqName);

  try
    //Pegando os valores dos parametros do arquivo ini
    edtCodEmpresa.Text := IntToStr(ArqIni.ReadInteger('CONFIG', 'empresapadrao', 1));
    _GigaPath          := ArqIni.ReadString('CONFIG', 'GigaPath', '');
    _Cod_tabela        := ArqIni.ReadInteger('CONFIG', 'tabelapreco', 1);
  finally
    ArqIni.Free;  //Liberando arquivo da memória
  end;
end;

procedure TfrmPrincipal.LimpaItem;
begin
  lbDesc_Prod.Caption := '';
  edtProduto.Text     := '';
end;

procedure TfrmPrincipal.LimpaTudo;
begin
  _Editando            := False;
  dbcb_Perfil.KeyValue := 0;
  edt_Data.Clear;
  edtQtdPeca.Value   := 0;
  edtPeso.Value      := 0;
  edtPesoTotal.Value := 0;
  edtVrKg.Value      := 0;
  edtVrTotal.Value   := 0;
  edtNF.Clear;
  pn_Itens.Enabled := False;
  // pn_Finaliza.Enabled:=False;
  LimpaItem;
  dbcb_Perfil.SetFocus;
  DM.QR_Rateio_Itens.Close;
  DM.QR_Perfil.Close;
  DM.QR_Perfil.Open();
  Editando(False);
end;

procedure TfrmPrincipal.ListaTabPreco;
begin
  DM.qrTabPreco.Close;
  DM.qrTabPreco.Open();
  DM.qrTabPreco.Last;
  DM.qrTabPreco.First;
  dblookTabelaPreco.Value := DM.qrTabPrecoDESC_TABELA.AsString;
end;

end.
