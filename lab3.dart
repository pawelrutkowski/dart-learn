// Napisz klasę Point posiadającą dwie publiczne zmienne x i y, będące współrzędnymi
// pewnego punktu. Klasa ta powinna posiadać dwuargumentowy konstruktor ustawiający
// zmienne x i y oraz publiczną metodę printCoords(self) wypisującą przekazane
// współrzędne na ekran. Utwórz obiekt klasy Punkt przekazując jako argumenty x = 10 oraz
// y = 20 oraz wywołaj utworzoną metodę.

class Point {
  num x, y;
  Point(this.x, this.y);

  printCoords() {
    print("point.x: ${x}, point.y: ${y}");
  }
}

exe1() {
  Point point = Point(10, 20);
  point.printCoords();
}

// Zmodyfikuj klasę Point, tak aby zmienne x i y stały się prywatne. Dopisz metody
// getX(self), getY(self), setX(self, x), setY(self, y) odpowiednio pobierające i
// ustawiające wartości zmiennych klasy Point.

class Point2 {
  num _x, _y;
  Point2(this._x, this._y);

  printCoords() {
    print("point.x: ${_x}, point.y: ${_y}");
  }

  get x => _x;
  set x(x) => _x = x;

  get y => _y;
  set y(y) => _y = y;
}

exe2() {
  Point2 point = Point2(10, 20);
  point.printCoords();

  point.x = 1;
  point.y = 2;

  print('x: ${point.x}');
  print('y: ${point.y}');
}

// Napisz klasę Point3D dziedziczącą po klasie Punkt oraz zawierającą dodatkową,
// prywatną zmienną z. W trójargumentowym konstruktorze klasy Point3D wywołaj
// konstruktor klasy Point oraz ustaw z. Dopisz metodę getZ(self) oraz setZ(self, z).

class Point3D extends Point2 {
  num _z;

  Point3D(num x, num y, this._z) : super(x, y);

  get z => _z;
  set z(z) => _z = z;

  @override
  printCoords() {
    print("point.x: ${_x}, point.y: ${_y}, point.z: ${_z}");
  }
}

exe3() {
  Point3D point = Point3D(10, 20, 30);
  point.printCoords();

  point.x = 1;
  point.y = 2;
  point.z = 3;

  print('x: ${point.x}');
  print('y: ${point.y}');
  print('z: ${point.z}');
}

// Napisz klasę Point4D dziedziczącą po utworzonych klasach Point oraz Point3D oraz
// zawierającą dodatkową prywatną zmienną t. W czteroargumentowym konstruktorze klasy
// Point4D wywołaj odpowiedni konstruktor klasy podrzędnej oraz ustaw wartość zmiennej
// t. Dodatkowo napisz prywatną metodę print4DCoords(self) wypisującą na ekran
// wartości wszystkich przekazanych współrzędnych, korzystając z utworzonych „getterów”.
class Point4D extends Point3D {
  num _t;

  Point4D(num x, num y, num z, this._t) : super(x, y, z);

  get t => _t;
  set t(t) => _t = t;

  print4DCoords() {
    print("point.x: ${x}, point.y: ${y}, point.z: ${z}, point.t: ${t}");
  }
}

exe4() {
  Point4D point = Point4D(10, 20, 30, 40);
  point.print4DCoords();

  point.x = 1;
  point.y = 2;
  point.z = 3;
  point.t = 4;

  print('x: ${point.z}');
  print('y: ${point.y}');
  print('z: ${point.z}');
  print('t: ${point.t}');
}

// additional: interfaces
class Person {
  final _name;
  Person(this._name);
  String greet(String who) => "$who: Person, $_name";
}

class Impostor implements Person {
  get _name => '';
  String greet(String who) => "$who: Impostor, $_name";
}

String greatBob(Person person) => person.greet('Bob');

// mixins
enum Color { red, green, blue }

class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

void main() {
  exe1();
  exe2();
  exe3();
  exe4();

  print(greatBob((Person('Kathy'))));
  print(greatBob((Impostor())));

  String result = '';

  AB ab = AB();
  result += ab.getMessage();

  BA ba = BA();
  result += ba.getMessage();

  print(result); // BA
}
