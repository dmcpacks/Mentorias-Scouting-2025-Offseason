import 'dart:io';

int readInt(String question) {
  stdout.write("$question: ");
  return int.parse(stdin.readLineSync()!);
}

String readString(String question) {
  stdout.write("$question: ");
  return stdin.readLineSync()!;
}