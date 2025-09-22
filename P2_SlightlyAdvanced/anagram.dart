import '../P1_BasicProjects/reader.dart';

void main() {

  String word1 = readString("Enter word 1");
  String word2 = readString("Enter word 2");

  List<String> word1chars = sortList(word1.split(""));
  List<String> word2chars = sortList(word2.split(""));

  String sortedW1 = joinList(word1chars);
  String sortedW2 = joinList(word2chars);

  if(sortedW1 == sortedW2) {
    print("Your words are anagrams!");
  } else {
    print("Your words aren't anagrams :(");
  }
}

List<String> sortList(List<String> list) {

  int lengthOfArray = list.length;
  for (int i = 0; i < lengthOfArray - 1; i++) {
    for (int j = 0; j < lengthOfArray - i - 1; j++) {
      if (list[j].compareTo(list[j + 1]) > 0) {
        // Swapping using temporary variable
        String temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

String joinList(List<String> list) {
  String word = "";
  for (String char in list) {
    word += char;
  }
  return word;
}