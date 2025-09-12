import 'dart:math';
import 'dart:io';

void main() {
  stdout.write("Enter how many faces for the dice: ");
  int faces = int.parse(stdin.readLineSync()!);

  stdout.write("Enter how many dice to roll: ");
  int dice = int.parse(stdin.readLineSync()!);

  int sum = 0;

  for(int i = 0; i<dice; i++) {
    int num = Random().nextInt(faces)+1;
    stdout.write("$num ");
    sum += num;
    // sum = sum + num;
  }
  print("\nTotal sum = $sum");
}