unit CAIXA;

interface

uses
  SimpleAttributes;

Type
  TCAIXA = class
  private
    { Private declarations }
    FFISCAL_FECHAMENTO: String;
    FOPERADOR: String;
    FVALORABERTURA: Double;
    FDATAABERTURA: TDateTime;
    FGUUID: String;
    FDATAALTERACAO: TDateTime;
    FFISCAL_ABERTURA: String;
    FSTATUS: Integer;
    FVALORFECHAMENTO: Double;
    FDATAFECHAMENTO: TDateTime;

    procedure SetFISCAL_FECHAMENTO(const Value: String);
    procedure SetOPERADOR(const Value: String);
    procedure SetVALORABERTURA(const Value: Double);
    procedure SetDATAABERTURA(const Value: TDateTime);
    procedure SetGUUID(const Value: String);
    procedure SetDATAALTERACAO(const Value: TDateTime);
    procedure SetFISCAL_ABERTURA(const Value: String);
    procedure SetSTATUS(const Value: Integer);
    procedure SetVALORFECHAMENTO(const Value: Double);
    procedure SetDATAFECHAMENTO(const Value: TDateTime);
    function GetFFISCAL_FECHAMENTO: String;
    function GetFOPERADOR: String;
    function GetFVALORABERTURA: Double;
    function GetFDATAABERTURA: TDateTime;
    function GetFGUUID: String;
    function GetFDATAALTERACAO: TDateTime;
    function GetFFISCAL_ABERTURA: String;
    function GetFSTATUS: Integer;
    function GetFVALORFECHAMENTO: Double;
    function GetFDATAFECHAMENTO: TDateTime;

  published
    { published declarations }
    property FISCAL_FECHAMENTO: String read GetFFISCAL_FECHAMENTO write SetFISCAL_FECHAMENTO;
    property OPERADOR: String read GetFOPERADOR write SetOPERADOR;
    property VALORABERTURA: Double read GetFVALORABERTURA write SetVALORABERTURA;
    [PK]
    property DATAABERTURA: TDateTime read GetFDATAABERTURA write SetDATAABERTURA;
    [PK]
    property GUUID: String read GetFGUUID write SetGUUID;
    property DATAALTERACAO: TDateTime read GetFDATAALTERACAO write SetDATAALTERACAO;
    property FISCAL_ABERTURA: String read GetFFISCAL_ABERTURA write SetFISCAL_ABERTURA;
    [PK]
    property STATUS: Integer read GetFSTATUS write SetSTATUS;
    property VALORFECHAMENTO: Double read GetFVALORFECHAMENTO write SetVALORFECHAMENTO;
    property DATAFECHAMENTO: TDateTime read GetFDATAFECHAMENTO write SetDATAFECHAMENTO;

  public
    { Public declarations }

  end;

implementation

{ TCAIXA }

procedure TCAIXA.SetFISCAL_FECHAMENTO(const Value: String);
begin
  FFISCAL_FECHAMENTO := Value;
end;

procedure TCAIXA.SetOPERADOR(const Value: String);
begin
  FOPERADOR := Value;
end;

procedure TCAIXA.SetVALORABERTURA(const Value: Double);
begin
  FVALORABERTURA := Value;
end;

procedure TCAIXA.SetDATAABERTURA(const Value: TDateTime);
begin
  FDATAABERTURA := Value;
end;

procedure TCAIXA.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

procedure TCAIXA.SetDATAALTERACAO(const Value: TDateTime);
begin
  FDATAALTERACAO := Value;
end;

procedure TCAIXA.SetFISCAL_ABERTURA(const Value: String);
begin
  FFISCAL_ABERTURA := Value;
end;

procedure TCAIXA.SetSTATUS(const Value: Integer);
begin
  FSTATUS := Value;
end;

procedure TCAIXA.SetVALORFECHAMENTO(const Value: Double);
begin
  FVALORFECHAMENTO := Value;
end;

procedure TCAIXA.SetDATAFECHAMENTO(const Value: TDateTime);
begin
  FDATAFECHAMENTO := Value;
end;

function TCAIXA.GetFFISCAL_FECHAMENTO: String;
begin
  Result := FFISCAL_FECHAMENTO;
end;

function TCAIXA.GetFOPERADOR: String;
begin
  Result := FOPERADOR;
end;

function TCAIXA.GetFVALORABERTURA: Double;
begin
  Result := FVALORABERTURA;
end;

function TCAIXA.GetFDATAABERTURA: TDateTime;
begin
  if aValue.Nome = '' then
    raise TValidaCampo.Create(DATAABERTURA, 'O campo DATAABERTURA não pode ser vazio!');

  Result := FDATAABERTURA;
end;

function TCAIXA.GetFGUUID: String;
begin
  if aValue.Nome = '' then
    raise TValidaCampo.Create(GUUID, 'O campo GUUID não pode ser vazio!');

  Result := FGUUID;
end;

function TCAIXA.GetFDATAALTERACAO: TDateTime;
begin
  Result := FDATAALTERACAO;
end;

function TCAIXA.GetFFISCAL_ABERTURA: String;
begin
  Result := FFISCAL_ABERTURA;
end;

function TCAIXA.GetFSTATUS: Integer;
begin
  if aValue.Nome = '' then
    raise TValidaCampo.Create(STATUS, 'O campo STATUS não pode ser vazio!');

  Result := FSTATUS;
end;

function TCAIXA.GetFVALORFECHAMENTO: Double;
begin
  Result := FVALORFECHAMENTO;
end;

function TCAIXA.GetFDATAFECHAMENTO: TDateTime;
begin
  Result := FDATAFECHAMENTO;
end;

end.
