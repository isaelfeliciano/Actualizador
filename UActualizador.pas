unit UActualizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, StdCtrls, DB, DBClient, SimpleDS, SqlExpr, Gauges, Buttons,
  Menus, IniFiles, Grids, DBGrids, ComCtrls, ShellApi, Registry, ExtCtrls,
  TrayIcon, jpeg, ShellCtrls, SHChangeNotify, IdTCPConnection, IdTCPClient,
  IdFTP, TlHelp32, UTBitBtnNew;

type
  TFActualizador = class(TForm)
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
    OcultarActualizador1: TMenuItem;
    Timer4: TTimer;
    SHChangeNotify1: TSHChangeNotify;
    Timer5: TTimer;
    CbLetraDisco: TComboBox;
    IdFTP1: TIdFTP;
    Timer3: TTimer;
    SimpleDataSet1USUARIO: TStringField;
    SimpleDataSet1CLAVE: TStringField;
    SimpleDataSet1SERVIDOR: TStringField;
    SimpleDataSet1SERVIDOR_ALT: TStringField;
    SimpleDataSet1RUTA_ACTUALIZACIONES: TStringField;
    SDS_Actualizador: TSimpleDataSet;
    SDS_ActualizadorUPGRADE: TSmallintField;
    SDS_ActualizadorACTUAL: TSmallintField;
    SDS_ActualizadorADM_8: TSmallintField;
    SDS_ActualizadorADM_ALTA: TSmallintField;
    SDS_ActualizadorADM_GLENY: TSmallintField;
    SDS_ActualizadorADM_MIGUELITO: TSmallintField;
    SDS_ActualizadorADM_RAQUEL: TSmallintField;
    SDS_ActualizadorADM_ROBERTO: TSmallintField;
    SDS_ActualizadorADM_ROSSY: TSmallintField;
    SDS_ActualizadorADM_SOPORTE: TSmallintField;
    SDS_ActualizadorALCARRIZOS: TSmallintField;
    SDS_ActualizadorALMACEN: TSmallintField;
    SDS_ActualizadorBOCA_CHICA: TSmallintField;
    SDS_ActualizadorCAMBITA: TSmallintField;
    SDS_ActualizadorELECTROMUEBLES: TSmallintField;
    SDS_ActualizadorELIAS_PINA: TSmallintField;
    SDS_ActualizadorEXTRA_1: TSmallintField;
    SDS_ActualizadorEXTRA_2: TSmallintField;
    SDS_ActualizadorEXTRA_3: TSmallintField;
    SDS_ActualizadorHAINA_1: TSmallintField;
    SDS_ActualizadorHAINA_2: TSmallintField;
    SDS_ActualizadorHAINA_3: TSmallintField;
    SDS_ActualizadorHATO_NUEVO: TSmallintField;
    SDS_ActualizadorINDEPENDENCIA: TSmallintField;
    SDS_ActualizadorKM_22: TSmallintField;
    SDS_ActualizadorKM_25: TSmallintField;
    SDS_ActualizadorLA_PARED: TSmallintField;
    SDS_ActualizadorLAS_AMERICAS: TSmallintField;
    SDS_ActualizadorLAS_PALMAS: TSmallintField;
    SDS_ActualizadorLOS_FRAILES: TSmallintField;
    SDS_ActualizadorNIGUA_1: TSmallintField;
    SDS_ActualizadorNIGUA_2: TSmallintField;
    SDS_ActualizadorNIZAO: TSmallintField;
    SDS_ActualizadorPALENQUE: TSmallintField;
    SDS_ActualizadorPANTOJA: TSmallintField;
    SDS_ActualizadorQUITA_SUENO: TSmallintField;
    SDS_ActualizadorSAN_CRISTOBAL: TSmallintField;
    SDS_ActualizadorSAN_VICENTE: TSmallintField;
    SDS_ActualizadorVILLA_MELLA: TSmallintField;
    SDS_ActualizadorUSUARIO: TStringField;
    SDS_ActualizadorSERVIDOR: TStringField;
    SDS_ActualizadorSERVIDOR_ALT: TStringField;
    SDS_ActualizadorRUTA_ACTUALIZADOR: TStringField;
    SDS_ActualizadorCLAVE: TStringField;
    TmReiniciar: TTimer;
    TmInicioWindows: TTimer;
    BitBtnNew1: TBitBtnNew;
    
      
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
    procedure SHChangeNotify1UpdateDir(Sender: TObject; Flags: Cardinal;
      Path1: String);
    procedure SHChangeNotify1Delete(Sender: TObject; Flags: Cardinal;
      Path1: String);
    procedure Timer5Timer(Sender: TObject);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure TmReiniciarTimer(Sender: TObject);
    procedure TmInicioWindowsTimer(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure BitBtnNew1Click(Sender: TObject);


  private
  Procedure Probar_Conexion;
  Procedure Rev_Nueva_Act;
  Procedure Descomprimir_Rars;
  Procedure Borrar_Rars;
  procedure CrearArchivoBat(rutArchivo: string);
  procedure CrearArchivoBat2(rutArchivo: string);
  procedure PonerProgramaInicio;
  Procedure AutoAct;
  procedure CerrarEs;
  procedure IniciarApp;
  public
  Ruta: String;
  Procedure DescargarArchivo;
  Procedure Copiando_Rars;
  Procedure CerrandoEs;
  Procedure CompararFecha;
  Procedure CompararFecha2;
  Function processExists(exeFileName: string): Boolean;
  Function GetFileTimes(FileName : string; var Created : TDateTime;
       var Modified : TDateTime; var Accessed : TDateTime) : boolean;

  end;

var
  FActualizador: TFActualizador;
  Ini, Ini2, Ini3: TIniFile;
  Configurado, Terminal, Cad3, Sql, Ruta,Ruta_Winrar,Ruta_Act, IpServidor, Modo, Path1, Fecha1, Fecha2, CadBat, LetraDisco: String;
  Usuario, Clave, Servidor, DiaA, DiaB :String;
  Num1, Num2, Num_Act: Integer;
  lpFileOp: TSHFileOpStruct;
  Hora_Mod: TDateTime;
  Auto_Act, PararEjecucion, MostrarForm: Boolean;
  //
  Afiles, Afiles2: TStringList;
  i,r,BarraProgreso: Integer;
  FTP, FTP2: TIdFTP;
implementation

uses UnuevaAct, Ulistar;

{$R *.dfm}

function WindowsUpTime : string ;
   function MSecToTime(mSec: Integer): string;
   const
     secondTicks = 1000;
     minuteTicks = 1000 * 60;
     hourTicks = 1000 * 60 * 60;
     dayTicks = 1000 * 60 * 60 * 24;
   var
      M : string;
      ZM : Integer;
   begin

      ZM := mSec div hourTicks;
      Dec(mSec, ZM * minuteTicks) ;
      M := IntToStr(ZM) ;
      Result :=M;
   end;
 begin
   result := MSecToTime(GetTickCount) ;

 end;

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
procedure TFActualizador.PonerProgramaInicio;
var Registro: TRegistry;
begin

  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;

  if Registro.OpenKey( 'Software\Microsoft\Windows\CurrentVersion\Run', FALSE ) then
  if Registro.ValueExists('Easy_Actualizador.exe') = False then
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
Procedure TFActualizador.Probar_Conexion;
begin
Timer2.Enabled:= False;
Label2.Caption:= 'Revisando Conexion';
Update;
if Modo = 'Local' then
    IpServidor:= '10.0.0.15';

    if Modo = 'Remoto' then
    IpServidor:= '25.108.175.106';

IdIcmpClient1.Host:= IpServidor;
try
IdIcmpClient1.Ping;
except
label2.Caption:= 'No se puedo conectar @' + IpServidor;
Update;
end;
if IdIcmpClient1.ReplyStatus.BytesReceived = 0 then
    begin
      Label1.Caption:= 'No Conectado';
      TmReiniciar.Enabled:= True;
    end
    else
      begin
        Label1.Caption:= 'Conectado @'+ IpServidor;
        if ProcessExists('fbserver.exe') then
        begin
          try
            SQLConnection1.Open;
            except
            label2.Caption:= 'No se puedo conectar @' + IpServidor;
            Update;
            exit;
          end;
          SimpleDataSet1.Open;
          Num2:= SimpleDataSet1UPGRADE.AsInteger;
          SimpleDataSet1.Close;
          AutoAct;
        end
        else
        begin
          Label2.Caption:= 'ERROR: El servicio "Firebird" no se esta ejecutando.';
          Update;
          TmReiniciar.Enabled:= True;
          Exit;
          //FActualizador.FormCreate(Self);
          //Timer2.Enabled:= True;
          //Exit;
        end;
      end;

end;
///////////////////////////////PROBANDO CONEXION: FIN

///////////////////////////////REVISANDO NUEVA ACTUALIZACION: INICIO
Procedure TFActualizador.Rev_Nueva_Act;
begin
Ini2 := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );

    Num1:=StrToInt(Ini2.ReadString('ComboBox1', 'Num_Act', ''));
    SQLConnection1.Open;
    SimpleDataSet1.Open;
    Num2:= SimpleDataSet1UPGRADE.AsInteger;
    SimpleDataSet1.Close;
  if Num1 < Num2 then
  begin
   //Timer2.Enabled:= False;
   FActualizador.Top:= Screen.WorkAreaHeight -187;
   FActualizador.Left:= Screen.WorkAreaWidth -597;
   Label2.Caption:= 'Preparando la descarga';
   Update;
   Sleep(1000);
   DescargarArchivo;
  
  
