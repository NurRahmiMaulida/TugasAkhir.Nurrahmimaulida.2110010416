object Form1: TForm1
  Left = 315
  Top = 152
  Width = 984
  Height = 421
  Caption = 'MENU UTAMA'
  Color = clMenuHighlight
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
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Showcard Gothic'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 504
    Top = 80
    Width = 64
    Height = 27
    Caption = 'MENU'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnortu: TButton
    Left = 288
    Top = 120
    Width = 129
    Height = 33
    Caption = 'ORANG TUA'
    TabOrder = 0
  end
  object btnsiswa: TButton
    Left = 456
    Top = 120
    Width = 137
    Height = 33
    Caption = 'SISWA'
    TabOrder = 1
  end
  object btnwakel: TButton
    Left = 632
    Top = 120
    Width = 137
    Height = 33
    Caption = 'WALI KELAS'
    TabOrder = 2
  end
  object btnpoin: TButton
    Left = 632
    Top = 184
    Width = 137
    Height = 33
    Caption = 'POIN'
    TabOrder = 3
  end
  object btnkelas: TButton
    Left = 288
    Top = 184
    Width = 129
    Height = 33
    Caption = 'KELAS'
    TabOrder = 4
  end
  object btnhubungan: TButton
    Left = 288
    Top = 240
    Width = 225
    Height = 33
    Caption = 'HUBUNGAN'
    TabOrder = 5
  end
  object btnsemester: TButton
    Left = 456
    Top = 184
    Width = 137
    Height = 33
    Caption = 'SEMESTER'
    TabOrder = 6
  end
  object btnuser: TButton
    Left = 544
    Top = 240
    Width = 225
    Height = 33
    Caption = 'DATA USER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object mm1: TMainMenu
    Left = 240
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
