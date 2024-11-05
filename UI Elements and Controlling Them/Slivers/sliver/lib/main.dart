/*
Create Complex Scrollable Layouts
Optimize Performance
Add Unique Scrolling Effects
*/
import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CustomScrollView is a scrollable area that allows you to add slivers (scrollable elements) like lists, grids, and app bars.
      //This widget enables combining different scrollable sections within a single scroll view.
      body: CustomScrollView(
        //slivers is a list of widgets that will scroll within the CustomScrollView.
        //It contains multiple Sliver widgets that define distinct scrollable sections.
        slivers: [
          SliverAppBar(
            //floating allows the SliverAppBar to reappear when the user scrolls up,
            //even if they are not at the very top of the screen.
            floating: true,

            //pinned keeps the SliverAppBar visible at the top as the user scrolls up,
            pinned: true,
            expandedHeight: 90.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SliverAppBar"),
            ),
          ),
          SliverList(
            //delegate manages the children of the SliverList.
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text("Sliver List Item $index"),
              ),
              childCount: 10,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                //The color dynamically changes based on the index, cycling through shades of purple.
                color: Colors.purple[100 * ((index % 15) + 1)],
                child: Center(child: Text("Grid Item $index")),
              ),
              childCount: 11,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //Defines the maximum width for each grid item.
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: SliverExample()));