///////////////////////////////REVISANDO NUEVA ACTUALIZACION: FIN
//shellexecute(Handle, 'open','taskkill /f /im Easy_System_S2010.exe',nil,nil,SW_NORMAL);

 {Label2.Caption:= 'Copiando Rars...';
Copiando_Rars;
end
else begin
Label2.Caption:= 'No hay Actualizaciones';
Timer2.Enabled:=True;}
  end
  else begin
    Label2.Caption:= 'ACTUALIZADO @' + IntToStr(Num2);
    Timer1.Enabled:= True;
  end;
end;

///////////////////////////////CERRAR ES: INICIO
Procedure TFActualizador.CerrarEs;
var PreviousHandle2 :THandle;
begin
 Timer1.Enabled:= False;
 Timer2.Enabled:= False;
 if processExists('Easy_System_S2010.exe') then
  begin
    PreviousHandle2:= FindWindow('TFNuevaAct', 'Nueva Actualizacion');
    if PreviousHandle2 = 0 then
    begin
      Application.CreateForm(TFNuevaAct, FNuevaAct);
    end
    else
    SetForeGroundWindow(PreviousHandle2);
  end
  else
  Descomprimir_Rars;
  end;
///////////////////////////////CERRAR ES: FIN


///////////////////////////////CERRANDO ES: INICIO
Procedure TFActualizador.CerrandoEs;
var
   temp: TStrings; Kill_Task: String;
