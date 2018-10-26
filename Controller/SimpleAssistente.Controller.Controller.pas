unit SimpleAssistente.Controller.Controller;

interface

uses
  SimpleAssistente.Model.Interfaces, SimpleAssistente.Model.Factory,
  Vcl.StdCtrls;

type
  TController = class(TInterfacedObject, iController)
  private
    FModelBuscarDados: iModelBuscarDados;
  public
    class function New: iController;
    constructor Create;
    destructor Destroy; override;

    function BuscarDados: iModelBuscarDados;
    function ListTable(aParent : TListBox) : iController;
    // function

  end;

implementation

{ Controller }

function TController.BuscarDados: iModelBuscarDados;
begin
  Result := FModelBuscarDados;
end;

constructor TController.Create;
begin
   FModelBuscarDados := TModelFactory.New.BuscaDadosBanco;

end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.ListTable(aParent : TListBox) : iController;
var s : string;
begin
   // FModelBuscarDados.GetTable(s);
    //aParent. := s;
end;

class function TController.New: iController;
begin
  Result := self.Create;
end;

end.
