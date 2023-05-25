object FRMUSUARIOS: TFRMUSUARIOS
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  BGColor = clWebWHITESMOKE
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
  object MENU: TIWLink
    Left = 448
    Top = 16
    Width = 97
    Height = 17
    Css = 'navbar-brand'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'MENU'
    OnClick = MENUClick
    TabOrder = 0
    RawText = False
    Caption = 'Menu Principal'
  end
  object TXTBUSCAR: TIWEdit
    Left = 272
    Top = 16
    Width = 121
    Height = 21
    Hint = 'BUSCAR'
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTBUSCAR'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object BTNBUSCAR: TIWButton
    Left = 272
    Top = 43
    Width = 75
    Height = 25
    Css = 'btn btn-outline-light'
    Caption = 'Buscar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNBUSCAR'
    TabOrder = 2
    OnClick = BTNBUSCARClick
  end
  object BTNSALVAR: TIWButton
    Left = 448
    Top = 96
    Width = 75
    Height = 25
    Css = 'btn btn-success'
    Caption = 'Salvar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNSALVAR'
    TabOrder = 3
    OnAsyncClick = BTNSALVARAsyncClick
  end
  object BTNEDITAR: TIWButton
    Left = 448
    Top = 127
    Width = 75
    Height = 25
    Css = 'btn btn-primary'
    Caption = 'Editar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNEDITAR'
    TabOrder = 4
    OnAsyncClick = BTNEDITARAsyncClick
  end
  object BTNNOVO: TIWButton
    Left = 448
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Novo'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNNOVO'
    TabOrder = 5
    OnAsyncClick = BTNNOVOAsyncClick
  end
  object BTNCANCELAR: TIWButton
    Left = 448
    Top = 189
    Width = 75
    Height = 25
    Css = 'btn btn-secondary'
    Caption = 'Cancelar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNCANCELAR'
    TabOrder = 6
    OnClick = BTNCANCELARClick
  end
  object BTNEXCLUIR: TIWButton
    Left = 448
    Top = 215
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Confirmation = 'Deseja Excluir?'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNEXCLUIR'
    TabOrder = 7
    OnClick = BTNEXCLUIRClick
  end
  object txtId: TIWEdit
    Left = 40
    Top = 100
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'txtId'
    SubmitOnAsyncEvent = True
    TabOrder = 8
    Text = 'TXTID'
  end
  object TXTNOME: TIWEdit
    Left = 64
    Top = 168
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNOME'
    SubmitOnAsyncEvent = True
    TabOrder = 9
  end
  object TXTUSUARIO: TIWEdit
    Left = 64
    Top = 195
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNOME'
    SubmitOnAsyncEvent = True
    TabOrder = 10
  end
  object TXTSENHA: TIWEdit
    Left = 64
    Top = 222
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNOME'
    SubmitOnAsyncEvent = True
    TabOrder = 11
  end
  object CBNIVEL: TIWComboBox
    Left = 64
    Top = 256
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    OnAsyncEnter = CBNIVELAsyncEnter
    TabOrder = 12
    ItemIndex = -1
    Items.Strings = (
      'Usu'#225'rio'
      'Admin'
      'Gerente')
    FriendlyName = 'CBNIVEL'
    NoSelectionText = '-- No Selection --'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = IWTemplateProcessorHTML1UnknownTag
    RenderStyles = False
    Left = 80
    Top = 8
  end
  object fd: TFDConnection
    Params.Strings = (
      'Database=financeiro'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 344
  end
  object query_login: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from usuarios')
    Left = 96
    Top = 344
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
