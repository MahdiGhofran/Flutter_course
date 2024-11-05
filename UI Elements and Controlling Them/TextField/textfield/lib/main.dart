/*
import 'package:flutter/material.dart';

class TextFieldExample extends StatelessWidget {
  //is creating a TextEditingController object, 
  final TextEditingController _controller = TextEditingController();
/* 
By managing the TextField with TextEditingController, 
you gain full control over the input, 
which is especially useful for form handling, 
data validation, and responding to user inputs dynamically.
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextField Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _controller.clear(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("User Input: ${_controller.text}");
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: TextFieldExample()));
*/
import 'package:flutter/material.dart';

class TextFieldWithControllerExample extends StatefulWidget {
  @override
  //It returns an instance of _TextFieldWithControllerExampleState,
  //which manages the widget’s mutable(قابل تغییر) state.
  _TextFieldWithControllerExampleState createState() =>
      _TextFieldWithControllerExampleState();
}

class _TextFieldWithControllerExampleState
    extends State<TextFieldWithControllerExample> {
/* 
By managing the TextField with TextEditingController, 
you gain full control over the input, 
which is especially useful for form handling, 
data validation, and responding to user inputs dynamically.
*/
//You can access the text in the TextField through _controller.text.
// You can clear the TextField by calling _controller.clear(),
//or set new text by assigning a value to _controller.text.
  final TextEditingController _controller = TextEditingController();

  @override //is overriding a method from its superclass (State).

  //frees up the memory used by _controller.
  //This is especially important for resources like controllers,
  //which might otherwise continue to hold memory even after the widget is removed.
  //Called when this object is removed from the tree permanently(به طور دائم).
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override //overriding a method from the superclass (State in this case).

  //build is a lifecycle method in Flutter, used to create and display the widget tree.
  //build is a required method for widgets that inherit(ارث بری)from State.
  //It returns a Widget that represents the UI for this state.
  Widget build(BuildContext context) {
    //BuildContext context provides information about the widget's location in the widget tree,
    //and allows access to theme data, media query, and navigation.

    //Scaffold is a material design layout structure in Flutter that provides common visual elements like AppBar,
    //FloatingActionButton, Drawer, etc., to create a standard app layout.
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "TextField with Controller Example")), //AppBar is a Flutter widget that creates a material design app bar (the top toolbar).

      body: Padding(
        //body is a property of Scaffold where the main content of the screen is placed.

        //Padding is a widget that adds empty space around its child.
        //Here, it applies padding of 16.0 pixels on all sides of the body content.

        padding: const EdgeInsets.all(16.0),
        //EdgeInsets.all(16.0) creates padding of 16 pixels on all sides (top, bottom, left, right).
        //const makes the EdgeInsets value compile-time constant, which is an optimization to reduce memory usage.

        child: Column(
          children: [
            TextField(
              //Here, TextField allows the user to type text, which will be managed by _controller.

              //controller is a property of TextField that links it to a TextEditingController.
              //_controller is an instance of TextEditingController created earlier,
              //which allows managing the input text (e.g., reading, clearing, or setting the text programmatically).
              controller: _controller, //Binding the controller to the TextField

              //decoration is used to style the TextField, allowing customization of hints, labels, borders, icons, and more.
              decoration: InputDecoration(
                //InputDecoration provides standard styling for TextField widgets
                //and is commonly used to make the input field look consistent and descriptive(وصف).

                labelText:
                    "Enter some text", //labelText is a property of InputDecoration that defines a label above the TextField.

                border:
                    OutlineInputBorder(), //border defines the type of border around the TextField.
                //OutlineInputBorder() creates a rectangular border around the field,
                //giving it a more defined look. This is useful for enhancing the UI and making the field more noticeable.
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Accessing the text in the TextField
                print("Entered text: ${_controller.text}");
              },
              child: Text("Show Text"),
            ),
            ElevatedButton(
              onPressed: () {
                // Clearing the text in the TextField
                _controller.clear();
              },
              child: Text("Clear Text"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: TextFieldWithControllerExample()));
