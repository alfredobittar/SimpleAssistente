unit SimpleAssistente.Model.Factory;

interface

uses
  SimpleAssistente.Model.CriarClass,
  SimpleAssistente.Model.BuscaDadosBanco,
  SimpleAssistente.Model.Interfaces;

type
  TModelFactory = Class(TInterfacedObject, iModelFactory)
  private
  public
    class function New: iModelFactory;
    constructor Create;
    destructor Destroy; override;
    function CriarClass: iModelClass;
    function BuscaDadosBanco: iModelBuscarDados;

  End;

implementation

{ TModelFactory }

function TModelFactory.BuscaDadosBanco: iModelBuscarDados;
begin
  Result := TModelBuscaDadosBanco.New;
end;

constructor TModelFactory.Create;
begin

end;

function TModelFactory.CriarClass: iModelClass;
begin
  Result := TModelCriarClass.New;
end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

class function TModelFactory.New: iModelFactory;
begin
  Result := Self.Create;
end;

end.
