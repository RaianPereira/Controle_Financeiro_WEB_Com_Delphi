object FRMFORNECEDORES: TFRMFORNECEDORES
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
    TabOrder = 0
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
    TabOrder = 1
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
    TabOrder = 2
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
    TabOrder = 3
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
    TabOrder = 4
    OnClick = BTNEXCLUIRClick
  end
  object txtId: TIWEdit
    Left = 240
    Top = 100
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'txtId'
    SubmitOnAsyncEvent = True
    TabOrder = 5
    Text = 'TXTID'
  end
  object TXTNOME: TIWEdit
    Left = 240
    Top = 138
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNOME'
    SubmitOnAsyncEvent = True
    TabOrder = 6
  end
  object TXTPRODUTOS: TIWEdit
    Left = 240
    Top = 165
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTPRODUTOS'
    SubmitOnAsyncEvent = True
    TabOrder = 7
  end
  object TXTTELEFONE: TIWEdit
    Left = 240
    Top = 192
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTTELEFONE'
    SubmitOnAsyncEvent = True
    TabOrder = 8
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
    TabOrder = 9
    OnClick = BTNBUSCARClick
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
    TabOrder = 10
  end
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
    TabOrder = 11
    RawText = False
    Caption = 'Menu Principal'
  end
  object TXTENDERECO: TIWEdit
    Left = 240
    Top = 219
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTTELEFONE'
    SubmitOnAsyncEvent = True
    TabOrder = 12
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = IWTemplateProcessorHTML1UnknownTag
    RenderStyles = False
    Left = 56
    Top = 32
  end
  object fd: TFDConnection
    Params.Strings = (
      'Database=financeiro'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 336
  end
  object query_forn: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from fornecedores')
    Left = 64
    Top = 336
    object query_fornid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_fornnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object query_fornprodutos: TStringField
      FieldName = 'produtos'
      Origin = 'produtos'
      Required = True
      Size = 30
    end
    object query_forntelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object query_fornendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 30
    end
  end
end
