unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids,
  Buttons;

type
  TForm7 = class(TForm)
    lbl1: TLabel;
    lbl4l: TLabel;
    lbl4l1: TLabel;
    lbl4l2: TLabel;
    lbl2: TLabel;
    dbgrddg: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    edt1: TEdit;
    edt2: TEdit;
    cbbcmb1: TComboBox;
    cbbcmb2: TComboBox;
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
    procedure dbgrddgColEnter(Sender: TObject);
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
  Form7: TForm7;
  id : string;

implementation

uses
  MENU;

{$R *.dfm}

procedure TForm7.editbersih;
begin
  edt1.Text := '';
  edt2.Text := '';
  cbbcmb1.Text := '';
  cbbcmb2.Text := '';
end;

procedure TForm7.editdisable;
begin
  edt1.Enabled := False;
  edt2.Enabled := False;
  cbbcmb1.Enabled := False;
  cbbcmb2.Enabled := False;
end;

procedure TForm7.editenable;
begin
  edt1.Enabled := True;
  edt2.Enabled := True;
  cbbcmb1.Enabled := True;
  cbbcmb2.Enabled := True;
end;

procedure TForm7.posisiawal;
begin
  editbersih;

  editdisable;

    btn1.Enabled:= true;
    btn2.Enabled:= False;
    btn3.Enabled:= True;
    btn4.Enabled:= True;
    btn5.Enabled:= True;
end;

procedure TForm7.dbgrddgColEnter(Sender: TObject);
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
cbbcmb1.Text:= zqry1.FieldList[3].AsString;
cbbcmb2.Text:= zqry1.FieldList[4].AsString;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm7.btn1Click(Sender: TObject);
begin
editbersih;
btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
editenable;
end;

procedure TForm7.btn2Click(Sender: TObject);
begin
  //SIMPAN
  
if(edt1.Text = '')or(edt2.Text = '')or(cbbcmb1.Text = '') or(cbbcmb2.Text = '') then
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
zqry1.sql.Add('insert into tabel_user values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cbbcmb1.Text+'","'+cbbcmb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm7.btn3Click(Sender: TObject);
begin
if(edt1.Text = '')or(edt2.Text = '')or(cbbcmb1.Text = '') or(cbbcmb2.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString)and (cbbcmb1.Text = zqry1.Fields[3].AsString)and (cbbcmb2.Text = zqry1.Fields[4].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dbgrddg.DataSource.DataSet.FieldByName('id_user').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_user set username= "'+edt1.Text+'",password="'+edt2.Text+'",level= "'+cbbcmb1.Text+'",status= "'+cbbcmb2.Text+'" where id_user ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm7.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrddg.DataSource.DataSet.FieldByName('id_user').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_user where id_user ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm7.btn5Click(Sender: TObject);
begin
posisiawal;
end;


procedure TForm7.btn7Click(Sender: TObject);
begin
 Hide;
  Form1.Show;
end;

procedure TForm7.btn6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

end.
