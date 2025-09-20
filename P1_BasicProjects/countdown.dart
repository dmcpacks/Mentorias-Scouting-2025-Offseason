import 'reader.dart';
import 'dart:io';

void main() {
  int seconds = readInt("How many seconds should the timer be");

  int hour = (seconds/3600).floor();
  seconds -= hour*3600;
  int minutes = (seconds/60).floor();
  seconds -= minutes*60;
  

  while(seconds >= 0) {
    print("$hour:$minutes:$seconds");
    seconds--;
    if(minutes <= 0 && hour > 0) {
      minutes = 59;
      hour--;
    }
    if(seconds < 0 && minutes > 0) {
      seconds = 59;
      minutes--;
    }
    sleep(Duration(milliseconds:1));
  }
  print("Time's up!");
}