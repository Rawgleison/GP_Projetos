object DM: TDM
  OldCreateOrder = False
  Height = 506
  Width = 467
  object ConexaoGigaERP: TFDConnection
    Params.Strings = (
      'Database=D:\Documentos\Gigatron\Clientes\Otton\GIGAERP.FDB'
      'Password=lib1503'
      'Server=LOCALHOST'
      'Port=3050'
      'CharacterSet=ISO8859_1'
      'User_Name=sysdba'
      'DriverID=FB'
      'Pooled=False')
    LoginPrompt = False
    Left = 26
    Top = 209
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 352
    Top = 32
  end
  object QR_Perfil: TFDQuery
    CachedUpdates = True
    Connection = conexaoLocal
    SQL.Strings = (
      'select * from GP_RATEIO')
    Left = 104
    Top = 8
    object QR_PerfilCOD_RATEIO: TIntegerField
      FieldName = 'COD_RATEIO'
      Origin = 'COD_RATEIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_PerfilDESC_RATEIO: TStringField
      FieldName = 'DESC_RATEIO'
      Origin = 'DESC_RATEIO'
      Required = True
      Size = 50
    end
    object QR_PerfilDATA_CRIACAO: TSQLTimeStampField
      FieldName = 'DATA_CRIACAO'
      Origin = 'DATA_CRIACAO'
    end
    object QR_PerfilDATA_MODIFICACAO: TSQLTimeStampField
      FieldName = 'DATA_MODIFICACAO'
      Origin = 'DATA_MODIFICACAO'
    end
  end
  object ds_Perfil: TDataSource
    DataSet = QR_Perfil
    Left = 200
    Top = 64
  end
  object ds_Rateio_Itens: TDataSource
    DataSet = QR_Rateio_Itens
    Left = 200
    Top = 121
  end
  object QR_Busca_prod: TFDQuery
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'SELECT'
      '      P.COD_PRODUTO,'
      '      PG.COD_GRADE,'
      '      P.DESC_PRODUTO'
      'FROM PRODUTOS P'
      'INNER JOIN PRODUTOS_GRADE PG ON'
      '(P.COD_PRODUTO = PG.COD_PRODUTO)'
      'INNER JOIN PRODUTOS_APELIDOS_PROD PAP ON'
      '(P.COD_PRODUTO = PAP.COD_PRODUTO)'
      'WHERE (PAP.APELIDO = :APELIDO)'
      '   OR (P.COD_PRODUTO = (SELECT * FROM PR_STRZEROS(:APELIDO,13)))'
      'GROUP BY'
      '      P.COD_PRODUTO,'
      '      PG.COD_GRADE,'
      '      P.DESC_PRODUTO')
    Left = 104
    Top = 328
    ParamData = <
      item
        Name = 'APELIDO'
        DataType = ftString
        ParamType = ptInput
        Value = 'TESTE'
      end>
    object QR_Busca_prodCOD_PRODUTO: TStringField
      DisplayWidth = 16
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object QR_Busca_prodCOD_GRADE: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 14
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object QR_Busca_prodDESC_PRODUTO: TStringField
      DisplayWidth = 144
      FieldName = 'DESC_PRODUTO'
      Origin = 'DESC_PRODUTO'
      Required = True
      Size = 120
    end
  end
  object ds_Busca_prod: TDataSource
    DataSet = QR_Busca_prod
    Left = 200
    Top = 329
  end
  object QR_Localizar: TFDQuery
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'SELECT'
      '      PG.COD_PRODUTO,'
      '      PG.COD_GRADE,'
      '      P.DESC_PRODUTO'
      'FROM PRODUTOS P'
      'INNER JOIN PRODUTOS_GRADE PG ON'
      '(P.COD_PRODUTO = PG.COD_PRODUTO)'
      'WHERE P.FLAG_ATIVO = 1'
      '  AND PG.FLAG_ATIVO = 1'
      '  AND P.DESC_PRODUTO LIKE :DESC')
    Left = 104
    Top = 384
    ParamData = <
      item
        Name = 'DESC'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end>
    object QR_LocalizarCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object QR_LocalizarCOD_GRADE: TStringField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      Required = True
      Size = 25
    end
    object QR_LocalizarDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Origin = 'DESC_PRODUTO'
      Required = True
      Size = 120
    end
  end
  object dsLocalizar: TDataSource
    DataSet = QR_Localizar
    Left = 200
    Top = 385
  end
  object QR_Movimentos_Estoque: TFDQuery
    CachedUpdates = True
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'select * from MOVIMENTOS_ESTOQUE')
    Left = 352
    Top = 96
    object QR_Movimentos_EstoqueCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_Movimentos_EstoqueCOD_SEQUENCIA: TIntegerField
      FieldName = 'COD_SEQUENCIA'
      Origin = 'COD_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_Movimentos_EstoqueCOD_MOTIVO: TIntegerField
      FieldName = 'COD_MOTIVO'
      Origin = 'COD_MOTIVO'
      Required = True
    end
    object QR_Movimentos_EstoqueCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'COD_FORNECEDOR'
    end
    object QR_Movimentos_EstoqueSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object QR_Movimentos_EstoqueNF_NUMERO: TIntegerField
      FieldName = 'NF_NUMERO'
      Origin = 'NF_NUMERO'
    end
    object QR_Movimentos_EstoqueDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      Required = True
    end
    object QR_Movimentos_EstoqueDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
      Required = True
    end
    object QR_Movimentos_EstoqueFAT_COD_EMPRESA: TIntegerField
      FieldName = 'FAT_COD_EMPRESA'
      Origin = 'FAT_COD_EMPRESA'
    end
    object QR_Movimentos_EstoqueFAT_SEQ: TIntegerField
      FieldName = 'FAT_SEQ'
      Origin = 'FAT_SEQ'
    end
    object QR_Movimentos_EstoqueVR_BRUTO: TBCDField
      FieldName = 'VR_BRUTO'
      Origin = 'VR_BRUTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_EstoqueVR_FRETE: TBCDField
      FieldName = 'VR_FRETE'
      Origin = 'VR_FRETE'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_EstoqueVR_SEGURO: TBCDField
      FieldName = 'VR_SEGURO'
      Origin = 'VR_SEGURO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_EstoqueVR_ACRESCIMO: TBCDField
      FieldName = 'VR_ACRESCIMO'
      Origin = 'VR_ACRESCIMO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_EstoqueVR_DESCONTO: TBCDField
      FieldName = 'VR_DESCONTO'
      Origin = 'VR_DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_EstoqueVR_LIQUIDO: TBCDField
      FieldName = 'VR_LIQUIDO'
      Origin = 'VR_LIQUIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_EstoqueFLAG_TIPO: TSmallintField
      FieldName = 'FLAG_TIPO'
      Origin = 'FLAG_TIPO'
      Required = True
    end
    object QR_Movimentos_EstoqueLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
    end
    object QR_Movimentos_EstoqueHORA_MOVIMENTO: TSQLTimeStampField
      FieldName = 'HORA_MOVIMENTO'
      Origin = 'HORA_MOVIMENTO'
      Required = True
    end
    object QR_Movimentos_EstoqueOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 80
    end
    object QR_Movimentos_EstoqueMAN_COD_EMPRESA: TIntegerField
      FieldName = 'MAN_COD_EMPRESA'
      Origin = 'MAN_COD_EMPRESA'
    end
    object QR_Movimentos_EstoqueMAN_COD_MANUTENCAO: TIntegerField
      FieldName = 'MAN_COD_MANUTENCAO'
      Origin = 'MAN_COD_MANUTENCAO'
    end
    object QR_Movimentos_EstoqueDEV_COD_EMPRESA: TIntegerField
      FieldName = 'DEV_COD_EMPRESA'
      Origin = 'DEV_COD_EMPRESA'
    end
    object QR_Movimentos_EstoqueDEV_COD_DEV: TIntegerField
      FieldName = 'DEV_COD_DEV'
      Origin = 'DEV_COD_DEV'
    end
    object QR_Movimentos_EstoquePP_TIMESTAMP: TSQLTimeStampField
      FieldName = 'PP_TIMESTAMP'
      Origin = 'PP_TIMESTAMP'
    end
    object QR_Movimentos_EstoquePP_CLOCK_UPDATE: TLargeintField
      FieldName = 'PP_CLOCK_UPDATE'
      Origin = 'PP_CLOCK_UPDATE'
    end
    object QR_Movimentos_EstoquePP_CLOCK_INSERT: TLargeintField
      FieldName = 'PP_CLOCK_INSERT'
      Origin = 'PP_CLOCK_INSERT'
    end
    object QR_Movimentos_EstoquePP_NOT_UPDATED: TSmallintField
      FieldName = 'PP_NOT_UPDATED'
      Origin = 'PP_NOT_UPDATED'
    end
    object QR_Movimentos_EstoquePP_ID_GLOBAL: TStringField
      FieldName = 'PP_ID_GLOBAL'
      Origin = 'PP_ID_GLOBAL'
      FixedChar = True
      Size = 22
    end
    object QR_Movimentos_EstoquePP_ID_LOCAL: TLargeintField
      FieldName = 'PP_ID_LOCAL'
      Origin = 'PP_ID_LOCAL'
    end
    object QR_Movimentos_EstoqueCOD_CC: TIntegerField
      FieldName = 'COD_CC'
      Origin = 'COD_CC'
    end
  end
  object QR_Movimentos_Estoque_Itens: TFDQuery
    CachedUpdates = True
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'select * from MOVIMENTOS_ESTOQUE_ITENS')
    Left = 352
    Top = 160
    object QR_Movimentos_Estoque_ItensCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_Movimentos_Estoque_ItensCOD_SEQUENCIA: TIntegerField
      FieldName = 'COD_SEQUENCIA'
      Origin = 'COD_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_Movimentos_Estoque_ItensCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = 'COD_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_Movimentos_Estoque_ItensCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      Required = True
      Size = 13
    end
    object QR_Movimentos_Estoque_ItensCOD_GRADE: TStringField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      Required = True
      Size = 25
    end
    object QR_Movimentos_Estoque_ItensQTD: TBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
      Precision = 18
      Size = 3
    end
    object QR_Movimentos_Estoque_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
    end
    object QR_Movimentos_Estoque_ItensFATOR_CONVERSAO: TFMTBCDField
      FieldName = 'FATOR_CONVERSAO'
      Origin = 'FATOR_CONVERSAO'
      Required = True
      Precision = 18
      Size = 5
    end
    object QR_Movimentos_Estoque_ItensVR_UNITARIO: TFMTBCDField
      FieldName = 'VR_UNITARIO'
      Origin = 'VR_UNITARIO'
      Required = True
      Precision = 18
      Size = 5
    end
    object QR_Movimentos_Estoque_ItensVR_BRUTO: TBCDField
      FieldName = 'VR_BRUTO'
      Origin = 'VR_BRUTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_Estoque_ItensQTD_DIGITADA: TBCDField
      FieldName = 'QTD_DIGITADA'
      Origin = 'QTD_DIGITADA'
      Required = True
      Precision = 18
      Size = 3
    end
    object QR_Movimentos_Estoque_ItensMETRO_CUBICO: TBCDField
      FieldName = 'METRO_CUBICO'
      Origin = 'METRO_CUBICO'
      Required = True
      Precision = 18
      Size = 3
    end
    object QR_Movimentos_Estoque_ItensVR_FRETE: TBCDField
      FieldName = 'VR_FRETE'
      Origin = 'VR_FRETE'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_Estoque_ItensVR_SEGURO: TBCDField
      FieldName = 'VR_SEGURO'
      Origin = 'VR_SEGURO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_Estoque_ItensVR_ACRESCIMO: TBCDField
      FieldName = 'VR_ACRESCIMO'
      Origin = 'VR_ACRESCIMO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_Estoque_ItensVR_DESCONTO: TBCDField
      FieldName = 'VR_DESCONTO'
      Origin = 'VR_DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_Estoque_ItensVR_LIQUIDO: TBCDField
      FieldName = 'VR_LIQUIDO'
      Origin = 'VR_LIQUIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QR_Movimentos_Estoque_ItensPP_TIMESTAMP: TSQLTimeStampField
      FieldName = 'PP_TIMESTAMP'
      Origin = 'PP_TIMESTAMP'
    end
    object QR_Movimentos_Estoque_ItensPP_CLOCK_UPDATE: TLargeintField
      FieldName = 'PP_CLOCK_UPDATE'
      Origin = 'PP_CLOCK_UPDATE'
    end
    object QR_Movimentos_Estoque_ItensPP_CLOCK_INSERT: TLargeintField
      FieldName = 'PP_CLOCK_INSERT'
      Origin = 'PP_CLOCK_INSERT'
    end
    object QR_Movimentos_Estoque_ItensPP_NOT_UPDATED: TSmallintField
      FieldName = 'PP_NOT_UPDATED'
      Origin = 'PP_NOT_UPDATED'
    end
    object QR_Movimentos_Estoque_ItensPP_ID_GLOBAL: TStringField
      FieldName = 'PP_ID_GLOBAL'
      Origin = 'PP_ID_GLOBAL'
      FixedChar = True
      Size = 22
    end
    object QR_Movimentos_Estoque_ItensPP_ID_LOCAL: TLargeintField
      FieldName = 'PP_ID_LOCAL'
      Origin = 'PP_ID_LOCAL'
    end
    object QR_Movimentos_Estoque_ItensIGN_CUSTO_MEDIO_FISICO: TFMTBCDField
      FieldName = 'IGN_CUSTO_MEDIO_FISICO'
      Origin = 'IGN_CUSTO_MEDIO_FISICO'
      Required = True
      Precision = 18
      Size = 5
    end
  end
  object QR_Produtos_Detalhes: TFDQuery
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'SELECT'
      '      PG.COD_PRODUTO,'
      '      PG.COD_GRADE,'
      '      P.DESC_PRODUTO,'
      '      PC.PRECO_CUSTO_REAL,'
      '      PGU.UNIDADE'
      'FROM PRODUTOS_GRADE PG'
      'INNER JOIN PRODUTOS P ON'
      '(P.COD_PRODUTO = PG.COD_PRODUTO)'
      'INNER JOIN PRODUTOS_CUSTO PC ON'
      '(PC.COD_EMPRESA = :COD_EMPRESA AND'
      ' PC.COD_PRODUTO = PG.COD_PRODUTO AND'
      ' PC.COD_GRADE = PG.COD_GRADE)'
      'INNER JOIN PRODUTOS_GRADE_UND PGU ON'
      '(PGU.COD_PRODUTO = PG.COD_PRODUTO AND'
      ' PGU.COD_GRADE = PG.COD_GRADE AND'
      ' PGU.FLAG_PADRAO = 1)')
    Left = 104
    Top = 440
    ParamData = <
      item
        Name = 'COD_EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    object QR_Produtos_DetalhesCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object QR_Produtos_DetalhesCOD_GRADE: TStringField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 25
    end
    object QR_Produtos_DetalhesDESC_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_PRODUTO'
      Origin = 'DESC_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object QR_Produtos_DetalhesPRECO_CUSTO_REAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_CUSTO_REAL'
      Origin = 'PRECO_CUSTO_REAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object QR_Produtos_DetalhesUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QR_Rateio_Itens: TFDQuery
    AfterPost = QR_Rateio_ItensAfterPost
    OnCalcFields = QR_Rateio_ItensCalcFields
    CachedUpdates = True
    IndexFieldNames = 'COD_RATEIO'
    AggregatesActive = True
    MasterSource = ds_Perfil
    MasterFields = 'COD_RATEIO'
    DetailFields = 'COD_RATEIO'
    Connection = conexaoLocal
    SQL.Strings = (
      'SELECT'
      '      GP.*'
      'FROM GP_RATEIO_ITENS GP'
      '')
    Left = 104
    Top = 64
    object QR_Rateio_ItensCOD_RATEIO: TIntegerField
      FieldName = 'COD_RATEIO'
      Origin = 'COD_RATEIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_Rateio_ItensCOD_RATEIO_ITEM: TIntegerField
      FieldName = 'COD_RATEIO_ITEM'
      Origin = 'COD_RATEIO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QR_Rateio_ItensCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      Required = True
      Size = 13
    end
    object QR_Rateio_ItensCOD_GRADE: TStringField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      Required = True
      Size = 25
    end
    object QR_Rateio_ItensPORCENTAGEM: TFMTBCDField
      FieldName = 'PORCENTAGEM'
      Origin = 'PORCENTAGEM'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 5
    end
    object QR_Rateio_ItensDESC_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_PRODUTO'
      LookupDataSet = QR_Produtos_Detalhes
      LookupKeyFields = 'COD_PRODUTO'
      LookupResultField = 'DESC_PRODUTO'
      KeyFields = 'COD_PRODUTO'
      Size = 120
      Lookup = True
    end
    object QR_Rateio_ItensUNIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'UNIDADE'
      LookupDataSet = QR_Produtos_Detalhes
      LookupKeyFields = 'COD_PRODUTO;COD_GRADE'
      LookupResultField = 'UNIDADE'
      KeyFields = 'COD_PRODUTO;COD_GRADE'
      Lookup = True
    end
    object QR_Rateio_ItensPESO_RATEIO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PESO_RATEIO'
      DisplayFormat = '#,##0.00'
    end
    object QR_Rateio_ItensCUSTO_COMPRA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CUSTO_COMPRA'
      DisplayFormat = '#,##0.00'
    end
    object QR_Rateio_ItensSUBTOTAL_VENDA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SUBTOTAL_VENDA'
      DisplayFormat = '#,##0.00'
    end
    object QR_Rateio_ItensCUSTO_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CUSTO_SUBTOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QR_Rateio_ItensCUSTO_UNIT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CUSTO_UNIT'
      DisplayFormat = '#,##0.00'
    end
    object QR_Rateio_ItensPRECO_VENDA: TFloatField
      FieldKind = fkLookup
      FieldName = 'PRECO_VENDA'
      LookupDataSet = qrPreco_Venda
      LookupKeyFields = 'COD_PRODUTO; COD_GRADE'
      LookupResultField = 'PRECO'
      KeyFields = 'COD_PRODUTO; COD_GRADE'
      Lookup = True
    end
    object QR_Rateio_ItensTOTAL_PESO_RATEIO: TAggregateField
      FieldName = 'TOTAL_PESO_RATEIO'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(PESO_RATEIO)'
    end
    object QR_Rateio_ItensTOTAL_PORCENTAGEM: TAggregateField
      FieldName = 'TOTAL_PORCENTAGEM'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(PORCENTAGEM)'
    end
    object QR_Rateio_ItensTOTAL_CUSTO_COMPRA: TAggregateField
      FieldName = 'TOTAL_CUSTO_COMPRA'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(CUSTO_COMPRA)'
    end
    object QR_Rateio_ItensTOTAL_VENDA: TAggregateField
      FieldName = 'TOTAL_VENDA'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(SUBTOTAL_VENDA)'
    end
    object QR_Rateio_ItensPERCENTUAL_AGREGADO: TAggregateField
      FieldName = 'PERCENTUAL_AGREGADO'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(CUSTO_COMPRA)/SUM(SUBTOTAL_VENDA)*100'
    end
  end
  object qrTabPreco: TFDQuery
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'select * from produtos_tab_precos')
    Left = 104
    Top = 272
    object qrTabPrecoCOD_TABELA: TIntegerField
      FieldName = 'COD_TABELA'
      Origin = 'COD_TABELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrTabPrecoDESC_TABELA: TStringField
      FieldName = 'DESC_TABELA'
      Origin = 'DESC_TABELA'
      Required = True
      Size = 25
    end
    object qrTabPrecoPP_TIMESTAMP: TSQLTimeStampField
      FieldName = 'PP_TIMESTAMP'
      Origin = 'PP_TIMESTAMP'
    end
    object qrTabPrecoPP_CLOCK_UPDATE: TLargeintField
      FieldName = 'PP_CLOCK_UPDATE'
      Origin = 'PP_CLOCK_UPDATE'
    end
    object qrTabPrecoPP_CLOCK_INSERT: TLargeintField
      FieldName = 'PP_CLOCK_INSERT'
      Origin = 'PP_CLOCK_INSERT'
    end
    object qrTabPrecoPP_NOT_UPDATED: TSmallintField
      FieldName = 'PP_NOT_UPDATED'
      Origin = 'PP_NOT_UPDATED'
    end
    object qrTabPrecoPP_ID_GLOBAL: TStringField
      FieldName = 'PP_ID_GLOBAL'
      Origin = 'PP_ID_GLOBAL'
      FixedChar = True
      Size = 22
    end
    object qrTabPrecoPP_ID_LOCAL: TLargeintField
      FieldName = 'PP_ID_LOCAL'
      Origin = 'PP_ID_LOCAL'
    end
  end
  object dsTabPreco: TDataSource
    DataSet = qrTabPreco
    Left = 200
    Top = 273
  end
  object qr_Produtos_Custo: TFDQuery
    CachedUpdates = True
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'SELECT * FROM PRODUTOS_CUSTO')
    Left = 352
    Top = 216
    object qr_Produtos_CustoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qr_Produtos_CustoCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object qr_Produtos_CustoCOD_GRADE: TStringField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 25
    end
    object qr_Produtos_CustoPRECO_CUSTO: TFMTBCDField
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoVR_OUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'VR_OUTRAS_DESPESAS'
      Origin = 'VR_OUTRAS_DESPESAS'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoICMS_ALIQ: TFMTBCDField
      FieldName = 'ICMS_ALIQ'
      Origin = 'ICMS_ALIQ'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoIPI_ALIQ: TFMTBCDField
      FieldName = 'IPI_ALIQ'
      Origin = 'IPI_ALIQ'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoST_IVA: TFMTBCDField
      FieldName = 'ST_IVA'
      Origin = 'ST_IVA'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoST_ICMS_ALIQ: TFMTBCDField
      FieldName = 'ST_ICMS_ALIQ'
      Origin = 'ST_ICMS_ALIQ'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoPRECO_CUSTO_REAL: TFMTBCDField
      FieldName = 'PRECO_CUSTO_REAL'
      Origin = 'PRECO_CUSTO_REAL'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoDATA_ULTIMO_REAJUSTE: TDateField
      FieldName = 'DATA_ULTIMO_REAJUSTE'
      Origin = 'DATA_ULTIMO_REAJUSTE'
      Required = True
    end
    object qr_Produtos_CustoVR_FRETE: TFMTBCDField
      FieldName = 'VR_FRETE'
      Origin = 'VR_FRETE'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoVR_SEGURO: TFMTBCDField
      FieldName = 'VR_SEGURO'
      Origin = 'VR_SEGURO'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoVR_DESC_CUSTO: TFMTBCDField
      FieldName = 'VR_DESC_CUSTO'
      Origin = 'VR_DESC_CUSTO'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoPP_TIMESTAMP: TSQLTimeStampField
      FieldName = 'PP_TIMESTAMP'
      Origin = 'PP_TIMESTAMP'
    end
    object qr_Produtos_CustoPP_CLOCK_UPDATE: TLargeintField
      FieldName = 'PP_CLOCK_UPDATE'
      Origin = 'PP_CLOCK_UPDATE'
    end
    object qr_Produtos_CustoPP_CLOCK_INSERT: TLargeintField
      FieldName = 'PP_CLOCK_INSERT'
      Origin = 'PP_CLOCK_INSERT'
    end
    object qr_Produtos_CustoPP_NOT_UPDATED: TSmallintField
      FieldName = 'PP_NOT_UPDATED'
      Origin = 'PP_NOT_UPDATED'
    end
    object qr_Produtos_CustoPP_ID_GLOBAL: TStringField
      FieldName = 'PP_ID_GLOBAL'
      Origin = 'PP_ID_GLOBAL'
      FixedChar = True
      Size = 22
    end
    object qr_Produtos_CustoPP_ID_LOCAL: TLargeintField
      FieldName = 'PP_ID_LOCAL'
      Origin = 'PP_ID_LOCAL'
    end
    object qr_Produtos_CustoICMS_RED_BASE: TFMTBCDField
      FieldName = 'ICMS_RED_BASE'
      Origin = 'ICMS_RED_BASE'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoST_ICMS_RED_BASE: TFMTBCDField
      FieldName = 'ST_ICMS_RED_BASE'
      Origin = 'ST_ICMS_RED_BASE'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoPIS_ALIQ: TFMTBCDField
      FieldName = 'PIS_ALIQ'
      Origin = 'PIS_ALIQ'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoCOFINS_ALIQ: TFMTBCDField
      FieldName = 'COFINS_ALIQ'
      Origin = 'COFINS_ALIQ'
      Required = True
      Precision = 18
      Size = 5
    end
    object qr_Produtos_CustoIPI_TIPO_ALIQUOTA: TSmallintField
      FieldName = 'IPI_TIPO_ALIQUOTA'
      Origin = 'IPI_TIPO_ALIQUOTA'
      Required = True
    end
    object qr_Produtos_CustoPIS_TIPO_ALIQUOTA: TSmallintField
      FieldName = 'PIS_TIPO_ALIQUOTA'
      Origin = 'PIS_TIPO_ALIQUOTA'
      Required = True
    end
    object qr_Produtos_CustoCOFINS_TIPO_ALIQUOTA: TSmallintField
      FieldName = 'COFINS_TIPO_ALIQUOTA'
      Origin = 'COFINS_TIPO_ALIQUOTA'
      Required = True
    end
    object qr_Produtos_CustoST_ICMS_VR_PAUTA: TFMTBCDField
      FieldName = 'ST_ICMS_VR_PAUTA'
      Origin = 'ST_ICMS_VR_PAUTA'
      Required = True
      Precision = 18
      Size = 5
    end
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 248
    Top = 16
  end
  object conexaoLocal: TFDConnection
    Params.Strings = (
      
        'Database=D:\Documentos\Gigatron\GigaProjetosXE8\GP_Rateio\Win32\' +
        'Debug\app\base\GP_RATEIO.FDB'
      'Password=lib1503'
      'Server=LOCALHOST'
      'Port=3050'
      'CharacterSet=ISO8859_1'
      'User_Name=sysdba'
      'DriverID=FB'
      'Pooled=False')
    LoginPrompt = False
    Left = 34
    Top = 9
  end
  object qrGigaERP: TFDQuery
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'select * from GP_RATEIO')
    Left = 24
    Top = 272
  end
  object qrPreco_Venda: TFDQuery
    Connection = ConexaoGigaERP
    SQL.Strings = (
      'select * '
      'from produtos_tab_precos_prod'
      'where cod_empresa = :cod_empresa'
      '  and cod_tabela = :cod_tabela')
    Left = 104
    Top = 216
    ParamData = <
      item
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        Name = 'COD_TABELA'
        ParamType = ptInput
      end>
    object qrPreco_VendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPreco_VendaCOD_TABELA: TIntegerField
      FieldName = 'COD_TABELA'
      Origin = 'COD_TABELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPreco_VendaCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object qrPreco_VendaCOD_GRADE: TStringField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 25
    end
    object qrPreco_VendaPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Required = True
      Precision = 18
      Size = 5
    end
    object qrPreco_VendaPP_TIMESTAMP: TSQLTimeStampField
      FieldName = 'PP_TIMESTAMP'
      Origin = 'PP_TIMESTAMP'
    end
    object qrPreco_VendaPP_CLOCK_UPDATE: TLargeintField
      FieldName = 'PP_CLOCK_UPDATE'
      Origin = 'PP_CLOCK_UPDATE'
    end
    object qrPreco_VendaPP_CLOCK_INSERT: TLargeintField
      FieldName = 'PP_CLOCK_INSERT'
      Origin = 'PP_CLOCK_INSERT'
    end
    object qrPreco_VendaPP_NOT_UPDATED: TSmallintField
      FieldName = 'PP_NOT_UPDATED'
      Origin = 'PP_NOT_UPDATED'
    end
    object qrPreco_VendaPP_ID_GLOBAL: TStringField
      FieldName = 'PP_ID_GLOBAL'
      Origin = 'PP_ID_GLOBAL'
      FixedChar = True
      Size = 22
    end
    object qrPreco_VendaPP_ID_LOCAL: TLargeintField
      FieldName = 'PP_ID_LOCAL'
      Origin = 'PP_ID_LOCAL'
    end
    object qrPreco_VendaIGN_ALTERADO: TSmallintField
      FieldName = 'IGN_ALTERADO'
      Origin = 'IGN_ALTERADO'
    end
    object qrPreco_VendaIGN_ALTERA: TSmallintField
      FieldName = 'IGN_ALTERA'
      Origin = 'IGN_ALTERA'
    end
    object qrPreco_VendaIGN_LOGIN_REAJUSTE: TStringField
      FieldName = 'IGN_LOGIN_REAJUSTE'
      Origin = 'IGN_LOGIN_REAJUSTE'
    end
    object qrPreco_VendaIGN_DATAHORA_REAJUSTE: TSQLTimeStampField
      FieldName = 'IGN_DATAHORA_REAJUSTE'
      Origin = 'IGN_DATAHORA_REAJUSTE'
    end
    object qrPreco_VendaIGN_PRECOOLD_REAJUSTE: TFMTBCDField
      FieldName = 'IGN_PRECOOLD_REAJUSTE'
      Origin = 'IGN_PRECOOLD_REAJUSTE'
      Precision = 18
      Size = 5
    end
  end
  object qr_Local: TFDQuery
    CachedUpdates = True
    Connection = conexaoLocal
    Left = 24
    Top = 64
  end
end
