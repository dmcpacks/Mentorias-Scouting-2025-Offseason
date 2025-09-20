import 'reader.dart';

void main() {
  int start = 0;
  int end = 100;
  int mid = ((start+end)/2).floor();
  int count = 0;
  bool guessed = false;

  while(count < 7 && !guessed) {
    String isNumber = readString("Is your number $mid (y/n)");

    if(isNumber == "y") {
      guessed = true;

    } else {

      String isGreater = readString("Is your number greater than $mid (y/n)");
      if(isGreater == "y") {
        start = mid;
      } else {
        end = mid;
      }

    }

    mid = ((start+end)/2).floor();
    count++;
  }

  if(!guessed) {
    print("Liar liar pants on fire");
  } else {
    print("I guessed your number was $mid in $count attempts");
  }
}