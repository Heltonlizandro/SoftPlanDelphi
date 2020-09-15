unit uTThreadSoftPlan;

interface

uses Forms, Controls, StdCtrls, Classes, SysUtils, IdHTTP, Vcl.ComCtrls,
  Vcl.Dialogs;

type

  TThreadSoftPlan = class(TThread)
    vLb: TLabel;
    vConta: Integer;
    procedure Contator;
    procedure Execute; override;
  private
    IdHTTP: TIdHTTP;
    vProgress : TProgressBar;
    dlgSave: TSaveDialog;
  public
    constructor Cria(const vIdHTTP: TIdHTTP; const progres : TProgressBar; const SaveDlg: TSaveDialog; const lb : TLabel; link : String);
  end;

implementation

procedure TThreadSoftPlan.Contator;
begin
  vConta := vProgress.Position;
  //vLb.Caption := 'Baixando: '+IntToStr(vConta);
  if vConta = vProgress.Max then
    Terminate;
end;

constructor TThreadSoftPlan.Cria(const vIdHTTP: TIdHTTP; const progres : TProgressBar;
  const SaveDlg: TSaveDialog; const lb : TLabel; link : String);
var
  fileDownload : TFileStream;
begin
  Create(False);
  FreeOnTerminate := True;
  IdHTTP          := vIdHTTP;
  vLb             := lb;
  vProgress       := progres;
  dlgSave         := SaveDlg;
  vConta          := 0;

  dlgSave.Filter := 'Arquivos' + ExtractFileExt(link) + '|*' + ExtractFileExt(link);
  dlgSave.FileName := 'Arquivo';
  if dlgSave.Execute then
  begin
    fileDownload := TFileStream.Create(dlgSave.FileName + ExtractFileExt(link), fmCreate);
    try
      try
        IdHTTP.Get(link, fileDownload);
      except
        on E:Exception do
        ShowMessage('Erro: '+E.Message);
      end;
    finally
      FreeAndNil(fileDownload);
    end;
  end;
end;

procedure TThreadSoftPlan.Execute;
begin
  while not Terminated do
  begin
    Synchronize(Contator);
    Sleep(10);
  end;
end;

end.
