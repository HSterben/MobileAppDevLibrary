import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  int guests;
  int rooms;
  BookingPage({required this.guests, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.orange),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Home',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 18.0,
            ),
          ),
          Text(
            'Hotels',
            style: TextStyle(
                color: Colors.white),
          ),
          SizedBox(width: 100),
        ],
      ),
    ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Black border color
              width: 5.0, // Border width
            ),
          ),
          child: Text(
            'You booked $guests guests and $rooms rooms.\nThank you!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}