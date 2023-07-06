object Form10: TForm10
  Left = 192
  Top = 152
  Width = 513
  Height = 395
  Caption = 'LOGIN USER'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl4l: TLabel
    Left = 69
    Top = 117
    Width = 72
    Height = 16
    Caption = 'USERNAME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl4l1: TLabel
    Left = 69
    Top = 157
    Width = 67
    Height = 16
    Caption = 'PASWORD'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 208
    Top = 48
    Width = 122
    Height = 23
    Caption = 'LOGIN USER'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object edt1: TEdit
    Left = 153
    Top = 117
    Width = 271
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 153
    Top = 157
    Width = 271
    Height = 21
    TabOrder = 1
  end
  object btnb1: TButton
    Left = 160
    Top = 213
    Width = 97
    Height = 44
    Caption = 'MASUK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnb2: TButton
    Left = 280
    Top = 213
    Width = 97
    Height = 44
    Caption = 'CANCEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    HostName = 'localhost'
    Port = 3306
    Database = 'database_siswa'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Rnldi-PC\S4\UAS-VISUAL-2-main\libmysql.dll'
    Left = 216
    Top = 272
  end
  object zqry1: TZQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM tabel_user')
    Params = <>
    Left = 256
    Top = 272
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 296
    Top = 272
  end
end
