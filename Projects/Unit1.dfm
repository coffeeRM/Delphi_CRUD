object EditCEP: TEditCEP
  Left = 0
  Top = 0
  Caption = 'Delphi_1'
  ClientHeight = 682
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 16
    Top = 24
    Width = 592
    Height = 233
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 18
    Top = 263
    Width = 590
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object Button1: TButton
    Left = 96
    Top = 320
    Width = 81
    Height = 41
    Caption = 'Incluir'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 320
    Width = 89
    Height = 41
    Caption = 'Editar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 328
    Top = 320
    Width = 89
    Height = 41
    Caption = 'Delete'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 448
    Top = 320
    Width = 83
    Height = 41
    Caption = 'Consulta'
    TabOrder = 5
    OnClick = Button4Click
  end
  object EditCEP: TEdit
    Left = 224
    Top = 392
    Width = 193
    Height = 23
    TabOrder = 6
    Text = 'EditCEP'
  end
  object ButtonConsultarCEP: TButton
    Left = 286
    Top = 421
    Width = 67
    Height = 25
    Caption = 'CEP'
    TabOrder = 7
    OnClick = ButtonConsultarCEPClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=teste_delphi'
      'User_Name=postgres'
      'Password=123'
      'Server=192.168.3.21'
      'DriverID=pG')
    Connected = True
    Left = 112
    Top = 472
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 112
    Top = 416
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'cliente'
    Left = 16
    Top = 416
    object FDTable1nome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object FDTable1cpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 11
    end
    object FDTable1logradouro: TWideStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 100
    end
    object FDTable1bairro: TWideStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object FDTable1uf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object FDTable1data_nascimento: TDateField
      FieldName = 'data_nascimento'
      Origin = 'data_nascimento'
    end
    object FDTable1cep: TWideStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 8
    end
    object FDTable1telefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
    object FDTable1localidade: TWideMemoField
      FieldName = 'localidade'
      Origin = 'localidade'
      BlobType = ftWideMemo
    end
    object FDTable1serial: TIntegerField
      FieldName = 'serial'
      Origin = 'serial'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 24
    Top = 472
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json'
    BaseURL = 'https://viacep.com.br'
    Params = <>
    SynchronizedEvents = False
    Left = 200
    Top = 472
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 472
    Top = 440
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'ctAPPLICATION_JSON'
    Left = 560
    Top = 440
  end
end
