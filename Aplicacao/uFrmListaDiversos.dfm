object FrmListaDiversos: TFrmListaDiversos
  Left = 0
  Top = 0
  Caption = 'FrmListaDiversos'
  ClientHeight = 287
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 539
    Height = 217
    Align = alTop
    DataSource = dsGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnFechar: TBitBtn
    Left = 232
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object dsGrid: TDataSource
    DataSet = SqlGrid
    Left = 264
    Top = 152
  end
  object SqlGrid: TFDQuery
    Connection = DM.Banco
    Left = 336
    Top = 152
  end
end
