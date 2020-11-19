object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = edtCodEmpresa
  Caption = 'Tela para gerar entrada no estoque '
  ClientHeight = 516
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pn_Rateio: TPanel
    Left = 0
    Top = 0
    Width = 1078
    Height = 145
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1078
      145)
    object Perfil: TLabel
      Left = 10
      Top = 52
      Width = 36
      Height = 19
      Caption = 'Perfil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbData: TLabel
      Left = 589
      Top = 81
      Width = 32
      Height = 19
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbEmpresa: TLabel
      Left = 127
      Top = 18
      Width = 61
      Height = 19
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 11
      Top = 81
      Width = 76
      Height = 19
      Caption = 'Tab. Pre'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbQtdPeca: TLabel
      Left = 107
      Top = 81
      Width = 63
      Height = 19
      Caption = 'Qtd Pe'#231'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbPesoPEca: TLabel
      Left = 206
      Top = 81
      Width = 71
      Height = 19
      Caption = 'Peso/Pe'#231'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbPesoTotal: TLabel
      Left = 302
      Top = 81
      Width = 74
      Height = 19
      Caption = 'Peso Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbVrKG: TLabel
      Left = 398
      Top = 81
      Width = 40
      Height = 19
      Caption = 'Vr/Kg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbVrTotal: TLabel
      Left = 494
      Top = 81
      Width = 57
      Height = 19
      Caption = 'Vr Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object but_Itens: TButton
      Left = 983
      Top = 103
      Width = 80
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = but_ItensClick
    end
    object but_NovoPerfil: TButton
      Left = 1040
      Top = 48
      Width = 25
      Height = 27
      Anchors = [akTop, akRight]
      Caption = '+'
      TabOrder = 13
      OnClick = but_NovoPerfilClick
    end
    object edt_Data: TMaskEdit
      Left = 590
      Top = 103
      Width = 90
      Height = 27
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 8
      Text = '  /  /    '
      OnEnter = edt_DataEnter
      OnExit = edt_DataExit
    end
    object dbcb_Perfil: TDBLookupComboBox
      Left = 78
      Top = 48
      Width = 956
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'COD_RATEIO'
      ListField = 'DESC_RATEIO'
      ListSource = DM.ds_Perfil
      ParentFont = False
      TabOrder = 1
      OnCloseUp = dbcb_PerfilCloseUp
      OnExit = dbcb_PerfilExit
    end
    object edtCodEmpresa: TLabeledEdit
      Left = 78
      Top = 15
      Width = 43
      Height = 27
      EditLabel.Width = 61
      EditLabel.Height = 19
      EditLabel.Caption = 'Empresa'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnExit = edtCodEmpresaExit
    end
    object edtNF: TLabeledEdit
      Left = 685
      Top = 103
      Width = 90
      Height = 27
      EditLabel.Width = 58
      EditLabel.Height = 19
      EditLabel.Caption = 'Num NF'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 9
    end
    object cbAlteraCusto: TCheckBox
      Left = 781
      Top = 111
      Width = 105
      Height = 17
      Caption = 'Altera Custo'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 10
    end
    object butCalcular: TButton
      Left = 897
      Top = 103
      Width = 80
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Calcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = butCalcularClick
    end
    object edtQtdPeca: TJvValidateEdit
      Left = 107
      Top = 103
      Width = 90
      Height = 27
      Flat = False
      ParentFlat = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnEnter = edtQtdPecaEnter
      OnKeyPress = edtQtdPecaKeyPress
    end
    object edtPesoTotal: TJvValidateEdit
      Left = 302
      Top = 103
      Width = 90
      Height = 27
      Flat = False
      ParentFlat = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnEnter = edtPesoTotalEnter
      OnKeyUp = edtPesoTotalKeyUp
    end
    object edtPeso: TJvValidateEdit
      Left = 206
      Top = 103
      Width = 90
      Height = 27
      Flat = False
      ParentFlat = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = edtPesoEnter
      OnKeyUp = edtPesoKeyUp
    end
    object edtVrKg: TJvValidateEdit
      Left = 399
      Top = 103
      Width = 90
      Height = 27
      Flat = False
      ParentFlat = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnKeyUp = edtVrKgKeyUp
    end
    object edtVrTotal: TJvValidateEdit
      Left = 494
      Top = 103
      Width = 90
      Height = 27
      Flat = False
      ParentFlat = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnEnter = edtVrTotalEnter
      OnKeyUp = edtVrTotalKeyUp
    end
    object dblookTabelaPreco: TJvDBLookupCombo
      Left = 10
      Top = 103
      Width = 90
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      IndexSwitch = False
      LookupField = 'DESC_TABELA'
      LookupDisplayIndex = 1
      LookupSource = DM.dsTabPreco
      ParentFont = False
      TabOrder = 2
      UseRecordCount = True
    end
  end
  object pn_Finaliza: TPanel
    Left = 0
    Top = 400
    Width = 1078
    Height = 116
    Align = alBottom
    TabOrder = 1
    object lbTotalPorcentagem: TLabel
      Left = 11
      Top = 61
      Width = 57
      Height = 19
      Caption = 'Total %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTotalPesoRateio: TLabel
      Left = 508
      Top = 10
      Width = 105
      Height = 19
      Caption = 'Peso Rateio Kg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTotalCusto: TLabel
      Left = 620
      Top = 10
      Width = 64
      Height = 19
      Caption = 'Custo R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTotalVenda: TLabel
      Left = 732
      Top = 10
      Width = 68
      Height = 19
      Caption = 'Venda R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbPorcentagemAgregado: TLabel
      Left = 844
      Top = 10
      Width = 90
      Height = 19
      Caption = '% Agregado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object butConfirmar: TButton
      Left = 10
      Top = 10
      Width = 120
      Height = 49
      Caption = 'Confirmar'
      DisabledImageIndex = 90
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 89
      ImageIndex = 91
      ImageMargins.Left = 5
      ParentFont = False
      TabOrder = 0
      OnClick = butConfirmarClick
    end
    object butRetornar: TButton
      Left = 136
      Top = 10
      Width = 120
      Height = 49
      Caption = 'Retornar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = butRetornarClick
    end
    object butGravarPerfil: TButton
      Left = 262
      Top = 10
      Width = 120
      Height = 49
      Caption = 'Gravar Perfil'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = butGravarPerfilClick
    end
    object edtTotalPorcentagem: TDBEdit
      Left = 396
      Top = 32
      Width = 105
      Height = 27
      DataField = 'TOTAL_PORCENTAGEM'
      DataSource = DM.ds_Rateio_Itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtTotalPesoRateio: TDBEdit
      Left = 508
      Top = 32
      Width = 105
      Height = 27
      DataField = 'TOTAL_PESO_RATEIO'
      DataSource = DM.ds_Rateio_Itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtTotalCustoCompra: TDBEdit
      Left = 620
      Top = 32
      Width = 105
      Height = 27
      DataField = 'TOTAL_CUSTO_COMPRA'
      DataSource = DM.ds_Rateio_Itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtTotalVenda: TDBEdit
      Left = 732
      Top = 32
      Width = 105
      Height = 27
      DataField = 'TOTAL_VENDA'
      DataSource = DM.ds_Rateio_Itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtPercentualAgregado: TDBEdit
      Left = 844
      Top = 32
      Width = 105
      Height = 27
      DataField = 'PERCENTUAL_AGREGADO'
      DataSource = DM.ds_Rateio_Itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object pn_Itens: TPanel
    Left = 0
    Top = 145
    Width = 1078
    Height = 255
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 41
      Width = 1076
      Height = 213
      Align = alClient
      DataSource = DM.ds_Rateio_Itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = pmGrid
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyUp = DBGrid1KeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_RATEIO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_RATEIO_ITEM'
          ReadOnly = True
          Title.Caption = 'ITEM'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          ReadOnly = True
          Title.Caption = 'PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_GRADE'
          ReadOnly = True
          Title.Caption = 'GRADE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_PRODUTO'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 307
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAGEM'
          Title.Caption = '%'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO_RATEIO'
          ReadOnly = True
          Title.Caption = 'PESO RATEIO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO_COMPRA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBTOTAL_VENDA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO_SUBTOTAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO_UNIT'
          Width = 64
          Visible = True
        end>
    end
    object pnProduto: TPanel
      Left = 1
      Top = 1
      Width = 1076
      Height = 40
      Align = alTop
      TabOrder = 1
      DesignSize = (
        1076
        40)
      object Label3: TLabel
        Left = 10
        Top = 8
        Width = 56
        Height = 19
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbDesc_Prod: TLabel
        Left = 213
        Top = 8
        Width = 67
        Height = 19
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtProduto: TEdit
        Left = 77
        Top = 5
        Width = 130
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0000000000000'
        OnKeyDown = edtProdutoKeyDown
      end
      object butConfirmaItem: TButton
        Left = 897
        Top = 5
        Width = 80
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'Confirma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = butConfirmaItemClick
      end
      object butSairItem: TButton
        Left = 983
        Top = 5
        Width = 80
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'Sair Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = butSairItemClick
      end
    end
  end
  object pmGrid: TPopupMenu
    Left = 256
    Top = 209
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 208
    object hema1: TMenuItem
      Caption = 'Visual'
      OnClick = hema1Click
    end
  end
end
