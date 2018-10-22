unit SimpleAssistente.Model.CriarClass;

interface

uses
  SimpleAssistente.Model.Interfaces, SimpleAssistente.Model.Types,
  System.Generics.Collections, Vcl.StdCtrls, Winapi.Windows, Vcl.Dialogs, System.SysUtils;

type
  TModelCriarClass = class(TInterfacedObject, iModelClass)

  private
    FClass: TextFile;
    FDirectory: string;
    FFields: TList<String>;
    FProceduresDeclaration: TList<String>;
    FFunctionsDeclaration: TList<String>;
    FProceduresImplementation: TList<String>;
    FFunctionsImplementation: TList<String>;
    FProperty: TList<String>;
    FNameUnit: String;
    FNameClass: String;
    FNameValidation: String;

    function SeteProcedureDeclaration(aValue: TProperty): iModelClass;
    function SetProcedureImplementation(aValue: TProperty): iModelClass;
    function SeteFunctionDeclaration(aValue: TProperty): iModelClass;
    function SetFunctionImplementation(aValue: TProperty): iModelClass;
    function SetFunctionImplementationValidation(aValue: TProperty): iModelClass;

  public
    class function New: iModelClass;
    constructor Create;
    destructor Destroy; override;

    function SetNomeUnit(aValue: String): iModelClass;
    function SetNomeClass(aValue: String): iModelClass;
    function SetNameValidation(aValue: String): iModelClass;
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
  if Trim(FDirectory) = '' then
    FDirectory := ExtractFilePath(ParamStr(0));

  try
    if FileExists(FDirectory + FNameUnit + '.pas') then
    begin
      If MessageDlg('Você tem certeza que deseja substituir a Classe ' + FNameUnit + '?',
        mtConfirmation, mbYesNo, 0) = idyes then
      begin
        DeleteFile(FDirectory + FNameUnit + '.pas');
        AssignFile(FClass, FDirectory + FNameUnit + '.pas');
        Rewrite(FClass);
        MontarClass;
      end
      else
        Exit;
    end
    else
    begin
      AssignFile(FClass, FDirectory + FNameUnit + '.pas');
      Rewrite(FClass);
      MontarClass;
    end;

    CloseFile(FClass);
  except
    on Error: Exception do
      raise Exception.Create('Error ao Gerarar o Arquivo ' + FNameUnit + '.');
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

  Writeln(FClass, 'unit ' + FNameUnit + ';');
  Writeln(FClass, '');
  Writeln(FClass, 'interface');
  Writeln(FClass, '');
  Writeln(FClass, 'uses');
  Writeln(FClass, '  SimpleAttributes;');
  Writeln(FClass, '');
  Writeln(FClass, 'Type');
  Writeln(FClass, '  ' + FNameClass + ' = class');
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
  Writeln(FClass, '{ ' + FNameClass + ' }');
  Writeln(FClass, '');

  for i := 0 to pred(FProceduresImplementation.Count) do
  begin
    Writeln(FClass, FProceduresImplementation[i]);
  end;

  for i := 0 to pred(FFunctionsImplementation.Count) do
  begin
    Writeln(FClass, FFunctionsImplementation[i]);
  end;

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

  aValue.NotNull := 'S';

  SeteProcedureDeclaration(aValue);
  SetProcedureImplementation(aValue);

  SeteFunctionDeclaration(aValue);
  SetFunctionImplementationValidation(aValue);
  // SetFunctionImplementation(aValue);

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

  FProceduresImplementation.Add('procedure ' + FNameClass + '.Set' + aValue.Nome + '(const Value: '
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
end;

function TModelCriarClass.SetFunctionImplementation(aValue: TProperty): iModelClass;
begin
  Result := Self;

  FFunctionsImplementation.Add('function ' + FNameClass + '.GetF' + aValue.Nome + ': ' +
    aValue.Tipo + ';');
  FFunctionsImplementation.Add('begin');
  FFunctionsImplementation.Add('  Result := F' + aValue.Nome + ';');
  FFunctionsImplementation.Add('end;');
  FFunctionsImplementation.Add('');
end;

function TModelCriarClass.SetFunctionImplementationValidation(aValue: TProperty): iModelClass;
begin
  Result := Self;

  if aValue.NotNull = 'S' then
  begin
    FFunctionsImplementation.Add('function ' + FNameClass + '.GetF' + aValue.Nome + ': ' +
      aValue.Tipo + ';');
    FFunctionsImplementation.Add('begin');
    FFunctionsImplementation.Add('  if aValue.Nome = ' + QuotedStr('') + ' then');
    FFunctionsImplementation.Add('    raise ' + FNameValidation + '.Create(' + aValue.Nome + ',' +
      QuotedStr('O campo ' + aValue.Nome + ' não pode ser vazio!') + ');');
    FFunctionsImplementation.Add('');
    FFunctionsImplementation.Add('  Result := F' + aValue.Nome + ';');
    FFunctionsImplementation.Add('end;');
    FFunctionsImplementation.Add('');
  end
  else
    SetFunctionImplementation(aValue);
end;

function TModelCriarClass.SetNameValidation(aValue: String): iModelClass;
begin
  Result := Self;

  FNameValidation := aValue;

  if aValue = '' then
    FNameValidation := 'TValidaCampo';
end;

function TModelCriarClass.SetNomeClass(aValue: String): iModelClass;
begin
  Result := Self;
  FNameClass := 'T' + aValue;
end;

function TModelCriarClass.SetNomeUnit(aValue: String): iModelClass;
begin
  Result := Self;
  FNameUnit := aValue;
end;

end.
