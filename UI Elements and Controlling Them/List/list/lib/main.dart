import 'package:flutter/material.dart';

class ListExample extends StatelessWidget {
  //StatelessWidget means this widget cannot change its state after it is built.
  //This creates a List of strings called items with four elements.
  //final indicates that items is a fixed list; it won’t be modified after being initialized.
  final List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];

  //@override indicates that the build method is overriding the build method in StatelessWidget.
  @override

  //build is a required method in StatelessWidget to define the widget tree.
  //BuildContext context provides access to location-based information in the widget tree.
  Widget build(BuildContext context) {
    //Scaffold provides the structure for a basic visual layout,
    //including properties for app bar, body, and more.
    return Scaffold(
      appBar: AppBar(title: Text("List Example")),

      //ListView.builder is used for creating a scrollable list of widgets.
      //ListView.builder is efficient for building lists with a dynamic number of items because it only builds visible items.
      body: ListView.builder(
        //itemCount specifies the number of items in the list.
        //Here, items.length tells ListView.builder to create four items in the list (since items has four elements).
        itemCount: items.length,

        //itemBuilder is a function that builds each item in the list.
        //context provides the build context(زمینه), and index represents the position of each item in the list.
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () => print("${items[index]} tapped"),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ListExample()));
