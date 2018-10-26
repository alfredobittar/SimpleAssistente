program SimpleAssistente;

uses
  Vcl.Forms,
  SimpleAssistente.View.CriarClass in 'View\SimpleAssistente.View.CriarClass.pas' {frmPrincipal},
  SimpleAssistente.Model.CriarClass in 'Model\SimpleAssistente.Model.CriarClass.pas',
  SimpleAssistente.Model.BuscaDadosBanco in 'Model\SimpleAssistente.Model.BuscaDadosBanco.pas',
  SimpleAssistente.Model.Interfaces in 'Model\SimpleAssistente.Model.Interfaces.pas',
  SimpleAssistente.Model.Factory in 'Model\SimpleAssistente.Model.Factory.pas',
  SimpleAssistente.Model.Types in 'Model\SimpleAssistente.Model.Types.pas',
  SimpleAssistente.Controller.Controller in 'Controller\SimpleAssistente.Controller.Controller.pas',
  SimpleAssistente.Controller.Factory in 'Controller\SimpleAssistente.Controller.Factory.pas',
  SimpleAssistente.Controller.Interfaces in 'Controller\SimpleAssistente.Controller.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
