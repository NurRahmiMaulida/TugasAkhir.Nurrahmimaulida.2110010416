unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids,
  Buttons;

type
  TForm9 = class(TForm)
    lbl1: TLabel;
    lbl4l: TLabel;
    lbl4l1: TLabel;
    lbl4l2: TLabel;
    lbl4l3: TLabel;
    lbl2: TLabel;
    dbgrd1: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn5: TButton;
    btn6: TButton;
    edt1: TEdit;
    edt2: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    btn7: TBitBtn;
    btn4: TButton;
    procedure posisiawal;
    procedure editbersih;
    procedure editdisable;
    procedure editenable;
    procedure btn7Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  id : string;

implementation

uses MENU;



{$R *.dfm}

procedure TForm9.editbersih;
begin
edt1.Text := '';
edt2.Text := '';
cbb1.Text := '';
cbb2.Text := '';
cbb3.Text := '';
end;

procedure TForm9.editdisable;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
cbb1.Enabled:= False;
cbb2.Enabled:= False;
cbb3.Enabled:= False;
end;

procedure TForm9.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
cbb1.Enabled:= True;
cbb2.Enabled:= True;
cbb3.Enabled:= True;
end;

procedure TForm9.posisiawal;
begin
editbersih;

editdisable;

btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;


procedure TForm9.btn7Click(Sender: TObject);
begin
 Hide;
  Form1.Show;
end;

procedure TForm9.btn1Click(Sender: TObject);
begin
editbersih;
btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
editenable;
end;

procedure TForm9.btn2Click(Sender: TObject);
begin
  //SIMPAN

if(edt1.Text = '')or(edt2.Text = '')or(cbb1.Text = '')or(cbb2.Text = '')or(cbb3.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('id_siswa',edt1.Text,[]))then
begin
  ShowMessage('Data Hubungan sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_hubungan values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cbb1.Text+'","'+cbb2.Text+'","'+cbb3.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_hubungan');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm9.btn3Click(Sender: TObject);
begin
  begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_hub').AsString;
  end;
ShowMessage('DATA BERHASIL DIUPDATE!') ;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tabel_hubungan set siswa_id="'+edt1.Text+'", ortu_id="'+edt2.Text+'", status_hub_anak="'+cbb1.Text+'", keterangan="'+cbb2.Text+'", status_ortu="'+cbb3.Text+'" where id_hub="'+id+'"');
  Zqry1.ExecSQL;

  Zqry1.SQL.Clear;
  Zqry1.SQL.Add('select * from tabel_hubungan');
  Zqry1.Open;
end;

procedure TForm9.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id_kelas').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_kelas where id_kelas ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm9.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm9.dbgrd1CellClick(Column: TColumn);
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
cbb3.Text:= zqry1.FieldList[5].AsString;
end;

end.
