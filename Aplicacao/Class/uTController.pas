unit uTController;

interface

uses uTPadrao;

type
  TControle = class
    private

    public
      procedure Inserir(Objeto: Padrao; vCampos : Array of String; vValores : Array of Variant);
      procedure Update(Objeto: Padrao);
      procedure Delete(Objeto: Padrao);

  end;

implementation

{ Controlerr }

uses uTLogDownload, System.TypInfo, uDM, System.SysUtils, Vcl.Dialogs;


procedure TControle.Delete(Objeto: Padrao);
begin

end;

procedure TControle.Inserir(Objeto: Padrao; vCampos : Array of String; vValores : Array of Variant);
var
  Script, Campos, Valores : String;
  I: Integer;
  propInfo: PPropInfo;
begin
  Script := 'INSERT INTO '+Objeto.TABELA;

  for i := Low(vCampos) to High(vCampos) do
  begin
    Campos  := Campos  + vCampos[i]+',';
    Valores := Valores + ':'+vCampos[i]+',';
  end;

  Campos  := copy(Campos,  1, length(Campos)-1);
  Valores := copy(Valores, 1, length(Valores)-1);

  try

    with DM.SqlDiversos do
    begin
      if not DM.Banco.InTransaction then
        DM.Banco.StartTransaction;

      Close;
      SQL.Text := Script +'('+Campos+') values ('+valores+')';

      for i := Low(vValores) to High(vValores) do
      begin
        Params[i].Value := vValores[i];
      end;

      ExecSQL;

      DM.Banco.Commit;
    end;
  except
    on E:Exception do
      ShowMessage('Erro na Inclusão do Download: '+E.Message);
  end;

end;

procedure TControle.Update(Objeto: Padrao);
begin

end;

end.
