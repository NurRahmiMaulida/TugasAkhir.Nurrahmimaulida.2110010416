unit MENU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    btnortu: TButton;
    btnsiswa: TButton;
    btnwakel: TButton;
    btnpoin: TButton;
    btnkelas: TButton;
    btnhubungan: TButton;
    btnsemester: TButton;
    btnuser: TButton;
    mm1: TMainMenu;
    Menu1: TMenuItem;
    LogOut1: TMenuItem;
    procedure LogOut1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.LogOut1Click(Sender: TObject);
begin
Hide;
end;

end.