begin
Timer4.Enabled:= False;
Kill_Task:= FActualizador.Ruta+'Kill_Task.bat';
   temp := TStringList.Create;
   try
     temp.Add('@echo off');
     temp.Add('taskkill /f /im Easy_System_S2010.exe');
     temp.SaveToFile(Kill_Task);

   finally
     temp.Free;
   end;

shellexecute(Handle, 'open',Pchar(Kill_Task),nil,nil,SW_HIDE);
  FActualizador.Top:= Screen.WorkAreaHeight -187;
  FActualizador.Left:= Screen.WorkAreaWidth -597;
  Descomprimir_Rars;
//Copiando_Rars;

end;
///////////////////////////////CERRANDO ES: FIN

///////////////////////////////DESCARGANDO_ARCHIVO: INICIO
Procedure TFActualizador.DescargarArchivo;
var
//FTP: TIdFTP;
Barra, o: Integer;
Directorio: TStringList;
begin
  Gauge1.Visible:=True;
  //Gauge1.Progress:= 0;
  FActualizador.Top:= Screen.WorkAreaHeight -187;
  FActualizador.Left:= Screen.WorkAreaWidth -597;
  //Timer3.Enabled:= False;
  If FileExists(Ruta + 'Easy*.rar') then
    begin
      //Directorio.Free;
      Directorio := TStringList.Create;
      UListar.FListar.Listar(Ruta, Directorio );
      //ShowMessage( Directorio.Text );
      //Directorio.Free;
      for o:= 0 to Directorio.Count -1 do
      begin
        DeleteFile(Ruta+Directorio[o]);
      end;
   end;

  FTP := TIdFTP.Create( nil );
  FTP.OnWork := IdFTP1Work;
  //FTP.EndWork(wmRead):= IdFTP1WorkEnd
  SimpleDataSet1.Open;
  FTP.Username := SimpleDataSet1USUARIO.AsString;
  FTP.Password := SimpleDataSet1CLAVE.AsString;
  FTP.Host := SimpleDataSet1SERVIDOR.AsString;
  SimpleDataSet1.Close;
  Barra:= 0;
  try
    FTP.Connect;

   except
   //Usando el servidor alterno
   SimpleDataSet1.Open;
   FTP.Host:= SimpleDataSet1SERVIDOR_ALT.AsString;
   SimpleDataSet1.Close;
   try
   FTP.Connect;
   except
    Label2.Caption:= 'No se ha podido conectar al servidor FTP .';
    Update;
    TmReiniciar.Enabled:= True;
    //Timer1.Enabled:= True;
    Exit;
    //raise Exception.Create( 'No se ha podido conectar con el servidor. ');
  end;
  end;
  SimpleDataSet1.Open;
  FTP.ChangeDir( SimpleDataSet1RUTA_ACTUALIZACIONES.AsString );
  SimpleDataSet1.Close;
  Afiles:= TStringList.Create;
  FTP.List(AFiles, '*.rar', False);
    for r := 0 to Afiles.Count -1 do begin
      Barra:= Barra + FTP.Size( ExtractFileName( AFiles[r] ) );
    end;
  Gauge1.MinValue:= 0;
  Gauge1.MaxValue:= Barra;
  for i := 0 to Afiles.Count -1 do begin
          //ListBox1.Items.add(AFiles[i]);


   //Label1.Caption:= Afiles[i];
   try
    //PararEjecucion:= False;

    FTP.BeginWork(wmRead);
    FTP.Get( ExtractFileName(AFiles[i]), LetraDisco+'\Easy System S2010\'+AFiles[i],True);
    Sleep(500);
    Except

      //on E: Exception do ShowMessage(E.Message + IntToStr(E.HelpContext));

      //raise Exception.Create( 'No se ha podido iniciar la descarga. ');
      Label2.Caption:= 'No se ha podido iniciar la descarga. ';
      Update;
      TmReiniciar.Enabled:= True;
      Exit;
      //PararEjecucion:= True;
      //Timer3.Enabled:= True;

   end;
 end;
 //If PararEjecucion = True then begin
 //Exit;
 //End
 //Else
 //Begin
 Afiles.Free;
 FTP.EndWork(wmRead);
 FTP.Disconnect;
 FTP.Free;
 if Gauge1.Progress = Gauge1.MaxValue then begin
 CerrarEs;
 Gauge1.Visible:= False;

 end;
 end;
//end;
///////////////////////////////DESCARGANDO_ARCHIVO: FIN


///////////////////////////////COPIANDO RAR'S: INICIO
Procedure TFActualizador.Copiando_Rars;
var lpFileOp: TSHFileOpStruct; i: Integer;
begin
FActualizador.Top:= Screen.WorkAreaHeight -187;
FActualizador.Left:= Screen.WorkAreaWidth -597;

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
Procedure TFActualizador.Descomprimir_Rars;
var i:integer; Unrar,Ruta_Es_Exe, sql:String;
begin
Label2.Caption:= 'Descomprimiendo Rars...';
Update;
Unrar:=Ruta+'Unrar.bat';
//Unrar:='x -y "'+Ruta+'Easy_System_S2010.part01.rar" '+'"'+Ruta+'"';
//ShellExecute(Form1.Handle,nil,PChar(Ruta_Winrar),Pchar(Unrar),'',SW_NORMAL);
//ShellExecute(Handle, 'Open', 'C:\Archivos de programa\WinRAR\rar.exe', 'x "D:\Easy System S2010\Easy_System_S2010.part01.rar" '+'"'+Ruta+'"', nil, SW_HIDE);
CrearArchivoBat(Ruta+'Unrar.bat');
shellexecute(Handle, 'open',Pchar(Unrar),nil,nil,SW_HIDE);
For i:= 25 to 75 do
//Gauge1.Progress:= i;
///////////////////////////////DESCOMPRIMIENDO Y BORRANDO RAR'S: FIN

Label2.Caption:= 'Modificando Base de Datos...';
Update;
sleep(1000);
sql:= 'UPDATE ACTUALIZADOR SET '+Terminal+ ' = ' +IntToStr(Num2);
SQLConnection1.Execute(sql, nil, nil);
Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
Ini.WriteString( 'ComboBox1', 'Num_Act', IntToStr(Num2) );
For i:= 75 to 100 do
//Gauge1.Progress:= i;
Label2.Caption:= 'Actualizacion Terminada';
Update;
sleep(1000);
Ruta_Es_Exe:= Ruta+'Easy_System_S2010.exe';
//shellexecute(Handle, 'open',PChar(Ruta_Es_Exe),nil,nil,SW_NORMAL);
Label2.Caption:='';
Label2.Caption:= 'ACTUALIZADO @'+ IntToStr(Num2);
Update;
Gauge1.Progress:= 0;
Sleep(1000);
Timer2.Enabled:= True;
//ShowMessage('Actualizacion Completa. Puede abrir el SISTEMA');
end;


///////////////////////////////BORRANDO RAR'S: INICIO no en uso
Procedure TFActualizador.Borrar_Rars;
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
procedure TFActualizador.BitBtn1Click(Sender: TObject);

begin
CerrarEs;
end;


//////////////////////////////AUTOCREANDO BAT: INICIO
procedure TFActualizador.CrearArchivoBat(rutArchivo: string);
 var
   temp: TStrings;
 begin
   temp := TStringList.Create;
   try
     temp.Add('@echo off');
     temp.Add('taskkill /f /im Easy_System_S2010.exe');
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



//////////////////////////////AUTOCREANDO BAT_2: INICIO
procedure TFActualizador.CrearArchivoBat2(rutArchivo: string);
 var
   temp: TStrings;
 begin
   temp := TStringList.Create;
   try
     temp.Add('@echo off');
     temp.Add('path='+Ruta_Winrar);
     temp.Add('rar.exe x -y "'+ LetraDisco+'\Actualizaciones\Reportes Net.rar" "' + Ruta);
     temp.SaveToFile(rutArchivo);
   finally
     temp.Free;
   end;
 end;
//////////////////////////////AUTOCREANDO BAT_2: FIN


procedure TFActualizador.BitBtn2Click(Sender: TObject);
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
    Ini.WriteString( 'ComboBox1', 'LetraDisco', CbLetraDisco.Text );
  finally
    Ini.Free;

  end;
   FActualizador.Close;
   shellexecute(Handle, 'open',PChar( ExtractFileName( Application.ExeName )),nil,nil,SW_NORMAL);
end;




procedure TFActualizador.FormCreate(Sender: TObject);
Var Ini4 : TIniFile;
begin
TrayIcon1.Show;
FActualizador.Top:= Screen.WorkAreaHeight -187;
FActualizador.Left:= Screen.WorkAreaWidth -597;
SimpleDataSet1.Connection:=  SQLConnection1;
SDS_Actualizador.Connection:=SQLConnection1;
PonerProgramaInicio;
Ini4 := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
Configurado:= Ini4.ReadString( 'ComboBox1', 'Iniciado?', '' );
if Configurado = 'SI' then
    begin
      CbLetraDisco.Visible:= False;
      CbTerminal.Visible:= False;
      CbModo.Visible:= False;
      BitBtn2.Visible:=False;
      CbRutaES.Visible:= False;
      CbRutaApp.Visible:= False;
      CbRuta_Act.Visible:= False;
    end;
  If WindowsUpTime = '0' Then
  begin
    FActualizador.Top:= Screen.WorkAreaHeight +187;
    FActualizador.Left:= Screen.WorkAreaWidth +597;
    TmInicioWindows.Enabled:= True;
  end
  else
  begin
    IniciarApp;
  end;
//Timer1.Enabled:= True;
//Timer5.Enabled:= False;
End;


Procedure TFActualizador.IniciarApp;
begin
TmInicioWindows.Enabled:= False;
TmReiniciar.Enabled:= False;
Timer1.Enabled:= False;
//SQLConnection1.Close;

//Cad3:='ADM_SOPORTE';
Ini2.Free;
Ini2 := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );

    Configurado:= Ini2.ReadString( 'ComboBox1', 'Iniciado?', '' );
    Terminal:= Ini2.ReadString( 'ComboBox1', 'Terminal', '' );
    Modo:= Ini2.ReadString( 'ComboBox1', 'Modo', '' );
    Num1:=StrToInt(Ini2.ReadString('ComboBox1', 'Num_Act', ''));
    Ruta:= Ini2.ReadString( 'ComboBox1', 'Rutas', '' );
    Ruta_Winrar:=Ini2.ReadString( 'ComboBox1', 'Ruta_Winrar', '' );
    Ruta_Act:= Ini2.ReadString( 'ComboBox1', 'Ruta_Act', '' );
    LetraDisco:= Ini2.ReadString( 'ComboBox1', 'LetraDisco', '' );
    //ShellChangeNotifier1.Root:=Ruta+'Actualizador\';
     
    //Hora_Mod:=StrToDate(Ini2.ReadString( 'ComboBox1', 'Hora_Mod', '' ));
    {SQLConnection1.Open;
SimpleDataSet1.Open;
Num2:= SimpleDataSet1UPGRADE.AsInteger;
SimpleDataSet1.Close;}

  if Configurado = 'SI' then
    begin
   CbLetraDisco.Visible:= False;
   CbTerminal.Visible:= False;
   CbModo.Visible:= False;
   BitBtn2.Visible:=False;
   CbRutaES.Visible:= False;
   CbRutaApp.Visible:= False;
   CbRuta_Act.Visible:= False;
   //AutoAct;
   Timer2.Enabled:= True;
   
   //FActualizador.Top:= Screen.WorkAreaHeight +187;
   //FActualizador.Left:= Screen.WorkAreaWidth +597;
   //CompararFecha;
   //CompararFecha2;

   //PonerProgramaInicio;

  end;
   //if Terminal = 'Adm_Soporte' then begin

    //Num2:= SimpleDataSet1UPGRADE.AsInteger;
    //SimpleDataSet1.Close;
     //if Num1 < Num2 then
      //Iniciar Copiar
      //SimpleDataSet1.DataSet.CommandText := 'UPDATE ACTUALIZADOR SET ADM_SOPORTE = ADM_SOPORTE + 1';
      //SimpleDataSet1.Open;
