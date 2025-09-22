import '../P1_BasicProjects/reader.dart';

void main() {
  int shift = readInt("Enter shift");
  String word = readString("Enter word to cipher").toLowerCase();

  List<String> splitWord = word.split("");

  List<String> cipheredList = cipher(splitWord, shift);
  String ciphered = joinList(cipheredList);
  print(ciphered);

  String word2 = readString("Enter word to decipher").toLowerCase();

  List<String> splitWordDe = word2.split("");

  List<String> decipheredList = decipher(splitWordDe, shift);
  String deciphered = joinList(decipheredList);
  print(deciphered);
}

List<String> cipher(List<String> list, int shift) {
  List<String> alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
  List<String> ciphered = [];

  for(String char in list) {
    int pos = alphabet.indexOf(char);

    if(pos >= 0) {
      pos += shift;
      if(pos > alphabet.length) {
        pos -= alphabet.length;
      }
      ciphered.add(alphabet[pos]);
    } else {
      ciphered.add(char);
    }
  }

  return ciphered;
}

List<String> decipher(List<String> list, int shift) {
  List<String> alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
  List<String> deciphered = [];

  for(String char in list) {
    int pos = alphabet.indexOf(char);
    if(pos >= 0) {
      pos -= shift;
      if(pos < 0) {
        pos += alphabet.length;
      }
      deciphered.add(alphabet[pos]);
    } else {
      deciphered.add(char);
    }
  }

  return deciphered;
}

String joinList(List<String> list) {
  String word = "";
  for (String char in list) {
    word += char;
  }
  return word;
}