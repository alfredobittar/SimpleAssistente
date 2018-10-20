unit SimpleAssistente.View.CriarClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  SimpleAssistente.Model.Interfaces, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    metaInfo: TFDMetaInfoQuery;
    FCon: TFDConnection;
    FDQuery1: TFDQuery;
    Panel2: TPanel;
    Panel3: TPanel;
    boxTables: TComboBox;
    Label1: TLabel;
    Panel4: TPanel;
    Button1: TButton;
    Fields: TButton;
    Button2: TButton;
    Panel5: TPanel;
    Memo1: TMemo;
    MetaFields: TFDMetaInfoQuery;
    DataSource2: TDataSource;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DataSource3: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure boxInfoKindChange(Sender: TObject);
    procedure FieldsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FFactory: iModelFactory;
    lbxFields: TStringList;
    { Private declarations }
    function BuscarCampo: string;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  SimpleAssistente.Model.Factory, System.TypInfo, System.Generics.Collections;

{$R *.dfm}

procedure TfrmPrincipal.boxInfoKindChange(Sender: TObject);
begin
  FFactory.BuscaDadosBanco
          .GetTable(boxTables);
end;

procedure TfrmPrincipal.FieldsClick(Sender: TObject);
var
  teste: string;
  I: Integer;
begin
  if boxTables.ItemIndex <> -1 then
  begin
    FFactory.BuscaDadosBanco
            .Log(Memo1)
            .BuscarCampo(boxTables.Items[boxTables.ItemIndex]);
  end
  else
    ShowMessage('Por favor! Escolha uma tabela.');
end;

function TfrmPrincipal.BuscarCampo: string;
begin

end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  tabela: string;
  campo: TStrings;
  I: Integer;

begin
  tabela := 'Caixa';
  if boxTables.ItemIndex <> -1 then
  begin

    with MetaFields do
    begin
      Close;
      IndexFieldNames := '';
      BaseObjectName := 'caixa';
      MetaInfoKind := mkPrimaryKeyFields;
      Open;
    end;

  end
  else
    ShowMessage('Por favor! Escolha uma tabela.');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FFactory := TModelFactory.New;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  FCon.GetTableNames(FCon.Params.Database, '', '', boxTables.Items);
end;

end.
