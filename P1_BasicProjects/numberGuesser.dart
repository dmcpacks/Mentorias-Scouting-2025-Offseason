import 'dart:math';
import 'reader.dart';

void main() {
  int max = readInt("Until what number should I think about");

  int num = Random().nextInt(max)+1;

  bool guessed = false;
  while(!guessed) {
    int guess = readInt("What number are you thinking of");
    if(num == guess) {
      guessed = true;
    } else if(num < guess) {
      print("\nGuess lower");
    } else if (num > guess) {
      print("\nGuess higher");
    }
  }
  print("Congratulations, the number was $num");
}