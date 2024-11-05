// Abstract Class: Animal
abstract class Animal {
  // Properties
  String name;
  String species;
  int age;

  // Constructor
  Animal(this.name, this.species, this.age);

  // Abstract method: sound
  void sound();

  // Abstract method: movement
  void movement();
}

// Interface: Quadruped
mixin Quadruped {
  void walkOnFourLegs() {
    print("Walking on four legs");
  }
}

// Interface: Biped
mixin Biped {
  void walkOnTwoLegs() {
    print("Walking on two legs");
  }
}

// Interface: AquaticAnimal
mixin AquaticAnimal {
  void swim() {
    print("Swimming in water");
  }
}

// WildAnimal Class
class WildAnimal extends Animal {
  // Constructor
  WildAnimal(String name, String species, int age) : super(name, species, age);

  // Implementing abstract method: sound
  @override
  void sound() {
    print("$name the $species roars!");
  }

  // Implementing abstract method: movement
  @override
  void movement() {
    print("$name moves swiftly in the wild.");
  }
}

// DomesticAnimal Class
class DomesticAnimal extends Animal {
  // Constructor
  DomesticAnimal(String name, String species, int age)
      : super(name, species, age);

  // Implementing abstract method: sound
  @override
  void sound() {
    print("$name the $species makes a calm sound.");
  }

  // Implementing abstract method: movement
  @override
  void movement() {
    print("$name moves gently in domestic areas.");
  }
}

// Class for Quadruped Wild Animals
class Tiger extends WildAnimal with Quadruped {
  Tiger(String name, int age) : super(name, "Tiger", age);

  // Tiger-specific behavior
  void hunt() {
    print("$name the Tiger is hunting.");
  }
}

// Class for Biped Wild Animals
class Kangaroo extends WildAnimal with Biped {
  Kangaroo(String name, int age) : super(name, "Kangaroo", age);

  // Kangaroo-specific behavior
  void jump() {
    print("$name the Kangaroo is jumping.");
  }
}

// Class for Aquatic Wild Animals
class Shark extends WildAnimal with AquaticAnimal {
  Shark(String name, int age) : super(name, "Shark", age);

  // Shark-specific behavior
  void attack() {
    print("$name the Shark is attacking prey.");
  }
}

// Class for Quadruped Domestic Animals
class Dog extends DomesticAnimal with Quadruped {
  Dog(String name, int age) : super(name, "Dog", age);

  // Dog-specific behavior
  void play() {
    print("$name the Dog is playing fetch.");
  }
}

// Class for Aquatic Domestic Animals
class Goldfish extends DomesticAnimal with AquaticAnimal {
  Goldfish(String name, int age) : super(name, "Goldfish", age);

  // Goldfish-specific behavior
  void bubble() {
    print("$name the Goldfish is blowing bubbles.");
  }
}

// Zoo Class
class Zoo {
  // List to store animals
  List<Animal> animals = [];

  // Method to add animals to the zoo
  void addAnimal(Animal animal) {
    animals.add(animal);
    print("${animal.name} the ${animal.species} has been added to the zoo.");
  }

  // Method to show all animals in the zoo
  void showAllAnimals() {
    print("\nAnimals in the Zoo:");
    for (var animal in animals) {
      print("${animal.name} the ${animal.species}, Age: ${animal.age}");
    }
  }

  // Method to make each animal perform their unique sounds and movements
  void zooActivities() {
    print("\nZoo Activities:");
    for (var animal in animals) {
      animal.sound();
      animal.movement();

      // Check and cast animal to the respective mixin type to call specific methods
      if (animal is Quadruped) {
        (animal as Quadruped).walkOnFourLegs();
      }
      if (animal is Biped) {
        (animal as Biped).walkOnTwoLegs();
      }
      if (animal is AquaticAnimal) {
        (animal as AquaticAnimal).swim();
      }
    }
  }
}

// Main function to test the zoo example
void main() {
  // Create a zoo
  Zoo myZoo = Zoo();

  // Create various animals
  Tiger tiger = Tiger("Shere Khan", 5);
  Kangaroo kangaroo = Kangaroo("Joey", 3);
  Shark shark = Shark("Bruce", 8);
  Dog dog = Dog("Buddy", 4);
  Goldfish goldfish = Goldfish("Goldie", 1);

  // Add animals to the zoo
  myZoo.addAnimal(tiger);
  myZoo.addAnimal(kangaroo);
  myZoo.addAnimal(shark);
  myZoo.addAnimal(dog);
  myZoo.addAnimal(goldfish);

  // Display all animals in the zoo
  myZoo.showAllAnimals();

  // Execute zoo activities
  myZoo.zooActivities();
}
