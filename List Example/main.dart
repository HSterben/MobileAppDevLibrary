import 'package:container/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'SecondScreen.dart';

// this example will be used to demo the namedRouting

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Named Routing Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // define all the routes you might use in this app
      routes:{
       '/': (context) => HomeScreen(),
        '/Second' : (context) => SecondScreen(),

      } ,
    );
  }
}
