unit SimpleAssistente.Model.CriarClass;

interface

uses
  SimpleAssistente.Model.Interfaces, SimpleAssistente.Model.Types,
  System.Generics.Collections, Vcl.StdCtrls, Winapi.Windows, Vcl.Dialogs, System.SysUtils;

type
  TModelCriarClass = class(TInterfacedObject, iModelClass)

  private
    FClass: TextFile;
    FCaminho: string;
    FFields: TList<String>;
    FProceduresDeclaration: TList<String>;
    FFunctionsDeclaration: TList<String>;
    FProceduresImplementation: TList<String>;
    FFunctionsImplementation: TList<String>;
    FProperty: TList<String>;
    FNomeUnit: String;
    FNomeClass: String;

    function SeteProcedureDeclaration(aValue: TProperty): iModelClass;
    function SetProcedureImplementation(aValue: TProperty): iModelClass;
    function SeteFunctionDeclaration(aValue: TProperty): iModelClass;
    function SetFunctionImplementation(aValue: TProperty): iModelClass;

  public
    class function New: iModelClass;
    constructor Create;
    destructor Destroy; override;

    function SetNomeUnit(aValue: String): iModelClass;
    function SetNomeClass(aValue: String): iModelClass;
    function SetCampos(aValue: TProperty): iModelClass;

    function CriarClass: iModelClass;
    function MontarClass: iModelClass;

  end;

implementation

uses
  System.Classes, Vcl.Forms;

{ TModelCriarClass }
constructor TModelCriarClass.Create;
begin
  FFields := TList<String>.Create;
  FProperty := TList<String>.Create;
  FProceduresDeclaration := TList<String>.Create;
  FFunctionsDeclaration := TList<String>.Create;
  FProceduresImplementation := TList<String>.Create;
  FFunctionsImplementation := TList<String>.Create;
end;

function TModelCriarClass.CriarClass: iModelClass;

begin
  Result := Self;
  if Trim(FCaminho) = '' then
    FCaminho := ExtractFilePath(ParamStr(0));

  try
    if FileExists(FCaminho + FNomeUnit + '.pas') then
    begin
      If MessageDlg('Você tem certeza que deseja substituir a Classe ' + FNomeUnit + '?',
        mtConfirmation, mbYesNo, 0) = idyes then
      begin
        DeleteFile(FCaminho + FNomeUnit + '.pas');
        AssignFile(FClass, FCaminho + FNomeUnit + '.pas');
        Rewrite(FClass);
        MontarClass;
      end
      else
        Exit;
    end
    else
    begin
      AssignFile(FClass, FCaminho + FNomeUnit + '.pas');
      Rewrite(FClass);
      MontarClass;
    end;

    CloseFile(FClass);
  except
    on Error: Exception do
      raise Exception.Create('Error ao Gerarar o Arquivo ' + FNomeUnit + '.');
  end;
end;

destructor TModelCriarClass.Destroy;
begin

  inherited;
end;

function TModelCriarClass.MontarClass: iModelClass;
var
  i: Integer;
