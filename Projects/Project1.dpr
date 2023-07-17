program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {EditCEP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEditCEP, EditCEP);
  Application.Run;
end.
