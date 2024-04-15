import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings UI', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepOrange, // Set the background color here
        ),
        body: SettingsPage(),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Common', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('Language'),
          subtitle: Text('English'),
          leading: Icon(Icons.language),
        ),
        Divider(),
        ListTile(
          title: Text('Environment'),
          subtitle: Text('Production'),
          leading: Icon(Icons.cloud_queue),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Account', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('Phone number'),
          leading: Icon(Icons.phone),
        ),
        Divider(),
        ListTile(
          title: Text('Email'),
          leading: Icon(Icons.email),
        ),
        Divider(),
        ListTile(
          title: Text('Sign out'),
          leading: Icon(Icons.exit_to_app),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Security', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('Lock app in background'),
          leading: Icon(Icons.lock),
          trailing: Switch(
            value: true,
            onChanged: (bool value) {},
          ),
        ),
      ],
    );
  }
}