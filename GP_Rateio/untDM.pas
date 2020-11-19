unit untDM;

interface

uses
  System.SysUtils, System.Classes, Forms, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Xml.xmldom, Datasnap.DBClient,
  IniFiles, System.Variants, RotinasRaul, FireDAC.VCLUI.Error, Vcl.Dialogs;

type
  TDM = class(TDataModule)
    ConexaoGigaERP: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QR_Perfil: TFDQuery;
    ds_Perfil: TDataSource;
    ds_Rateio_Itens: TDataSource;
    QR_Busca_prod: TFDQuery;
    ds_Busca_prod: TDataSource;
    QR_Busca_prodCOD_PRODUTO: TStringField;
    QR_Busca_prodCOD_GRADE: TStringField;
    QR_Busca_prodDESC_PRODUTO: TStringField;
    QR_PerfilCOD_RATEIO: TIntegerField;
    QR_PerfilDESC_RATEIO: TStringField;
    QR_PerfilDATA_CRIACAO: TSQLTimeStampField;
    QR_PerfilDATA_MODIFICACAO: TSQLTimeStampField;
    QR_Localizar: TFDQuery;
    dsLocalizar: TDataSource;
    QR_LocalizarCOD_PRODUTO: TStringField;
    QR_LocalizarCOD_GRADE: TStringField;
    QR_LocalizarDESC_PRODUTO: TStringField;
    QR_Movimentos_Estoque: TFDQuery;
    QR_Movimentos_EstoqueCOD_EMPRESA: TIntegerField;
    QR_Movimentos_EstoqueCOD_SEQUENCIA: TIntegerField;
    QR_Movimentos_EstoqueCOD_MOTIVO: TIntegerField;
    QR_Movimentos_EstoqueCOD_FORNECEDOR: TIntegerField;
    QR_Movimentos_EstoqueSERIE: TStringField;
    QR_Movimentos_EstoqueNF_NUMERO: TIntegerField;
    QR_Movimentos_EstoqueDATA_EMISSAO: TDateField;
    QR_Movimentos_EstoqueDATA_ENTRADA: TDateField;
    QR_Movimentos_EstoqueFAT_COD_EMPRESA: TIntegerField;
    QR_Movimentos_EstoqueFAT_SEQ: TIntegerField;
    QR_Movimentos_EstoqueVR_BRUTO: TBCDField;
    QR_Movimentos_EstoqueVR_FRETE: TBCDField;
    QR_Movimentos_EstoqueVR_SEGURO: TBCDField;
    QR_Movimentos_EstoqueVR_ACRESCIMO: TBCDField;
    QR_Movimentos_EstoqueVR_DESCONTO: TBCDField;
    QR_Movimentos_EstoqueVR_LIQUIDO: TBCDField;
    QR_Movimentos_EstoqueFLAG_TIPO: TSmallintField;
    QR_Movimentos_EstoqueLOGIN: TStringField;
    QR_Movimentos_EstoqueHORA_MOVIMENTO: TSQLTimeStampField;
    QR_Movimentos_EstoqueOBS: TStringField;
    QR_Movimentos_EstoqueMAN_COD_EMPRESA: TIntegerField;
    QR_Movimentos_EstoqueMAN_COD_MANUTENCAO: TIntegerField;
    QR_Movimentos_EstoqueDEV_COD_EMPRESA: TIntegerField;
    QR_Movimentos_EstoqueDEV_COD_DEV: TIntegerField;
    QR_Movimentos_EstoquePP_TIMESTAMP: TSQLTimeStampField;
    QR_Movimentos_EstoquePP_CLOCK_UPDATE: TLargeintField;
    QR_Movimentos_EstoquePP_CLOCK_INSERT: TLargeintField;
    QR_Movimentos_EstoquePP_NOT_UPDATED: TSmallintField;
    QR_Movimentos_EstoquePP_ID_GLOBAL: TStringField;
    QR_Movimentos_EstoquePP_ID_LOCAL: TLargeintField;
    QR_Movimentos_EstoqueCOD_CC: TIntegerField;
    QR_Movimentos_Estoque_Itens: TFDQuery;
    QR_Produtos_Detalhes: TFDQuery;
    QR_Movimentos_Estoque_ItensCOD_EMPRESA: TIntegerField;
    QR_Movimentos_Estoque_ItensCOD_SEQUENCIA: TIntegerField;
    QR_Movimentos_Estoque_ItensCOD_ITEM: TIntegerField;
    QR_Movimentos_Estoque_ItensCOD_PRODUTO: TStringField;
    QR_Movimentos_Estoque_ItensCOD_GRADE: TStringField;
    QR_Movimentos_Estoque_ItensQTD: TBCDField;
    QR_Movimentos_Estoque_ItensUNIDADE: TStringField;
    QR_Movimentos_Estoque_ItensFATOR_CONVERSAO: TFMTBCDField;
    QR_Movimentos_Estoque_ItensVR_UNITARIO: TFMTBCDField;
    QR_Movimentos_Estoque_ItensVR_BRUTO: TBCDField;
    QR_Movimentos_Estoque_ItensQTD_DIGITADA: TBCDField;
    QR_Movimentos_Estoque_ItensMETRO_CUBICO: TBCDField;
    QR_Movimentos_Estoque_ItensVR_FRETE: TBCDField;
    QR_Movimentos_Estoque_ItensVR_SEGURO: TBCDField;
    QR_Movimentos_Estoque_ItensVR_ACRESCIMO: TBCDField;
    QR_Movimentos_Estoque_ItensVR_DESCONTO: TBCDField;
    QR_Movimentos_Estoque_ItensVR_LIQUIDO: TBCDField;
    QR_Movimentos_Estoque_ItensPP_TIMESTAMP: TSQLTimeStampField;
    QR_Movimentos_Estoque_ItensPP_CLOCK_UPDATE: TLargeintField;
    QR_Movimentos_Estoque_ItensPP_CLOCK_INSERT: TLargeintField;
    QR_Movimentos_Estoque_ItensPP_NOT_UPDATED: TSmallintField;
    QR_Movimentos_Estoque_ItensPP_ID_GLOBAL: TStringField;
    QR_Movimentos_Estoque_ItensPP_ID_LOCAL: TLargeintField;
    QR_Movimentos_Estoque_ItensIGN_CUSTO_MEDIO_FISICO: TFMTBCDField;
    QR_Rateio_Itens: TFDQuery;
    QR_Rateio_ItensDESC_PRODUTO: TStringField;
    QR_Rateio_ItensUNIDADE: TStringField;
    QR_Rateio_ItensCOD_RATEIO: TIntegerField;
    QR_Rateio_ItensCOD_RATEIO_ITEM: TIntegerField;
    QR_Rateio_ItensCOD_PRODUTO: TStringField;
    QR_Rateio_ItensCOD_GRADE: TStringField;
    QR_Rateio_ItensPORCENTAGEM: TFMTBCDField;
    QR_Produtos_DetalhesCOD_PRODUTO: TStringField;
    QR_Produtos_DetalhesCOD_GRADE: TStringField;
    QR_Produtos_DetalhesDESC_PRODUTO: TStringField;
    QR_Produtos_DetalhesPRECO_CUSTO_REAL: TFMTBCDField;
    QR_Produtos_DetalhesUNIDADE: TStringField;
    QR_Rateio_ItensPESO_RATEIO: TFloatField;
    QR_Rateio_ItensCUSTO_COMPRA: TFloatField;
    QR_Rateio_ItensSUBTOTAL_VENDA: TFloatField;
    QR_Rateio_ItensCUSTO_SUBTOTAL: TFloatField;
    QR_Rateio_ItensCUSTO_UNIT: TFloatField;
    qrTabPreco: TFDQuery;
    dsTabPreco: TDataSource;
    qrTabPrecoCOD_TABELA: TIntegerField;
    qrTabPrecoDESC_TABELA: TStringField;
    qrTabPrecoPP_TIMESTAMP: TSQLTimeStampField;
    qrTabPrecoPP_CLOCK_UPDATE: TLargeintField;
    qrTabPrecoPP_CLOCK_INSERT: TLargeintField;
    qrTabPrecoPP_NOT_UPDATED: TSmallintField;
    qrTabPrecoPP_ID_GLOBAL: TStringField;
    qrTabPrecoPP_ID_LOCAL: TLargeintField;
    QR_Rateio_ItensTOTAL_PESO_RATEIO: TAggregateField;
    QR_Rateio_ItensTOTAL_PORCENTAGEM: TAggregateField;
    QR_Rateio_ItensTOTAL_CUSTO_COMPRA: TAggregateField;
    QR_Rateio_ItensTOTAL_VENDA: TAggregateField;
    QR_Rateio_ItensPERCENTUAL_AGREGADO: TAggregateField;
    qr_Produtos_Custo: TFDQuery;
    qr_Produtos_CustoCOD_EMPRESA: TIntegerField;
    qr_Produtos_CustoCOD_PRODUTO: TStringField;
    qr_Produtos_CustoCOD_GRADE: TStringField;
    qr_Produtos_CustoPRECO_CUSTO: TFMTBCDField;
    qr_Produtos_CustoVR_OUTRAS_DESPESAS: TFMTBCDField;
    qr_Produtos_CustoICMS_ALIQ: TFMTBCDField;
    qr_Produtos_CustoIPI_ALIQ: TFMTBCDField;
    qr_Produtos_CustoST_IVA: TFMTBCDField;
    qr_Produtos_CustoST_ICMS_ALIQ: TFMTBCDField;
    qr_Produtos_CustoPRECO_CUSTO_REAL: TFMTBCDField;
    qr_Produtos_CustoDATA_ULTIMO_REAJUSTE: TDateField;
    qr_Produtos_CustoVR_FRETE: TFMTBCDField;
    qr_Produtos_CustoVR_SEGURO: TFMTBCDField;
    qr_Produtos_CustoVR_DESC_CUSTO: TFMTBCDField;
    qr_Produtos_CustoPP_TIMESTAMP: TSQLTimeStampField;
    qr_Produtos_CustoPP_CLOCK_UPDATE: TLargeintField;
    qr_Produtos_CustoPP_CLOCK_INSERT: TLargeintField;
    qr_Produtos_CustoPP_NOT_UPDATED: TSmallintField;
    qr_Produtos_CustoPP_ID_GLOBAL: TStringField;
    qr_Produtos_CustoPP_ID_LOCAL: TLargeintField;
    qr_Produtos_CustoICMS_RED_BASE: TFMTBCDField;
    qr_Produtos_CustoST_ICMS_RED_BASE: TFMTBCDField;
    qr_Produtos_CustoPIS_ALIQ: TFMTBCDField;
    qr_Produtos_CustoCOFINS_ALIQ: TFMTBCDField;
    qr_Produtos_CustoIPI_TIPO_ALIQUOTA: TSmallintField;
    qr_Produtos_CustoPIS_TIPO_ALIQUOTA: TSmallintField;
    qr_Produtos_CustoCOFINS_TIPO_ALIQUOTA: TSmallintField;
    qr_Produtos_CustoST_ICMS_VR_PAUTA: TFMTBCDField;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    conexaoLocal: TFDConnection;
    qrGigaERP: TFDQuery;
    qrPreco_Venda: TFDQuery;
    qrPreco_VendaCOD_EMPRESA: TIntegerField;
    qrPreco_VendaCOD_TABELA: TIntegerField;
    qrPreco_VendaCOD_PRODUTO: TStringField;
    qrPreco_VendaCOD_GRADE: TStringField;
    qrPreco_VendaPRECO: TFMTBCDField;
    qrPreco_VendaPP_TIMESTAMP: TSQLTimeStampField;
    qrPreco_VendaPP_CLOCK_UPDATE: TLargeintField;
    qrPreco_VendaPP_CLOCK_INSERT: TLargeintField;
    qrPreco_VendaPP_NOT_UPDATED: TSmallintField;
    qrPreco_VendaPP_ID_GLOBAL: TStringField;
    qrPreco_VendaPP_ID_LOCAL: TLargeintField;
    qrPreco_VendaIGN_ALTERADO: TSmallintField;
    qrPreco_VendaIGN_ALTERA: TSmallintField;
    qrPreco_VendaIGN_LOGIN_REAJUSTE: TStringField;
    qrPreco_VendaIGN_DATAHORA_REAJUSTE: TSQLTimeStampField;
    qrPreco_VendaIGN_PRECOOLD_REAJUSTE: TFMTBCDField;
    QR_Rateio_ItensPRECO_VENDA: TFloatField;
    qr_Local: TFDQuery;
    procedure QR_Rateio_ItensAfterPost(DataSet: TDataSet);
    procedure QR_Rateio_ItensCalcFields(DataSet: TDataSet);
  private
    procedure AlteraCusto;
    { Private declarations }
  public
     _FiltroCNPJ: String;
    { Public declarations }
    procedure Totais(var Porc, Valor: Real);
    procedure ConectaGigaERP_;
    procedure EntraEstoque;
    procedure VerifLicenca;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untPrincipal, untMsgErro;

