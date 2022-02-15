{=======================================}
{             RSC SISTEMAS              }
{        SOLUÇÕES TECNOLÓGICAS          }
{         rscsistemas.com.br            }
{          +55 92 4141-2737             }
{      contato@rscsistemas.com.br       }
{                                       }
{ Desenvolvidor por:                    }
{   Roniery Santos Cardoso              }
{     ronierys2@hotmail.com             }
{     +55 92 984391279                  }
{                                       }
{                                       }
{ Versão Original RSC SISTEMAS          }
{ Versão: 1.0.0 - 12/02/2022            }
{                                       }
{                                       }
{=======================================}


unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, uRscDbSearchCheckListBox,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCustomListBox,
  cxCheckListBox, cxDBCheckListBox, uTInject;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    RscDbSearchCheckListBox1: TRscDbSearchCheckListBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    FDQCidades: TFDQuery;
    DsCidades: TDataSource;
    FDQClientes: TFDQuery;
    DsClientes: TDataSource;
    RscDbSearchCheckListBox2: TRscDbSearchCheckListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
    editchelist: TRscDbSearchCheckListBox;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(editchelist) then
    editchelist.Free;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConnection1.Open;
  FDQuery1.Open;
  FDQCidades.Open;
  FDQClientes.Open;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  filtro: string;
  I, T: Integer;
begin
  filtro  :=  EmptyStr;
  if RscDbSearchCheckListBox1.Count > 0 then
    begin
      for I := 0 to RscDbSearchCheckListBox1.Count - 1 do
        begin
          if RscDbSearchCheckListBox1.Checked[I] then
            begin
              if filtro = EmptyStr then
                filtro  :=  RscDbSearchCheckListBox1.DataField + ' = ''' +  RscDbSearchCheckListBox1.Items[I] + ''''
              else
                filtro  :=  filtro  + ' and '  +  RscDbSearchCheckListBox1.DataField + ' = ''' +  RscDbSearchCheckListBox1.Items[I] + '''';
            end;
        end;
    end;

  if RscDbSearchCheckListBox2.Count > 0 then
    begin
      for T := 0 to RscDbSearchCheckListBox2.Count - 1 do
        begin
          if RscDbSearchCheckListBox2.Checked[T] then
            begin
              if filtro = EmptyStr then
                filtro  :=  RscDbSearchCheckListBox2.DataField + ' = ''' +  RscDbSearchCheckListBox2.Items[T] + ''''
              else
                filtro  :=  filtro  + ' and '  +  RscDbSearchCheckListBox2.DataField + ' = ''' +  RscDbSearchCheckListBox2.Items[T] + '''';
            end;
        end;
    end;


  if filtro = EmptyStr then
    FDQuery1.Filtered :=  False
  else
    begin
      FDQuery1.Filter :=  filtro;
      FDQuery1.Filtered :=  True;
    end;
end;

end.
