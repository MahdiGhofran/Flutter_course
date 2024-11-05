///Stateless Example :
///that doesn’t change or hold any dynamic data.
///Its appearance or content is fixed once it’s built.
///If you need a widget that only displays static information,
///like text or images, and doesn’t need to change, you can use a StatelessWidget.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///MyApp: This is our main app widget, which is a StatelessWidget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///MaterialApp: A wrapper for the app, providing basic app structure and theming.
    return MaterialApp(
      ///Scaffold: Provides structure with an app bar and body area.
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget Example"),
        ),
        body: Center(
          ///MessageWidget: This is a custom StatelessWidget that just displays static text.
          child: MessageWidget(),
        ),
      ),
    );
  }
}

///MessageWidget: This is a custom StatelessWidget that just displays static text.
///Since MessageWidget doesn’t need to hold or update any state, it’s a StatelessWidget.
class MessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, Flutter!',
      style: TextStyle(
          fontSize: 24, color: const Color.fromARGB(255, 127, 58, 247)),
    );
  }
}
