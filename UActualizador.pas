unit UActualizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, StdCtrls, DB, DBClient, SimpleDS, SqlExpr, Gauges, Buttons,
  Menus, IniFiles, Grids, DBGrids, ComCtrls, ShellApi, Registry, ExtCtrls,
  TrayIcon, jpeg, ShellCtrls;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    SimpleDataSet1: TSimpleDataSet;
    Label1: TLabel;
    IdIcmpClient1: TIdIcmpClient;
    CbTerminal: TComboBox;
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
    CbRutaES: TComboBox;
    CbRutaApp: TComboBox;
    Gauge1: TGauge;
    CbRuta_Act: TComboBox;
    Label2: TLabel;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    ActualizarAhora1: TMenuItem;
    CerrarActualizador1: TMenuItem;
    Image1: TImage;
    Timer2: TTimer;
    MostrarActualizador1: TMenuItem;
    ShellChangeNotifier1: TShellChangeNotifier;
    Timer3: TTimer;
    OcultarActualizador1: TMenuItem;
    Timer4: TTimer;
    
      
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SQLConnection1BeforeConnect(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ActualizarAhora1Click(Sender: TObject);
    procedure CerrarActualizador1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
    procedure MostrarActualizador1Click(Sender: TObject);
    procedure ShellChangeNotifier1Change;
    procedure Timer3Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OcultarActualizador1Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);


  private
  Procedure Probar_Conexion;
  Procedure Rev_Nueva_Act;
  Procedure Descomprimir_Rars;
  Procedure Borrar_Rars;
  procedure CrearArchivoBat(rutArchivo: string);

  procedure PonerProgramaInicio;
  Procedure AutoAct;
  procedure CerrarEs;
  public
  Ruta: String;
  Procedure Copiando_Rars;
  Procedure CerrandoEs;
  end;

var
  Form1: TForm1;
  Ini, Ini2  : TIniFile;
  Configurado, Terminal, Cad3, Sql, Ruta,Ruta_Winrar,Ruta_Act, IpServidor, Modo: String;
  Num1, Num2, Num_Act: Integer;
  lpFileOp: TSHFileOpStruct;
  Hora_Mod: TDateTime;
  Auto_Act: Boolean;
implementation

uses UnuevaAct;

{$R *.dfm}

function ExisteArchivo(Ruta:string):boolean;
begin
      if (FileExists(Ruta)) then
      begin
         //Existe
        Result:=true;
      end
     else
     begin
        //No Existe
        Result:=false;
     end;
end;
/////////////////////////////INICIAR CON WINDOWS: INICIO
procedure TForm1.PonerProgramaInicio;
var Registro: TRegistry;
begin

  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;

  if Registro.OpenKey( 'Software\Microsoft\Windows\CurrentVersion\Run', FALSE ) then
  begin
    try
    Registro.WriteString( ExtractFileName( Application.ExeName ), Application.ExeName );
    Registro.CloseKey;
    except
       MessageDlg('No se pudo config. el auto-inicio, de la utilidad de actualizacion automatica de Easy System', mtWarning, [mbOK], 0);
  end;

  Registro.Free;
  end;
  end;
/////////////////////////////INICIAR CON WINDOWS: FIN

/////////////////////////////PROBANDO CONEXION: INICIO
Procedure TForm1.Probar_Conexion;
begin
if Modo = 'Local' then
    IpServidor:= '10.0.0.15';

    if Modo = 'Remoto' then
    IpServidor:= '5.108.175.106';

IdIcmpClient1.Host:= IpServidor;
IdIcmpClient1.Ping;

if IdIcmpClient1.ReplyStatus.BytesReceived = 0 then
    begin
      Label1.Caption:= 'No Conectado';

    end else begin
      Label1.Caption:= 'Conectado '+ IpServidor;
       Rev_Nueva_Act;
    end;

end;
///////////////////////////////PROBANDO CONEXION: FIN

///////////////////////////////REVISANDO NUEVA ACTUALIZACION: INICIO
Procedure TForm1.Rev_Nueva_Act;
begin
Ini2 := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );

    Num1:=StrToInt(Ini2.ReadString('ComboBox1', 'Num_Act', ''));
    SQLConnection1.Open;
    SimpleDataSet1.Open;
    Num2:= SimpleDataSet1UPGRADE.AsInteger;
    SimpleDataSet1.Close;
  if Num1 < Num2 then
  begin
  Timer2.Enabled:= False;
  Form1.Top:= Screen.WorkAreaHeight -187;
  Form1.Left:= Screen.WorkAreaWidth -597;
  CerrarEs;
