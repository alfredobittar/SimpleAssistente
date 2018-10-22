unit SimpleAssistente.Model.BuscaDadosBanco;

interface

uses
  SimpleAssistente.Model.Interfaces, Data.DB, FireDAC.Comp.Client,
  Vcl.StdCtrls, Winapi.Windows, System.Generics.Collections, System.Classes,
  SimpleAssistente.View.CriarClass,
  SimpleAssistente.Model.CriarClass,
  SimpleAssistente.Model.Types;

type
  TModelBuscaDadosBanco = class(TInterfacedObject, iModelBuscarDados)
  private
    FCriaClass: iModelClass;
    FMetaTables: TFDMetaInfoQuery;
    FMetaFields: TFDMetaInfoQuery;
    FQuery: TFDQuery;

    FFields: TDictionary<string, TProperty>;
    FTable: string;
    FCampo: TProperty;

    Flog: String;
    FEscrita: TMemo;

    function GetFieldType(pTipo: TFieldType): string;
  public
    class function New: iModelBuscarDados;
    constructor Create;
    destructor Destroy; override;

    function BuscarCampo(aTabela: String): iModelBuscarDados;
    function BuscarPK(aTabela: String): iModelBuscarDados;
    function Log(aValue: TMemo): iModelBuscarDados;
    function exibiLog: iModelBuscarDados;
    function GetTable(aValue: TComboBox): iModelBuscarDados;

    function SetFields: iModelBuscarDados;
    function SetPK: iModelBuscarDados;
    function SetType: iModelBuscarDados;

  end;

implementation

uses
  System.SysUtils, FireDAC.Phys.Intf;

{ TModelBuscaDadosBanco }

function TModelBuscaDadosBanco.BuscarCampo(aTabela: String): iModelBuscarDados;
var
  Campo: TProperty;
begin
  Result := Self;

  FTable := aTabela;
  /// ///////////////////////////////////////////////////////  isso não é aqui
  FCriaClass.SetNomeUnit('Teste');
  FCriaClass.SetNameValidation('');

  FCriaClass.SetNomeClass(FTable);

  SetFields;
  SetType;
  SetPK;

  for Campo in FFields.Values do
  begin
    FCriaClass.SetCampos(Campo);
  end;

  FCriaClass.CriarClass;
end;

function TModelBuscaDadosBanco.GetTable(aValue: TComboBox): iModelBuscarDados;
begin
  with FMetaTables do
  begin
    Close();
    MetaInfoKind := TFDPhysMetaInfoKind(mkTables);
    ObjectName := aValue.Text;
    Open();
  end;
end;

function TModelBuscaDadosBanco.Log(aValue: TMemo): iModelBuscarDados;
begin
  Result := Self;
  FEscrita := aValue;
end;

function TModelBuscaDadosBanco.BuscarPK(aTabela: String): iModelBuscarDados;
begin
  Result := Self;
  with FMetaTables do
  begin
    Close;
    IndexFieldNames := '';
    BaseObjectName := aTabela;
    MetaInfoKind := mkPrimaryKeyFields;
    Open;
  end;
end;

class function TModelBuscaDadosBanco.New: iModelBuscarDados;
begin
  Result := Self.Create;
end;

constructor TModelBuscaDadosBanco.Create;
begin
  FMetaTables := frmPrincipal.metaInfo;
  FMetaFields := frmPrincipal.MetaFields;
  FFields := TDictionary<string, TProperty>.Create;
  FQuery := frmPrincipal.FDQuery1;
  FCriaClass := TModelCriarClass.New;
end;

destructor TModelBuscaDadosBanco.Destroy;
begin

  inherited;
end;

function TModelBuscaDadosBanco.SetFields: iModelBuscarDados;
begin
  with FMetaFields do
  begin
    Close();
    MetaInfoKind := mkTableFields;
    ObjectName := FTable;
    Open();

    First;
    while not Eof do
    begin
      FCampo.Nome := Trim(FieldByName('COLUMN_NAME').AsString);
      FFields.Add(FCampo.Nome, FCampo);
      Next;
    end;
  end;
end;

function TModelBuscaDadosBanco.exibiLog: iModelBuscarDados;
begin

  begin
    FEscrita.Lines.Add(Flog);
    Flog := '';
  end
end;

function TModelBuscaDadosBanco.SetType: iModelBuscarDados;
var
  FieldTipo: TFieldType;
  i: Integer;
begin
  Result := Self;
  with FQuery do
  begin
    Open('SELECT * FROM ' + FTable);
    for i := 0 to Pred(FieldList.Count) do
    begin
      FCampo.Nome := Trim(FieldList.Fields[i].FieldName);
      FieldTipo := FieldByName(FCampo.Nome).DataType;
      FCampo.Tipo := GetFieldType(FieldTipo);
      FFields.AddOrSetValue(FCampo.Nome, FCampo);
    end;
  end;
end;

function TModelBuscaDadosBanco.GetFieldType(pTipo: TFieldType): string;
begin
  case (pTipo) of
    ftString, ftWideString, ftFixedChar, ftFmtMemo:
      Result := 'String';
    ftBoolean:
      Result := 'Boolean';
    ftLargeint, ftSmallint, ftInteger, ftWord, ftAutoInc:
      Result := 'Integer';
    ftFloat, ftCurrency:
      Result := 'Currency';
    ftTime:
      Result := 'TTime';
    ftDate, ftDateTime, ftTimeStamp:
      Result := 'TDateTime';
    ftBlob, ftMemo, ftWideMemo, ftOraBlob, ftOraClob:
      Result := 'TBlob';
    ftFMTBcd, ftBCD:
      Result := 'Double';
  else
    Result := 'variant';
  end;
end;

function TModelBuscaDadosBanco.SetPK: iModelBuscarDados;
var
  i: Integer;
  Campo: String;
begin
  Result := Self;
  with FQuery do
  begin
    Open('SELECT * FROM ' + FTable);
    BuscarPK(FTable);

    for i := 0 to Pred(FieldList.Count) do
    begin
      Campo := FieldList.Fields[i].FieldName;
      FCampo.PK := '';

      if FFields.TryGetValue(Campo, FCampo) then
      begin
        if FMetaTables.Locate('COLUMN_NAME', FCampo.Nome, [loCaseInsensitive]) then
          FCampo.PK := 'PK';

        FFields.AddOrSetValue(FCampo.Nome, FCampo);

        // TIRAR LOG
        Flog := FCampo.PK + sLineBreak + ' Field: ' + FCampo.Nome + sLineBreak + ' Tipo: ' +
          FCampo.Tipo + sLineBreak;
        exibiLog;
      end
      else
        raise Exception.Create('Erro o Campo: ' + Campo + ' não existe na tabela.');
    end;
  end;
end;

end.
