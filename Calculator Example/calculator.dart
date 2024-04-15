import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
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
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textSecondEditingController = TextEditingController();
  //this class will retrieve the value of the user entered inside the textbox and also to control
  String userInput = '';
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Input Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter First Number'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _textSecondEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Second Number'),
            ),
            // sizedbox is used for space between widgets
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // userInput = _textEditingController.text; // this will retrieve the value from the user inpu
                    double firstNumber = double.tryParse(_textEditingController.text)??0.0;
                    // if the user did not give any value, the null aware operator assigns the right side value
                    // which is 0.0
                    double secondNumber = double.tryParse(_textSecondEditingController.text)??0.0;
                    result = firstNumber + secondNumber;

                  });

                }, child: Text('Calculate Sum')),
            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // userInput = _textEditingController.text; // this will retrieve the value from the user inpu
                    double firstNumber = double.tryParse(_textEditingController.text)??0.0;
                    // if the user did not give any value, the null aware operator assigns the right side value
                    // which is 0.0
                    double secondNumber = double.tryParse(_textSecondEditingController.text)??0.0;
                    result = firstNumber - secondNumber;

                  });

                }, child: Text('Calculate Minus')),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // userInput = _textEditingController.text; // this will retrieve the value from the user inpu
                    double firstNumber = double.tryParse(_textEditingController.text)??0.0;
                    // if the user did not give any value, the null aware operator assigns the right side value
                    // which is 0.0
                    double secondNumber = double.tryParse(_textSecondEditingController.text)??0.0;
                    result = firstNumber * secondNumber;

                  });

                }, child: Text('Calculate Times')),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // userInput = _textEditingController.text; // this will retrieve the value from the user inpu
                    double firstNumber = double.tryParse(_textEditingController.text)??0.0;
                    // if the user did not give any value, the null aware operator assigns the right side value
                    // which is 0.0
                    double secondNumber = double.tryParse(_textSecondEditingController.text)??0.0;
                    result = firstNumber / secondNumber;

                  });

                }, child: Text('Calculate Division')),
            Text(
              'User Input : $result',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
