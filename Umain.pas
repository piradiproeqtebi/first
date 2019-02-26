unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  cxInplaceContainer, cxDBTL, cxTLData, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,cxTLExportLink, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxSkinscxPCPainter, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxPSCore, dxPScxCommon,
  dxPScxTLLnk, cxClasses;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    acc_name: TcxDBTreeList;
    acc_nameid: TcxDBTreeListColumn;
    acc_namename: TcxDBTreeListColumn;
    acc_nameatc_code: TcxDBTreeListColumn;
    acc_nameparentid: TcxDBTreeListColumn;
    acc_namerootlevel: TcxDBTreeListColumn;
    acc_namekod: TcxDBTreeListColumn;
    acc_namesort_f: TcxDBTreeListColumn;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Button2: TButton;
    Button3: TButton;
    SpeedButton11: TSpeedButton;
    SpeedButton9: TSpeedButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link2: TcxDBTreeListReportLink;
    SaveDialog1: TSaveDialog;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
	
  acc_name.FullExpand;
  
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  acc_name.FullCollapse;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
FDConnection1.Connected:=true;
FDQuery1.Open();
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
  if (SaveDialog1.Execute) then
  begin
    cxExportTLToExcel(SaveDialog1.FileName,acc_name,false,true,false);
  end;

end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  dxComponentPrinter1.Preview();

end;

end.
