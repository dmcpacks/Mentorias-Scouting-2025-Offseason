import 'dart:math';

List<int> diceRoller(int faces, int dice) {
  int sum = 0;
  List<int> results = [];
  for(int i = 0; i<dice; i++) {
    int num = Random().nextInt(faces)+1;
    sum += num;
    results.add(num);
  }
  results.insert(0, sum);
  return results;
}