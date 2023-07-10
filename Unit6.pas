unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids,
  Buttons;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    dbgrd1: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    btn7: TBitBtn;
    lbl4l: TLabel;
    lbl4l1: TLabel;
    lbl4l2: TLabel;
    lbl4l3: TLabel;
    lbl4l4: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt1: TEdit;
    edt2: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  id : string;

implementation

uses MENU;

{$R *.dfm}


procedure TForm6.posisiawal;
begin
editbersih;

edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
edt6.Enabled:= False;
edt7.Enabled:= False;
cbb1.Enabled:= False;
cbb2.Enabled:= False;

btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;

procedure TForm6.editbersih;
begin
edt1.Text := '';
Edt2.Text := '';
Edt3.Text := '';
Edt4.Text := '';
Edt5.Text := '';
edt6.Text := '';
edt7.Text := '';
cbb1.Text := '';
cbb2.Text := '';
end;

procedure TForm6.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True;
edt7.Enabled:= True;
cbb1.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TForm6.dbgrd1CellClick(Column: TColumn);
begin
editenable;

btn1.Enabled:= true;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
edt3.Text:= zqry1.FieldList[1].AsString;
edt4.Text:= zqry1.FieldList[2].AsString;
edt5.Text:= zqry1.FieldList[3].AsString;
Edt6.Text:= zqry1.FieldList[4].AsString;
Edt7.Text:= zqry1.FieldList[5].AsString;
edt1.Text:= zqry1.FieldList[6].AsString;
cbb1.Text:= zqry1.FieldList[7].AsString;
edt2.Text:= zqry1.FieldList[8].AsString;
cbb2.Text:= zqry1.FieldList[9].AsString;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.btn1Click(Sender: TObject);
begin
editbersih;
btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;

editenable;
end;

procedure TForm6.btn2Click(Sender: TObject);
begin
if(Edt3.Text = '')or(Edt4.Text = '')or(Edt5.Text = '')or(Edt6.Text = '')or(Edt7.Text = '')or(edt1.Text = '')or(edt2.Text = '')or(cbb1.Text = '')or(cbb2.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('nik',Edt3.Text,[]))and(zqry1.Locate('nama',Edt4.Text,[]))then
begin
  ShowMessage('Data Ortu sudah digunakan');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_ortu values(null,"'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+edt7.Text+'","'+edt1.Text+'","'+Cbb1.Text+'","'+edt2.Text+'","'+Cbb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_ortu');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;


procedure TForm6.btn3Click(Sender: TObject);
begin
if (Edt3.Text = '')or(Edt4.Text = '')or(Edt5.Text = '')or(Edt6.Text = '')or(Edt7.Text = '')or(edt1.Text = '')or(edt2.Text = '')or(cbb1.Text = '')or(cbb2.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (Edt3.Text = zqry1.Fields[1].AsString) and (Edt4.Text = zqry1.Fields[2].AsString) and(Edt5.Text = zqry1.Fields[3].AsString)and(Edt6.Text = zqry1.Fields[4].AsString)and(Edt7.Text = zqry1.Fields[5].AsString)and(edt1.Text = zqry1.Fields[6].AsString)and(Cbb1.Text = zqry1.Fields[7].AsString)and(edt2.Text = zqry1.Fields[8].AsString)and(Cbb2.Text = zqry1.Fields[9].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_ortu').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_ortu set nik= "'+Edt3.Text+'",nama="'+Edt4.Text+'", pendidikan= "'+Edt5.Text+'",pekerjaan= "'+Edt6.Text+'",telp= "'+Edt7.Text+'",alamat= "'+edt1.Text+'",jenis_kelamin= "'+Cbb1.Text+'",agama= "'+edt2.Text+'",status= "'+Cbb2.Text+'"  where id_ortu ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_ortu');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm6.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_ortu').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_ortu where id_ortu ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_ortu');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm6.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.btn7Click(Sender: TObject);
begin
hide;
form1.show;
end;

procedure TForm6.btn6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

end.
