import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to SecondScreen using Ongenerate Route
            Navigator.pushNamed(context, '/Second',
            arguments: 'hello From Home page');
          },
          child: Text('Go to Second with Data'),
        ),
      ),
    );
  }
}
