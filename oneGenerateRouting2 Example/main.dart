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
      // use onGenerateRoute for unnamed Routes
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) => DetailsPage());
        } else if (settings.name == '/settings') {
          return MaterialPageRoute(builder: (context)=>SettingsPage());
        } else if (settings.name!.startsWith('/dynamic/')) {
          final List<String> path = settings.name!.split('/');
          final String id = path[2];
          return MaterialPageRoute(builder: (context) => DynamicScreen(id:id));

        };

        return null;
      },
      home: Home(),
    );
  }

}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/details');
                },
                child: Text('Go to Details page')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                }, child: Text('Go to Settings Page')),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dynamic/123');
                }, child: Text('Go to Dynamic Page')),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text(' Here is the Detailed Info'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(' Here is the Settings Info'),
      ),
    );
  }
}

class DynamicScreen extends StatelessWidget {
  final String id;

  DynamicScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic page'),
      ),
      body: Center(
        child: Text('Dynamic Screen with ID : $id'),
      ),
    );
  }
}