unit SimpleAssistente.Controller.Controller;

interface

uses
  SimpleAssistente.Model.Interfaces, SimpleAssistente.Model.Factory,
  Vcl.StdCtrls, System.Generics.Collections;

type
  TController = class(TInterfacedObject, iController)
  private
    FModelBuscarDados: iModelBuscarDados;
    FTables: TList<string>;
  public
    class function New: iController;
    constructor Create;
    destructor Destroy; override;

    function ListTable(aParent: TListBox): iController;
    // function

  end;

implementation

uses
  System.SysUtils;

{ Controller }

constructor TController.Create;
begin
  FModelBuscarDados := TModelFactory.New.BuscaDadosBanco;
  FTables := TList<string>.Create;

end;

destructor TController.Destroy;
begin
  FreeAndNil(FTables);
  inherited;
end;

function TController.ListTable(aParent: TListBox): iController;
var
  i: Integer;
  sTable: string;
begin
  FModelBuscarDados.GetTable(FTables);
  for i := 0 to Pred(FTables.Count) do
  begin
    aParent.Items.Strings[i] := FTables[i];
  end;
end;

class function TController.New: iController;
begin
  Result := self.Create;
end;

end.
