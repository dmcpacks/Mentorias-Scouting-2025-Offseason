String time(int seconds) {
  int hour = (seconds/3600).floor();
  seconds -= hour*3600;
  int minutes = (seconds/60).floor();
  seconds -= minutes*60;
  // seconds = seconds - minutes*60;

  String minText = "0$minutes";
  if(minText.length > 2) {
    minText = minText.substring(1);
  }

  String secText = "0$seconds";
   if(secText.length > 2) {
    secText = secText.substring(1);
  }
  return "$hour:$minText:$secText";
}