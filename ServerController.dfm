object serv: Tserv
  OldCreateOrder = False
  AppName = 'MyApp'
  Description = 'My IntraWeb Application'
  DisplayName = 'IntraWeb Application'
  HTMLHeaders.Strings = (
    
      '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/' +
      'bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0i' +
      'XCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" cross' +
      'origin="anonymous">'
    
      '<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" i' +
      'ntegrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfR' +
      'vH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>'
    
      '<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.' +
      '14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KV' +
      'phtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymo' +
      'us"></script>'
    
      '<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/' +
      'js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoI' +
      'Iy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"' +
      '></script>')
  Port = 8888
  Version = '15.1.0'
  JavaScriptOptions.jQueryVersion = '1.12.4'
  SessionOptions.SessionTimeout = 10
  OnNewSession = IWServerControllerBaseNewSession
  Height = 361
  Width = 501
  object fd: TFDConnection
    Params.Strings = (
      'Database=financeiro'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object query_login: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from usuarios')
    Left = 112
    Top = 32
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
  object query_forn: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from fornecedores')
    Left = 176
    Top = 32
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
  object query_produtos: TFDQuery
    Connection = fd
    SQL.Strings = (
      
        'SELECT p.id, p.nome, p.descricao, p.valor, p.estoque, p.id_forne' +
        'cedor, p.imagem, f.nome as nome_forn FROM produtos as p INNER JO' +
        'IN fornecedores as f on p.id_fornecedor = f.id order by p.nome a' +
        'sc')
    Left = 248
    Top = 32
    object query_produtosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_produtosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
    end
    object query_produtosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 35
    end
    object query_produtosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_produtosestoque: TIntegerField
      FieldName = 'estoque'
      Origin = 'estoque'
      Required = True
    end
    object query_produtosid_fornecedor: TIntegerField
      FieldName = 'id_fornecedor'
      Origin = 'id_fornecedor'
      Required = True
    end
    object query_produtosimagem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'imagem'
      Origin = 'imagem'
      Size = 100
    end
    object query_produtosnome_forn: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_forn'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
  end
end