begin
  Result := Self;

  Writeln(FClass, 'unit ' + FNomeUnit + ';');
  Writeln(FClass, '');
  Writeln(FClass, 'interface');
  Writeln(FClass, '');
  Writeln(FClass, 'uses');
  Writeln(FClass, '  SimpleAttributes;');
  Writeln(FClass, '');
  Writeln(FClass, 'Type');
  Writeln(FClass, '  ' + FNomeClass + ' = class');
  Writeln(FClass, '  private');
  Writeln(FClass, '    { Private declarations }');

  for i := 0 to pred(FFields.Count) do
  begin
    Writeln(FClass, '    ' + FFields[i]);
  end;

  Writeln(FClass, '');

  for i := 0 to pred(FProceduresDeclaration.Count) do
  begin
    Writeln(FClass, '    ' + FProceduresDeclaration[i]);
  end;

  for i := 0 to pred(FFunctionsDeclaration.Count) do
  begin
    Writeln(FClass, '    ' + FFunctionsDeclaration[i]);
  end;

  Writeln(FClass, '');
  Writeln(FClass, '  published');
  Writeln(FClass, '    { published declarations }');

  for i := 0 to pred(FProperty.Count) do
  begin
    Writeln(FClass, '    ' + FProperty[i]);
  end;

  Writeln(FClass, '');
  Writeln(FClass, '  public');
  Writeln(FClass, '    { Public declarations }');
  Writeln(FClass, '');
  Writeln(FClass, '  end;');
  Writeln(FClass, '');
  Writeln(FClass, 'implementation');
  Writeln(FClass, '');
  Writeln(FClass, '{ ' + FNomeClass + ' }');
  Writeln(FClass, '');

  for i := 0 to pred(FProceduresImplementation.Count) do
  begin
    Writeln(FClass, FProceduresImplementation[i]);
  end;
  // pronto ate aqui
  Writeln(FClass, 'function TCAIXA.GetFDATAABERTURA: TDateTime;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFDATAALTERACAO: TDateTime;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFDATAFECHAMENTO: TDateTime;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFFISCAL_ABERTURA: String;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFFISCAL_FECHAMENTO: String;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFGUUID: String;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFOPERADOR: String;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFSTATUS: Integer;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFVALORABERTURA: Double;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'function TCAIXA.GetFVALORFECHAMENTO: Double;');
  Writeln(FClass, 'begin');
  Writeln(FClass, '');
  Writeln(FClass, 'end;');
  Writeln(FClass, '');
  Writeln(FClass, 'end.');
end;

class function TModelCriarClass.New: iModelClass;
begin
  Result := Self.Create;
end;

function TModelCriarClass.SetCampos(aValue: TProperty): iModelClass;
var
  AutoIncPK: string;
begin
  Result := Self;

  SeteProcedureDeclaration(aValue);
  SetProcedureImplementation(aValue);

  SeteFunctionDeclaration(aValue);
  SetFunctionImplementation(aValue);

  AutoIncPK := aValue.PK;

  if Trim(aValue.AutoInc) <> '' then
    AutoIncPK := AutoIncPK + ', ' + aValue.AutoInc;

  if Trim(aValue.Ignore) <> '' then
    AutoIncPK := AutoIncPK + ', ' + aValue.Ignore;

  if Trim(AutoIncPK) <> '' then
    FProperty.Add('[' + AutoIncPK + ']');

  FProperty.Add('property ' + aValue.Nome + ': ' + aValue.Tipo + ' read GetF' + aValue.Nome +
    ' write Set' + aValue.Nome + ';');
end;

function TModelCriarClass.SeteProcedureDeclaration(aValue: TProperty): iModelClass;
begin
  Result := Self;

  FFields.Add('F' + aValue.Nome + ': ' + aValue.Tipo + ';');
  FProceduresDeclaration.Add('procedure Set' + UpperCase(aValue.Nome) + '(const Value: ' +
    aValue.Tipo + ');');
end;

function TModelCriarClass.SetProcedureImplementation(aValue: TProperty): iModelClass;
begin
  Result := Self;

  FProceduresImplementation.Add('procedure ' + FNomeClass + '.Set' + aValue.Nome + '(const Value: '
    + aValue.Tipo + ');');
  FProceduresImplementation.Add('begin');
  FProceduresImplementation.Add('  F' + aValue.Nome + ' := Value;');
  FProceduresImplementation.Add('end;');
  FProceduresImplementation.Add('');
end;

function TModelCriarClass.SeteFunctionDeclaration(aValue: TProperty): iModelClass;
begin
  Result := Self;
  FFunctionsDeclaration.Add('function GetF' + aValue.Nome + ': ' + aValue.Tipo + ';');
  // function GetFDATAABERTURA: TDateTime;
end;

function TModelCriarClass.SetFunctionImplementation(aValue: TProperty): iModelClass;
begin
  hffjh
end;

function TModelCriarClass.SetNomeClass(aValue: String): iModelClass;
begin
  Result := Self;
  FNomeClass := 'T' + aValue;
end;

function TModelCriarClass.SetNomeUnit(aValue: String): iModelClass;
begin
  Result := Self;
  FNomeUnit := aValue;

end;

end.
