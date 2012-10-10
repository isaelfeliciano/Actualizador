object Form1: TForm1
  Left = 424
  Top = 137
  Width = 600
  Height = 213
  Caption = 'Form1'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 4
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Gauge1: TGauge
    Left = 0
    Top = 40
    Width = 587
    Height = 28
    Color = 16744448
    ForeColor = 16744448
    ParentColor = False
    Progress = 0
  end
  object Label2: TLabel
    Left = 0
    Top = 72
    Width = 3
    Height = 13
  end
  object BitBtn1: TBitBtn
    Left = 448
    Top = 72
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object CbTerminal: TComboBox
    Left = 0
    Top = 88
    Width = 121
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    Text = 'Terminal'
    Items.Strings = (
      'Adm_8'
      'Adm_Alta'
      'Adm_Gleny'
      'Adm_Miguelito'
      'Adm_Raquel'
      'Adm_Roberto'
      'Adm_Rossy'
      'Adm_Soporte'
      'Alcarrizos'
      'Almacen'
      'Boca_Chica'
      'Cambita'
      'Electromuebles'
      'Elias_Pi'#241'a'
      'Extra_1'
      'Extra_2'
      'Extra_3'
      'Haina_1'
      'Haina_2'
      'Haina_3'
      'Hato_Nuevo'
      'Independencia'
      'Km_22'
      'Km_25'
      'La_Pared'
      'Las_Americas'
      'Las_Palmas'
      'Los_Frailes'
      'Nigua_1'
      'Nigua_2'
      'Nizao'
      'Palenque'
      'Pantoja'
      'Quita_Sue'#241'o'
      'San_Cristobal'
      'San_Vicente'
      'Villa_Mella')
  end
  object CbModo: TComboBox
    Left = 120
    Top = 88
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'Modo'
    Items.Strings = (
      'Local'
      'Remoto')
  end
  object BitBtn2: TBitBtn
    Left = 448
    Top = 96
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 448
    Top = 120
    Width = 75
    Height = 25
    Caption = 'BitBtn3'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object CbRutaES: TComboBox
    Left = 200
    Top = 88
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'Ruta ES'
    Items.Strings = (
      'C:\Easy System S2010\'
      'D:\Easy System S2010\'
      'E:\Easy System S2010\'
      'F:\Easy System S2010\'
      'G:\Easy System S2010\')
  end
  object BitBtn4: TBitBtn
    Left = 448
    Top = 144
    Width = 75
    Height = 25
    Caption = 'BitBtn4'
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object CbRutaApp: TComboBox
    Left = 296
    Top = 88
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'Ruta Dir App'
    Items.Strings = (
      'C:\Archivos de programa\WinRAR\'
      'C:\Program Files\WinRAR\')
  end
  object CbRuta_Act: TComboBox
    Left = 0
    Top = 104
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = 'Ruta Act'
    Items.Strings = (
      'C:\Actualizaciones\*.*'
      'D:\Actualizaciones\*.*'
      'E:\Actualizaciones\*.*'
      'F:\Actualizaciones\*.*'
      'G:\Actualizaciones\*.*')
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database='
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=juan173mateo69'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=True')
    VendorLib = 'gds32.dll'
    BeforeConnect = SQLConnection1BeforeConnect
    Left = 392
    Top = 8
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'select * from ACTUALIZADOR'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'UPGRADE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ACTUAL'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_8'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_ALTA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_GLENY'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_MIGUELITO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_RAQUEL'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_ROBERTO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_ROSSY'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ADM_SOPORTE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ALCARRIZOS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ALMACEN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'BOCA_CHICA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'CAMBITA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ELECTROMUEBLES'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ELIAS_PINA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'EXTRA_1'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'EXTRA_2'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'EXTRA_3'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'HAINA_1'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'HAINA_2'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'HAINA_3'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'HATO_NUEVO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'INDEPENDENCIA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'KM_22'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'KM_25'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'LA_PARED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'LAS_AMERICAS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'LAS_PALMAS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'LOS_FRAILES'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NIGUA_1'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NIGUA_2'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NIZAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PALENQUE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PANTOJA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'QUITA_SUENO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SAN_CRISTOBAL'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SAN_VICENTE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'VILLA_MELLA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'SimpleDataSet1Index1'
      end>
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 8
    object SimpleDataSet1UPGRADE: TSmallintField
      FieldName = 'UPGRADE'
      Required = True
    end
    object SimpleDataSet1ACTUAL: TSmallintField
      FieldName = 'ACTUAL'
      Required = True
    end
    object SimpleDataSet1ADM_8: TSmallintField
      FieldName = 'ADM_8'
      Required = True
    end
    object SimpleDataSet1ADM_ALTA: TSmallintField
      FieldName = 'ADM_ALTA'
      Required = True
    end
    object SimpleDataSet1ADM_GLENY: TSmallintField
      FieldName = 'ADM_GLENY'
      Required = True
    end
    object SimpleDataSet1ADM_MIGUELITO: TSmallintField
      FieldName = 'ADM_MIGUELITO'
      Required = True
    end
    object SimpleDataSet1ADM_RAQUEL: TSmallintField
      FieldName = 'ADM_RAQUEL'
      Required = True
    end
    object SimpleDataSet1ADM_ROBERTO: TSmallintField
      FieldName = 'ADM_ROBERTO'
      Required = True
    end
    object SimpleDataSet1ADM_ROSSY: TSmallintField
      FieldName = 'ADM_ROSSY'
      Required = True
    end
    object SimpleDataSet1ADM_SOPORTE: TSmallintField
      FieldName = 'ADM_SOPORTE'
      Required = True
    end
    object SimpleDataSet1ALCARRIZOS: TSmallintField
      FieldName = 'ALCARRIZOS'
      Required = True
    end
    object SimpleDataSet1ALMACEN: TSmallintField
      FieldName = 'ALMACEN'
      Required = True
    end
    object SimpleDataSet1BOCA_CHICA: TSmallintField
      FieldName = 'BOCA_CHICA'
      Required = True
    end
    object SimpleDataSet1CAMBITA: TSmallintField
      FieldName = 'CAMBITA'
      Required = True
    end
    object SimpleDataSet1ELECTROMUEBLES: TSmallintField
      FieldName = 'ELECTROMUEBLES'
      Required = True
    end
    object SimpleDataSet1ELIAS_PINA: TSmallintField
      FieldName = 'ELIAS_PINA'
      Required = True
    end
    object SimpleDataSet1EXTRA_1: TSmallintField
      FieldName = 'EXTRA_1'
      Required = True
    end
    object SimpleDataSet1EXTRA_2: TSmallintField
      FieldName = 'EXTRA_2'
      Required = True
    end
    object SimpleDataSet1EXTRA_3: TSmallintField
      FieldName = 'EXTRA_3'
      Required = True
    end
    object SimpleDataSet1HAINA_1: TSmallintField
      FieldName = 'HAINA_1'
      Required = True
    end
    object SimpleDataSet1HAINA_2: TSmallintField
      FieldName = 'HAINA_2'
      Required = True
    end
    object SimpleDataSet1HAINA_3: TSmallintField
      FieldName = 'HAINA_3'
      Required = True
    end
    object SimpleDataSet1HATO_NUEVO: TSmallintField
      FieldName = 'HATO_NUEVO'
      Required = True
    end
    object SimpleDataSet1INDEPENDENCIA: TSmallintField
      FieldName = 'INDEPENDENCIA'
      Required = True
    end
    object SimpleDataSet1KM_22: TSmallintField
      FieldName = 'KM_22'
      Required = True
    end
    object SimpleDataSet1KM_25: TSmallintField
      FieldName = 'KM_25'
      Required = True
    end
    object SimpleDataSet1LA_PARED: TSmallintField
      FieldName = 'LA_PARED'
      Required = True
    end
    object SimpleDataSet1LAS_AMERICAS: TSmallintField
      FieldName = 'LAS_AMERICAS'
      Required = True
    end
    object SimpleDataSet1LAS_PALMAS: TSmallintField
      FieldName = 'LAS_PALMAS'
      Required = True
    end
    object SimpleDataSet1LOS_FRAILES: TSmallintField
      FieldName = 'LOS_FRAILES'
      Required = True
    end
    object SimpleDataSet1NIGUA_1: TSmallintField
      FieldName = 'NIGUA_1'
      Required = True
    end
    object SimpleDataSet1NIGUA_2: TSmallintField
      FieldName = 'NIGUA_2'
      Required = True
    end
    object SimpleDataSet1NIZAO: TSmallintField
      FieldName = 'NIZAO'
      Required = True
    end
    object SimpleDataSet1PALENQUE: TSmallintField
      FieldName = 'PALENQUE'
      Required = True
    end
    object SimpleDataSet1PANTOJA: TSmallintField
      FieldName = 'PANTOJA'
      Required = True
    end
    object SimpleDataSet1QUITA_SUENO: TSmallintField
      FieldName = 'QUITA_SUENO'
      Required = True
    end
    object SimpleDataSet1SAN_CRISTOBAL: TSmallintField
      FieldName = 'SAN_CRISTOBAL'
      Required = True
    end
    object SimpleDataSet1SAN_VICENTE: TSmallintField
      FieldName = 'SAN_VICENTE'
      Required = True
    end
    object SimpleDataSet1VILLA_MELLA: TSmallintField
      FieldName = 'VILLA_MELLA'
      Required = True
    end
  end
  object IdIcmpClient1: TIdIcmpClient
    Host = '10.0.0.15'
    Port = 21
    Left = 472
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 900000
    OnTimer = Timer1Timer
    Left = 504
    Top = 8
  end
end
