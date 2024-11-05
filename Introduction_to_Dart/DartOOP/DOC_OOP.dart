//OOP in Dart 

//Declaring Class
  class ClassName {
  }
  /*
  In this example below, there is class Animal with three properties: name, numberOfLegs, and lifeSpan.
  The class also has a method called display, which prints out the values of the three properties.
  */
  class Animal {
    String? name;
    int? numberOfLegs;
    int? lifeSpan;

    void display() {
      print("Animal name: $name.");
      print("Number of Legs: $numberOfLegs.");
      print("Life Span: $lifeSpan.");
    }
  }

//Declaring Object In Dart
  //Syntax
  ClassName objectName = ClassName();
    //Declaring An Object In Dart
      class Bicycle {

        String? color;
        int? size;
        int? currentSpeed;

    

        void changeGear(int newValue) {
          currentSpeed = newValue;
        }

    

        void display() {

          print("Color: $color");
          print("Size: $size");
          print("Current Speed: $currentSpeed");
        }

      }

  void main(){

      // Here bicycle is object of class Bicycle. 

    Bicycle bicycle = Bicycle();

    bicycle.color = "Red";
    bicycle.size = 26;
    bicycle.currentSpeed = 0;
    bicycle.changeGear(5);
    bicycle.display();

  }
    /*
    Output :
      Color: Red
        Size: 26
        Current Speed: 5
    */

  //example of object and class in Dart(Animal)
  class Animal2 {
    String? name2;
    int? numberOfLegs2;
    int? lifeSpan2;

    void display() {
      print("Animal name: $name2.");
      print("Number of Legs: $numberOfLegs2.");
      print("Life Span: $lifeSpan2.");
    }
  }

/*
void main(){
  // Here animal is object of class Animal. 
  Animal animal = Animal();
  animal.name2 = "Lion";
  animal.numberOfLegs2 = 4;
  animal.lifeSpan2 = 10;
  animal.display();
}
*/

//Constructor In Dart
  //A constructor is a special method used to initialize an object.
  Person person = Person("John", 30);
  //Without Constructor:
  Person person = Person();
  person.name = "John";
  person.age = 30;


/*
When you create a object of a class, the constructor is called automatically.
It is used to initialize the values when an object is created.
*/
class ClassName2 {
  // Constructor declaration: Same as class name
  ClassName2() {
    // body of the constructor
  }
}

class Teacher {

  String? name;
  int? age;
  String? subject;
  double? salary;

  // Constructor
  Teacher(String name, int age, String subject, double salary) {
    this.name = name;
    this.age = age;
    this.subject = subject;
    this.salary = salary;
  }

  // Method
  void display() {
    print("Name: ${this.name}");
    print("Age: ${this.age}");
    print("Subject: ${this.subject}");
    print("Salary: ${this.salary}\n"); // \n is used for new line
  }
}
/*
void main() {
  // Creating teacher1 object of class Teacher
  Teacher teacher1 = Teacher("John", 30, "Maths", 50000.0);
  teacher1.display();
  // Creating teacher2 object of class Teacher
  Teacher teacher2 = Teacher("Smith", 35, "Science", 60000.0);
  teacher2.display();
}
*/

//Default Constructor In Dart
//Note: The default constructor is called automatically when you create an object of the class.
//It is used to initialize the instance variables of the class.


class Laptop {

  String? brand;
  int? price;

  // Constructor
  Laptop() {
    print("This is a default constructor");
  }

}
/*
void main() {
  // Here laptop is object of class Laptop.
  Laptop laptop = Laptop();
}
*/

//Parameterized Constructor 
class Student {

  String? name;
  int? age;

  // Constructor
  Student({String? name = "John", int? age = 0}) {

    this.name = name;
    this.age = age;
  }
}
/*
void main(){
    // Here student is object of class Student. 
    Student student = Student();
    print("Name: ${student.name}");
    print("Age: ${student.age}");
}
*/

//Named Constructor In Dart
//Note: Named constructors improves code readability. 
//It is useful when you want to create multiple constructors with the same name.

class Mobile {

  String? name;
  String? color;
  int? price;

