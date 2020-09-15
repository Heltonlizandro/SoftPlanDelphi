unit uTLogDownload;

interface

uses uTPadrao;

type
  TLogDownload = class(Padrao)
  private
    FCODIGO: Integer;
    FDATAFIM: TDateTime;
    FDATAINICIO: TDateTime;
    FURL: String;
    FTABELA: String;

    procedure SetCODIGO(const Value: Integer);
    procedure SetDATAFIM(const Value: TDateTime);
    procedure SetDATAINICIO(const Value: TDateTime);
    procedure SetURL(const Value: String);

  public
    property CODIGO     : Integer   read FCODIGO     write SetCODIGO;
    property URL        : String    read FURL        write SetURL;
    property DATAINICIO : TDateTime read FDATAINICIO write SetDATAINICIO;
    property DATAFIM    : TDateTime read FDATAFIM    write SetDATAFIM;

    function Inserir(): String;
    function TABELA : String; override;
    function Consultar: String; override;
  end;

implementation

{ TLogDownload }

uses uTController;

function TLogDownload.Consultar: String;
begin
  Result := 'SELECT DATAINICIO AS "Data Ini", DATAFIM AS "Data Fim", URL from LOGDOWNLOAD ';
end;

function TLogDownload.Inserir(): String;
var
  Campos: Array [0..2] of string;
  Valores : Array [0..2] of Variant;
  Controle : TControle;
begin
  try
    Campos[0] := 'URL';
    Campos[1] := 'DATAINICIO';
    Campos[2] := 'DATAFIM';

    Valores[0] := FURL;
    Valores[1] := FDATAINICIO;
    Valores[2] := FDATAFIM;

    Controle := TControle.Create;
    Controle.Inserir(Self, Campos, Valores);

    Result := 'Dados inserido com Sucesso!';
  finally
    Controle.Free;
  end;
end;

procedure TLogDownload.SetCODIGO(const Value: Integer);
begin
  FCODIGO := Value;
end;

procedure TLogDownload.SetDATAFIM(const Value: TDateTime);
begin
  FDATAFIM := Value;
end;

procedure TLogDownload.SetDATAINICIO(const Value: TDateTime);
begin
  FDATAINICIO := Value;
end;

procedure TLogDownload.SetURL(const Value: String);
begin
  FURL := Value;
end;

function TLogDownload.TABELA: String;
begin
  Result := 'LogDownload';
end;

end.
