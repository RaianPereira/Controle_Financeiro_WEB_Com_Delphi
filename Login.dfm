object FRMLOGIN: TFRMLOGIN
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  PreventBackButton = True
  Background.Fixed = False
  LayoutMgr = IWTemplateProcessorHTML1
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 2
  DesignTop = 2
  object BTNLOGIN: TIWButton
    Left = 456
    Top = 16
    Width = 75
    Height = 25
    Css = 'btn btn-lg btn-primary btn-block btn-signin'
    Caption = 'LOGIN'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNLOGIN'
    TabOrder = 0
    OnAsyncClick = BTNLOGINAsyncClick
  end
  object TXTUSUARIO: TIWEdit
    Left = 304
    Top = 20
    Width = 121
    Height = 21
    Hint = 'Insira o Usu'#225'rio'
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTUSUARIO'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object TXTSENHA: TIWEdit
    Left = 304
    Top = 47
    Width = 121
    Height = 21
    Hint = 'Insira a Senha'
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTUSUARIO'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    PasswordPrompt = True
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    RenderStyles = False
    Left = 64
    Top = 24
  end
  object fd: TFDConnection
    Params.Strings = (
      'Database=financeiro'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 96
  end
  object query_login: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from usuarios')
    Left = 112
    Top = 96
    object query_loginid: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_loginnome: TStringField
      DisplayWidth = 20
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object query_loginusuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
    end
    object query_loginsenha: TStringField
      DisplayWidth = 10
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
    end
    object query_loginnivel: TStringField
      DisplayWidth = 15
      FieldName = 'nivel'
      Origin = 'nivel'
      Required = True
    end
  end
end
