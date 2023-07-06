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
    procedure btnortuClick(Sender: TObject);
    procedure btnsiswaClick(Sender: TObject);
    procedure btnwakelClick(Sender: TObject);
    procedure btnkelasClick(Sender: TObject);
    procedure btnpoinClick(Sender: TObject);
    procedure btnsemesterClick(Sender: TObject);
    procedure btnuserClick(Sender: TObject);
    procedure btnhubunganClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit6, Unit5, Unit4, Unit2, Unit3, Unit8, Unit7, Unit9;

{$R *.dfm}

procedure TForm1.LogOut1Click(Sender: TObject);
begin
Hide;
end;

procedure TForm1.btnortuClick(Sender: TObject);
begin
 hide;
Form6.Show;
end;

procedure TForm1.btnsiswaClick(Sender: TObject);
begin
 hide;
Form5.Show;
end;

procedure TForm1.btnwakelClick(Sender: TObject);
begin
 hide;
Form4.Show;
end;

procedure TForm1.btnkelasClick(Sender: TObject);
begin
 hide;
Form2.Show;
end;

procedure TForm1.btnpoinClick(Sender: TObject);
begin
 hide;
Form3.Show;
end;

procedure TForm1.btnsemesterClick(Sender: TObject);
begin
 hide;
Form8.Show;
end;

procedure TForm1.btnuserClick(Sender: TObject);
begin
 hide;
Form7.Show;
end;

procedure TForm1.btnhubunganClick(Sender: TObject);
begin
 hide;
Form9.Show;
end;

end.
