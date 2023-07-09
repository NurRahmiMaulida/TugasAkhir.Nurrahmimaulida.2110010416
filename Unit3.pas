unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids,
  Buttons;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    lbl4l: TLabel;
    lbl4l1: TLabel;
    lbl4l2: TLabel;
    lbl2: TLabel;
    dbgrddg1: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    edt1: TEdit;
    edt2: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    btn7: TBitBtn;
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure dbgrddg1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
id : string;
implementation
uses
  MENU;

{$R *.dfm}

procedure TForm3.editbersih;
begin
  edt1.Text := '';
  edt2.Text := '';
  cbb1.Text := '';
  cbb2.Text := '';
end;

procedure TForm3.editdisable;
begin
  edt1.Enabled := False;
  edt2.Enabled := False;
  cbb1.Enabled := False;
  cbb2.Enabled := False;
end;

procedure TForm3.editenable;
begin
  edt1.Enabled := True;
  edt2.Enabled := True;
  cbb1.Enabled := True;
  cbb2.Enabled := True;
end;

procedure TForm3.posisiawal;
begin
  editbersih;

  editdisable;

    btn1.Enabled:= true;
    btn2.Enabled:= False;
    btn3.Enabled:= True;
    btn4.Enabled:= True;
    btn5.Enabled:= True;
end;

procedure TForm3.dbgrddg1CellClick(Column: TColumn);
begin
editenable;

btn1.Enabled:= true;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;

id:=zqry1.Fields[0].AsString;

edt1.Text:= zqry1.FieldList[1].AsString;
edt2.Text:= zqry1.FieldList[2].AsString;
cbb1.Text:= zqry1.FieldList[3].AsString;
cbb2.Text:= zqry1.FieldList[4].AsString;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm3.btn1Click(Sender: TObject);
begin
editbersih;
btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
editenable;
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
 //SIMPAN
  
if(edt1.Text = '')or(edt2.Text = '')or(cbb1.Text = '') or(cbb2.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('username',edt1.Text,[]))then
begin
  ShowMessage('Username sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_user values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cbb1.Text+'","'+cbb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
begin
id:=dbgrddg1.DataSource.DataSet.FieldByName('id_poin').AsString;

ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tabel_poin set nama_poin= "'+edt1.Text+'",bobot="'+edt2.Text+'",jenis="'+cbb1.Text+'",status="'+cbb2.Text+'" where id_poin="'+id+'"');
  zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_poin');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm3.btn5Click(Sender: TObject);
begin
posisiawal;
end;



procedure TForm3.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrddg1.DataSource.DataSet.FieldByName('id_poin').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_poin where id_poin ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_poin');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm3.btn7Click(Sender: TObject);
begin
 Hide;
  Form1.Show;
end;

end.
