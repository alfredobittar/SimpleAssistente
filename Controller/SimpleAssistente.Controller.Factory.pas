unit SimpleAssistente.Controller.Factory;

interface

uses
  SimpleAssistente.Controller.Interfaces, SimpleAssistente.Model.Interfaces;

type
  TControllerFactory = Class(TInterfacedObject, iControlerFactory)
  private
  public
    class function New: iControlerFactory;
    constructor Create;
    destructor Destroy; override;

    function Controller: iController;

  End;

implementation

uses
  SimpleAssistente.Controller.Controller;

{ TControllerFactory }

function TControllerFactory.Controller: iController;
begin
  Result := TController.New;
end;

constructor TControllerFactory.Create;
begin

end;

destructor TControllerFactory.Destroy;
begin

  inherited;
end;

class function TControllerFactory.New: iControlerFactory;
begin
  Result := Self.Create;
end;

end.
