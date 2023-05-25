program ControleFinanceiro;

uses
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  Forms,
  IWStart,
  Login in 'Login.pas' {FRMLOGIN: TIWAppForm},
  ServerController in 'ServerController.pas' {serv: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Menu in 'Menu.pas' {FRMMENU: TIWAppForm},
  Usuarios in 'Usuarios.pas' {FRMUSUARIOS: TIWAppForm},
  Fornecedores in 'Fornecedores.pas' {FRMFORNECEDORES: TIWAppForm},
  Produtos in 'Produtos.pas' {FRMPRODUTOS: TIWAppForm},
  Gastos in 'Gastos.pas' {FRMGASTOS: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
