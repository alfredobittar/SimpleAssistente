unit CAIXAOPERACOES;

interface

uses
  SimpleAttributes;

Type
  TCAIXAOPERACOES = class
  private
    { Private declarations }
    FTIPO: Integer;
    FGUUID: String;
    FCAIXA: String;
    FDATAALTERACAO: TDateTime;
    FSTATUS: Integer;
    FFISCAL: String;
    FVALOR: Double;

    procedure SetTIPO(const Value: Integer);
    procedure SetGUUID(const Value: String);
    procedure SetCAIXA(const Value: String);
    procedure SetDATAALTERACAO(const Value: TDateTime);
    procedure SetSTATUS(const Value: Integer);
    procedure SetFISCAL(const Value: String);
    procedure SetVALOR(const Value: Double);
    function GetFTIPO: Integer;
    function GetFGUUID: String;
    function GetFCAIXA: String;
    function GetFDATAALTERACAO: TDateTime;
    function GetFSTATUS: Integer;
    function GetFFISCAL: String;
    function GetFVALOR: Double;

  published
    { published declarations }
    property TIPO: Integer read GetFTIPO write SetTIPO;
    [PK]
    property GUUID: String read GetFGUUID write SetGUUID;
    property CAIXA: String read GetFCAIXA write SetCAIXA;
    property DATAALTERACAO: TDateTime read GetFDATAALTERACAO write SetDATAALTERACAO;
    property STATUS: Integer read GetFSTATUS write SetSTATUS;
    property FISCAL: String read GetFFISCAL write SetFISCAL;
    property VALOR: Double read GetFVALOR write SetVALOR;

  public
    { Public declarations }

  end;

implementation

{ TCAIXAOPERACOES }

procedure TCAIXAOPERACOES.SetTIPO(const Value: Integer);
begin
  FTIPO := Value;
end;

procedure TCAIXAOPERACOES.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

procedure TCAIXAOPERACOES.SetCAIXA(const Value: String);
begin
  FCAIXA := Value;
end;

procedure TCAIXAOPERACOES.SetDATAALTERACAO(const Value: TDateTime);
begin
  FDATAALTERACAO := Value;
end;

procedure TCAIXAOPERACOES.SetSTATUS(const Value: Integer);
begin
  FSTATUS := Value;
end;

procedure TCAIXAOPERACOES.SetFISCAL(const Value: String);
begin
  FFISCAL := Value;
end;

procedure TCAIXAOPERACOES.SetVALOR(const Value: Double);
begin
  FVALOR := Value;
end;

function TCAIXAOPERACOES.GetFTIPO: Integer;
begin
  Result := FTIPO;
end;

function TCAIXAOPERACOES.GetFGUUID: String;
begin
  if aValue.Nome = '' then
    raise TValidaCampo.Create(GUUID, 'O campo GUUID não pode ser vazio!');

  Result := FGUUID;
end;

function TCAIXAOPERACOES.GetFCAIXA: String;
begin
  Result := FCAIXA;
end;

function TCAIXAOPERACOES.GetFDATAALTERACAO: TDateTime;
begin
  Result := FDATAALTERACAO;
end;

function TCAIXAOPERACOES.GetFSTATUS: Integer;
begin
  Result := FSTATUS;
end;

function TCAIXAOPERACOES.GetFFISCAL: String;
begin
  Result := FFISCAL;
end;

function TCAIXAOPERACOES.GetFVALOR: Double;
begin
  Result := FVALOR;
end;

end.
