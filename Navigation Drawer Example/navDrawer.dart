import 'package:flutter/material.dart';

// this code explains the concept of Navigation Drawer
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePageDrawer(),
    );
  }
}

class MyHomePageDrawer extends StatelessWidget {
  const MyHomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer demo'),
      ),
      body: Center(
        child: Text(' A Drawer is an invisible side Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important : We have to remove any padding from the ListView cos Drawer controls the widget
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Vanier Student'),
              accountEmail: Text('Stu1@vanier.qc.ca'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact me'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}