import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write my first text'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Hello Flutter",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Hello Montreal",
              style: TextStyle(fontSize: 20),
            ),
            Icon(Icons.beach_access,
              color: Colors.amber,
              size: 20.0,),
            Icon(Icons.audiotrack,
              color: Colors.blue,
              size: 20.0,),
            ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).
              showSnackBar(SnackBar(content: Text("You clicked me")));
            }, child: Text('Click me'))
          ],
        ),
      ),
    );

  }
}