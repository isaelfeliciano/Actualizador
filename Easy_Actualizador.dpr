program Easy_Actualizador;

uses
  Forms, windows,
  UActualizador in 'UActualizador.pas' {FActualizador},
  UNuevaAct in 'UNuevaAct.pas' {FNuevaAct};

{$R *.res}

var PreviousHandle :THandle;
begin
PreviousHandle:= FindWindow('TFActualizador', 'FActualizador');
  //if PreviousHandle = 0 then
 // begin
  Application.Initialize;
  Application.Title := 'ES Actualizador v1.0';
  Application.CreateForm(TFActualizador, FActualizador);
  Application.Run;
  //end
  //else
  //SetForeGroundWindow(PreviousHandle);
end.
