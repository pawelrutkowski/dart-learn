import 'dart:io';
import 'dart:async';
import 'dart:collection';
import 'lab1.dart';

// Wypisz 10 najczęstszych słów w pliku tekstowym
// http://www.gutenberg.org/files/730/730.txt („Oliver Twist”) wraz z liczbą wystąpień.
exe1({String fileName = 'Oliver_Twist.txt'}) {
  File(fileName).readAsString().then((String contents) {
    Map<String, num> words = {};

    updateDictionary(element) =>
        words[element] += words[element] == null ? 0 : words[element] + 1;

    contents.split(' ').where(isWord).forEach(updateDictionary);

    sortDesc(k1, k2) => words[k2].compareTo(words[k1]);

    var sortedKeys = words.keys.toList(growable: false)..sort(sortDesc);
    LinkedHashMap sortedMap = new LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => words[k]);
    print(sortedMap.keys.take(10));
  });
}

// Wypisz na ekran tylko te linie pliku tekstowego, które zawierają przynajmniej 10 liter ‘a’ (dla
// „Olivera Twista” jest takich linii ok. 34, pierwsza to „him a thousand embraces, and what
// Oliver wanted a great deal more, a”).
exe2({String fileName = 'Oliver_Twist.txt'}) {
  File(fileName).readAsString().then((String contents) {
    var nomberOfLines = contents
        .split('\n')
        .where((line) => line.split('a').length - 1 >= 10)
        .length;
    print('NomberOfLines $nomberOfLines');
  });
}

// Na dowolnym obrazie przetestuj metody: rotate, resize, crop, transpose.
// Wyniki zapisz do osobnych plików *.PNG.
ex3() {}

// Do dowolnego katalogu wrzuć („ręcznie”) 3 obrazki w formacie JPEG. Napisz skrypt, który w
// pętli :
// a) odczytuje wszystkie pliki .jpg z tego katalogu,
// b) tworzy (nie niszcząc oryginałów) obrazki przycięte (metoda crop) do 60%
// wysokości i szerokości, wycinając ze środka (tj. jeśli obraz ma 960 x 720 pikseli, to
// otrzymujemy w wyniku centralny prostokąt o wymiarach 576 x 432),
// c) na podstawie przyciętych obrazków produkuje miniatury i zapisuje je z
// sufiksem thumb w nazwie. Przykład: obrazek01.jpg  obrazek01thumb.jpg.
ex4() {}

// Wczytaj z klawiatury liczbę z przedziału [1, 50], która będzie procentem szumu
// dodanego do obrazu. Przykładowo „10” oznacza, że w przypadku 2Mpikslowego obrazu
// (rozmiar surowych danych obrazowych) zostaje wylosowanych 0.2M punktów, którym
// nadane są losowe wartości (R,G,B) (każda składowa losowana niezależnie w przedziale [0,
// 255]). Uwaga: nie sprawdzamy, czy dany punkt nie został już wcześniej wylosowany.
// Wynikowy obraz zapisz do nowego pliku.
ex5() {}

// Obraz z ćwiczenia 5 przefiltruj używając:
// a) filtru wygładzającego (blur)
// b) filtru medianowego
// Wyniki zapisz do plików.
ex6() {}

main() {
  (exe2());
}
