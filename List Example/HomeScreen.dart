import 'package:flutter/material.dart';
import 'SecondScreen.dart';
//

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter some Data'
              ),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    dataList.add(_textEditingController.text);
                    _textEditingController.clear();
                  });
                },
                child: Text('Add to the list')),
            SizedBox(height: 16.0,),
            ElevatedButton(
                onPressed: () {
                  //Navigate to secondscreen using named route with list data
                  Navigator.pushNamed(context, '/Second', arguments: dataList);
                },
                child: Text('Go to Second Screen'))
          ],
        ),
      ),
    );
  }
}




