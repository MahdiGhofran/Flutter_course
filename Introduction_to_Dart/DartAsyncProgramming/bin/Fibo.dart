///Fibonacci with Stream
///
import 'dart:async';

// Generate a Fibonacci sequence as a Stream
Stream<int> fibonacciStream(int n) async* {
  int a = 0, b = 1;

  for (int i = 0; i < n; i++) {
    yield a; // Yield the current Fibonacci number
    int next = a + b;
    a = b;
    b = next;
  }
}

void main() async {
  int count = 10;

  print('Fibonacci sequence up to $count terms:');

  await for (int value in fibonacciStream(count)) {
    print(value); // Print each Fibonacci number as it's generated
  }
}


///Fibonacci with Future
/*
import 'dart:async';

// Synchronous Fibonacci
int fibonacciSync(int n) {
  if (n <= 1) return n;
  return fibonacciSync(n - 1) + fibonacciSync(n - 2);
}

// Asynchronous Fibonacci (using Future)
Future<int> fibonacciAsync(int n) async* {
  if (n <= 1) return n;
  return await fibonacciAsync(n - 1) + await fibonacciAsync(n - 2);
}

void main() async {
  int n = 10;

  // Calling the synchronous Fibonacci function
  print('Synchronous Fibonacci of $n: ${fibonacciSync(n)}');

  // Calling the asynchronous Fibonacci function
  print('Starting asynchronous Fibonacci calculation for $n...');
  int asyncResult = await fibonacciAsync(n);
  print('Asynchronous Fibonacci of $n: $asyncResult');
}
*/
 

