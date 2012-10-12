program Easy_Actualizador;

uses
  Forms,
  UActualizador in 'UActualizador.pas' {Form1},
  UNuevaAct in 'UNuevaAct.pas' {FNuevaAct};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ES Actualizador v1.0';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
