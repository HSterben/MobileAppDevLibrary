import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: ClipOval(
                child: Image.asset("assets/logo.jpg"),
              ),
            ),
            Text(
              "Yunk Huynk",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "MOBILE DEVELOPER",
              style: TextStyle(
                fontSize: 15,
                color: Colors.green[300],
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 120,
              child: Divider(
                thickness: 2,
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 290,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "+84 123456789",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 290,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "tynk.moviledev@gmail.com",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 290,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "@tinh_huynh_97",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 290,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Icon(
                      Icons.wheelchair_pickup,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "+84 123456789",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
