import 'package:flutter/material.dart';
import 'register.dart';
import 'users.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent),
      title: 'Practice App',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserCredentials? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pizza App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Image.asset(
              "assets/car.png",
              width: 100.0,
            ),
            SizedBox(height: 100.0),
            Container(
              width: 200,
              child: TextFormField(
                controller: userController,
                decoration: InputDecoration(hintText: 'UserID'),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              width: 200,
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (validateLogin()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(username: userController.text),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Username Or Password Incorrect"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  userController.clear();
                  passwordController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                "BUTTON",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 35.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      user = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => registerScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  bool validateLogin() {
    if (user == null || user?.userID == "" || user?.password == "") {
      return false;
    }
    return (user?.userID == userController.text &&
        user?.password == passwordController.text);
  }
}
