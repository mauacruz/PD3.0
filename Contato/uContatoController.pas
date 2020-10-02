unit uContatoController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/api/v1')]
  TContatoController = class(TMVCController)

    public
      [MVCPath('/echostring/($Value)')]
      [MVCHTTPMethod([httpGET])]
      procedure GetEchoString(const Value: string);

    protected
      procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
      procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TContatoController.OnAfterAction(Context: TWebContext; const AActionName: string);
begin
  { Executed after each action }
  inherited;
end;

procedure TContatoController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

procedure TContatoController.GetEchoString(const Value: string);
var
  lStringBuilder: TStringBuilder;
begin
  lStringBuilder := TStringBuilder.Create;
  try
    lStringBuilder.Append('{"Result":"');
    lStringBuilder.Append(Value);
    lStringBuilder.Append('"}');
    Render(lStringBuilder.ToString);
  finally
    lStringBuilder.Free;
  end;

end;

end.