  Mobile(this.name, this.color, this.price);
  // here Mobile() is a named constructor
  Mobile.namedConstructor(this.name, this.color, [this.price = 0]);

  void displayMobileDetails() {

    print("Mobile name: $name.");
    print("Mobile color: $color.");
    print("Mobile price: $price");
  }
}
/*
void main() {

  var mobile1 = Mobile("Samsung", "Black", 20000);
  mobile1.displayMobileDetails();
  var mobile2 = Mobile.namedConstructor("Apple", "White");
  mobile2.displayMobileDetails();
}
*/


//Constant Constructor
//Note: Constant Constructor is used to create a object whose value cannot be changed. 
//It Improves the performance of the program.

class Car {

  final String? name;
  final String? model;
  final int? price;
  // Constant Constructor
  const Car({this.name, this.model, this.price});
}


/*
void main() {

  // Here car is object of class Car.
  const Car car = Car(name: "BMW", model: "X5", price: 50000);
  print("Name: ${car.name}");
  print("Model: ${car.model}");
  print("Price: ${car.price}");

}
*/

//In Dart, Encapsulation means hiding data within a library, preventing it from outside factors. 
//It helps you control your program and prevent it from becoming too complicated.

//Getter and Setter Methods
//Getter and setter methods are used to access and update the value of private property. 
//Getter methods are used to access the value of private property. 
//Setter methods are used to update the value of private property.

class Employee {
  // Private properties
  int? _id;
  String? _name;

// Getter method to access private property _id
  int getId() {
    return _id!;
  }
// Getter method to access private property _name
  String getName() {
    return _name!;
  }
// Setter method to update private property _id
  void setId(int id) {
    this._id = id;
  }
// Setter method to update private property _name
  void setName(String name) {
    this._name = name;
  }
  
}
/*
void main() {
  // Create an object of Employee class
  Employee emp = new Employee();
  // setting values to the object using setter
  emp.setId(1);
  emp.setName("John");

  // Retrieve the values of the object using getter
  print("Id: ${emp.getId()}");
  print("Name: ${emp.getName()}");
}
*/

//Grtter
class Person {
  // Properties
  String? firstName;
  String? lastName;

  // Constructor
  Person(this.firstName, this.lastName);

  // Getter
  String get fullName => "$firstName $lastName";
}
/*
void main() {
  Person p = Person("John", "Doe");
  print(p.fullName);
}
*/

//setter
class NoteBook {
  // Private Properties
  String? _name;
  double? _prize;

  // Setter to update private property _name
  set name(String name) => this._name = name;

  // Setter to update private property _prize
  set price(double price) => this._prize = price;

  // Method to display the values of the properties
  void display() {
    print("Name: ${_name}");
    print("Price: ${_prize}");
  }
}
/*
void main() {
  // Create an object of NoteBook class
  NoteBook nb = new NoteBook();
  // setting values to the object using setter
  nb.name = "Dell";
  nb.price = 500.00;
  // Display the values of the object
  nb.display();
}
*/

//Inheritance in Dart
//Inheritance is a sharing of behaviour between two classes. 
//It allows you to define a class that extends the functionality of another class. 
//The extend keyword is used for inheriting from parent class.

/*
Note: Whenever you use inheritance, it always create a is a relation between the parent and child class
like Student is a Person, Truck is a Vehicle, Cow is a Animal etc.
*/

class ParentClass {
  // Parent class code
}

class ChildClass extends ParentClass {
  // Child class code
}
// car example with Inheritance
class Car{
  String color;
  int year;

  void start(){
    print("Car started");
  }  
}

class Toyota extends Car{
  String model;
  int price;

  void showDetails(){
    print("Model: $model");
    print("Price: $price");
  }
}
/*
void main(){
  var toyota = Toyota();
  toyota.color = "Red";
  toyota.year = 2020;
  toyota.model = "Camry";
  toyota.price = 20000;
  toyota.start();
  toyota.showDetails();
}
*/

//Inheritance Of Constructor In Dart
class Laptop {
  // Constructor
  Laptop() {
    print("Laptop constructor");
  }
}

