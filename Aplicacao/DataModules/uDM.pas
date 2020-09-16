unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Inifiles;

type
  TDM = class(TDataModule)
    Banco: TFDConnection;
    SqlDiversos: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  I: Integer;
  x: Integer;
  ini: TIniFile;
begin

  try
    ini                   := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'SoftPlan.ini');
    Banco.Params.Database := ini.ReadString('CONFIGURACAO','CAMINHO',' ');
    Banco.Connected       := True;
  except
    on E:Exception do
      ShowMessage('Erro ao tentar conectar com o banco de dados.'+#13+E.Message);
  end;
end;

end.
