unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, ComCtrls, StdCtrls, Grids,
  DBGrids, Buttons;

type
  TForm5 = class(TForm)
    lbl4l: TLabel;
    lbl4l1: TLabel;
    lbl4l2: TLabel;
    lbl4l3: TLabel;
    lbl4l4: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
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
    edt7: TEdit;
    edt8: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    dtp1: TDateTimePicker;
    edt6: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    btn7: TBitBtn;
    procedure posisiawal;
    procedure editbersih;
    procedure editdisable;
    procedure editenable;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  id : string;

implementation

uses MENU;


{$R *.dfm}
procedure TForm5.editbersih;
begin
edt1.Text := '';
edt2.Text := '';
edt3.Text := '';
edt4.Text := '';
edt5.Text := '';
edt6.Text := '';
cbb1.Text := '';
edt7.Text := '';
edt8.Text := '';
cbb2.Text := '';
end;

procedure TForm5.editdisable;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
edt6.Enabled:= False;
cbb1.Enabled:= False;
edt7.Enabled:= False;
edt8.Enabled:= False;
cbb2.Enabled:= False;
end;

procedure TForm5.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True; 
cbb1.Enabled:= True;
edt7.Enabled:= True;
edt8.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TForm5.posisiawal;
begin
editbersih;

editdisable;

btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;


procedure TForm5.dbgrd1CellClick(Column: TColumn);
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
edt3.Text:= zqry1.FieldList[3].AsString;
edt4.Text:= zqry1.FieldList[4].AsString;
edt5.Text:= zqry1.FieldList[5].AsString;
edt6.Text:= zqry1.FieldList[6].AsString;
cbb1.Text:= zqry1.FieldList[7].AsString;
edt7.Text:= zqry1.FieldList[8].AsString;
edt8.Text:= zqry1.FieldList[9].AsString;
cbb2.Text:= zqry1.FieldList[10].AsString;
end;



procedure TForm5.btn1Click(Sender: TObject);
begin
editbersih;
btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;

editenable;
end;

procedure TForm5.btn2Click(Sender: TObject);
begin
  //simpan
  
if(edt1.Text = '')or(edt2.Text = '')or(edt3.Text = '')or(edt4.Text = '')or(edt5.Text = '')or(edt6.Text = '')or(cbb1.Text = '')or(edt7.Text = '')or(edt8.Text = '')or(cbb2.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('nis',edt1.Text,[]))and(zqry1.Locate('nik',edt4.Text,[]))then
begin
  ShowMessage('Data Siswa sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_siswa values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+cbb1.Text+'","'+edt7.Text+'","'+edt8.Text+'","'+cbb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_siswa');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm5.btn3Click(Sender: TObject);
begin
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_siswa').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_siswa set nis= "'+edt1.Text+'",nisn="'+edt2.Text+'", nama= "'+edt3.Text+'",nik= "'+edt4.Text+'",tempat_lahir= "'+edt5.Text+'",tgl_lahir= "'+edt6.Text+'",jenis_kelamin= "'+cbb1.Text+'",alamat= "'+edt7.Text+'",telpon= "'+edt8.Text+'",status= "'+cbb2.Text+'"  where id_siswa ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_siswa');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm5.btn4Click(Sender: TObject);
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

procedure TForm5.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.btn7Click(Sender: TObject);
begin
 Hide;
 Form1.Show;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  posisiawal;
end;
procedure TForm5.btn6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

end.
