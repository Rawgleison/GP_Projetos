unit untSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmSplash = class(TForm)
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmSplash.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSplash.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Close;
end;

end.
