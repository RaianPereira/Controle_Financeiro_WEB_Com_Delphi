unit Fornecedores;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWHTMLControls,
  IWCompEdit, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompButton, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRMFORNECEDORES = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    BTNNOVO: TIWButton;
    BTNCANCELAR: TIWButton;
    BTNEXCLUIR: TIWButton;
    txtId: TIWEdit;
    TXTNOME: TIWEdit;
    TXTPRODUTOS: TIWEdit;
    TXTTELEFONE: TIWEdit;
    BTNBUSCAR: TIWButton;
    TXTBUSCAR: TIWEdit;
    MENU: TIWLink;
    TXTENDERECO: TIWEdit;
    fd: TFDConnection;
    query_forn: TFDQuery;
    query_fornid: TFDAutoIncField;
    query_fornnome: TStringField;
    query_fornprodutos: TStringField;
    query_forntelefone: TStringField;
    query_fornendereco: TStringField;

     procedure limparCampos;
    procedure associarCampos();

    procedure buscarTudo();
    procedure buscarNome();
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNEXCLUIRClick(Sender: TObject);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure MENUClick(Sender: TObject);

  public
  end;

implementation

{$R *.dfm}

uses ServerController, Menu;


{ TFRMFORNECEDORES }

procedure TFRMFORNECEDORES.associarCampos;
begin
query_forn.FieldByName('nome').Value := txtnome.Text;
query_forn.FieldByName('produtos').Value := txtprodutos.Text;
query_forn.FieldByName('telefone').Value := txttelefone.Text;
query_forn.FieldByName('endereco').Value := txtendereco.text;

end;

procedure TFRMFORNECEDORES.BTNBUSCARClick(Sender: TObject);
begin
buscarnome;
end;

procedure TFRMFORNECEDORES.BTNCANCELARClick(Sender: TObject);
begin

WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''hide'');');

end;

procedure TFRMFORNECEDORES.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin

query_forn.Locate('id', txtid.Text, []);
query_forn.Edit;

if not query_forn.FieldByName('nome').IsNull then
txtnome.Text := query_forn.FieldByName('nome').Value;

if not query_forn.FieldByName('produtos').IsNull then
txtprodutos.Text := query_forn.FieldByName('produtos').Value;

if not query_forn.FieldByName('telefone').IsNull then
txttelefone.Text := query_forn.FieldByName('telefone').Value;

if not query_forn.FieldByName('endereco').IsNull then
txtendereco.text := query_forn.FieldByName('endereco').Value;


WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''show'');');

end;

procedure TFRMFORNECEDORES.BTNEXCLUIRClick(Sender: TObject);
begin
query_forn.Locate('id', txtid.Text, []);
query_forn.Delete;
buscarTudo;
end;

procedure TFRMFORNECEDORES.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
limparCampos;
query_forn.Insert;
WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''show'');');

end;

procedure TFRMFORNECEDORES.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
if Trim(txtnome.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Nome');
   txtnome.SetFocus;
   exit;
end;

if Trim(txtprodutos.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Produtos');
   txtprodutos.SetFocus;
   exit;
end;



associarCampos();
query_forn.Post;
limparCampos;
buscarTudo;
query_forn.Insert;

WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''hide'');');
WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');


end;

procedure TFRMFORNECEDORES.buscarNome;
begin
 query_forn.Close;
 query_forn.SQL.Clear;
 query_forn.SQL.Add('SELECT * from fornecedores where nome LIKE :nome order by nome asc');
 query_forn.ParamByName('nome').Value := txtbuscar.Text + '%';
    //query_login.ParamByName('senha').Value := txtSenha.Text;
 query_forn.Open();
end;

procedure TFRMFORNECEDORES.buscarTudo;
begin
    query_forn.Close;
    query_forn.SQL.Clear;
    query_forn.SQL.Add('SELECT * from fornecedores order by nome asc');
    //query_login.ParamByName('usuario').Value := txtUsuario.Text;
    //query_login.ParamByName('senha').Value := txtSenha.Text;
    serv.query_forn.Open();
end;

procedure TFRMFORNECEDORES.IWTemplateProcessorHTML1UnknownTag(
  const AName: string; var VValue: string);
begin
if AName = 'gridFornecedores' then
  begin


    buscarNome;



    while not query_forn.Eof do
    begin
      VValue := VValue +

      '<tr><td>' + query_forn.FieldByName('id').AsString + '</td>' +sLineBreak+
      '<td>' + query_forn.FieldByName('nome').AsString + '</td>' +sLineBreak+
      '<td>' + query_forn.FieldByName('produtos').AsString + '</td>' +sLineBreak+
      '<td>' + query_forn.FieldByName('telefone').AsString + '</td>' +sLineBreak+
      '<td>' + query_forn.FieldByName('endereco').AsString + '</td>' +sLineBreak+

      '<td>' + '<button type="button" class="btn btn-info mr-2" onclick="return pegarPosicao('+query_forn.FieldByName('id').AsString+', ''alterar'')">Editar</button>' +
      '<button type="button" class="btn btn-danger" onclick="return pegarPosicao('+query_forn.FieldByName('id').AsString+', ''excluir'')">Excluir</button>' +
      '</td>' +sLineBreak+ '</tr>';

      query_forn.Next;

    end;

  end;
end;

procedure TFRMFORNECEDORES.limparCampos;
begin
TXTtelefone.Text := '';
TXTendereco.Text := '';
TXTNOME.Text := '';
TXTPRODUTOS.Text := '';
end;

procedure TFRMFORNECEDORES.MENUClick(Sender: TObject);
begin
 TFRMMENU.Create(webApplication).Show;
end;

end.
