import 'package:flutter/material.dart';
void main() {
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demonstration Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Styles',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),),
            SizedBox(height: 20.0,),
            Text('Italics',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0,
                  color: Colors.purple
              ),),
            SizedBox(height: 20.0,),
            Text('UnderLined',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16.0,
                color: Colors.red,
              ),),
            SizedBox(height: 18.0,),
            ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.yellow,
                    textStyle: TextStyle(
                        fontSize: 18.0
                    )
                ),
                child: Text('Styled Button')),
            SizedBox(height: 20.0,),
            OutlinedButton(onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue, side: BorderSide(
                    color: Colors.amber,
                    width: 2.0,
                  ),
                  textStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                child: Text('Outlined')),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text(
                'Container with Border Radius',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}