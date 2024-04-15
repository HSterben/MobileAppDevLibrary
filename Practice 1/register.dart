import 'package:flutter/material.dart';
import 'main.dart';
import 'users.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

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
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            "Registration",
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(height: 30.0),
          Container(
            width: 200,
            child: TextFormField(
              controller: userController,
              decoration: InputDecoration(
                hintText: 'User ID',
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            width: 200,
            child: TextFormField(
              controller: passwordController1,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            width: 200,
            child: TextFormField(
              controller: passwordController2,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
              ),
            ),
          ),
          SizedBox(height: 70.0),
          ElevatedButton(
            onPressed: () {
              if (validatePassword()) {
                Navigator.pop(
                  context,
                  UserCredentials(
                      userController.text, passwordController1.text),
                );
              } else {
                userController.clear();
                passwordController1.clear();
                passwordController2.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Passwords do not match'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              "SAVE",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  bool validatePassword() {
    if (userController.text == "" || passwordController1.text == "") {
      return false;
    }
    return (passwordController1.text == passwordController2.text);
  }
}
