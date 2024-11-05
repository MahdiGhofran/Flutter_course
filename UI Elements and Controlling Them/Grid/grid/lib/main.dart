//  چندین ستون وجود دارند
import 'package:flutter/material.dart';

class GridExample extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid Example")),

      //GridView.builder is a constructor(سازنده) for creating a scrollable grid of widgets.
      body: GridView.builder(
        //gridDelegate defines the layout and spacing for the grid.
        //SliverGridDelegateWithFixedCrossAxisCount arranges the grid with a fixed number of columns.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //crossAxisCount sets the number of columns in the grid. Here, it’s set to 2,
          crossAxisCount: 2,

          //crossAxisSpacing defines the horizontalافقی space between grid items.
          crossAxisSpacing: 8.0,

          //mainAxisSpacing sets the vertical space between grid items.
          mainAxisSpacing: 8.0,
        ),

        //itemCount determines the total number of items in the grid.
        //Setting itemCount to items.length tells GridView.builder to create an item for each element in the items list.
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amber,
            child: Center(child: Text(items[index])),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: GridExample()));
