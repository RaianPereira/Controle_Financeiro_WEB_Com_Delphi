unit Usuarios;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWCompEdit, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls,
  IWCompListbox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRMUSUARIOS = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    MENU: TIWLink;
    TXTBUSCAR: TIWEdit;
    BTNBUSCAR: TIWButton;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    BTNNOVO: TIWButton;
    BTNCANCELAR: TIWButton;
    BTNEXCLUIR: TIWButton;
    txtId: TIWEdit;
    TXTNOME: TIWEdit;
    TXTUSUARIO: TIWEdit;
    TXTSENHA: TIWEdit;
    CBNIVEL: TIWComboBox;
    fd: TFDConnection;
    query_login: TFDQuery;
    query_loginid: TFDAutoIncField;
    query_loginnome: TStringField;
    query_loginusuario: TStringField;
    query_loginsenha: TStringField;
    query_loginnivel: TStringField;
    procedure MENUClick(Sender: TObject);
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);

    procedure limparCampos;
    procedure associarCampos();

    procedure buscarTudo();
    procedure buscarNome();
    procedure carregarCombobox();

    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure BTNEXCLUIRClick(Sender: TObject);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure CBNIVELAsyncEnter(Sender: TObject; EventParams: TStringList);
    procedure BTNCANCELARClick(Sender: TObject);

  public
  end;

implementation

{$R *.dfm}

uses Menu, ServerController;


procedure TFRMUSUARIOS.associarCampos;
begin
query_login.FieldByName('nome').Value := txtnome.Text;
query_login.FieldByName('usuario').Value := txtusuario.Text;
query_login.FieldByName('senha').Value := txtsenha.Text;
query_login.FieldByName('nivel').Value := cbNivel.text;


end;

procedure TFRMUSUARIOS.BTNBUSCARClick(Sender: TObject);
begin
buscarNome;
end;

procedure TFRMUSUARIOS.BTNCANCELARClick(Sender: TObject);
begin

WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''hide'');');


end;

procedure TFRMUSUARIOS.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin


query_login.Locate('id', txtid.Text, []);
query_login.Edit;

if not query_login.FieldByName('nome').IsNull then
txtnome.Text := query_login.FieldByName('nome').Value;

if not query_login.FieldByName('usuario').IsNull then
txtusuario.Text := query_login.FieldByName('usuario').Value;

if not serv.query_login.FieldByName('senha').IsNull then
txtsenha.Text := serv.query_login.FieldByName('senha').Value;

if not query_login.FieldByName('nivel').IsNull then
CBnivel.Items[0] := query_login.FieldByName('nivel').Value;
cbnivel.ItemIndex := 0;

WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''show'');');


end;

procedure TFRMUSUARIOS.BTNEXCLUIRClick(Sender: TObject);
begin
query_login.Locate('id', txtid.Text, []);
query_login.Delete;
buscarTudo;
end;

procedure TFRMUSUARIOS.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
limparCampos;
query_login.Insert;
WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''show'');');

end;

procedure TFRMUSUARIOS.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin

if Trim(txtnome.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Nome');
   txtnome.SetFocus;
   exit;
end;

if Trim(txtsenha.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Senha');
   txtsenha.SetFocus;
   exit;
end;

if Trim(txtusuario.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Usuario');
   txtusuario.SetFocus;
   exit;
end;

associarCampos();
query_login.Post;
limparCampos;
buscarTudo;
query_login.Insert;

WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''hide'');');
WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');


end;

procedure TFRMUSUARIOS.buscarNome;
begin
   query_login.Close;
    query_login.SQL.Clear;
    query_login.SQL.Add('SELECT * from usuarios where nome LIKE :nome order by nome asc');
    query_login.ParamByName('nome').Value := txtbuscar.Text + '%';
   // query_login.ParamByName('senha').Value := txtSenha.Text;
    query_login.Open();
end;

procedure TFRMUSUARIOS.buscarTudo;
begin
   query_login.Close;
    query_login.SQL.Clear;
    query_login.SQL.Add('SELECT * from usuarios order by nome asc');
    //query_login.ParamByName('usuario').Value := txtUsuario.Text;
    //query_login.ParamByName('senha').Value := txtSenha.Text;
    query_login.Open();
end;

procedure TFRMUSUARIOS.carregarCombobox;
begin
cbNivel.Items.Clear;
cbNivel.Items.Add('Admin');
cbNivel.Items.Add('Gerente');
cbNivel.Items.Add('Usu�rio');
end;

procedure TFRMUSUARIOS.CBNIVELAsyncEnter(Sender: TObject;
  EventParams: TStringList);
begin
carregarCombobox;
end;

procedure TFRMUSUARIOS.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin

if AName = 'gridUsuarios' then
  begin


    buscarNome;



    while not query_login.Eof do
    begin
      VValue := VValue +

      '<tr><td>' + query_login.FieldByName('id').AsString + '</td>' +sLineBreak+
      '<td>' + query_login.FieldByName('nome').AsString + '</td>' +sLineBreak+
      '<td>' + query_login.FieldByName('usuario').AsString + '</td>' +sLineBreak+
      '<td>' + query_login.FieldByName('senha').AsString + '</td>' +sLineBreak+
      '<td>' + query_login.FieldByName('nivel').AsString + '</td>' +sLineBreak+

      '<td>' + '<button type="button" class="btn btn-info mr-2" onclick="return pegarPosicao('+query_login.FieldByName('id').AsString+', ''alterar'')">Editar</button>' +
      '<button type="button" class="btn btn-danger" onclick="return pegarPosicao('+query_login.FieldByName('id').AsString+', ''excluir'')">Excluir</button>' +
      '</td>' +sLineBreak+ '</tr>';

      query_login.Next;

    end;

  end;

end;

procedure TFRMUSUARIOS.limparCampos;
begin
TXTUSUARIO.Text := '';
TXTSENHA.Text := '';
TXTNOME.Text := '';
CBNIVEL.ItemIndex := 0;
end;

procedure TFRMUSUARIOS.MENUClick(Sender: TObject);
begin
 TFRMMENU.Create(webApplication).Show;
end;

end.
