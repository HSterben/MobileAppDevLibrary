import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String data =
    ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Data from Home : $data',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Go Home'))
          ],
        ),
      ),
    );
  }
}
