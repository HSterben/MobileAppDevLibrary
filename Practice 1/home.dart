import 'package:flutter/material.dart';
import 'pizza.dart';
import 'pizzaPage.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen({required this.username});

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
      body: HomePage(username: username),
    );
  }
}

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  "Pizzas",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 60),
                child: Text(
                  username,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PizzaScreen(pizza: Pizza(1), username: username,),
                    ),
                  );
                },
                child: Image.asset("assets/car.png", width: 120),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PizzaScreen(pizza: Pizza(2), username: username),
                    ),
                  );
                },
                child: Image.asset("assets/car.png", width: 120),
              ),
            ],
          ),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PizzaScreen(pizza: Pizza(3), username: username),
                    ),
                  );
                },
                child: Image.asset("assets/car.png", width: 120),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PizzaScreen(pizza: Pizza(4), username: username),
                    ),
                  );
                },
                child: Image.asset("assets/car.png", width: 120),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClickableImage(BuildContext context, String assetPath, Widget destinationScreen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationScreen),
        );
      },
      child: Image.asset(
        assetPath,
        width: 100.0,
      ),
    );
  }
}
