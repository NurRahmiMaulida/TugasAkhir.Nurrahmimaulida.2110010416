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
    btnb2: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

end.
