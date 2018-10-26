unit SimpleAssistente.Controller.Interfaces;

interface

uses
  SimpleAssistente.Model.Interfaces;

type
  iControlerFactory = interface
    ['{1E2B4201-3833-4F6F-9DEC-45159CD4CCE4}']
    function Controller: iController;
  end;

implementation

end.
