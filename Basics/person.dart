class Person {
  late int age;
  late String name;
  late double height;

  Person(int age, String name, double height) {
    this.age = age;
    this.name = name;
    this.height = height;
  }

  String toString() {
    return "My name is $name, I am $age years old, my height is $height meters";
  }

  void setAge(int newAge) {
    age = newAge;
  }

  void setHeight(double newHeight) {
    height = newHeight;
  }
}