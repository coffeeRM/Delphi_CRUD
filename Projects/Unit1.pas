unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Menus, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON;

type
  TEditCEP = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDTable1: TFDTable;
    FDTable1nome: TWideStringField;
    FDTable1cpf: TWideStringField;
    FDTable1logradouro: TWideStringField;
    FDTable1bairro: TWideStringField;
    FDTable1uf: TWideStringField;
    FDTable1data_nascimento: TDateField;
    FDTable1cep: TWideStringField;
    FDTable1telefone: TWideStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    EditCEP: TEdit;
    ButtonConsultarCEP: TButton;
    FDTable1localidade: TWideMemoField;
    FDTable1serial: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonConsultarCEPClick(Sender: TObject);
    procedure CarregarEndereco(CEP: string);

  public
    { Public declarations }
  end;

var
  EditCEP: TEditCEP;

implementation

{$R *.dfm}

procedure TEditCEP.FormCreate(Sender: TObject);
begin
  FDConnection1.Open;
  FDTable1.Open;
end;

procedure TEditCEP.Button1Click(Sender: TObject);
begin
  FDTable1.Append;
end;

procedure TEditCEP.Button2Click(Sender: TObject);
begin
  FDTable1.Edit;
end;

procedure TEditCEP.Button3Click(Sender: TObject);
begin
  FDTable1.Delete;
end;

procedure TEditCEP.Button4Click(Sender: TObject);
var
  InputValue: string;
begin
  InputValue := InputBox('Consulta', 'Digite o valor para consulta:', '');

  FDTable1.Filtered := False;
  FDTable1.Filter := 'nome LIKE ''%' + InputValue + '%'' OR cpf LIKE ''%' + InputValue + '%''';
  FDTable1.Filtered := True;
end;

procedure TEditCEP.ButtonConsultarCEPClick(Sender: TObject);
var
  CEP: string;
begin
  CEP := EditCEP.Text;
  if CEP <> '' then
    CarregarEndereco(CEP);
end;

procedure TEditCEP.CarregarEndereco(CEP: string);
var
  JSONValue: TJSONValue;
  JSONObj: TJSONObject;
begin
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + CEP + '/json/';
  RESTRequest1.Execute;

  if RESTResponse1.StatusCode = 200 then
  begin
    JSONValue := TJSONObject.ParseJSONValue(RESTResponse1.Content);
    try
     if JSONValue is TJSONObject then
     begin
      JSONObj := TJSONObject(JSONValue);
      FDTable1.Append;
      FDTable1.FieldByName('cep').AsString := JSONObj.GetValue('cep').Value;
      FDTable1.FieldByName('localidade').AsString := JSONObj.GetValue('localidade').Value;
      FDTable1.FieldByName('logradouro').AsString := JSONObj.GetValue('logradouro').Value;
      FDTable1.FieldByName('bairro').AsString := JSONObj.GetValue('bairro').Value;
      FDTable1.FieldByName('uf').AsString := JSONObj.GetValue('uf').Value;
      FDTable1.Post;
     end;
    finally
      FreeAndNil(JSONValue);
    end;

  end;
end;

end.