end;

procedure TFActualizador.BitBtn3Click(Sender: TObject);
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
procedure TFActualizador.BitBtn4Click(Sender: TObject);
begin
Copiando_Rars;
end;




procedure TFActualizador.SQLConnection1BeforeConnect(Sender: TObject);
begin
 with Sender as TSQLConnection do
  begin
    if LoginPrompt = False then
    begin
      if Modo = 'Local' then
      begin
        IpServidor:= '10.0.0.15';
        SQLConnection1.Params.Values['Database']:= '10.0.0.15:D:\Easy System News\DATA.FDB';
      end;
      if Modo = 'Remoto' then
      begin
        IpServidor:= '25.108.175.106';
        SQLConnection1.Params.Values['Database']:= '25.108.175.106:D:\Easy System News\DATA.FDB';
      end;
    end;
  end;
end;
procedure TFActualizador.Timer1Timer(Sender: TObject);
begin
IniciarApp;
end;

procedure TFActualizador.ActualizarAhora1Click(Sender: TObject);
begin
Gauge1.Progress:= 0;
Update;
Gauge1.Visible:= True;
Label2.Caption:= 'Descargando archivos.';
Update;
FActualizador.Top:= Screen.WorkAreaHeight -187;
FActualizador.Left:= Screen.WorkAreaWidth -597;
DescargarArchivo;
end;

