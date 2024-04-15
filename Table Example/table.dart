import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
// using Table class

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double iconSize = 40;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Table Demo "),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.account_box, size: iconSize,),
                              Text('MY Account')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.settings, size: iconSize,),
                              Text('Settings')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.lightbulb_circle, size: iconSize,),
                              Text('Ideas')
                            ],
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          Column(
                            children: [

                              Text('Bank Account')
                            ],
                          ),
                          Column(
                            children: [

                              Text('Private account')
                            ],
                          ),
                          Column(
                            children: [
                              Text('Investment')
                            ],
                          ),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

