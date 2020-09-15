program SoftPlan;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uTThreadSoftPlan in 'uTThreadSoftPlan.pas',
  uDM in 'DataModules\uDM.pas' {DM: TDataModule},
  uTLogDownload in 'Class\uTLogDownload.pas',
  uTController in 'Class\uTController.pas',
  uTPadrao in 'Class\uTPadrao.pas',
  uFrmListaDiversos in 'uFrmListaDiversos.pas' {FrmListaDiversos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmListaDiversos, FrmListaDiversos);
  Application.Run;
end.
