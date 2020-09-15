unit uFrmListaDiversos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uTPadrao;

type
  TFrmListaDiversos = class(TForm)
    DBGrid1: TDBGrid;
    btnFechar: TBitBtn;
    dsGrid: TDataSource;
    SqlGrid: TFDQuery;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ObjetoConsulta(sql: String);
  end;

var
  FrmListaDiversos: TFrmListaDiversos;

implementation

{$R *.dfm}

uses uDM;

procedure TFrmListaDiversos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmListaDiversos.ObjetoConsulta(sql: String);
begin
  SqlGrid.Close;
  SqlGrid.SQL.Text := sql;
  SqlGrid.Open();
end;

end.
