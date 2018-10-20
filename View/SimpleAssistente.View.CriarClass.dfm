object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 490
  ClientWidth = 982
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 982
    Height = 490
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 49
      Width = 980
      Height = 248
      Align = alTop
      Caption = 'Panel2'
      TabOrder = 0
      object Panel6: TPanel
        Left = 642
        Top = 1
        Width = 337
        Height = 246
        Align = alRight
        Caption = 'Panel6'
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 1
          Top = 1
          Width = 335
          Height = 244
          Align = alClient
          DataSource = DataSource3
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 288
        Height = 246
        Align = alLeft
        Caption = 'Panel6'
        TabOrder = 1
        object DBGrid3: TDBGrid
          Left = 1
          Top = 1
          Width = 286
          Height = 244
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object Panel8: TPanel
        Left = 289
        Top = 1
        Width = 353
        Height = 246
        Align = alClient
        Caption = 'Panel6'
        TabOrder = 2
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 351
          Height = 244
          Align = alClient
          DataSource = DataSource2
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 980
      Height = 48
      Align = alTop
      Color = clInactiveCaption
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 978
        Height = 16
        Align = alTop
        Caption = 'TABELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 49
      end
      object boxTables: TComboBox
        Left = 1
        Top = 17
        Width = 978
        Height = 21
        Align = alTop
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 453
      Width = 980
      Height = 36
      Align = alBottom
      Color = clInactiveCaption
      ParentBackground = False
      TabOrder = 2
      object Button1: TButton
        Left = 8
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Model'
        TabOrder = 0
      end
      object Fields: TButton
        Left = 642
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Fields'
        TabOrder = 1
        OnClick = FieldsClick
      end
      object Button2: TButton
        Left = 711
        Top = 6
        Width = 75
        Height = 25
        Caption = 'PK'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 297
      Width = 980
      Height = 156
      Align = alClient
      TabOrder = 3
      object Memo1: TMemo
        Left = 1
        Top = 1
        Width = 978
        Height = 154
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = metaInfo
    Left = 152
    Top = 72
  end
  object metaInfo: TFDMetaInfoQuery
    Active = True
    Connection = FCon
    Left = 152
    Top = 136
  end
  object FCon: TFDConnection
    Params.Strings = (
      'Database=D:\Delphi\Exemplos\Dup20\Database\PDVUPDATES.FDB'
      'DriverID=FB'
      'Password=masterkey'
      'Server=localhost'
      'User_Name=sysdba')
    Connected = True
    LoginPrompt = False
    Left = 664
    Top = 176
  end
  object FDQuery1: TFDQuery
    Connection = FCon
    Left = 784
    Top = 136
  end
  object MetaFields: TFDMetaInfoQuery
    Active = True
    Connection = FCon
    Left = 489
    Top = 137
  end
  object DataSource2: TDataSource
    DataSet = MetaFields
    Left = 481
    Top = 65
  end
  object DataSource3: TDataSource
    DataSet = FDQuery1
    Left = 787
    Top = 82
  end
end