///////////////////////////////REVISANDO NUEVA ACTUALIZACION: FIN
//shellexecute(Handle, 'open','taskkill /f /im Easy_System_S2010.exe',nil,nil,SW_NORMAL);

 {Label2.Caption:= 'Copiando Rars...';
 Copiando_Rars;
  end
  else begin
  Label2.Caption:= 'No hay Actualizaciones';
  Timer2.Enabled:=True;}
  end;
end;

///////////////////////////////CERRAR ES: INICIO
Procedure TForm1.CerrarEs;
begin
Application.CreateForm(TFNuevaAct, FNuevaAct);
end;
///////////////////////////////CERRAR ES: FIN


///////////////////////////////CERRANDO ES: INICIO
Procedure TForm1.CerrandoEs;
var
   temp: TStrings; Kill_Task: String;
begin
Timer4.Enabled:= False;
Kill_Task:= Form1.Ruta+'Kill_Task.bat';
   temp := TStringList.Create;
   try
     temp.Add('@echo off');
     temp.Add('taskkill /f /im Easy_System_S2010.exe');
     temp.SaveToFile(Kill_Task);

   finally
     temp.Free;
   end;

shellexecute(Handle, 'open',Pchar(Kill_Task),nil,nil,SW_HIDE);
Copiando_Rars;

end;
///////////////////////////////CERRANDO ES: FIN

