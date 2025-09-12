import 'person.dart';

void main() {
  //Variables to store my data
  int age = 17;
  String name = "Juan";
  bool knowHowToCode = true;

  print("My name is $name, I am $age, coding status: $knowHowToCode");

  /*
  ------------
  ------------
  */
  int num1 = 6;
  int num2 = 7;
  int result = num1 + num2;
  print(result);

  List<int> numeros = [5, 7, 1, 4, 10, 6];

  int sum = 0;
  for(int numero in numeros) {
    sum += numero;
  }
  print(sum);

  saludar(name);
  saludar("Manuel");
  sum = suma(3, 4);
  print(sum);

  Person pedro = Person(23, "Pedro", 1.78);
  print(pedro);
  pedro.setAge(pedro.age + 1);
  pedro.setHeight(pedro.height + 0.12);
  print(pedro);

}

void saludar(String nombre) {
  print("Hola $nombre!");
}

int suma(int num1, int num2) {
  return num1 + num2;
}