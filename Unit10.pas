unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls;

type
  TForm10 = class(TForm)
    lbl4l: TLabel;
    lbl4l1: TLabel;
    lbl1: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btnb1: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    btn1: TButton;
    procedure btnb1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses MENU;

{$R *.dfm}

procedure TForm10.btnb1Click(Sender: TObject);
begin
with zqry1 do begin
SQL.Clear;
SQL.Add('select * from tabel_user where username='+QuotedStr(edt1.Text));
open;
end;
//jika tidak ditemukan data yang dicari
//maka tampilkan pesan

if zqry1.RecordCount=0
then
Application.MessageBox('Maaf user name tidak ditemukan','informasi',MB_OK or MB_ICONINFORMATION)
else
begin
if zqry1.FieldByName('password').AsString<>Edt2.Text
then
Application.MessageBox('Pastikan password yang anda masukkan benar','error',MB_OK or MB_ICONERROR)
else
begin
hide;
Form1.Show;
end;
end;


end;

procedure TForm10.btn1Click(Sender: TObject);
begin
Close;
end;

end.
