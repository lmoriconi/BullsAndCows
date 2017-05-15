program PBullsCows;

uses
  Vcl.Forms,
  UBullsCows in 'UBullsCows.pas' {FCowsAndBulls};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCowsAndBulls, FCowsAndBulls);
  Application.Run;
end.
