object FCowsAndBulls: TFCowsAndBulls
  Left = 0
  Top = 0
  Caption = 'FCowsAndBulls'
  ClientHeight = 398
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 122
    Top = 67
    Width = 24
    Height = 13
    Caption = 'Taille'
  end
  object Label2: TLabel
    Left = 203
    Top = 251
    Width = 26
    Height = 13
    Caption = 'Cows'
  end
  object Label3: TLabel
    Left = 96
    Top = 302
    Width = 35
    Height = 13
    Caption = 'Erreurs'
  end
  object Label4: TLabel
    Left = 203
    Top = 302
    Width = 24
    Height = 13
    Caption = 'Essai'
  end
  object Label5: TLabel
    Left = 104
    Top = 259
    Width = 21
    Height = 13
    Caption = 'Bulls'
  end
  object Memo1: TMemo
    Left = 312
    Top = 48
    Width = 49
    Height = 25
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    Visible = False
  end
  object Memo2: TMemo
    Left = 104
    Top = 104
    Width = 185
    Height = 57
    Lines.Strings = (
      'Memo2')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 158
    Top = 248
    Width = 39
    Height = 33
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 240
    Top = 248
    Width = 39
    Height = 33
    TabOrder = 3
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 152
    Top = 299
    Width = 39
    Height = 33
    TabOrder = 4
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 240
    Top = 299
    Width = 39
    Height = 33
    TabOrder = 5
    Text = 'Edit4'
  end
  object Edit5: TEdit
    Left = 136
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit5'
  end
  object BRefresh: TButton
    Left = 214
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 7
    OnClick = Newgame1Click
  end
  object Edit6: TEdit
    Left = 152
    Top = 65
    Width = 33
    Height = 24
    TabOrder = 8
    Text = 'Edit6'
  end
  object BCheck: TButton
    Left = 104
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Check'
    TabOrder = 9
    OnClick = à
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 32
    object Fichiers1: TMenuItem
      Caption = '&Fichiers'
      object Newgame1: TMenuItem
        Caption = '&New game'
        ShortCut = 112
        OnClick = Newgame1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Quit1: TMenuItem
        Caption = 'Quit'
        ShortCut = 115
      end
    end
  end
end
