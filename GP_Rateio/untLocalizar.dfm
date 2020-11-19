object frmLocalizar: TfrmLocalizar
  Left = 0
  Top = 0
  Caption = 'Localizar produto'
  ClientHeight = 429
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 89
    Align = alTop
    TabOrder = 0
    object edtLocalizar: TEdit
      Left = 32
      Top = 52
      Width = 521
      Height = 27
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtLocalizarChange
      OnKeyDown = edtLocalizarKeyDown
    end
    object rgLocalizar: TRadioGroup
      Left = 32
      Top = 0
      Width = 377
      Height = 46
      Caption = 'Localizar por'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Come'#231'ando'
        'Contendo'
        'Terminando')
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 575
    Height = 340
    TabStop = False
    Align = alClient
    DataSource = DM.dsLocalizar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_GRADE'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Visible = True
      end>
  end
end
