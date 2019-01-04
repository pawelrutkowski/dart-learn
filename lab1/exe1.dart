import "dart:io";

// Poproś użytkownika o podanie dwóch napisów, przy czym drugi z nich musi być 1-literowy
// (jeśli nie jest, wypisz komunikat o błędzie). Następnie napisz, ile razy drugi napis mieści się w
// pierwszym.

main() {
  print("insert string:");
  String string1  = stdin.readLineSync();

  print("insert string with length == 1:");
  String string2  = stdin.readLineSync();

  if(string2.length == 1){
    print('second string length != 1\n');
  }

  var allMatches = string1.split(string2).length - 1;

  print("All matches string 2 in string 1: $allMatches");
}