unit Gastos;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  IWHTMLControls, IWCompEdit, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IwHtmlTag,
  IWCompLabel;

type
  TFRMGASTOS = class(TIWAppForm)
    fd: TFDConnection;
    query_gastos: TFDQuery;
    query_gastosid: TFDAutoIncField;
    query_gastosmotivo: TStringField;
    query_gastosvalor: TBCDField;
    query_gastosfuncionario: TStringField;
    query_gastosdata: TDateField;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    BTNBUSCAR: TIWButton;
    TXTBUSCAR: TIWEdit;
    MENU: TIWLink;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    BTNNOVO: TIWButton;
    BTNCANCELAR: TIWButton;
    BTNEXCLUIR: TIWButton;
    TXTMOTIVO: TIWEdit;
    TXTVALOR: TIWEdit;
    txtId: TIWEdit;
    LBLTOTAL: TIWLabel;
    query_coringa: TFDQuery;
    procedure TXTVALORAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;


      var VValue: string);
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure MENUClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNEXCLUIRClick(Sender: TObject);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure TXTBUSCARHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure IWAppFormCreate(Sender: TObject);
  public

    procedure limparCampos;
    procedure associarCampos();


    procedure buscarData();
    procedure buscarDataAtual();
    procedure totalizar();

  end;

implementation

{$R *.dfm}

uses ServerController, Menu;


procedure TFRMGASTOS.associarCampos;
begin
query_gastos.FieldByName('motivo').Value := txtMotivo.Text;
query_gastos.FieldByName('funcionario').Value := nomeUsuario;
query_gastos.FieldByName('valor').Value := txtvalor.Text;
query_gastos.FieldByName('data').Value := Date;

end;

procedure TFRMGASTOS.BTNBUSCARClick(Sender: TObject);
begin
buscarData;
end;

procedure TFRMGASTOS.BTNCANCELARClick(Sender: TObject);
begin

WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''hide'');');

end;

procedure TFRMGASTOS.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin

query_gastos.Locate('id', txtid.Text, []);
query_gastos.Edit;

txtValor.Enabled := false;

txtmotivo.Text := query_gastos.FieldByName('motivo').Value;
txtvalor.Text := query_gastos.FieldByName('valor').Value;


WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''show'');');

end;

procedure TFRMGASTOS.BTNEXCLUIRClick(Sender: TObject);
begin
query_gastos.Locate('id', txtid.Text, []);
query_gastos.Delete;
buscarDataAtual;
end;

procedure TFRMGASTOS.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
query_gastos.Active := true;
limparCampos;
query_gastos.Insert;
WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''show'');');
txtValor.Enabled := true;
end;

procedure TFRMGASTOS.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
if Trim(txtmotivo.Text) = '' then
begin
   webApplication.ShowMessage('Preencha o Campo Usuario');
   txtmotivo.SetFocus;
   exit;
   txtValor.Enabled := true;
end;

associarCampos();
query_gastos.Post;
limparCampos;
buscarDataAtual;
query_gastos.Insert;

WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EditaDados'').modal(''hide'');');
WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');

end;

procedure TFRMGASTOS.buscarData;
begin
query_gastos.Active := false;
query_gastos.Active := true;
query_gastos.SQL.Clear;
query_gastos.SQL.Add('SELECT * FROM gastos where data = :data');

if txtBuscar.Text = '' then
begin
query_gastos.ParamByName('data').Value := Date;
end
else
begin
query_gastos.ParamByName('data').Value := txtBuscar.Text;

end;


query_gastos.Open();
query_gastos.First;

totalizar;
end;



procedure TFRMGASTOS.buscarDataAtual;
begin
query_gastos.Active := false;
query_gastos.Active := true;
query_gastos.SQL.Clear;
query_gastos.SQL.Add('SELECT * FROM gastos where data = curDate()');

query_gastos.Open();
query_gastos.First;

totalizar;
end;

procedure TFRMGASTOS.IWAppFormCreate(Sender: TObject);
begin
totalizar;
end;

procedure TFRMGASTOS.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin
if AName = 'gridGastos' then
  begin



    buscarData;



    while not query_gastos.Eof do
    begin
      VValue := VValue +

      '<tr><td>' + query_gastos.FieldByName('motivo').AsString + '</td>' +sLineBreak+
       '<td>' + FormatFloat('R$ #,,,,0.00', query_gastos.FieldByName('valor').Value) + '</td>' +sLineBreak+
      '<td>' + query_gastos.FieldByName('funcionario').AsString + '</td>' +sLineBreak+
      '<td>' + query_gastos.FieldByName('data').AsString + '</td>' +sLineBreak+

      '<td>' + '<button type="button" class="btn btn-info mr-2" onclick="return pegarPosicao('+query_gastos.FieldByName('id').AsString+', ''alterar'')">Editar</button>' +
      '<button type="button" class="btn btn-danger" onclick="return pegarPosicao('+query_gastos.FieldByName('id').AsString+', ''excluir'')">Excluir</button>' +
      '</td>' +sLineBreak+ '</tr>';

      query_gastos.Next;

    end;

  end;
end;

procedure TFRMGASTOS.limparCampos;
begin
txtMotivo.Text := '';
txtValor.Text := '';
end;

procedure TFRMGASTOS.MENUClick(Sender: TObject);


begin
 TFRMMENU.Create(webApplication).Show;
end;




procedure TFRMGASTOS.totalizar;
var
total: double;
begin
query_coringa.Close;
query_coringa.SQL.Clear;
query_coringa.SQL.Add('select sum(valor) as total from gastos where data = :data');

if txtBuscar.Text = '' then
begin
query_coringa.ParamByName('data').Value := Date;
end
else
begin
query_coringa.ParamByName('data').Value := txtBuscar.Text;

end;


query_coringa.Open();
total := query_coringa.FieldByName('total').AsFloat;
lblTotal.Caption := FormatFloat('R$ #,,,,0.00', total);

end;

procedure TFRMGASTOS.TXTBUSCARHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
ATag.AddStringParam('type', 'date');

end;

procedure TFRMGASTOS.TXTVALORAsyncChange(Sender: TObject;
  EventParams: TStringList);
var
  numero : double;
begin

if not TryStrToFloat(txtValor.Text, numero) then
  begin
  webApplication.ShowMessage('Digite Apenas N�meros!');
  txtValor.Text := '';
  txtValor.SetFocus;
  end;


end;

end.