procedure TFActualizador.CerrarActualizador1Click(Sender: TObject);
begin
FActualizador.Close;
end;

procedure TFActualizador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
TrayIcon1.Hide;

Action:= Cafree;
end;


procedure TFActualizador.Timer2Timer(Sender: TObject);
begin
Probar_Conexion;
FActualizador.Top:= Screen.WorkAreaHeight +187;
FActualizador.Left:= Screen.WorkAreaWidth +597;
//Timer2.Enabled:= False;
end;

procedure TFActualizador.MostrarActualizador1Click(Sender: TObject);
begin
FActualizador.Top:= Screen.WorkAreaHeight -187;
FActualizador.Left:= Screen.WorkAreaWidth -597;
end;

procedure TFActualizador.ShellChangeNotifier1Change;
begin
//Timer3.Enabled:= True;
//ShowMessage('Modificado');
end;

Procedure TFActualizador.AutoAct;
var Upgrade, Suc :Integer;
lpFileOp: TSHFileOpStruct; Ruta_AutoAct: String;
temp4 :TStrings;
begin
Timer5.Enabled:= False;
Ini3 := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
try
SDS_Actualizador.Open;
except
Label2.Caption:= 'Intento de conexion fallida.';
TmReiniciar.Enabled:= True;
exit;
end;
Upgrade:= SDS_ActualizadorUPGRADE.AsInteger;
try
Suc:= StrToInt(Ini3.ReadString('ComboBox1', 'Num_Actualizador', ''));
except
Ini3.WriteString('ComboBox1', 'Num_Actualizador', '1');
end;
SDS_Actualizador.Close;
if Suc < Upgrade then
begin
If FileExists(Ruta + 'Actualizador\Easy_Actualizador.exe') then
    begin
        DeleteFile(Ruta + 'Actualizador\Easy_Actualizador.exe');
      end;

