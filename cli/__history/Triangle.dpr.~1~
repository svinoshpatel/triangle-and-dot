program Triangle;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

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

BEGIN
write('Введіть координати x і y точки 1: ');
readln(x1, y1);
write('Введіть координати x і y точки 2: ');
readln(x2, y2);
write('Введіть координати x і y точки 3: ');
readln(x3, y3);

Eps := 0.0001;
// Знаходимо довжини сторін
a := sqrt(sqr(x3-x1) + sqr(y3-y1));
b := sqrt(sqr(x2-x1) + sqr(y2-y1));
c := sqrt(sqr(x3-x2) + sqr(y3-y2));

S := area(a, b, c);

while True do
  begin
    write('Введіть координати x і y точки 4: ');
    readln(x4, y4);
    writeln('');

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
END.
