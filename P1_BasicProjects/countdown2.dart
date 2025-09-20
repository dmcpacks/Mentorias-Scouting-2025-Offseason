import 'reader.dart';
import 'dart:io';

void main() {
  int seconds = readInt("How many seconds should the timer be");

  while(seconds >= 0) {
    display(seconds);
    seconds--;
    sleep(Duration(milliseconds:1));
  }
  print("Time's up!");
}

void display(int seconds) {
  int hour = (seconds/3600).floor();
  seconds -= hour*3600;
  int minutes = (seconds/60).floor();
  seconds -= minutes*60;

  print("$hour:$minutes:$seconds");
}