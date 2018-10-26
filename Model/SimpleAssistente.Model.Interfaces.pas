unit SimpleAssistente.Model.Interfaces;

interface

uses
  Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, System.Generics.Collections,
  SimpleAssistente.Model.Types;

type
  iModelBuscarDados = interface;
  iController = interface;

  iModelClass = interface
    ['{4A477652-432D-4399-AAF1-CDDB4E3B9D8F}']
    function SetNomeUnit(aValue: String): iModelClass;
    function SetNomeClass(aValue: String): iModelClass;
    function SetNameValidation(aValue: String): iModelClass;
    function SetCampos(aValue: TProperty): iModelClass;
    function CriarClass: iModelClass;
    function MontarClass: iModelClass;
  end;

  iModelFactory = interface
    ['{3E8E920A-569F-43BE-97D0-B2A490832C6C}']
    function CriarClass: iModelClass;
    function BuscaDadosBanco: iModelBuscarDados;
  end;

  iModelBuscarDados = interface
    ['{4E1B6EE3-9ED8-40D7-A207-4CF32B216693}']
    function Log(aValue: TMemo): iModelBuscarDados;
    function BuscarCampo(aTabela: String): iModelBuscarDados;
    function GetTable(aValue: TComboBox): iModelBuscarDados;
    function SetNomeUnit(aValue: String): iModelBuscarDados;
    function SetNameValidation(aValue: String): iModelBuscarDados;
    // virificar melhor forma de sair desta interface
    // function BuscarDados: iController;
  end;

  iController = interface
    ['{6C05C67B-8A38-4BBF-B27E-5F73B0607620}']
    function BuscarDados: iModelBuscarDados;
  end;

implementation

end.