Update;
  //Gauge1.Progress:= 0;

  FTP2 := TIdFTP.Create( nil );
  //FTP2.OnWork := IdFTP1Work;
  //FTP.EndWork(wmRead):= IdFTP1WorkEnd
  SDS_Actualizador.Open;
  FTP2.Username := SDS_ActualizadorUSUARIO.AsString;
  FTP2.Password := SDS_ActualizadorCLAVE.AsString;
  FTP2.Host := SDS_ActualizadorSERVIDOR.AsString;
  SDS_Actualizador.Close;

  try
    FTP2.Connect;

   except
   //Usando el servidor alterno
   SDS_Actualizador.Open;
   FTP2.Host:= SDS_ActualizadorSERVIDOR_ALT.AsString;
   SDS_Actualizador.Close;
   try
   FTP2.Connect;
   except
    //raise Exception.Create( 'No se ha podido conectar con el servidor. ');
    Label2.Caption:= 'No se ha podido conectar con el servidor. ';
    Update;
  end;
  end;
  SDS_Actualizador.Open;
  FTP2.ChangeDir( SDS_ActualizadorRUTA_ACTUALIZADOR.AsString );
  SDS_Actualizador.Close;
  Afiles2:= TStringList.Create;
  FTP2.List(AFiles2, 'Easy_Actualizador.exe', False);
    {for r := 0 to Afiles.Count -1 do begin
Barra:= Barra + FTP.Size( ExtractFileName( AFiles[r] ) );
end;
Gauge1.MinValue:= 0;
Gauge1.MaxValue:= Barra;}
  for i := 0 to Afiles2.Count -1 do begin
          //ListBox1.Items.add(AFiles[i]);


   //Label1.Caption:= Afiles[i];
   try
    //PararEjecucion:= False;
    FTP2.BeginWork(wmRead);
    FTP2.Get( ExtractFileName(AFiles2[i]), LetraDisco+'\Easy System S2010\Actualizador\'+AFiles2[i], True, True );
    Sleep(500);
    Except

      //raise Exception.Create( 'No se ha podido iniciar la descarga. ');
      Label2.Caption:= 'No se ha podido iniciar la descarga. ';
      Update;
      //PararEjecucion:= True;
      //Timer3.Enabled:= True;

   end;
 end;
 //If PararEjecucion = True then begin
 //Exit;
 //End
 //Else
 //Begin
 FTP2.EndWork(wmRead);
 FTP2.Disconnect;
 FTP2.Free;
 //if Gauge1.Progress = Gauge1.MaxValue then begin
 //CerrarEs;
 temp4 := TStringList.Create;
   try
     temp4.Add('@echo off');
     temp4.Add('taskkill /f /im Easy_Actualizador.exe');
     temp4.Add('sleep 20');
     temp4.Add('copy /y /v "'+Ruta+'Actualizador\Easy_Actualizador.exe" "'+Ruta);
     temp4.Add(LetraDisco);
     temp4.Add('cd \easy system s2010\');
     temp4.Add('sleep 20');
     temp4.Add('start Easy_Actualizador.exe');
     temp4.SaveToFile(Ruta+'copyAct.bat');
   finally
     temp4.Free;
   end;
   sql:= 'UPDATE AUTO_ACT SET '+Terminal+ ' = ' +IntToStr(Upgrade);
  SQLConnection1.Execute(sql, nil, nil);
  Ini3 := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  Ini3.WriteString( 'ComboBox1', 'Num_Actualizador', IntToStr(Upgrade) );
  Timer5.Enabled:= True;
  shellexecute(Handle, 'open',Pchar(Ruta+'copyAct.bat'),nil,nil,SW_HIDE);
  sleep(1000);

  FActualizador.Close;
  //shellexecute(Handle, 'open',Pchar(Ruta+'copy.bat'),nil,nil,SW_HIDE);
  //end
  //else begin
  //Timer5.Enabled:= True;
  end
  else
  begin
    Rev_Nueva_Act;
  End;  
 


 //end;
//end

end;

procedure TFActualizador.Timer3Timer(Sender: TObject);
begin
FActualizador.Top:= Screen.WorkAreaHeight -187;
FActualizador.Left:= Screen.WorkAreaWidth -597;
DescargarArchivo;
end;

procedure TFActualizador.FormShow(Sender: TObject);
begin
ShowWindow(application.Handle, SW_HIDE)
end;

procedure TFActualizador.OcultarActualizador1Click(Sender: TObject);
begin
FActualizador.Top:= Screen.WorkAreaHeight +187;
FActualizador.Left:= Screen.WorkAreaWidth +597;
end;

procedure TFActualizador.Timer4Timer(Sender: TObject);
begin
CerrandoEs;
end;

procedure TFActualizador.SHChangeNotify1UpdateDir(Sender: TObject; Flags: Cardinal;
  Path1: String);
begin
//Update_Dir:= Path1;
if Path1 = Ruta+'Actualizador' then
begin


end;
end;

procedure TFActualizador.SHChangeNotify1Delete(Sender: TObject; Flags: Cardinal;
  Path1: String);
begin
ShowMessage(Path1);
end;

////////////////////////////////FUNCION OBTENER FECHA DE ARCHIVO: INICIO
function TFActualizador.GetFileTimes(FileName : string; var Created : TDateTime;
    var Modified : TDateTime; var Accessed : TDateTime) : boolean;
var
   FileHandle : integer;
   Retvar : boolean;
   FTimeC,FTimeA,FTimeM : TFileTime;
   LTime : TFileTime;
   STime : TSystemTime;
begin
  // Abrir el fichero
  FileHandle := FileOpen(FileName,fmShareDenyNone);
  // inicializar
  Created := 0.0;
  Modified := 0.0;
  Accessed := 0.0;
  // Ha tenido acceso al fichero?
  if FileHandle < 0 then
    RetVar := false
  else begin
 
    // Obtener las fechas
    RetVar := true;
    GetFileTime(FileHandle,@FTimeC,@FTimeA,@FTimeM);
    // Cerrar
    FileClose(FileHandle);
    // Creado
    FileTimeToLocalFileTime(FTimeC,LTime);
 
    if FileTimeToSystemTime(LTime,STime) then begin
      Created := EncodeDate(STime.wYear,STime.wMonth,STime.wDay);
      Created := Created + EncodeTime(STime.wHour,STime.wMinute,
              STime.wSecond, STime.wMilliSeconds);
    end;
 
    // Accedido
    FileTimeToLocalFileTime(FTimeA,LTime);
 
    if FileTimeToSystemTime(LTime,STime) then begin
      Accessed := EncodeDate(STime.wYear,STime.wMonth,STime.wDay);
      Accessed := Accessed + EncodeTime(STime.wHour,STime.wMinute,
              STime.wSecond, STime.wMilliSeconds);
    end;
 
    // Modificado
    FileTimeToLocalFileTime(FTimeM,LTime);
 
    if FileTimeToSystemTime(LTime,STime) then begin
      Modified := EncodeDate(STime.wYear,STime.wMonth,STime.wDay);
      Modified := Modified + EncodeTime(STime.wHour,STime.wMinute,
                     STime.wSecond, STime.wMilliSeconds);
    end;
  end;
  Result := RetVar;
end;
////////////////////////////////FUNCION OBTENER FECHA DE ARCHIVO: FIN


////////////////////////////////COMPARAR FECHA: INICIO
procedure TFActualizador.CompararFecha;
var
   CDate,MDate,ADate : TDateTime;
   hFile: Integer;
   temp2: TStrings;
begin
  Timer5.Enabled:=False;
  if GetFileTimes(Ruta+'Actualizador\Easy_Actualizador.exe', CDate, MDate, ADate) then begin
    Fecha1:= FormatDateTime('hh:mm:ss AM/PM',MDate);
  end;
  if GetFileTimes(Ruta+'Easy_Actualizador.exe', CDate, MDate, ADate) then begin
    Fecha2:= FormatDateTime('hh:mm:ss AM/PM',MDate);
  end;
  if Fecha1 <> Fecha2 then begin
   temp2 := TStringList.Create;
   try
     temp2.Add('@echo off');
     temp2.Add('taskkill /f /im Easy_Actualizador.exe');
     temp2.Add('sleep 20');
     temp2.Add('copy /y /v "'+Ruta+'Actualizador\easy_actualizador.exe" "'+Ruta);
     temp2.Add(LetraDisco);
     temp2.Add('cd \easy system s2010\');
     temp2.Add('sleep 20');
     temp2.Add('start easy_actualizador.exe');
     temp2.SaveToFile(Ruta+'copy.bat');
   finally
     temp2.Free;
   end;
  shellexecute(Handle, 'open',Pchar(Ruta+'copy.bat'),nil,nil,SW_HIDE);
  FActualizador.Close;
  //shellexecute(Handle, 'open',Pchar(Ruta+'copy.bat'),nil,nil,SW_HIDE);
  end
  else begin
  Timer5.Enabled:= True;
  end;

end;
////////////////////////////////COMPARAR FECHA: FIN



////////////////////////////////COMPARAR FECHA_2: INICIO
procedure TFActualizador.CompararFecha2;
var
   CDate,MDate,ADate : TDateTime;
   hFile: Integer;
   temp3: TStrings;
begin
  Timer5.Enabled:=False;
  if GetFileTimes(LetraDisco+'\Actualizaciones\Reportes Net.rar', CDate, MDate, ADate) then begin
    Fecha1:= FormatDateTime('hh:mm:ss AM/PM',MDate);
  end;
  if GetFileTimes(Ruta+'Reportes Net.rar', CDate, MDate, ADate) then begin
    Fecha2:= FormatDateTime('hh:mm:ss AM/PM',MDate);
  end;
  if Fecha1 <> Fecha2 then begin
   temp3 := TStringList.Create;
   try
     temp3.Add('@echo off');
     temp3.Add('copy /y /v "'+LetraDisco+'\Actualizaciones\Reportes Net.rar" "'+Ruta);
     temp3.Add('path='+Ruta_Winrar);
     temp3.Add('rar.exe x -y "'+ LetraDisco+'\Actualizaciones\Reportes Net.rar" "' + Ruta);
     temp3.SaveToFile(Ruta+'CopyReportes.bat');
   finally
     temp3.Free;
   end;
  shellexecute(Handle, 'open',Pchar(Ruta+'CopyReportes.bat'),nil,nil,SW_HIDE);
  
  //shellexecute(Handle, 'open',Pchar(Ruta+'copy.bat'),nil,nil,SW_HIDE);
  end
  else begin
  Timer5.Enabled:= True;
  end;

end;
////////////////////////////////COMPARAR FECHA_2: FIN



procedure TFActualizador.Timer5Timer(Sender: TObject);
begin
//AutoAct;
//CompararFecha;
//CompararFecha2
end;

procedure TFActualizador.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
 Label2.Caption:= 'Descargando archivos';
 Update;
 BarraProgreso:= BarraProgreso + AWorkCount div 3;
 Gauge1.Progress := BarraProgreso;
end;


function TFActualizador.processExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TFActualizador.TmReiniciarTimer(Sender: TObject);
begin
Label2.Caption:= 'Reiniciando aplicación.';
Update;
MostrarForm:= False;
IniciarApp;
//TmReiniciar.Enabled:= False;
end;

procedure TFActualizador.TmInicioWindowsTimer(Sender: TObject);
begin
  IniciarApp;
end;

procedure TFActualizador.TrayIcon1DblClick(Sender: TObject);
begin
  FActualizador.Top:= Screen.WorkAreaHeight -187;
  FActualizador.Left:= Screen.WorkAreaWidth -597;
end;

procedure TFActualizador.BitBtnNew1Click(Sender: TObject);
begin
  FActualizador.Top:= Screen.WorkAreaHeight +187;
  FActualizador.Left:= Screen.WorkAreaWidth +597;
end;

end.
