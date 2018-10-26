object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 490
  ClientWidth = 933
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
  object CardPanel1: TCardPanel
    Left = 0
    Top = 0
    Width = 933
    Height = 490
    Align = alClient
    ActiveCard = Card1
    Caption = 'CardPanel1'
    TabOrder = 0
    ExplicitLeft = 256
    ExplicitTop = 192
    ExplicitWidth = 300
    ExplicitHeight = 200
    object Card1: TCard
      Left = 1
      Top = 1
      Width = 931
      Height = 488
      Caption = 'Card1'
      CardIndex = 0
      TabOrder = 1
      ExplicitLeft = 2
      object pnlFundo: TPanel
        Left = 0
        Top = 0
        Width = 931
        Height = 488
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Color = clRed
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 72
        ExplicitTop = 48
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 929
          Height = 48
          Align = alTop
          Caption = 'Panel10'
          Color = clBackground
          Padding.Top = 10
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 21
          ExplicitTop = 6
          ExplicitWidth = 889
        end
        object Panel11: TPanel
          Left = 1
          Top = 49
          Width = 929
          Height = 438
          Margins.Left = 50
          Margins.Bottom = 10
          Align = alClient
          Caption = 'Panel11'
          Color = clFuchsia
          Padding.Left = 10
          Padding.Top = 10
          Padding.Right = 10
          Padding.Bottom = 10
          ParentBackground = False
          TabOrder = 1
          ExplicitLeft = 40
          ExplicitTop = 210
          ExplicitWidth = 383
          ExplicitHeight = 141
          object pnlMenu: TPanel
            Left = 11
            Top = 11
            Width = 907
            Height = 416
            Align = alClient
            Color = clActiveCaption
            ParentBackground = False
            TabOrder = 0
            ExplicitLeft = 53
            ExplicitTop = 23
            ExplicitWidth = 740
            ExplicitHeight = 320
            object pnlTables: TPanel
              Left = 201
              Top = 1
              Width = 705
              Height = 414
              Align = alClient
              Color = clInactiveCaptionText
              ParentBackground = False
              TabOrder = 0
              ExplicitLeft = 295
              ExplicitTop = 16
              ExplicitWidth = 498
              ExplicitHeight = 287
              object Panel12: TPanel
                Left = 1
                Top = 1
                Width = 186
                Height = 412
                Align = alLeft
                Caption = 'Panel12'
                Color = clRed
                ParentBackground = False
                TabOrder = 0
                ExplicitLeft = -5
                ExplicitTop = -6
                object lstTables: TListBox
                  Left = 1
                  Top = 1
                  Width = 184
                  Height = 410
                  Align = alClient
                  ItemHeight = 13
                  TabOrder = 0
                  OnClick = lstTablesClick
                  ExplicitLeft = 17
                  ExplicitTop = 17
                end
              end
              object Panel13: TPanel
                Left = 187
                Top = 1
                Width = 224
                Height = 412
                Align = alLeft
                Caption = 'Panel13'
                Color = clCream
                ParentBackground = False
                TabOrder = 1
                ExplicitLeft = 273
                object lstCampos: TListBox
                  Left = 1
                  Top = 1
                  Width = 222
                  Height = 410
                  Align = alClient
                  ItemHeight = 13
                  TabOrder = 0
                  ExplicitLeft = 40
                  ExplicitTop = 40
                  ExplicitWidth = 121
                  ExplicitHeight = 97
                end
              end
              object Panel14: TPanel
                Left = 411
                Top = 1
                Width = 293
                Height = 412
                Align = alClient
                Caption = 'Panel14'
                Color = clBlue
                ParentBackground = False
                TabOrder = 2
                ExplicitLeft = 503
                ExplicitTop = 136
                ExplicitWidth = 185
                ExplicitHeight = 41
              end
            end
            object pnlFields: TPanel
              Left = 1
              Top = 1
              Width = 200
              Height = 414
              Align = alLeft
              Color = clAppWorkSpace
              ParentBackground = False
              TabOrder = 1
              object SpeedButton1: TSpeedButton
                Left = 1
                Top = 1
                Width = 198
                Height = 48
                Align = alTop
                Caption = 'Buscar Tabelas'
                OnClick = SpeedButton1Click
                ExplicitLeft = -2
                ExplicitTop = -6
              end
            end
          end
        end
      end
    end
    object Card2: TCard
      Left = 1
      Top = 1
      Width = 931
      Height = 488
      Caption = 'Card2'
      CardIndex = 1
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 298
      ExplicitHeight = 198
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 931
        Height = 488
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 0
        ExplicitLeft = 496
        ExplicitTop = 120
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 929
          Height = 486
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 2
          ExplicitTop = 2
          ExplicitWidth = 978
          object Panel3: TPanel
            Left = 1
            Top = 49
            Width = 927
            Height = 248
            Align = alTop
            Caption = 'Panel2'
            TabOrder = 0
            ExplicitWidth = 976
            object Panel6: TPanel
              Left = 589
              Top = 1
              Width = 337
              Height = 246
              Align = alRight
              Caption = 'Panel6'
              TabOrder = 0
              ExplicitLeft = 638
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
              Width = 300
              Height = 246
              Align = alClient
              Caption = 'Panel6'
              TabOrder = 2
              ExplicitWidth = 349
              object DBGrid1: TDBGrid
                Left = 1
                Top = 1
                Width = 298
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
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 927
            Height = 48
            Align = alTop
            Color = clInactiveCaption
            ParentBackground = False
            TabOrder = 1
            ExplicitWidth = 976
            object Label1: TLabel
              Left = 1
              Top = 1
              Width = 925
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
              Width = 925
              Height = 21
              Align = alTop
              TabOrder = 0
              ExplicitWidth = 974
            end
          end
          object Panel5: TPanel
            Left = 1
            Top = 449
            Width = 927
            Height = 36
            Align = alBottom
            Color = clInactiveCaption
            ParentBackground = False
            TabOrder = 2
            ExplicitWidth = 976
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
          object Panel9: TPanel
            Left = 1
            Top = 297
            Width = 927
            Height = 152
            Align = alClient
            TabOrder = 3
            ExplicitWidth = 976
            object Memo1: TMemo
              Left = 1
              Top = 1
              Width = 925
              Height = 150
              Align = alClient
              ScrollBars = ssVertical
              TabOrder = 0
              ExplicitWidth = 974
            end
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = metaInfo
    Left = 848
    Top = 176
  end
  object metaInfo: TFDMetaInfoQuery
    Active = True
    Connection = FCon
    Left = 864
    Top = 304
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
    Left = 864
    Top = 240
  end
  object FDQuery1: TFDQuery
    Connection = FCon
    Left = 848
    Top = 112
  end
  object MetaFields: TFDMetaInfoQuery
    Active = True
    Connection = FCon
    Left = 865
    Top = 385
  end
  object DataSource2: TDataSource
    DataSet = MetaFields
    Left = 801
    Top = 401
  end
  object DataSource3: TDataSource
    DataSet = FDQuery1
    Left = 851
    Top = 42
  end
end
