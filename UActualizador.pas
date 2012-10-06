unit UActualizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, StdCtrls, DB, DBClient, SimpleDS, SqlExpr, Gauges, Buttons,
  Menus, IniFiles, Grids, DBGrids, ComCtrls, ShellApi;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    SimpleDataSet1: TSimpleDataSet;
    Label1: TLabel;
    IdIcmpClient1: TIdIcmpClient;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    CbModo: TComboBox;
    BitBtn2: TBitBtn;
    SimpleDataSet1UPGRADE: TSmallintField;
    SimpleDataSet1ACTUAL: TSmallintField;
    SimpleDataSet1ADM_8: TSmallintField;
    SimpleDataSet1ADM_ALTA: TSmallintField;
    SimpleDataSet1ADM_GLENY: TSmallintField;
    SimpleDataSet1ADM_MIGUELITO: TSmallintField;
    SimpleDataSet1ADM_RAQUEL: TSmallintField;
    SimpleDataSet1ADM_ROBERTO: TSmallintField;
    SimpleDataSet1ADM_ROSSY: TSmallintField;
    SimpleDataSet1ADM_SOPORTE: TSmallintField;
    SimpleDataSet1ALCARRIZOS: TSmallintField;
    SimpleDataSet1ALMACEN: TSmallintField;
    SimpleDataSet1BOCA_CHICA: TSmallintField;
    SimpleDataSet1CAMBITA: TSmallintField;
    SimpleDataSet1ELECTROMUEBLES: TSmallintField;
    SimpleDataSet1ELIAS_PINA: TSmallintField;
    SimpleDataSet1EXTRA_1: TSmallintField;
    SimpleDataSet1EXTRA_2: TSmallintField;
    SimpleDataSet1EXTRA_3: TSmallintField;
    SimpleDataSet1HAINA_1: TSmallintField;
    SimpleDataSet1HAINA_2: TSmallintField;
    SimpleDataSet1HAINA_3: TSmallintField;
    SimpleDataSet1HATO_NUEVO: TSmallintField;
    SimpleDataSet1INDEPENDENCIA: TSmallintField;
    SimpleDataSet1KM_22: TSmallintField;
    SimpleDataSet1KM_25: TSmallintField;
    SimpleDataSet1LA_PARED: TSmallintField;
    SimpleDataSet1LAS_AMERICAS: TSmallintField;
    SimpleDataSet1LAS_PALMAS: TSmallintField;
    SimpleDataSet1LOS_FRAILES: TSmallintField;
    SimpleDataSet1NIGUA_1: TSmallintField;
    SimpleDataSet1NIGUA_2: TSmallintField;
    SimpleDataSet1NIZAO: TSmallintField;
    SimpleDataSet1PALENQUE: TSmallintField;
    SimpleDataSet1PANTOJA: TSmallintField;
    SimpleDataSet1QUITA_SUENO: TSmallintField;
    SimpleDataSet1SAN_CRISTOBAL: TSmallintField;
    SimpleDataSet1SAN_VICENTE: TSmallintField;
    SimpleDataSet1VILLA_MELLA: TSmallintField;
    ProgressBar1: TProgressBar;
    procedure IdIcmpClient1Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;
  Ini  : TIniFile;
  Cad1, Cad2, Cad3, Sql: String;
  Num1, Num2, Num_Act: Integer;
  lpFileOp: TSHFileOpStruct;
implementation

{$R *.dfm}
//FUNCION PARA COPIAR


procedure TForm1.IdIcmpClient1Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin
 if IdIcmpClient1.ReplyStatus.BytesReceived = 0 then
    begin
      Label1.Caption:= 'No Conectado';
    end else begin
      Label1.Caption:= 'Conectado al Servidor';
    end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
IdIcmpClient1.Ping;
Num1:= StrToInt(Ini.ReadString( 'ComboBox1', 'Num_Act', '' ));
Num2:= SimpleDataSet1UPGRADE.AsInteger;
 if Num1 < Num2 then
 begin
 //origen:= 'D:\Actualizaciones\*.*';
 //destino:= 'D:\Easy System S2010';
 
  end;
end;
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteString( 'ComboBox1', 'Terminal', ComboBox1.Text);
    Ini.WriteString( 'ComboBox1', 'Modo', CbModo.Text );
    Ini.WriteString( 'ComboBox1', 'Iniciado?', 'SI' );
    //Ini.WriteString( 'ComboBox1', 'Num_Act', '' );
    Ini.WriteBool( 'Form', 'InitMax', WindowState = wsMaximized );
  finally
    Ini.Free;

  end;
end;




procedure TForm1.FormCreate(Sender: TObject);
begin
Cad3:='ADM_SOPORTE';
Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Cad1 := Ini.ReadString( 'ComboBox1', 'Iniciado?', '' );
    Cad2 := Ini.ReadString( 'ComboBox1', 'Terminal', '' );
  finally
    Ini.Free;
  end;
  if Cad1 = 'SI' then
    begin
   ComboBox1.Visible:= False;
   CbModo.Visible:= False;
   BitBtn2.Visible:=False;
    end;


   ShowMessage('La Actualizacion Comenzara');
   if Cad2 = 'Adm_Soporte' then begin
    Num1:= SimpleDataSet1ADM_SOPORTE.AsInteger ;
    Num2:= SimpleDataSet1UPGRADE.AsInteger;
    SimpleDataSet1.Close;
     if Num1 < Num2 then
      //Iniciar Copiar
      SimpleDataSet1.DataSet.CommandText := 'UPDATE ACTUALIZADOR  SET ADM_SOPORTE = ADM_SOPORTE + 1';
      SimpleDataSet1.Open;
end;
end;

end.
