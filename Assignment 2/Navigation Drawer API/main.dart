import 'package:flutter/material.dart';
import 'profile.dart';
import 'notifications.dart';
import 'settings.dart';

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
        title: Text('Navigation Drawer'),
      ),
      body: Center(
        child: Text('Assignment 2 Part 2'),
      ),
      drawer: Drawer(
        child: ListView(
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
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Log out'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(content: Text('You are being logged out'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
