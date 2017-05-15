unit UBullsCows;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TFCowsAndBulls = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    BRefresh: TButton;
    MainMenu1: TMainMenu;
    Fichiers1: TMenuItem;
    Newgame1: TMenuItem;
    N1: TMenuItem;
    Quit1: TMenuItem;
    Label5: TLabel;
    Edit6: TEdit;
    BCheck: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Newgame1Click(Sender: TObject);
    procedure Newgame();
    procedure à(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FCowsAndBulls: TFCowsAndBulls;
  solution: string;
  proposition: string;
  cptEssai: integer;
  tailleMot: integer;
  cptErreur: integer;

implementation

{$R *.dfm}

function checkLongmot(proposition: string): boolean;
var
  check: boolean;
begin
  if length(proposition) > length(solution) then begin
    ShowMessage('Mot trop long ! La proposition doit contenir autant de lettres que le mot à trouver. Veuillez recommencer.');
  end
  else begin
    if length(proposition) < length(solution) then begin
      ShowMessage('Mot trop court ! La proposition doit contenir autant de lettres que le mot à trouver. Veuillez recommencer.');
    end
    else begin
      check:=false;
      checkLongMot:=check;
    end;
  end;
  check:=true;
  checkLongMot:=check;
end;

function checkIsogramme(proposition: string): boolean;
var
  i,j: integer;
  currentLetter,compareLetter: string;
  check: boolean;
begin
  check := true;
  for i := 1 to length(proposition) do begin
    currentLetter := proposition[i];
    for j := 1 to length(proposition) do begin
        compareLetter := proposition[j];
        if i <> j then begin
          if currentLetter = compareLetter then begin
            check := false;
            checkIsogramme := check;
          end;
        end;
    end;
  end;
  checkIsogramme := check;
end;

function countBulls(proposition,solution: string): integer;
var
  i,cpt: integer;
begin
  cpt:=0;
  for i := 1 to length(solution) do begin
    if proposition[i] = solution[i] then begin
      cpt:=cpt+1;
    end;
  end;
  countBulls:=cpt;
end;

function countCows(proposition,solution: string): integer;
var
  i,j,cpt: integer;

begin
  cpt:=0;
  for i := 1 to length(solution) do begin
    for j := 1 to length(solution) do begin
      if (i<>j) and (solution[i]=proposition[j]) then begin
        cpt:=cpt+1;
      end;
    end;
  end;
  countCows:=cpt;
end;

procedure TFCowsAndBulls.à(Sender: TObject);
var
  checkLong,isogramme,minuscule: boolean;
  cptCows,cptBulls: integer;
begin
  //premiere verification (longueur mot)
  proposition := Memo2.Lines[0];
  checkLong := checkLongMot(proposition);
  //deuxieme verification (isogramme)
  isogramme := checkIsogramme(proposition);
  if isogramme = false then begin
    ShowMessage('La proposition doit contenir une seule fois chaque lettre ! Veuillez recommencer.');
  end;
  //troisieme verification (mot minuscule)
  if proposition <> lowercase(proposition) then begin
    minuscule:=false;
    Showmessage('Votre mot doit être écrit en minuscule ! Veuillez recommencer.');
  end
  else begin
    minuscule:=true;
  end;
  if checkLong = true and isogramme = true and minuscule = true then begin
    cptEssai := cptEssai+1;
    Edit4.Text := inttostr(cptEssai);
  end
  else begin
    Memo2.Text := '';
  end;
  cptBulls:=countBulls(proposition,solution);
  Edit1.Text:=inttostr(cptBulls);
  cptCows:=countCows(proposition,solution);
  Edit2.Text:=inttostr(cptCows);
  if cptBulls = length(solution) then begin
    ShowMessage('Gagné !');
    Newgame();
  end
  else begin
    cptErreur:=cptErreur+1;
    Edit3.Text:=inttostr(cptErreur);
  end;
end;

procedure TFCowsAndBulls.FormCreate(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('C:\Users\Lenny\Documents\Embarcadero\Studio\Projets\dico.txt');
  Memo2.Lines.Text := '';
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
end;

function creerMot(nouveauMot: string; Memo1: TMemo): string;
begin
  randomize;
  nouveauMot := Memo1.Lines[random((Memo1.Lines.Count))];
  creerMot := nouveauMot;
end;

procedure TFCowsAndBulls.Newgame();

begin
  cptErreur:=0;
  Memo2.Lines.Text := '';
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit6.Text := '';
  Edit5.Text := '';
  cptEssai := 1;
  Edit4.Text := inttostr(cptEssai);
  solution := creerMot(solution,Memo1);
  tailleMot := length(solution);
  Edit6.Text := inttostr(tailleMot);
end;

procedure TFCowsAndBulls.Newgame1Click(Sender: TObject);
begin
  Newgame();
end;

end.
