unit Login;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton, IWCompEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRMLOGIN = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    BTNLOGIN: TIWButton;
    TXTUSUARIO: TIWEdit;
    TXTSENHA: TIWEdit;
    fd: TFDConnection;
    query_login: TFDQuery;
    query_loginid: TFDAutoIncField;
    query_loginnome: TStringField;
    query_loginusuario: TStringField;
    query_loginsenha: TStringField;
    query_loginnivel: TStringField;
    procedure BTNLOGINAsyncClick(Sender: TObject; EventParams: TStringList);

    procedure BTClick(Sender: TObject);
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, Menu;


procedure TFRMLOGIN.BTClick(Sender: TObject);
begin
 webApplication.ShowMessage('Preencha o Campo Usuário');
end;

procedure TFRMLOGIN.BTNLOGINAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin

if Trim(TXTUSUARIO.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Usuário');
   TXTUSUARIO.SetFocus;
   exit;
end;

if Trim(TXTSENHA.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Senha');
   TXTSENHA.SetFocus;
   exit;
end;


    query_login.Close;
    query_login.SQL.Clear;
    query_login.SQL.Add('SELECT * from usuarios where usuario = :usuario and senha = :senha');
    query_login.ParamByName('usuario').Value := txtUsuario.Text;
    query_login.ParamByName('senha').Value := txtSenha.Text;
    query_login.Open();

    if not query_login.IsEmpty then
    begin
     //RECUPERAR OS DADOS DO USUÁRIO LOGADO
     nomeUsuario := query_login['nome'];
     nivelUsuario := query_login['nivel'];

    //ABRIR PAGINA DO MENU
    TFRMMENU.Create(webApplication).Show;

       end
       else
       begin
        webApplication.ShowMessage('Dados Incorretos!!');
    end;

end;


procedure TFRMLOGIN.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin
 webApplication.ShowMessage('Dados Incorretos!!');
end;

initialization
  TFRMLOGIN.SetAsMainForm;

end.
