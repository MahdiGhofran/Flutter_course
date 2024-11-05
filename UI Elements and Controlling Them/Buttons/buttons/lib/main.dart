import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => print("ElevatedButton pressed"),
              child: Text("ElevatedButton"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => print("TextButton pressed"),
              child: Text("TextButton"),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => print("OutlinedButton pressed"),
              child: Text("OutlinedButton"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ButtonExample()));
