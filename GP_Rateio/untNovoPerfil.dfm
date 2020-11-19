object frmNomePerfil: TfrmNomePerfil
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Nome do Novo Perfil'
  ClientHeight = 89
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtDesc_Rateio: TLabeledEdit
    Left = 8
    Top = 24
    Width = 241
    Height = 27
    CharCase = ecUpperCase
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome do Perfil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtDesc_RateioKeyPress
  end
  object butConfirma: TButton
    Left = 88
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = butConfirmaClick
  end
  object butCancela: TButton
    Left = 174
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = butCancelaClick
  end
end
