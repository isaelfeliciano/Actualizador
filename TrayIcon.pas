// --------------------------------------------------------------------------
// TrayIcon.pas
//
// Copyright 1999, 2004  Antony Pranata
// http://www.antonypranata.com
//
// TTrayIcon Component version 1.2
// This component allows you to display icon on a Windows task bar.
//
// This component is free software; you can use it for any private or
// educational applications. If you want to use it in commercial
// applications, please contact me.
// --------------------------------------------------------------------------

unit TrayIcon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TTrayIcon = class(TComponent)
  private
    OldWndProc: TFarProc;
    NewWndProc: Pointer;
    parentHwnd: HWND;
    FID: UINT;
    FTip: string;
    FIcon: TIcon;
    FPopupMenu: TPopupMenu;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnMouseDown: TNotifyEvent;
    FOnMouseMove: TNotifyEvent;
    FOnMouseUp: TNotifyEvent;

    function DoTray (action: DWORD): boolean;
    procedure SetFIcon(const Value: TIcon);
    procedure SetFTip(const Value: string);
  protected
    procedure WndProc (var Msg: TMessage);
    procedure IconChanged (Sender: TObject);
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;

    function Show: boolean;
    function Hide: boolean;
  published
    property Icon: TIcon read FIcon write SetFIcon;
    property Tip: string read FTip write SetFTip;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnMouseDown: TNotifyEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TNotifyEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TNotifyEvent read FOnMouseUp write FOnMouseUp;
  end;

procedure Register;

implementation

type
  NOTIFYICONDATA  = record
    cbSize           : DWORD;
    hWnd             : HWND;
    uID              : UINT;
    uFlags           : UINT;
    uCallbackMessage : UINT;
    hIcon            : HICON;
    szTip            : array [0..63] of char;
  end;

const
  NIM_ADD            = $0;
  NIM_MODIFY         = $1;
  NIM_DELETE         = $2;

  NIF_MESSAGE        = $1;
  NIF_ICON           = $2;
  NIF_TIP            = $4;

function Shell_NotifyIcon(
  flag: DWORD; var data: NOTIFYICONDATA): BOOL; stdcall;
  external 'shell32.dll' name 'Shell_NotifyIcon';

{ TTrayIcon }

constructor TTrayIcon.Create(AOwner: TComponent);
var
  form: TForm;
  i: integer;
  counter: integer;
begin
  // Calls parent's constructor
  inherited Create(AOwner);

  // Assigns a default value.
  FID   := 0;
  FIcon := TIcon.Create;
  FIcon.OnChange := IconChanged;
  FTip  := '';

  // Assigns a new window procedure.
  if (Owner is TForm) then
  begin
    parentHwnd := (Owner as TForm).Handle;
    OldWndProc := TFarProc(GetWindowLong(parentHwnd, GWL_WNDPROC));
    NewWndProc := MakeObjectInstance(WndProc);
    SetWindowLong(parentHwnd, GWL_WNDPROC, Longint(NewWndProc));

    counter := 0;
    form := (Owner as TForm);
    for i := 0 to form.ComponentCount - 1 do
      if (form.Components[i] is TTrayIcon) then
        inc(counter);
    FID := counter;
  end
  else
  begin
    parentHwnd := 0;
    OldWndProc := nil;
    NewWndProc := nil;
  end;
end;

destructor TTrayIcon.Destroy;
begin
  // Hides the icon.
  DoTray(NIM_DELETE);

  // Destroys the icon.
  FIcon.Free;

  // Restore the old window procedure
  if (OldWndProc <> nil) then
    SetWindowLong(parentHwnd, GWL_WNDPROC, Longint(OldWndProc));
  if (NewWndProc <> nil) then
    FreeObjectInstance(NewWndProc);

  // Call the default destructor
  inherited Destroy;
end;

function TTrayIcon.DoTray(action: DWORD): boolean;
var
  tnd: NOTIFYICONDATA;
begin
  tnd.cbSize := sizeof(NOTIFYICONDATA);
  tnd.hWnd := parentHwnd;
  tnd.uID := FID;
  tnd.uFlags := NIF_ICON or NIF_MESSAGE;
  if (FIcon.Empty) then
    tnd.hIcon := LoadIcon(0, IDI_WINLOGO)
  else
    tnd.hIcon := FIcon.Handle;
  tnd.uCallbackMessage := WM_USER + FID;

  if (FTip <> '') then
  begin
    tnd.uFlags := tnd.uFlags or NIF_TIP;
    StrPCopy(@tnd.szTip,  FTip);
  end;

  Result := Shell_NotifyIcon(action, tnd);
end;

function TTrayIcon.Show: boolean;
begin
  Result := DoTray(NIM_ADD);
end;

function TTrayIcon.Hide: boolean;
begin
  Result := DoTray(NIM_DELETE);
end;

procedure TTrayIcon.SetFIcon(const Value: TIcon);
begin
  FIcon.Assign(Value);
  DoTray(NIM_MODIFY);
end;

procedure TTrayIcon.SetFTip(const Value: string);
begin
  FTip := Value;
  DoTray(NIM_MODIFY);
end;

procedure TTrayIcon.WndProc (var Msg: TMessage);
var
  point: TPoint;
begin
  // Messages from the icon.
  if (Msg.Msg = WM_USER + FID) then
  begin
    case Msg.lParam of
      WM_LBUTTONDBLCLK,
      WM_MBUTTONDBLCLK,
      WM_RBUTTONDBLCLK:
        if Assigned(OnDblClick) then
          OnDblClick(Self);

      WM_LBUTTONDOWN,
      WM_MBUTTONDOWN,
      WM_RBUTTONDOWN:
      begin
        if ((Msg.lParam = WM_RBUTTONDOWN) and Assigned(FPopupMenu)
           and (FPopupMenu.AutoPopup)) then
        begin
          SetForegroundWindow(parentHwnd);
          Application.ProcessMessages;
          FPopupMenu.PopupComponent := (Owner as TForm);
          GetCursorPos(point);
          FPopupMenu.Popup(point.x, point.y);
          Application.ProcessMessages;
        end

        else if (Assigned(OnMouseDown)) then
          OnMouseDown(Self)

        else if (Assigned (OnClick)) then
          OnClick(Self);
      end;

      WM_MOUSEMOVE:
        if Assigned(OnMouseMove) then
          OnMouseMove(Self);

      WM_LBUTTONUP,
      WM_MBUTTONUP,
      WM_RBUTTONUP:
        if Assigned(OnMouseUp) then
          OnMouseUp(Self);

      else
      begin
        Msg.Result := 1;
        exit;
      end;
    end;
  end

  // Calls the default window procedure.
  else
    Msg.Result := CallWindowProc(OldWndProc, parentHWnd,
      Msg.Msg, Msg.wParam, Msg.lParam);
end;

procedure TTrayIcon.IconChanged (Sender: TObject);
begin
  DoTray(NIM_MODIFY);
end;

procedure Register;
begin
  RegisterComponents('AntonyPranata.com', [TTrayIcon]);
end;

end.