///////////////////////////////COPIANDO RAR'S: INICIO
Procedure TForm1.Copiando_Rars;
var lpFileOp: TSHFileOpStruct; i: Integer;
begin
Form1.Top:= Screen.WorkAreaHeight -187;
Form1.Left:= Screen.WorkAreaWidth -597;

    lpFileOp.Wnd := Self.Handle;
    lpFileOp.wFunc := FO_COPY;
    lpFileOp.pFrom := PChar(Ruta_Act + #0#0);
    lpFileOp.pTo := PChar(Ruta + #0#0);
    lpFileOp.fFlags:= FOF_SIMPLEPROGRESS or FOF_FILESONLY or FOF_NOCONFIRMATION;
    lpFileOp.fAnyOperationsAborted := FALSE;
    lpFileOp.hNameMappings := nil;
    lpFileOp.lpszProgressTitle := PChar('Trasladando archivos al disco D' + #0#0);


    { Mover el archivo }
    SHFileOperation(lpFileOp);
For i:= 0 to 25 do
Gauge1.Progress:= i;
Descomprimir_Rars;

end;
///////////////////////////////COPIANDO RAR'S: FIN


///////////////////////////////DESCOMPRIMIENDO Y BORRANDO RAR'S: INICIO
Procedure TForm1.Descomprimir_Rars;
var i:integer; Unrar,Ruta_Es_Exe, sql:String;
begin
Label2.Caption:= 'Descomprimiendo Rars...';
Unrar:=Ruta+'Unrar.bat';
//Unrar:='x -y "'+Ruta+'Easy_System_S2010.part01.rar" '+'"'+Ruta+'"';
//ShellExecute(Form1.Handle,nil,PChar(Ruta_Winrar),Pchar(Unrar),'',SW_NORMAL);
//ShellExecute(Handle, 'Open', 'C:\Archivos de programa\WinRAR\rar.exe', 'x "D:\Easy System S2010\Easy_System_S2010.part01.rar" '+'"'+Ruta+'"', nil, SW_HIDE);
CrearArchivoBat(Ruta+'Unrar.bat');
shellexecute(Handle, 'open',Pchar(Unrar),nil,nil,SW_HIDE);
For i:= 25 to 75 do
Gauge1.Progress:= i;
///////////////////////////////DESCOMPRIMIENDO Y BORRANDO RAR'S: FIN

Label2.Caption:= 'Modificando Base de Datos...';
sql:= 'UPDATE ACTUALIZADOR  SET '+Terminal+ ' = ' +IntToStr(Num2);
SQLConnection1.Execute(sql, nil, nil);
Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
Ini.WriteString( 'ComboBox1', 'Num_Act', IntToStr(Num2) );
For i:= 75 to 100 do
Gauge1.Progress:= i;
Label2.Caption:= 'Actualizacion Terminada';
Ruta_Es_Exe:= Ruta+'Easy_System_S2010.exe';
//shellexecute(Handle, 'open',PChar(Ruta_Es_Exe),nil,nil,SW_NORMAL);
Label2.Caption:='';
Timer2.Enabled:= True;
Label2.Caption:= 'ACTUALIZADO';
Gauge1.Progress:= 0;
ShowMessage('Actualizacion Completa. Puede abrir el SISTEMA');
end;


///////////////////////////////BORRANDO RAR'S: INICIO  no en uso
Procedure TForm1.Borrar_Rars;
var File_Existe: String; lpFileOp2: TSHFileOpStruct;
begin
{File_Existe:= Ruta+'Easy_System_S2010.exe';
if ExisteArchivo(File_Existe) = False then
  begin
    Borrar_Rars;
    end
    else
    begin
    lpFileOp2.Wnd := Self.Handle;
    lpFileOp2.wFunc := FO_DELETE;
    lpFileOp2.pFrom := PChar(Ruta+'Easy_System_S2010.*.rar' + #0#0);
    lpFileOp2.pTo := nil;
    lpFileOp2.fFlags:= FOF_SIMPLEPROGRESS or FOF_FILESONLY or FOF_NOCONFIRMATION;
    lpFileOp2.fAnyOperationsAborted := FALSE;
    lpFileOp2.hNameMappings := nil;
    lpFileOp2.lpszProgressTitle := PChar('Trasladando archivos al disco D' + #0#0);


    SHFileOperation(lpFileOp2);
    end;}


  end;


///////////////////////////////BORRANDO RAR'S: FIN
procedure TForm1.BitBtn1Click(Sender: TObject);

begin
Descomprimir_Rars;
end;


//////////////////////////////AUTOCREANDO BAT: INICIO
procedure TForm1.CrearArchivoBat(rutArchivo: string);
 var
   temp: TStrings;
 begin
   temp := TStringList.Create;
   try
     temp.Add('@echo off');
     temp.Add('path='+Ruta_Winrar);
     temp.Add('rar.exe x -y "'+ Ruta+'Easy_System_S2010.*.rar" "' + Ruta);
     temp.Add('Path=D:\Easy System S2010\');
     temp.Add('del /q "'+Ruta+'Easy_System_S2010.*.rar"');
     temp.SaveToFile(rutArchivo);
   finally
     temp.Free;
   end;
 end;
//////////////////////////////AUTOCREANDO BAT: FIN

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
//PonerProgramaInicio;
 Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteString( 'ComboBox1', 'Terminal', CbTerminal.Text);
    Ini.WriteString( 'ComboBox1', 'Modo', CbModo.Text );
    Ini.WriteString( 'ComboBox1', 'Rutas', CbRutaES.Text );
    Ini.WriteString( 'ComboBox1', 'Iniciado?', 'SI' );
    Ini.WriteString( 'ComboBox1', 'Ruta_Winrar', CbRutaApp.Text );
    Ini.WriteString( 'ComboBox1', 'Ruta_Act', CbRuta_Act.Text );
    Ini.WriteString( 'ComboBox1', 'Num_Act', '1' );

  finally
    Ini.Free;

  end;
   Form1.Close;
   shellexecute(Handle, 'open',PChar( ExtractFileName( Application.ExeName )),nil,nil,SW_NORMAL);
end;




procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.Top:= Screen.WorkAreaHeight -187;
Form1.Left:= Screen.WorkAreaWidth -597;
TrayIcon1.Show;
Timer1.Enabled:= True;
SQLConnection1.Close;
SimpleDataSet1.Connection:= SQLConnection1;
Cad3:='ADM_SOPORTE';
Ini2 := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );

    Configurado:= Ini2.ReadString( 'ComboBox1', 'Iniciado?', '' );
    Terminal:=    Ini2.ReadString( 'ComboBox1', 'Terminal', '' );
    Modo:=        Ini2.ReadString( 'ComboBox1', 'Modo', '' );
    Num1:=StrToInt(Ini2.ReadString('ComboBox1', 'Num_Act', ''));
    Ruta:=        Ini2.ReadString( 'ComboBox1', 'Rutas', '' );
    Ruta_Winrar:=Ini2.ReadString(  'ComboBox1', 'Ruta_Winrar', '' );
    Ruta_Act:=   Ini2.ReadString(  'ComboBox1', 'Ruta_Act', '' );
    ShellChangeNotifier1.Root:=Ruta+'Actualizador\';
    //Hora_Mod:=StrToDate(Ini2.ReadString(  'ComboBox1', 'Hora_Mod', '' ));
    SQLConnection1.Open;
    SimpleDataSet1.Open;
    Num2:= SimpleDataSet1UPGRADE.AsInteger;
    SimpleDataSet1.Close;
    Timer2.Enabled:= True;
  if Configurado = 'SI' then
    begin
   CbTerminal.Visible:= False;
   CbModo.Visible:= False;
   BitBtn2.Visible:=False;
   CbRutaES.Visible:= False;
   CbRutaApp.Visible:= False;
   CbRuta_Act.Visible:= False;

  end;
   //if Terminal = 'Adm_Soporte' then begin

    //Num2:= SimpleDataSet1UPGRADE.AsInteger;
    //SimpleDataSet1.Close;
     //if Num1 < Num2 then
      //Iniciar Copiar
      //SimpleDataSet1.DataSet.CommandText := 'UPDATE ACTUALIZADOR  SET ADM_SOPORTE = ADM_SOPORTE + 1';
      //SimpleDataSet1.Open;
end;


procedure TForm1.BitBtn3Click(Sender: TObject);
var lpFileOp: TSHFileOpStruct;
begin
Probar_Conexion;

 if Num1 < Num2 then
 begin
 //ShowMessage('Iniciando');

begin

    { Relleno de la estructura }
    {lpFileOp.Wnd := Self.Handle;
    lpFileOp.wFunc := FO_COPY;
    lpFileOp.pFrom := PChar('D:\Actualizaciones\*.*' + #0#0);
    lpFileOp.pTo := PChar('D:\Easy System S2010' + #0#0);
    lpFileOp.fFlags:= FOF_SIMPLEPROGRESS or FOF_FILESONLY;
    lpFileOp.fAnyOperationsAborted := FALSE;
    lpFileOp.hNameMappings := nil;
    lpFileOp.lpszProgressTitle := PChar('Trasladando archivos al disco D' + #0#0);
    ProgressBar1.Position:= 50;

    { Mover el archivo }
    //SHFileOperation(lpFileOp);

 //origen:= 'D:\Actualizaciones\*.*';
 //destino:= 'D:\Easy System S2010';

end;
end;
end;
procedure TForm1.BitBtn4Click(Sender: TObject);
begin
Copiando_Rars;
end;




procedure TForm1.SQLConnection1BeforeConnect(Sender: TObject);
begin
 with Sender as TSQLConnection do
  begin
    if LoginPrompt = False then
    begin
      if Modo = 'Local' then begin
    IpServidor:= '10.0.0.15';
    SQLConnection1.Params.Values['Database']:= '10.0.0.15:D:\Easy System News\DATA.FDB';
    end;
    if Modo = 'Remoto' then begin
    IpServidor:= '5.108.175.106';
    SQLConnection1.Params.Values['Database']:= '5.108.175.106:D:\Easy System News\DATA.FDB';
    end;
  end;
end;
end;
procedure TForm1.Timer1Timer(Sender: TObject);
begin
Probar_Conexion;
end;

procedure TForm1.ActualizarAhora1Click(Sender: TObject);
begin
Copiando_Rars;
end;

procedure TForm1.CerrarActualizador1Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
TrayIcon1.Hide;
Action:= Cafree;
end;


procedure TForm1.Timer2Timer(Sender: TObject);
begin
Probar_Conexion;
Form1.Top:= Screen.WorkAreaHeight +187;
Form1.Left:= Screen.WorkAreaWidth +597;
Timer2.Enabled:= False;
end;

procedure TForm1.MostrarActualizador1Click(Sender: TObject);
begin
Form1.Top:= Screen.WorkAreaHeight -187;
Form1.Left:= Screen.WorkAreaWidth -597;
end;

procedure TForm1.ShellChangeNotifier1Change;
begin
Timer3.Enabled:= True;
end;

Procedure TForm1.AutoAct;
var lpFileOp: TSHFileOpStruct; Ruta_AutoAct: String;
begin
Timer3.Enabled:= False;
Ruta_AutoAct:= Ruta+'Actualizador\*.*';
    lpFileOp.Wnd := Self.Handle;
    lpFileOp.wFunc := FO_COPY;
    lpFileOp.pFrom := PChar(Ruta_AutoAct + #0#0);
    lpFileOp.pTo := PChar(Ruta + #0#0);
    lpFileOp.fFlags:= FOF_SIMPLEPROGRESS or FOF_FILESONLY or FOF_NOCONFIRMATION;
    lpFileOp.fAnyOperationsAborted := FALSE;
    lpFileOp.hNameMappings := nil;
    lpFileOp.lpszProgressTitle := PChar('Trasladando archivos al disco D' + #0#0);
    Form1.Close;

    { Mover el archivo }
    SHFileOperation(lpFileOp);
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
AutoAct;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
ShowWindow(application.Handle, SW_HIDE)
end;

procedure TForm1.OcultarActualizador1Click(Sender: TObject);
begin
Form1.Top:= Screen.WorkAreaHeight +187;
Form1.Left:= Screen.WorkAreaWidth +597;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
CerrandoEs;

end;

end.
