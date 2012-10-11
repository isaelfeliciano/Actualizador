unit UNuevaAct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UActualizador, ExtCtrls, ShellApi, ShellCtrls, jpeg;

type
  TFNuevaAct = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNuevaAct: TFNuevaAct;

implementation

{$R *.dfm}

procedure TFNuevaAct.BitBtn1Click(Sender: TObject);
var
   temp: TStrings; Kill_Task: String;
 begin
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
Form1.Copiando_Rars;

end;

procedure TFNuevaAct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= Cafree;
end;

procedure TFNuevaAct.FormCreate(Sender: TObject);
begin
FNuevaAct.ShowModal;
end;

procedure TFNuevaAct.BitBtn2Click(Sender: TObject);
begin
Memo1.Visible:= True;
BitBtn2.Visible:= False;
Label3.Visible:= False;
FNuevaAct.Top:= Screen.WorkAreaHeight -191;
FNuevaAct.Left:= Screen.WorkAreaWidth -517;
//Form1.Top:= Screen.WorkAreaHeight +187;
//Form1.Left:= Screen.WorkAreaWidth +597;
end;

end.
