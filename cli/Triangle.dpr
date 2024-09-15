Program triangle_and_dot;

var
x1, y1, x2, y2, x3, y3, x4, y4, Eps, S, S1, S2, S3, AC, AB, BC, DA, DB, DC : Real;
answer : String;

// Функція для обчислення площі трикутника
function area(a, b, c : Real) : Real;
var p : Real;
  begin
  p := (a + b + c) / 2;
  area := sqrt(p * (p - a) * (p - b) * (p - c))
end;

BEGIN
write('Введіть координати x і y точки A: ');
readln(x1, y1);
write('Введіть координати x і y точки B: ');
readln(x2, y2);
write('Введіть координати x і y точки C: ');
readln(x3, y3);


// Обчислення довжини сторін
AC := sqrt(sqr(x3-x1) + sqr(y3-y1));
AB := sqrt(sqr(x2-x1) + sqr(y2-y1));
BC := sqrt(sqr(x3-x2) + sqr(y3-y2));

// Перевірка існування заданого трикутника
if not ((AC + BC > AB) and (AB + AC > BC) and (AB + BC > AC)) then
begin
  writeln('');
  writeln('Трикутника з даними координатами не існує');
  readln;
  exit;
end;

  S := area(AC, AB, BC);

  // Допустима похибка
  Eps := 0.0001;

while True do
  begin
  write('Введіть координати x і y точки D: ');
  readln(x4, y4);
  writeln('');

  DA := sqrt(sqr(x4-x1) + sqr(y4-y1));
  DB := sqrt(sqr(x4-x2) + sqr(y4-y2));
  DC := sqrt(sqr(x4-x3) + sqr(y4-y3));

  S1 := area(AC, DA, DC);
  S2 := area(AB, DB, DA);
  S3 := area(BC, DB, DC);

  // Перевірка місцезнаходження точки D
  if abs(S - (S1 + S2 + S3)) < Eps then
    if abs(S1 - S) < Eps then
    begin
      writeln('Точка D лежить на вершині B');
      writeln('---------------------------');
    end
    else if abs(S2 - S) < Eps then
    begin
      writeln('Точка D лежить на вершині C');
      writeln('---------------------------');
    end
    else if abs(S3 - S) < Eps then
    begin
      writeln('Точка D лежить на вершині A');
      writeln('---------------------------');
    end
    else if S1 < Eps then
    begin
      writeln('Точка D лежить на стороні AC');
      writeln('----------------------------');
    end
    else if S2 < Eps then
    begin
      writeln('Точка D лежить на стороні AB');
      writeln('----------------------------');
    end
    else if S3 < Eps then
    begin
      writeln('Точка D лежить на стороні BC');
      writeln('----------------------------');
    end
    else
    begin
      writeln('Точка D лежить в середині трикутника');
      writeln('------------------------------------');
    end
  else
  begin
    writeln('Точка D лежить за межами трикутника');
    writeln('-----------------------------------');
  end;

  writeln('Введіть "exit", щоб завершити роботу або натисніть Enter, щоб продовжити');
  read(answer);

  if answer = 'exit' then
    break
end;
END.