{$R *.dfm}

procedure TDM.ConectaGigaERP_;
var
  ArqName: String;
begin
  try
    ArqName:=ExtractFilePath(Application.ExeName)+'Conexao.ini';
    ConexaoGigaERP.Params.LoadFromFile(ArqName);
    ConexaoGigaERP.Open();
  except
    on E:Exception do
      raise Exception.Create('ConectaGigaERP'+#13+E.Message);
  end;
end;

procedure TDM.EntraEstoque;
begin
  qrGigaERP.Close;
  qrGigaERP.SQL.Text:='EXECUTE PROCEDURE PR_LOGAR(''ADMIN'')';
  qrGigaERP.ExecSQL;
  qrGigaERP.Close;
  QR_Movimentos_Estoque.Close();
  QR_Movimentos_Estoque_Itens.Close();
  QR_Movimentos_Estoque.Open();
  QR_Movimentos_Estoque_Itens.Open();
  qr_Produtos_Custo.Close();
  qr_Produtos_Custo.Open();
  {MOVIMENTOS_ESTOQUE}
  qrGigaERP.Open('SELECT GEN_ID(SMOVIMENTOS_ESTOQUE,1) COD FROM RDB$DATABASE');
  QR_Movimentos_Estoque.Append;
  QR_Movimentos_EstoqueCOD_EMPRESA.AsString:=frmPrincipal.edtCodEmpresa.Text;
  QR_Movimentos_EstoqueCOD_SEQUENCIA.AsInteger:=qrGigaERP.FieldByName('COD').AsInteger;
  QR_Movimentos_EstoqueCOD_MOTIVO.AsInteger:=2;
  QR_Movimentos_EstoqueDATA_EMISSAO.AsString:=frmPrincipal.edt_Data.Text;
  QR_Movimentos_EstoqueDATA_ENTRADA.AsString:=frmPrincipal.edt_Data.Text;
  QR_Movimentos_EstoqueVR_BRUTO.AsFloat:=0;
  if Trim(frmPrincipal.edtNF.Text)<>'' then
    QR_Movimentos_EstoqueNF_NUMERO.AsString:=frmPrincipal.edtNF.Text;
  QR_Movimentos_EstoqueVR_FRETE.AsFloat:=0;
  QR_Movimentos_EstoqueVR_SEGURO.AsFloat:=0;
  QR_Movimentos_EstoqueVR_ACRESCIMO.AsFloat:=0;
  QR_Movimentos_EstoqueVR_DESCONTO.AsFloat:=0;
  QR_Movimentos_EstoqueVR_LIQUIDO.AsFloat:=0;
  QR_Movimentos_EstoqueFLAG_TIPO.AsInteger:=0;
  QR_Movimentos_EstoqueHORA_MOVIMENTO.AsDateTime:=NOW;
  QR_Movimentos_EstoqueOBS.AsString:='['+frmPrincipal.dbcb_Perfil.Text+'] '+frmPrincipal.edtQtdPeca.Text+' Peças de '+frmPrincipal.edtPeso.Text+' por R$'+frmPrincipal.edtVrTotal.Text;
  QR_Movimentos_Estoque.Post;
  {MOVIMENTOS_ESTOQUE_ITENS}
  QR_Rateio_Itens.First;
  while not QR_Rateio_Itens.Eof do
  begin
    QR_Movimentos_Estoque_Itens.Append;
    QR_Movimentos_Estoque_ItensCOD_EMPRESA.AsString:=frmPrincipal.edtCodEmpresa.Text;
    QR_Movimentos_Estoque_ItensCOD_SEQUENCIA.AsInteger:=qrGigaERP.FieldByName('COD').AsInteger;
    QR_Movimentos_Estoque_ItensCOD_ITEM.AsInteger:=QR_Rateio_ItensCOD_RATEIO_ITEM.AsInteger;
    QR_Movimentos_Estoque_ItensCOD_PRODUTO.AsString:=QR_Rateio_ItensCOD_PRODUTO.AsString;
    QR_Movimentos_Estoque_ItensCOD_GRADE.AsString:=QR_Rateio_ItensCOD_GRADE.AsString;
    QR_Movimentos_Estoque_ItensQTD.AsFloat:=QR_Rateio_ItensPESO_RATEIO.AsFloat;
    QR_Movimentos_Estoque_ItensUNIDADE.AsString:=QR_Rateio_ItensUNIDADE.AsString;
    QR_Movimentos_Estoque_ItensFATOR_CONVERSAO.AsInteger:=1;
    QR_Movimentos_Estoque_ItensVR_UNITARIO.AsFloat:=QR_Rateio_ItensCUSTO_UNIT.AsFloat;
    QR_Movimentos_Estoque_ItensVR_BRUTO.AsFloat:=QR_Rateio_ItensCUSTO_SUBTOTAL.AsFloat;
    QR_Movimentos_Estoque_ItensVR_FRETE.AsFloat:=0;
    QR_Movimentos_Estoque_ItensVR_SEGURO.AsFloat:=0;
    QR_Movimentos_Estoque_ItensVR_ACRESCIMO.AsFloat:=0;
    QR_Movimentos_Estoque_ItensVR_DESCONTO.AsFloat:=0;
    QR_Movimentos_Estoque_ItensVR_LIQUIDO.AsFloat:=QR_Rateio_ItensCUSTO_SUBTOTAL.AsFloat;
    QR_Movimentos_Estoque_ItensQTD_DIGITADA.AsFloat:=QR_Rateio_ItensPESO_RATEIO.AsFloat;
    QR_Movimentos_Estoque_ItensMETRO_CUBICO.AsFloat:=0;
    QR_Movimentos_Estoque_ItensIGN_CUSTO_MEDIO_FISICO.AsFloat:=0;
    if frmPrincipal.cbAlteraCusto.Checked then AlteraCusto;
    QR_Movimentos_Estoque_Itens.Post;
    QR_Rateio_Itens.Next;
  end;

  QR_Movimentos_Estoque.ApplyUpdates(-1);
  QR_Movimentos_Estoque_Itens.ApplyUpdates(-1);
  qr_Produtos_Custo.ApplyUpdates();
end;

procedure TDM.Totais(var Porc, Valor: Real);
var
  Ind: Integer;
begin
  Porc:=0;
  Valor:=0;
  Ind:=QR_Rateio_Itens.FieldByName('COD_RATEIO_ITEM').AsInteger;
  QR_Rateio_Itens.First;
  while not QR_Rateio_Itens.Eof do
  begin
    Porc:=Porc+QR_Rateio_ItensPORCENTAGEM.AsFloat;
//    Valor:=Valor+QR_Rateio_ItensPRECO_LIQ.AsFloat;
    QR_Rateio_Itens.Next;
  end;
  QR_Rateio_Itens.Locate('COD_RATEIO_ITEM',Ind,[]);
end;

procedure TDM.QR_Rateio_ItensAfterPost(DataSet: TDataSet);
begin
  frmPrincipal.Editando();
end;

procedure TDM.QR_Rateio_ItensCalcFields(DataSet: TDataSet);
begin
  with frmPrincipal do
  begin
    if edtPesoTotal.Text <> '' then
      QR_Rateio_ItensPESO_RATEIO.AsFloat := QR_Rateio_ItensPORCENTAGEM.AsFloat * edtPesoTotal.Value/100
    else
      QR_Rateio_ItensPESO_RATEIO.AsFloat := 0;
    if edtVrKg.Text <> '' then
      QR_Rateio_ItensCUSTO_COMPRA.AsFloat := QR_Rateio_ItensPESO_RATEIO.AsFloat * edtVrKg.Value
    else
      QR_Rateio_ItensCUSTO_COMPRA.AsFloat := 0;
    QR_Rateio_ItensSUBTOTAL_VENDA.AsFloat := QR_Rateio_ItensPESO_RATEIO.AsFloat * QR_Rateio_ItensPRECO_VENDA.AsFloat;
    QR_Rateio_ItensCUSTO_SUBTOTAL.AsFloat := frmPrincipal._PercentualAgregado*QR_Rateio_ItensSUBTOTAL_VENDA.AsFloat;
    QR_Rateio_ItensCUSTO_UNIT.AsFloat := QR_Rateio_ItensCUSTO_SUBTOTAL.AsFloat/QR_Rateio_ItensPESO_RATEIO.AsFloat;
  end;
end;

procedure TDM.AlteraCusto;
begin
  if qr_Produtos_Custo.Locate('COD_EMPRESA;COD_PRODUTO;COD_GRADE',VarArrayOf([frmPrincipal.edtCodEmpresa.Text,QR_Rateio_ItensCOD_PRODUTO.AsString,QR_Rateio_ItensCOD_GRADE.AsString]),[]) then
  begin
    qr_Produtos_Custo.Edit;
    qr_Produtos_CustoCOD_EMPRESA.AsString        := frmPrincipal.edtCodEmpresa.Text;
    qr_Produtos_CustoCOD_PRODUTO.AsString        := QR_Rateio_ItensCOD_PRODUTO.AsString;
    qr_Produtos_CustoCOD_GRADE.AsString          := QR_Rateio_ItensCOD_GRADE.AsString;
    qr_Produtos_CustoPRECO_CUSTO.AsFloat         := QR_Rateio_ItensCUSTO_UNIT.AsFloat;
    qr_Produtos_CustoVR_OUTRAS_DESPESAS.AsFloat  := 0;
    qr_Produtos_CustoVR_FRETE.AsFloat            := 0;
    qr_Produtos_CustoVR_SEGURO.AsFloat           := 0;
    qr_Produtos_CustoVR_DESC_CUSTO.AsFloat       := 0;
    qr_Produtos_CustoICMS_ALIQ.AsFloat           := 0;
    qr_Produtos_CustoIPI_ALIQ.AsFloat            := 0;
    qr_Produtos_CustoST_IVA.AsFloat              := 0;
    qr_Produtos_CustoST_ICMS_ALIQ.AsFloat        := 0;
    qr_Produtos_CustoPRECO_CUSTO_REAL.AsFloat    := QR_Rateio_ItensCUSTO_UNIT.AsFloat;
    qr_Produtos_Custo.Post;
  end;
end;

procedure TDM.VerifLicenca;
var
  Arq: Tinifile;
  VarStr: String;
  CNPJ_CPF: String;
  ArqName: String;
  procedure getCNPJ_CPF;
  begin
    if Trim(CNPJ_CPF) = '' then
    begin
      CNPJ_CPF := RetiraNaoNumero(InputBox('CPNJ do dono da Licença','Arquivo de licença não encontrado'+#13+'Entre com o CNPJ do dono dá licença.',''));
      if Trim(CNPJ_CPF)='' then
        raise Exception.Create('O CNPJ deve ser passado.');
      Arq.WriteString('LIC_CONF','CNPJ',CNPJ_CPF);
    end;
  end;
begin
  try
  ArqName:=StringReplace(Application.ExeName,'.exe','.ini',[rfIgnoreCase,rfReplaceAll]);
  if not FileExists(ArqName) then
  begin
    Arq:=TIniFile.Create(ArqName);
    getCNPJ_CPF;
  end
  else
  begin
    Arq:=TIniFile.Create(ArqName);
    CNPJ_CPF:=Arq.ReadString('LIC_CONF','CNPJ','');
    getCNPJ_CPF
  end;
  with DM do
  begin
    CNPJ_CPF := RetiraNaoNumero(CNPJ_CPF);
    if Length(CNPJ_CPF)<11 then
      raise Exception.Create('O CNPJ do dono da Licença deve ser passado no arquivo de configuração.');
    qrGigaERP.Close;
    qrGigaERP.Open('SELECT CNPJ_CPF FROM EMPRESAS WHERE CNPJ_CPF = '''+CNPJ_CPF+'''');
    if qrGigaERP.IsEmpty then
      raise Exception.Create('Empresa dona da Licença não encontrada no banco de dados.');
      _FiltroCNPJ := VerificaLicenca(CNPJ_CPF,2);
    if (Trim(_FiltroCNPJ)='') then
      raise Exception.Create('Licença vencida ou não encontrada.'+#13+'Entre em contato com o suporte.');
  end;
  except
    on E:Exception do
      raise;
  end;
end;


end.
