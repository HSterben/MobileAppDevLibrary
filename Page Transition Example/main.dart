import 'HomeScreen.dart';
import 'package:flutter/material.dart';


// code for Stack Widget
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
