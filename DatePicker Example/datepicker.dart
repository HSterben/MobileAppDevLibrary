//DEPENDENCIES:
//page_transition: ^2.1.0 -> flutter

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

main() {
  runApp(MyApp());
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

  DateTime currentDate = DateTime.now();
  Future<void> _selectTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2030));
    if(pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currentDate.toString()),
            ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text('Pick a Date'))
          ],
        ),
      ),
    );
  }
}