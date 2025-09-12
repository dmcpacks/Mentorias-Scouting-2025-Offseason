import 'reader.dart';

void main() {
  bool running = true;
  print("Type exit to exit the program");
  while(running) {
    String word = readString("Enter palindrome");

    if(word == "exit") {
      running = false;
    } else {
      List<String> chars = word.split("");
      chars = reverse(chars);
      String palindrome = joinList(chars);
      if(word == palindrome) {
        print("$palindrome is a palindrome of $word");
      } else {
        print("$palindrome is not a palindrome of $word");
      }

    }
  }
}

List<String> reverse(List<String> list) {
  List<String> reversed = [];
  for(int i = list.length-1; i >= 0; i--) {
    reversed.add(list[i]);
  }
  return reversed;
}

String joinList(List<String> list) {
  String word = "";
  for(String char in list) {
    word += char;
  }
  return word;
}