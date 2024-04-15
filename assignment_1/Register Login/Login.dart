import 'package:flutter/material.dart';
import 'Session.dart';

class LoginScreen extends StatelessWidget {
  final Map<String, String> users;

  LoginScreen({required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: LoginForm(users: users),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Map<String, String> users;

  LoginForm({required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.question_answer,
          size: 130,
          color: Colors.blue,
        ),
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Set border radius here
            ),
          ),
        ),
        SizedBox(height: 30.0),
        TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Set border radius here
            ),
          ),
        ),
        SizedBox(height: 20.0),
        SizedBox(
          height: 40.0,
          width: 600.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              String email = emailController.text;
              if (validateLogin(email, passwordController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login Successful!'),
                    backgroundColor: Colors.blue,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SessionScreen(
                      username: email,
                    ),
                  ),
                );
                emailController.clear();
                passwordController.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login Failed'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(
              'Log In',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  bool validateLogin(String email, String password) {
    if (users.containsKey(email)) {
      return (users[email] == password);
    }
    return false;
  }
}
