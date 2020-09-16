{Autor - Helton Lizandro
 Email - Heltonlizandro@gmail.com
 Data de Criação: 16/09/2020
 Descrição: Procedimento simples utilizado para efetuar downloads de arquivos
            passando apenas o link}

unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, IdAntiFreezeBase, Vcl.IdAntiFreeze, IdBaseComponent, uTThreadSoftPlan,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Imaging.pngimage, uTLogDownload,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TfrmPrincipal = class(TForm)
    IdHTTP: TIdHTTP;
    IdAntiFreeze: TIdAntiFreeze;
    dlgSave: TSaveDialog;
    EdtUrl: TEdit;
    pbProgresso: TProgressBar;
    Img: TImage;
    btnDownload: TBitBtn;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    lbStatus: TLabel;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    BitBtn2: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnDownloadClick(Sender: TObject);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    MinhaThread : TThreadSoftPlan;
    logDown : TLogDownload;
    function  RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function  RetornaKiloBytes(ValorAtual: real): string;
    procedure PararDownload;
  public
    { Public declarations }
    DtIni : TDateTime;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmListaDiversos;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  ShowMessage(RetornaPorcentagem(pbprogresso.Max, pbprogresso.Position));
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
var
  FrmListaDiversos : TFrmListaDiversos;
  logDownConsulta  : TlogDownload;
begin
  try
    FrmListaDiversos := TFrmListaDiversos.Create(nil);
    logDownConsulta := TlogDownload.Create;
    FrmListaDiversos.ObjetoConsulta(logDownConsulta.Consultar);
    FrmListaDiversos.ShowModal;
  finally
    FreeAndNil(logDownConsulta);
    FrmListaDiversos.Free;
  end;
end;

procedure TfrmPrincipal.btnDownloadClick(Sender: TObject);
Var
  msg : String;
begin
  if MinhaThread = nil then
  begin
    try
      MinhaThread := TThreadSoftPlan.Create();
      MinhaThread.Cria(IdHTTP, pbProgresso, dlgSave, lbStatus, EdtUrl.Text);

      if (IdHTTP.Connected) then
      try
        logDown := TlogDownload.Create;
        logDown.URL := EdtUrl.Text;
        logDown.DATAINICIO := DtIni;
        logDown.DATAFIM    := Now;
        msg := logDown.Inserir();
        ShowMessage(msg);
      finally
        FreeAndNil(logDown);
      end;

    finally
      MinhaThread := nil;
    end;
  end
  else
  begin
    if Application.MessageBox('Confirma o cancelamento do Download?', 'Parar Download....', MB_YESNO) = mrYes then
    begin
      pararDownload;
    end;
  end;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MinhaThread <> nil then
  begin
    CanClose := False;
    if Application.MessageBox('Existe um download em andamento, deseja interrompe-lo?', 'Fechando sistema....', MB_YESNO) = mrYes then
    begin
      PararDownload;
      CanClose := True;
    end;
  end;
end;

procedure TfrmPrincipal.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  pbprogresso.Position := AWorkCount;
  lbStatus.Caption     := 'Baixando ... ' + RetornaKiloBytes(AWorkCount);
  frmPrincipal.Caption := 'Download em ... ' + RetornaPorcentagem(pbprogresso.Max, AWorkCount);
end;

procedure TfrmPrincipal.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  btnDownload.Caption := 'Parar Download';
  DtIni               := Now;
  EdtUrl.ReadOnly     := True;
  pbprogresso.Max     := AWorkCountMax;
end;

procedure TfrmPrincipal.IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  EdtUrl.ReadOnly      := False;
  btnDownload.Caption  := 'Iniciar Download';
  pbprogresso.Position := 0;
  frmPrincipal.Caption := 'Finalizado ...';
  lbStatus.Caption     := 'Download Finalizado ...';
end;

procedure TfrmPrincipal.PararDownload;
begin
  IdHTTP.Disconnect;
  pbProgresso.Position := 0;
end;

function TfrmPrincipal.RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
var
  resultado: Real;
begin
  resultado := ((ValorAtual * 100) / ValorMaximo);
  Result    := FormatFloat('0%', resultado);
end;

function TfrmPrincipal.RetornaKiloBytes(ValorAtual: real): string;
var
  resultado : real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result    := FormatFloat('0.000 KBs', resultado);
end;

end.
