﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    xEdit1: TEdit;
    xEdit2: TEdit;
    xEdit3: TEdit;
    xEdit4: TEdit;
    yEdit1: TEdit;
    yEdit2: TEdit;
    yEdit3: TEdit;
    yEdit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Функція для обчислення площі трикутника
function area(a, b, c : Real) : Real;
var p : Real;
  begin
  p := (a + b + c) / 2;
  area := sqrt(p * (p - a) * (p - b) * (p - c))
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  var
x1, y1, x2, y2, x3, y3, x4, y4, Eps, S, S1, S2, S3, AB, BC, AC, DA, DB, DC : Real;;

x1 := strtofloat(xEdit1.Text);
x2 := strtofloat(xEdit2.Text);
x3 := strtofloat(xEdit3.Text);
x4 := strtofloat(xEdit4.Text);
y1 := strtofloat(yEdit1.Text);
y2 := strtofloat(yEdit2.Text);
y3 := strtofloat(yEdit3.Text);
y4 := strtofloat(yEdit4.Text);



// Знаходимо довжини сторін
AC := sqrt(sqr(x3-x1) + sqr(y3-y1));
AB := sqrt(sqr(x2-x1) + sqr(y2-y1));
BC := sqrt(sqr(x3-x2) + sqr(y3-y2));

// Перевірка існування заданого трикутника
if not ((AC + BC > AB) and (AB + AC > BC) and (AB + BC > AC)) then
begin
  showMessage('Трикутника з даними координатами не існує');
end;

  S := area(AC, AB, BC);

  // Допустима похибка
  Eps := 0.0001;

  DA := sqrt(sqr(x4-x1) + sqr(y4-y1));
  DB := sqrt(sqr(x4-x2) + sqr(y4-y2));
  DC := sqrt(sqr(x4-x3) + sqr(y4-y3));

  S1 := area(AC, DA, DC);
  S2 := area(AB, DB, DA);
  S3 := area(BC, DB, DC);

  // Перевірка місцезнаходження точки D
  if (abs(S - (S1 + S2 + S3)) < Eps) and ((AC + BC > AB) and (AB + AC > BC) and (AB + BC > AC)) then
  begin
    if abs(S1 - S) < Eps then
    begin
      showMessage('Точка D лежить на вершині B');
    end
    else if abs(S2 - S) < Eps then
    begin
      showMessage('Точка D лежить на вершині C');
    end
    else if abs(S3 - S) < Eps then
    begin
      showMessage('Точка D лежить на вершині A');
    end
    else if S1 < Eps then
    begin
      showMessage('Точка D лежить на стороні AC');
    end
    else if S2 < Eps then
    begin
      showMessage('Точка D лежить на стороні AB');
    end
    else if S3 < Eps then
    begin
      showMessage('Точка D лежить на стороні BC');
    end
    else
    begin
      showMessage('Точка D лежить в середині трикутника');
    end;
  end;
  if (abs(S - (S1 + S2 + S3)) > Eps) and (AC + BC > AB) and (AB + AC > BC) and (AB + BC > AC) then
  begin
    showMessage('Точка D лежить за межами трикутника');
  end
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

end.
