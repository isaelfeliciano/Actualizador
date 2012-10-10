program Easy_Actualizador;

uses
  Forms,
  UActualizador in 'UActualizador.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ES Actualizador';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