class MacBook extends Laptop {
  // Constructor
  MacBook() {
    print("MacBook constructor");
  }
}
/*
void main() {
  var macbook = MacBook();
}
*/
/* 
output:
Laptop constructor
MacBook constructor
*/

//Super In Dart
//Super is used to refer to the parent class. 
//It is used to call the parent class’s properties and methods.


class Car {
  int noOfSeats = 4;
}

class Tesla extends Car {
  int noOfSeats = 6;

  void display() {
    print("No of seats in Tesla: $noOfSeats");
    print("No of seats in Car: ${super.noOfSeats}");
  }
}
/*
void main() {
  var tesla = Tesla();
  tesla.display();
}
*/

//Polymorphism In Dart
//Polymorphism is the ability of an object to take on many forms. 
//As humans, we have the ability to take on many forms. 
//We can be a student, a teacher, a parent, a friend, and so on. 


//Syntax
class ParentClass{
void functionName(){
  }
}
class ChildClass extends ParentClass{
@override 
void functionName(){
  }
}

//Example 
class Animal {
  void eat() {
    print("Animal is eating");
  }
}

class Dog extends Animal {
  @override
  void eat() {
    print("Dog is eating");
  }
}

/*
void main() {
  Animal animal = Animal();
  animal.eat();

  Dog dog = Dog();
  dog.eat();
}
*/

//Static
//example in Dart 
class Student {
  int id;
  String name;
  static String schoolName = "ABC School";
  Student(this.id, this.name);
  void display() {
    print("Id: ${this.id}");
    print("Name: ${this.name}");
    print("School Name: ${Student.schoolName}");
  }
}
/*
void main() {
  Student s1 = new Student(1, "John");
  s1.display();
  Student s2 = new Student(2, "Smith");
  s2.display();
}
*/

//Enum in Dart
//An enum is a special type that represents a fixed number of constant values.

//Enum example
enum days {
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thrusday,
  Friday,
  Saturday
}

void main() {
  var today = days.Friday;
  switch (today) {
    case days.Sunday:
      print("Today is Sunday.");
      break;
    case days.Monday:
      print("Today is Monday.");
      break;
    case days.Tuesday:
      print("Today is Tuesday.");
      break;
    case days.Wednesday:
      print("Today is Wednesday.");
      break;
    case days.Thursday:
      print("Today is Thursday.");
      break;
    case days.Friday:
      print("Today is Friday.");
      break;
    case days.Saturday:
      print("Today is Saturday.");
      break;
  }
}

//example in Dart:
enum Gender { Male, Female, Other }

class Person {
  // Properties
  String? firstName;
  String? lastName;
  Gender? gender;

  // Constructor
  Person(this.firstName, this.lastName, this.gender);

  // display() method
  void display() {
    print("First Name: $firstName");
    print("Last Name: $lastName");
    print("Gender: $gender");
  }
}
/*
void main() {
  Person p1 = Person("John", "Doe", Gender.Male);
  p1.display();

  Person p2 = Person("Menuka", "Sharma", Gender.Female);
  p2.display();
}
*/

//Abstract Class

//Abstract classes are classes that cannot be initialized. 
//It is used to define the behavior of a class that can be inherited by other classes. 
//An abstract class is declared using the keyword abstract.

//Syntax
abstract class ClassName {
  //Body of abstract class

  method1();
  method2();
}

//example abstract in dart 
abstract class Vehicle {
  // Abstract method
  void start();
  // Abstract method
  void stop();
}

class Car extends Vehicle {
  // Implementation of start()
  @override
  void start() {
    print('Car started');
  }

  // Implementation of stop()
  @override
  void stop() {
    print('Car stopped');
  }
}

class Bike extends Vehicle {
  // Implementation of start()
  @override
  void start() {
    print('Bike started');
  }

  // Implementation of stop()
  @override
  void stop() {
    print('Bike stopped');
  }
}

/*
void main() {
  Car car = Car();
  car.start();
  car.stop();

  Bike bike = Bike();
  bike.start();
  bike.stop();
}
*/

