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


unit uRscDbSearchCheckListBox;

interface

uses
  System.SysUtils,
  System.Classes,

  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Dialogs,
  Vcl.Buttons,

  Data.DB;

type
  TRscDbSearchCheckListBox = class(TCustomEdit)
  private
    { Private declarations }
    FDataLink     : TFieldDataLink;
    FSbtnPesq     : TSpeedButton;


    FDataFieldSeparador: char;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    procedure SetDataField(const Value: string);
    procedure SetDataFieldSeparador(const Value: char);
    procedure SetDataSource(const Value: TDataSource);

    { Ações Botão Pesquisa no Edit }
    procedure SbtnPesqClick(Sender: TObject);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property DataField: string read GetDataField write SetDataField;
    property DataSource : TDataSource read GetDataSource write SetDataSource;
    property DataFieldSeparador: char read FDataFieldSeparador write SetDataFieldSeparador;

    property Align;
    property Alignment;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind default bkNone;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property NumbersOnly;
    property OEMConvert;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property TextHint;
    property Touch;
    property Visible;
    property StyleElements;
//    property OnChange;
//    property OnClick;
    property OnContextPopup;
//    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
//    property OnEnter;
//    property OnExit;
    property OnGesture;
//    property OnKeyDown;
//    property OnKeyPress;
//    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Rsc', [TRscDbSearchCheckListBox]);
end;

{ TRscDbSearchCheckListBox }

constructor TRscDbSearchCheckListBox.Create(AOwner: TComponent);
begin
  inherited;
  DataFieldSeparador :=  ',';

  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  try
    FSbtnPesq :=  TSpeedButton.Create(Self);
    with  FSbtnPesq do
    begin
      OnClick :=  SbtnPesqClick;
      Caption :=  '...';
      Parent  :=  Self;
      Align   :=  alRight;
    end;
  Except on E: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

destructor TRscDbSearchCheckListBox.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FSbtnPesq.Free;
  inherited;
end;

function TRscDbSearchCheckListBox.GetDataField: string;
begin
    Result := FDataLink.FieldName;
end;

function TRscDbSearchCheckListBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TRscDbSearchCheckListBox.SbtnPesqClick(Sender: TObject);
begin
  ShowMessage('clicou');
end;

procedure TRscDbSearchCheckListBox.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TRscDbSearchCheckListBox.SetDataFieldSeparador(const Value: char);
begin
  FDataFieldSeparador := Value;
end;

procedure TRscDbSearchCheckListBox.SetDataSource(const Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

end.
