unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  UserSessionUnit, IWApplication, IWAppForm, IW.Browser.Browser, 
  IW.HTTP.Request, IW.HTTP.Reply, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet;

type
  Tserv = class(TIWServerControllerBase)
    fd: TFDConnection;
    query_login: TFDQuery;
    query_loginid: TFDAutoIncField;
    query_loginnome: TStringField;
    query_loginusuario: TStringField;
    query_loginsenha: TStringField;
    query_loginnivel: TStringField;
    query_forn: TFDQuery;
    query_fornid: TFDAutoIncField;
    query_fornnome: TStringField;
    query_fornprodutos: TStringField;
    query_forntelefone: TStringField;
    query_fornendereco: TStringField;
    query_produtos: TFDQuery;
    query_produtosid: TFDAutoIncField;
    query_produtosnome: TStringField;
    query_produtosdescricao: TStringField;
    query_produtosvalor: TBCDField;
    query_produtosestoque: TIntegerField;
    query_produtosid_fornecedor: TIntegerField;
    query_produtosimagem: TStringField;
    query_produtosnome_forn: TStringField;
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);

  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

  function UserSession: TIWUserSession;
  function serv: Tserv;

  var
  nomeUsuario : string;
  nivelUsuario : string;

implementation

{$R *.dfm}

uses
  IWInit, IWGlobal;

function serv: Tserv;
begin
  Result := Tserv(GServerController);
end;



function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

{ TIWServerController }

procedure Tserv.IWServerControllerBaseNewSession(
  ASession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil, ASession);
end;

initialization
  Tserv.SetServerControllerClass;

end.

