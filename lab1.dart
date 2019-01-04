import "dart:io";
import "dart:core";

// Poproś użytkownika o podanie dwóch napisów, przy czym drugi z nich musi być 1-literowy
// (jeśli nie jest, wypisz komunikat o błędzie). Następnie napisz, ile razy drugi napis mieści się w
// pierwszym.
exe1() {
  print("insert string:");
  String string1 = stdin.readLineSync();

  print("insert string with length == 1:");
  String string2 = stdin.readLineSync();

  if (string2.length == 1) {
    print('second string length != 1\n');
  }

  int allMatches = string1.split(string2).length - 1;

  return "All matches string 2 in string 1: $allMatches";
}

// Napisz funkcję przyjmującą na wejściu adres email (jako string) i zwracającą ten adres w
// postaci „antyspamowej” (zamiast kropek niech będą spacje, zamiast @ tekst (a) ).
exe2() {
  print("insert email:");
  String email = stdin.readLineSync();
  String result = email.replaceAll('.', ' ').replaceAll('@', '(a)');
  return "Result: $result";
}

// Wczytaj dwie nazwy miesięcy (nie sprawdzamy poprawności pisowni) i napisz, ile miesięcy
// mija od pierwszego z miesięcy do drugiego. Jeśli drugi jest wcześniejszy, to zakładamy, że
// jest on w następnym roku. Przykład: marzec, maj, na wyjściu: 2; maj, styczeń, na wyjściu: 8;
// luty, luty, na wyjściu: 12. Dla wygody możesz ograniczyć nazwy miesięcy do pierwszych 3
exe3() {
  const List<String> monthsList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  print("insert month:");
  String month1 = stdin.readLineSync();

  print("insert month:");
  String month2 = stdin.readLineSync();

  var indexOfMonth1 = monthsList.indexOf(month1);
  var indexOfMonth2 = monthsList.indexOf(month2);

  var condition = indexOfMonth2 - indexOfMonth1;

  var monthsNumber = condition >= 0
      ? indexOfMonth2 - indexOfMonth1 - 1
      : 12 - indexOfMonth1 + indexOfMonth2 - 1;

  return "Between $month1 and $month2 is ${monthsNumber == -1 ? 0 : monthsNumber} months";
}

// Ile jest różnych znaków w treści tego zadania?
exe4({String input = "Ile jest różnych znaków w treści tego zadania?"}) {
  Set result = Set.from(input.split(''));
  return "Count of differents character in this input: '$input', is: ${result.length}";
}

// Napisz funkcję, która przyjmuje 2 napisy i stwierdza, czy przekazane teksty są w tym samym
// języku. Jeśli część wspólna zawiera przynajmniej 2 wspólne słowa (przy czym odrzucamy
// liczby etc.), to zakładamy zgodność języka.

bool isLetter(int codeUnit) {
  return 65 <= codeUnit && codeUnit <= 123;
}

bool isWord(String input) {
  for (var character in input.codeUnits) {
    if (!isLetter(character)) {
      return false;
    }
  }
  return true;
}

exe5() {
  print("insert sentence:");
  String sentence1 = stdin.readLineSync();

  print("insert sentence:");
  String sentence2 = stdin.readLineSync();

  Set<String> setOfWordsFromSentence1 =
      Set.from((sentence1.split(' ').where(isWord)));
  Set<String> setOfWordsFromSentence2 =
      Set.from((sentence2.split(' ').where(isWord)));

  var numberOfThisSameWords =
      setOfWordsFromSentence1.intersection(setOfWordsFromSentence2).length;

  return numberOfThisSameWords >= 2
      ? 'same languages, number of this same words: $numberOfThisSameWords'
      : 'different languages, number of this same words: $numberOfThisSameWords';
}

// 6. Dany jest string s1 złożony z kilku słów. W JEDNEJ LINII utwórz string s2 zawierający znaki '_'
// w miejscu spacji w s1.

exe6({String input = 'text text text text\ntext text'}) {
  return input.replaceAll(' ', '_');
}

// Napisz jednolinijkową funkcję rysującą prostokąt ze znaczków dolara o wymiarach a i b;
// domyślna liczba wierszy, tj. b, niech wynosi 1.
exe7({a = 3, b = 1, character = "\$"}) {
  Iterable<int> range(int low, int high) sync* {
    for (int i = low; i < high; ++i) {
      yield i;
    }
  }

  var output = '';
  for (final i in range(0, b)) {
    for (final j in range(0, a)) {
      output += '\$ ';
    }
    output += '\n';
  }
  return output;
}

// W JEDNEJ LINII kodu wygeneruj wynikową listę kwadratów pierwszych czterech cyfr w
// przykładowej liście: [1, 2, 3, 4, 5] -> [1, 4, 9, 16].
exe8(List<num> input) => input.take(4).map((element) => element * element);

main() {
  var input = [1, 2, 3, 4, 5];
  print(exe8(input));
}