//Interface In Dart
//An interface defines a syntax that a class must follow.

//Syntax Of Interface In Dart
class InterfaceName {
  // code
}

class ClassName implements InterfaceName {
  // code
}

//Example Of Interface In Dart
// abstract class as interface
abstract class Vehicle {
  void start();
  void stop();
}
// implements interface
class Car implements Vehicle {
  @override
  void start() {
    print('Car started');
  }

  @override
  void stop() {
    print('Car stopped');
  }
}

/*
void main() {
  var car = Car();
  car.start();
  car.stop();
}
*/
//Mixin
//Mixins are a way of reusing the code in multiple classes.
//The with keyword is used to apply the mixin to the class. 

/* 
rules:
You can’t create object of mixin.
Use the mixin to share the code between multiple classes.
Mixin has no constructor and cannot be extended.
It is possible to use multiple mixins in a class.
*/

//Syntax
mixin Mixin1{
  // code
}
mixin Mixin2{
  // code
}
class ClassName with Mixin1, Mixin2{
  // code
}

// Example in dart : 
mixin ElectricVariant {
  void electricVariant() {
    print('This is an electric variant');
  }
}
mixin PetrolVariant {
  void petrolVariant() {
    print('This is a petrol variant');
  }
}
// with is used to apply the mixin to the class
class Car with ElectricVariant, PetrolVariant {
  // here we have access of electricVariant() and petrolVariant() methods
}
/*
void main() {
  var car = Car();
  car.electricVariant();
  car.petrolVariant();
}
*/
mixin CanFly {
  void fly() {
    print('I can fly');
  }
}

mixin CanWalk {
  void walk() {
    print('I can walk');
  }
}

class Bird with CanFly, CanWalk {
}
class Human with CanWalk {
}

/*
void main() {
  var bird = Bird();
  bird.fly();
  bird.walk();

  var human = Human();
  human.walk();
}
*/

//Sometimes, you want to use a mixin only with a specific class. 
//In this case, you can use the on keyword.

abstract class Animal {
  // properties
  String name;
  double speed;

  // constructor
  Animal(this.name, this.speed);

  // abstract method
  void run();
}

// mixin CanRun is only used by class that extends Animal
mixin CanRun on Animal {
  // implementation of abstract method
  @override
  void run() => print('$name is Running at speed $speed');
}

class Dog extends Animal with CanRun {
  // constructor
  Dog(String name, double speed) : super(name, speed);
}

/*
void main() {
  var dog = Dog('My Dog', 25);
  dog.run();
}
*/

// Not Possible
// class Bird with Animal { } 


//Factory Constructor

//Factory Constructor example
class Area {
  final int length;
  final int breadth;
  final int area;

  // private constructor
  const Area._internal(this.length, this.breadth) : area = length * breadth;

  // Factory constructor
  factory Area(int length, int breadth) {
    if (length < 0 || breadth < 0) {
      throw Exception("Length and breadth must be positive");
    }
    // redirect to private constructor
    return Area._internal(length, breadth);
  }
}

/*
void main() {
  // This works
  Area area = Area(10, 20);
  print("Area is: ${area.area}");

  // notice that here is negative value
  Area area2 = Area(-10, 20);
  print("Area is: ${area2.area}");
}
*/

//Generics is a way to create a class, 
//or function that can work with different types of data (objects).
//without Generic:

// Creating a class for int
class IntData {
  int data;
  IntData(this.data);
}
// Creating a class for double
class DoubleData {
  double data;
  DoubleData(this.data);
}
/*
void main() {
  // Create an object of IntData class
  IntData intData = IntData(10);
  DoubleData doubleData = DoubleData(10.5);
  // Print the data
  print("IntData: ${intData.data}");
  print("DoubleData: ${doubleData.data}");
}
*/

// Using Generics
class Data<T> {
  T data;
  Data(this.data);
}

void main() {
  // create an object of type int and double
  Data<int> intData = Data<int>(10);
  Data<double> doubleData = Data<double>(10.5);

  // print the data
  print("IntData: ${intData.data}");
  print("DoubleData: ${doubleData.data}");
}