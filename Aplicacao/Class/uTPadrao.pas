unit uTPadrao;

interface

type
  Padrao = class
  published
    function TABELA : String; virtual; abstract;
    function Consultar : String; Virtual; abstract;
  end;

implementation

{ Padrao }


end.
