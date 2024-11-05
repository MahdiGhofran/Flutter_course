//top-level main() function

void main() {
  print('Hello, World!');

//type-safe Dart code. these variables' types are determined by their initial values
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
//Variables

  //If an object isn't restricted to a single type, specify the Object type (or dynamic if necessary).
  Object name1 = 'Bob';
  //explicitly declare the type that would be inferred:
  String name2 = 'Bob';
  int lineCount = 0;

  //Null safety
  // Nullable type. Can be `null` or string.
  String? name3;

  // Non-nullable type. Cannot be `null` but can be string.
  String name4 = 'sdad';

  //Late variables
  //If you're sure that a variable is set before it's used, but Dart disagrees, you can fix the error by marking the variable as late:
  late String description;

  void test() {
    description = 'Feijoada!';
    print(description);
  }

  //Final and const
  //final
  //You can't change the value of a final variable:
  //Error: a final variable can only be set once.
  final name5 = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';
  //const
  //Use const for variables that you want to be compile-time constants.
  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere
  //If the const variable is at the class level, mark it "static const".
  //You can't change the value of a const variable

/*
Difference from final: 
While both const and final make variables unmodifiable after they’re set,
only const requires values to be known at compile-time.
final can be used with values that are determined at runtime 
but are still immutable once assigned.

final -> class
const -> replace streghit 
*/


//Control flow statements
  //if-elseif-else
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  //for model1
  for (final object in flybyObjects) {
    print(object);
  }
  //for model2
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  //while
  while (year < 2016) {
    year += 1;
  }
  //A do-while loop evaluates the condition after the loop:
  do {
    printLine();
  } while (!atEndOfPage());

  //break
  while (true) {
    if (shutDownRequested()) break;
    processIncomingRequests();
  }
  //continue 
  for (int i = 0; i < candidates.length; i++) {
    var candidate = candidates[i];
    if (candidate.yearsExperience < 5) {
      continue;
    }
    candidate.interview();
  }

//Functions
  //type1 ->specifying the types of each function's arguments and return value
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);  

  //type2 ->shorthand
  flybyObjects.where((name) => name.contains('turn')).forEach(print);

//Comments
  // This is a normal, one-line comment.

  /// This is a documentation comment, used to document libraries,
  /// classes, and their members. Tools like IDEs and dartdoc treat
  /// doc comments specially.

  /* Comments like these are also supported. */

// Importing core libraries
    import 'dart:math';

// Importing libraries from external packages
    import 'package:test/test.dart';

// Importing files
    import 'path/to/my_other_file.dart';

}
