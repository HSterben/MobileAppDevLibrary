import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SecondScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter onGenerateRoute Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // use OngenerateRoute for unnamed Routes
      onGenerateRoute: (settings) {
        if(settings.name == '/Second') {
          return MaterialPageRoute(builder: (context) => SecondScreen(),
          settings: RouteSettings(arguments: settings.arguments)
          );

        }
        // handle other routes here
        return null;

      },
      home: HomeScreen(),
    );
  }
}
