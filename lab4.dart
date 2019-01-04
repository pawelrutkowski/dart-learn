// Napisz klasę Point posiadającą dwie publiczne zmienne x i y, będące współrzędnymi
// pewnego punktu. Klasa ta powinna posiadać dwuargumentowy konstruktor ustawiający
// zmienne x i y oraz publiczną metodę printCoords(self) wypisującą przekazane
// współrzędne na ekran. Utwórz obiekt klasy Punkt przekazując jako argumenty x = 10 oraz
// y = 20 oraz wywołaj utworzoną metodę.

class Point {
  num x, y;
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }

  printCoords() {
    print("point.x: ${this.x}, point.y: ${this.y}");
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
  Point2(num x, num y) {
    this._x = x;
    this._y = y;
  }

  printCoords() {
    print("point.x: ${this._x}, point.y: ${this._y}");
  }

  getX() {
    return this._x;
  }

  setX(x) {
    this._x = x;
  }

  getY() {
    return this._y;
  }

  setY(y) {
    this._y = y;
  }
}

exe2() {
  Point2 point = Point2(10, 20);
  point.printCoords();

  point.setX(1);
  point.setY(2);

  print('x: ${point.getX()}');
  print('y: ${point.getY()}');
}

// Napisz klasę Point3D dziedziczącą po klasie Punkt oraz zawierającą dodatkową,
// prywatną zmienną z. W trójargumentowym konstruktorze klasy Point3D wywołaj
// konstruktor klasy Point oraz ustaw z. Dopisz metodę getZ(self) oraz setZ(self, z).

class Point3D extends Point2 {
  num _z;

  Point3D(num x, num y, num z) : super(x, y) {
    this._z = z;
  }

  getZ() {
    return this._z;
  }

  setZ(z) {
    this._z = z;
  }

  @override
  printCoords() {
    print("point.x: ${this._x}, point.y: ${this._y}, point.z: ${this._z}");
  }
}

exe3() {
  Point3D point = Point3D(10, 20, 30);
  point.printCoords();

  point.setX(1);
  point.setY(2);
  point.setZ(3);

  print('x: ${point.getX()}');
  print('y: ${point.getY()}');
  print('z: ${point.getZ()}');
}

// Napisz klasę Point4D dziedziczącą po utworzonych klasach Point oraz Point3D oraz
// zawierającą dodatkową prywatną zmienną t. W czteroargumentowym konstruktorze klasy
// Point4D wywołaj odpowiedni konstruktor klasy podrzędnej oraz ustaw wartość zmiennej
// t. Dodatkowo napisz prywatną metodę print4DCoords(self) wypisującą na ekran
// wartości wszystkich przekazanych współrzędnych, korzystając z utworzonych „getterów”.
class Point4D extends Point3D {
  num _t;

  Point4D(num x, num y, num z, num t) : super(x, y, z) {
    this._t = t;
  }

  getT() {
    return this._t;
  }

  setT(t) {
    this._t = t;
  }

  print4DCoords() {
    print(
        "point.x: ${this.getX()}, point.y: ${this.getY()}, point.z: ${this.getZ()}, point.t: ${this.getT()}");
  }
}

exe4() {
  Point4D point = Point4D(10, 20, 30, 40);
  point.print4DCoords();

  point.setX(1);
  point.setY(2);
  point.setZ(3);
  point.setT(4);

  print('x: ${point.getX()}');
  print('y: ${point.getY()}');
  print('z: ${point.getZ()}');
  print('t: ${point.getT()}');
}

void main() {
  exe4();
}
