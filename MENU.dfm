object Form1: TForm1
  Left = 315
  Top = 152
  Width = 984
  Height = 515
  Caption = 'MENU UTAMA'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 240
    Top = 32
    Width = 524
    Height = 33
    Caption = 'SISEM INFORMASI DATABASE SEKOLAH'
    Color = clHotLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Showcard Gothic'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 352
    Top = 80
    Width = 317
    Height = 27
    Caption = 'MENU  APLIKASI SEKOLAHAN'
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object btnortu: TButton
    Left = 216
    Top = 128
    Width = 177
    Height = 49
    Caption = 'ORANG TUA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnortuClick
  end
  object btnsiswa: TButton
    Left = 416
    Top = 128
    Width = 169
    Height = 49
    Caption = 'SISWA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnsiswaClick
  end
  object btnwakel: TButton
    Left = 608
    Top = 128
    Width = 177
    Height = 49
    Caption = 'WALI KELAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnwakelClick
  end
  object btnpoin: TButton
    Left = 608
    Top = 200
    Width = 185
    Height = 49
    Caption = 'POIN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnpoinClick
  end
  object btnkelas: TButton
    Left = 216
    Top = 200
    Width = 177
    Height = 49
    Caption = 'KELAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnkelasClick
  end
  object btnhubungan: TButton
    Left = 216
    Top = 272
    Width = 273
    Height = 49
    Caption = 'HUBUNGAN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnhubunganClick
  end
  object btnsemester: TButton
    Left = 416
    Top = 200
    Width = 169
    Height = 49
    Caption = 'SEMESTER'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnsemesterClick
  end
  object btnuser: TButton
    Left = 520
    Top = 272
    Width = 273
    Height = 49
    Caption = 'DATA USER'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnuserClick
  end
  object mm1: TMainMenu
    Left = 288
    Top = 80
    object Menu1: TMenuItem
      Caption = 'Menu'
    end
    object LogOut1: TMenuItem
      Caption = 'LogOut'
      OnClick = LogOut1Click
    end
  end
end
