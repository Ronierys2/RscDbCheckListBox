object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 371
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 738
    Height = 314
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Filtar por cidades'
    end
    object Label2: TLabel
      Left = 208
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Filtar por clientes'
    end
    object SpeedButton1: TSpeedButton
      Left = 400
      Top = 26
      Width = 73
      Height = 22
      Caption = 'Filtrar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object RscDbSearchCheckListBox1: TRscDbSearchCheckListBox
      Left = 16
      Top = 27
      Width = 169
      Height = 21
      DataField = 'CITY'
      DataSource = DsCidades
      DataFieldSeparador = ','
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object RscDbSearchCheckListBox2: TRscDbSearchCheckListBox
      Left = 208
      Top = 30
      Width = 186
      Height = 21
      DataField = 'CUSTOMER'
      DataSource = DsClientes
      DataFieldSeparador = ','
      TabOrder = 1
      Text = 'RscDbSearchCheckListBox2'
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\0_Componentes\RestDataware\CORE\Demos\EMPLOYEE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 64
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT r.CUST_NO, r.CUSTOMER, r.CONTACT_FIRST, r.CONTACT_LAST, r' +
        '.PHONE_NO,'
      
        '    r.ADDRESS_LINE1, r.ADDRESS_LINE2, r.CITY, r.STATE_PROVINCE, ' +
        'r.COUNTRY,'
      '    r.POSTAL_CODE, r.ON_HOLD, r.FIELDERROR, r.FIELDERROR2'
      'FROM CUSTOMER r')
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 64
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 144
  end
  object FDQCidades: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT r.CITY'
      'FROM CUSTOMER r'
      'GROUP BY r.CITY')
    Left = 64
    Top = 168
  end
  object DsCidades: TDataSource
    DataSet = FDQCidades
    Left = 64
    Top = 216
  end
  object FDQClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT r.CUSTOMER'
      'FROM CUSTOMER r'
      'GROUP BY r.CUSTOMER')
    Left = 360
    Top = 192
  end
  object DsClientes: TDataSource
    DataSet = FDQClientes
    Left = 368
    Top = 240
  end
end
