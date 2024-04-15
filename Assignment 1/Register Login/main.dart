import 'package:flutter/material.dart';
import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Registration',
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              borderRadius: BorderRadius.circular(10.0), // Set border radius here
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
              borderRadius: BorderRadius.circular(10.0), // Set border radius here
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration Successful!'),
                backgroundColor: Colors.blue,
              ),
            );
            Map<String, String> updatedUsers = {
              'admin@gmail.com': 'password123', // Existing user
              emailController.text: passwordController.text, // New user
            };
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(
                    users: updatedUsers
                ),
              ),
            );
            emailController.clear();
            passwordController.clear();
          },
          child: Text('Register',
              style: TextStyle(color: Colors.white),
          ),
        ),
        ),

      ],
    );
  }
}
