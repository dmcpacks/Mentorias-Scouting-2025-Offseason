import 'dart:math';
import '../P1_BasicProjects/reader.dart';

void main() {
  bool playing = true;
  List<String> options = ["rock", "paper", "scissors"];
  int won = 0;
  int lost = 0;
  int tied = 0;

  while(playing) {
    String compPick = options[Random().nextInt(3)];
    String userPick = readString("Choose rock, paper, or scissors");

    print("Computer chose $compPick");
    if(compPick == userPick) {
      print("You tied");
      tied++;
    } else if((compPick == "rock" && userPick == "scissors") || (compPick == "scissors" && userPick == "paper") || (compPick == "paper" && userPick == "rock")) {
      print("You lost");
      lost++;
    } else if((userPick == "rock" && compPick == "scissors") || (userPick == "scissors" && compPick == "paper") || (userPick == "paper" && compPick == "rock")) {
      print("You won");
      won++;
    }

    if(userPick == "q") {
      playing = false;
      print("Bye bye, final scores:\n\tWon: $won\n\tLost: $lost\n\tTied: $tied");
    }
  }
}