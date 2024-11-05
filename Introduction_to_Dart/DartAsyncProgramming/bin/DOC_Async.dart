//Synchronous operation means a task that needs to be solved before proceeding to the next one.
//Asynchronous programming, program execution continues to the next line without waiting to complete other work.
//It simply means, Don’t wait.

//Async example :
void main() {
  print("First Operation");
  Future.delayed(Duration(seconds: 3), () => print('Second Big Operation'));
  print("Third Operation");
  print("Last Operation");
}

//A Future represents a value that is not yet available.

///Future In Dart
//In dart, the Future represents a value or error that is not yet available.
//It is used to represent a potential value, or error, that will be available at some time in the future.

//In this example below, we are creating a function middleFunction() that returns a future.
// The function will return Future<String> after 5 seconds.
void main() {
  print("Start");
  getData();
  print("End");
}

void getData() async {
  String data = await middleFunction();
  print(data);
}

Future<String> middleFunction() {
  return Future.delayed(Duration(seconds: 5), () => "Hello");
}

///Async and Await In Dart

//Async/await is a feature in Dart that allows us to write asynchronous code that looks and behaves like synchronous code,
//making it easier to read.

//The await keyword, on the other hand, allows you to delay the execution of an async function until the awaited Future has finished.
//This enables us to create code that appears to be synchronous but is actually asynchronous.

void main() {
  print("Start");
  getData();
  print("End");
}

void getData() async {
  String data = await middleFunction();
  print(data);
}

Future<String> middleFunction() {
  return Future.delayed(Duration(seconds: 5), () => "Hello");
}

///Streams In Dart
//استرم یک یا چند شنونده دارد و همه شنوندگان مقدار یکسانی دریافت خواهند کرد

/*
For example, A stream is like a pipe that emits events,
you put a value on the one end, and if there’s a listener on the other end that listener will receive that value. 
These events can be values of any type, errors or a “done” event to signal the end of the stream.
*/

// function that returns a stream
Stream<String> getUserName() async* {
  await Future.delayed(Duration(seconds: 1));
  yield 'Mark';
  await Future.delayed(Duration(seconds: 1));
  yield 'John';
  await Future.delayed(Duration(seconds: 1));
  yield 'Smith';
}

// main function
void main() async {
  // you can use await for loop to get the value from stream
  await for (String name in getUserName()) {
    print(name);
  }
}

//Note: Here yield returns the value from the stream. To use yield you have to use async*.

/*
Yielding Values:
The yield keyword is used to send values out to whoever is listening to the stream. 
*/