import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // retrieve the list of data from arguments
 final List<String>? datalist = ModalRoute.of(context)?.settings.arguments as List<String>?;
   // ModalRoute is the class to get the arguments from the previous screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'List of Data that comes from Home Screen',
              style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 16.0,),
            Expanded(
                child: ListView.builder(
                    itemCount: datalist?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                      title:  Text(datalist![index]),
                      );
    }
                ),
            ),
          ],
        ),
      )
    );
  }

}