unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids,
  Buttons;

type
  TForm4 = class(TForm)
    lbl1: TLabel;
    lbl4l: TLabel;
    lbl4l1: TLabel;
    lbl4l2: TLabel;
    lbl4l3: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dbgrd1: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    cbb1: TComboBox;
    edt6: TEdit;
    cbb2: TComboBox;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    lbl5: TLabel;
    btn7: TBitBtn;
    procedure posisiawal;
    procedure editbersih;
    procedure editdisable;
    procedure editenable;
    procedure FormShow(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  id : string;

implementation

uses MENU;

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.dbgrd1CellClick(Column: TColumn);
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
edt3.Text:= zqry1.FieldList[4].AsString;
edt4.Text:= zqry1.FieldList[5].AsString;
edt5.Text:= zqry1.FieldList[6].AsString;
edt6.Text:= zqry1.FieldList[7].AsString;
cbb2.Text:= zqry1.FieldList[8].AsString;
end;

procedure TForm4.btn1Click(Sender: TObject);
begin
editbersih;
btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
editenable;
end;

procedure TForm4.btn2Click(Sender: TObject);
begin
  //SIMPAN

if(edt1.Text = '')or(edt2.Text = '')or(cbb1.Text = '') or(edt3.Text = '')or(edt4.Text = '')or(edt5.Text = '')or(edt6.Text = '')or(cbb2.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('nik',edt1.Text,[]))and(zqry1.Locate('nama',edt2.Text,[]))then
begin
  ShowMessage('Data Siswa sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_wali_kelas values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cbb1.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+cbb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_wali_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm4.btn3Click(Sender: TObject);
begin
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_wali').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_wali_kelas set nik= "'+edt1.Text+'",nama="'+edt2.Text+'", jenis_kelamin= "'+cbb1.Text+'",pendidikan= "'+edt3.Text+'",telp= "'+edt4.Text+'",matpel= "'+edt5.Text+'",alamat= "'+edt6.Text+'",status= "'+cbb2.Text+'"  where id_wali ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_wali_kelas');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm4.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_wali').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_wali_kelas where id_wali ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_wali_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm4.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.btn7Click(Sender: TObject);
begin
hide;
form1.show;
end;
procedure TForm4.editbersih;
begin
edt1.Text := '';
edt2.Text := '';
cbb1.Text := '';
edt3.Text := '';
edt4.Text := '';
edt5.Text := '';
edt6.Text := '';
cbb2.Text := '';
end;

procedure TForm4.editdisable;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
cbb1.enabled:= false;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
edt6.Enabled:= False;
cbb2.Enabled:= False;
end;

procedure TForm4.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
cbb1.enabled := True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TForm4.posisiawal;
begin
editbersih;

editdisable;

btn1.Enabled:= true;
btn2.Enabled:= false;
btn3.Enabled:= false;
btn4.enabled:= False;
btn5.enabled:= false;
end;

end.










