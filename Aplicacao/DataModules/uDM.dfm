object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 520
  object Banco: TFDConnection
    Params.Strings = (
      'Database=D:\Install\SQLiteStudio\softplan'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 88
    Top = 64
  end
  object SqlDiversos: TFDQuery
    Connection = Banco
    Left = 160
    Top = 64
  end
end
