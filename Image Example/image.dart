import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/* class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: MyCounterPage(),
 );
 }
}

class MyCounterPage extends StatefulWidget {
 const MyCounterPage({super.key});

 @override
 State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
 int _counter = 0;

 void _incrementCounter() {
 setState(() {
 _counter++;
 });
 }

 void _decrementCounter() {
 setState(() {
 _counter--;
 });
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: Text('Counter Application'),
 actions: [
 IconButton(onPressed: () {
 _showSnackbar(context, 'Message Icon tapped');
 }, icon: Icon(Icons.message),
 ),
 ],
 ),
 body: Center(
 child: Column(
 children: [
 Text(
 'Counter: ',
 style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
 ),
 Text(
 '$_counter',
 style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
 ),
 SizedBox(
 height: 20.0,
 ),
 Row(
 children: [
 ElevatedButton(
 onPressed: _incrementCounter, child: Icon(Icons.add))
 ],
 ),
 Row(
 children: [
 ElevatedButton(
 onPressed: _decrementCounter, child: Icon(Icons.remove))
 ],
 ),
 ],
 ),
 ),
 );
 }

 void _showSnackbar(BuildContext context, String s) {
 ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(content: Text(s),
 duration: Duration(seconds: 3),)
 );
 }
}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstImageApp(),
    );
  }
}

class MyFirstImageApp extends StatelessWidget {
  const MyFirstImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card App'),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('assets/birthday_image.jpg',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,),
                SizedBox(height: 20.0,),
                Text('Happy Birthday!',
                  style:TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,

                  ) ,),
                SizedBox(height: 20.0,),
                Text('Wish you many more happy returns of the day!',
                  style:TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,

                  ) ,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}