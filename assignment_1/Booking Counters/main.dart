import 'package:flutter/material.dart';
import 'booking.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int guestCounter = 1;
  int roomCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.orange),
          onPressed: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            rowContainer(Icons.location_pin, "Las Vegas, NV", isCounter: false),
            rowContainer(Icons.people_alt_outlined, "$guestCounter Guest(s)",
                isCounter: true, index: 1),
            rowContainer(Icons.bed, "$roomCounter Room(s)",
                isCounter: true, index: 2),
            rowContainer(Icons.arrow_forward, "Today", isCounter: false),
            rowContainer(Icons.arrow_back, "Tomorrow", isCounter: false),
            SizedBox(height: 50),
            SizedBox(
              height: 40.0,
              width: 600.0,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'You are trying to book $guestCounter guests and $roomCounter rooms'),
                    backgroundColor: Colors.black,
                  ),
                );
              },
              child: Text("Reserve",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ),
            SizedBox(height: 80),
            SizedBox(
              height: 40.0,
              width: 600.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(
                        guests: guestCounter,
                        rooms: roomCounter,
                      ),
                    ),
                  );
                },
                child: Text("Book Hotels",
                    style: TextStyle(color: Colors.white),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget rowContainer(IconData icon, String text,
      {bool isCounter = false, int index = 0}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 60.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          Text(text),
          Spacer(),
          if (isCounter) ...[
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.orange),
                shape: BoxShape.rectangle,
              ),
              child: IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  if ((index == 1 && guestCounter > 1) ||
                      (index == 2 && roomCounter > 1)) {
                    setState(() => index == 1 ? guestCounter-- : roomCounter--);
                  }
                },
                padding: EdgeInsets.zero,
              ),
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.orange),
                shape: BoxShape.rectangle,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () =>
                    setState(() => index == 1 ? guestCounter++ : roomCounter++),
                padding: EdgeInsets.zero,
              ),
            ),
          ] else
            Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
