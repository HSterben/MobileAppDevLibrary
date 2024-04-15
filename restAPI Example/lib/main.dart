//DEPENDENCIES: 
//In the flutter hierarchy: hhtp: any

import 'package:flutter/material.dart';
import 'user_model.dart';
import 'ApiService.dart';
import 'constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //late keyword is used to say that the variable will take some data at later time
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers());
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('REST example 2'),
        ),
        body: _userModel == null || _userModel!.isEmpty ? Center(
          child: CircularProgressIndicator(),
        )
        : ListView.builder(
          itemCount: _userModel!.length,
          itemBuilder: (context, index) {
            return Card (
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_userModel![index].id.toString()),
                      Text(_userModel![index].username),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_userModel![index].email),
                      Text(_userModel![index].website),
                    ],
                  )
                ],
              )
            );
          }
        )
      )
    );
  }
}
