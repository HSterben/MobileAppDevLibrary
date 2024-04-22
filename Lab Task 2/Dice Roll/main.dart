import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepOrange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _dice1 = 1;
  int _dice2 = 1;

  // import 'dart:math';
  // Random random = new Random();
  // int randomNumber = random.nextInt(100);

  void _rollDice() {
    setState(() {
      Random random = new Random();
      _dice1 = random.nextInt(6) + 1;
      _dice2 = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100),
            Text(
              'The sum is: ${_dice1 + _dice2}',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: Image.asset("assets/dice$_dice1.png"),
                ),
                SizedBox(width: 30),
                Container(
                  width: 120,
                  height: 120,
                  child: Image.asset("assets/dice$_dice2.png"),
                ),
              ],
            ),
            SizedBox(height: 230),
            ElevatedButton(
              onPressed: _rollDice,
              child: Container(
                width: 90,
                height: 40,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Roll Dice",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
