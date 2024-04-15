import 'package:flutter/material.dart';
import 'pizza.dart';

class PizzaScreen extends StatelessWidget {
  final Pizza pizza;
  final String username;

  PizzaScreen({required this.pizza, required this.username});

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
      body: PizzaPage(
        pizza: pizza,
        username: username,
      ),
    );
  }
}

class PizzaPage extends StatelessWidget {
  final Pizza pizza;
  final String username;

  PizzaPage({required this.pizza, required this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pizza.name,
              style: TextStyle(fontSize: 25),
            ),
            Text(username)
          ],
        ),
        SizedBox(height:30),
        Center(
          child: Image.asset('assets/car.png',
          width: 130,),
        ),
        SizedBox(height:40),
        Center(
          child: Text(pizza.description)
        ),
        SizedBox(height:30),
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                "Size",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width:100),
              Text("Small"),
              SizedBox(width:100),
              Text("Medium"),
              SizedBox(width:100),
              Text("Large"),
            ],
          ),
        ),
      ],
    );
  }
}
