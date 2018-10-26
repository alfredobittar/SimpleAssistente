unit SimpleAssistente.View.CriarClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  SimpleAssistente.Model.Interfaces, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    CardPanel1: TCardPanel;
    Card2: TCard;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Label1: TLabel;
    boxTables: TComboBox;
    Panel5: TPanel;
    Button1: TButton;
    Fields: TButton;
    Button2: TButton;
    Panel9: TPanel;
    Memo1: TMemo;
    DataSource1: TDataSource;
    metaInfo: TFDMetaInfoQuery;
    FCon: TFDConnection;
    FDQuery1: TFDQuery;
    MetaFields: TFDMetaInfoQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Card1: TCard;
    pnlFundo: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    pnlMenu: TPanel;
    pnlTables: TPanel;
    pnlFields: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    lstTables: TListBox;
    lstCampos: TListBox;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure boxInfoKindChange(Sender: TObject);
    procedure FieldsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lstTablesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FFactory: iModelFactory;
    FController: iController;
    procedure SetList;
    function BuscarCampo: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  SimpleAssistente.Model.Factory, System.TypInfo, System.Generics.Collections,
  SimpleAssistente.Controller.Factory;

{$R *.dfm}

procedure TfrmPrincipal.boxInfoKindChange(Sender: TObject);
begin
  FFactory.BuscaDadosBanco.GetTable(boxTables);
end;

procedure TfrmPrincipal.FieldsClick(Sender: TObject);
var
  teste: string;
  I: Integer;
begin
  if boxTables.ItemIndex <> -1 then
  begin
    FFactory.BuscaDadosBanco.Log(Memo1).BuscarCampo(boxTables.Items[boxTables.ItemIndex]);
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
  FController := TControllerFactory.New.Controller;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  FCon.GetTableNames(FCon.Params.Database, '', '', boxTables.Items);
end;

procedure TfrmPrincipal.lstTablesClick(Sender: TObject);
begin
  metaInfo.Connection.GetFieldNames('', '', lstTables.Items.Strings[lstTables.ItemIndex], '',
    lstCampos.Items);
end;

procedure TfrmPrincipal.SetList;
begin
  lstTables.AddItem();
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FController.BuscarDados
             .GetTable(boxTables);
 SetList;

  { with metaInfo do
    try
    Connection   := FCon;
    ObjectScopes := [osMy];
    TableKinds   := [tkTable, tkView];
    CatalogName  := '';
    Active       := True;
    First;

    if not isEmpty then
    begin
    lstTabelas.Items.Clear;

    repeat
    Application.ProcessMessages;

    lstTabelas.Items.Add( FieldByName('TABLE_NAME').AsString );

    Next;
    until Eof;
    end;

    finally
    Free;
    end }

end;

end.
