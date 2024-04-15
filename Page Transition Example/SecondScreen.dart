import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //navigate back to the home screen the one called me
            Navigator.pop(context);
          },
          child: Text("Go Home page"),
        ),
      ),
    );
  }
}