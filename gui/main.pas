unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    result: TLabel;
    l_y4: TLabel;
    yedit1: TEdit;
    yedit2: TEdit;
    yedit3: TEdit;
    l_y1: TLabel;
    l_y2: TLabel;
    l_y3: TLabel;
    solveButton: TButton;
    exitButton: TButton;
    xedit1: TEdit;
    xedit2: TEdit;
    xedit3: TEdit;
    xedit4: TEdit;
    l_x1: TLabel;
    l_x2: TLabel;
    l_x3: TLabel;
    l_x4: TLabel;
    yedit4: TEdit;
    procedure exitButtonClick(Sender: TObject);
    procedure l_x1Click(Sender: TObject);
    procedure solveButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.l_x1Click(Sender: TObject);
begin

end;

procedure TForm1.exitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.solveButtonClick(Sender: TObject);

var 
x1, y1, x2, y2, x3, y3, x4, y4, Eps, S, S1, S2, S3, a, b, c, d, e, g : Real;
answer : String;

// Функція для обчислення площі трикутника
function area(a, b, c : Real) : Real;
var p : Real;
  begin
  p := (a + b + c) / 2;
  area := sqrt(p * (p - a) * (p - b) * (p - c))
end;

begin
x1 := strToFloat(xedit1.text);
x2 := strToFloat(xedit2.text);
x3 := strToFloat(xedit3.text);
y1 := strToFloat(yedit1.text);
y2 := strToFloat(yedit2.text);
y3 := strToFloat(yedit3.text);

Eps := 0.0001;
// Знаходимо довжини сторін
a := sqrt(sqr(x3-x1) + sqr(y3-y1));
b := sqrt(sqr(x2-x1) + sqr(y2-y1));
c := sqrt(sqr(x3-x2) + sqr(y3-y2));

S := area(a, b, c);

while True do
  begin 
    x4 := strToFloat(xedit4.text);
    y4 := strToFloat(yedit4.text);

    d := sqrt(sqr(x4-x1) + sqr(y4-y1));
    g := sqrt(sqr(x4-x2) + sqr(y4-y2));
    e := sqrt(sqr(x4-x3) + sqr(y4-y3));

    S1 := area(a, d, e);  
    S2 := area(b, d, g);  
    S3 := area(c, g, e);

    if abs(S - (S1 + S2 + S3)) < Eps then
      begin
      writeln('Точка 4 лежить в середині трикутника');
      writeln('------------------------------------');
      end
    else
      begin
      writeln('Точка 4 лежить за межами трикутника');
      writeln('-----------------------------------');
      end;

    writeln('Введіть exit якщо бажаєте завершити роботу або Enter щоб продовжити');
    read(answer);

    if answer = 'exit' then
      break;
end
end;

end.

