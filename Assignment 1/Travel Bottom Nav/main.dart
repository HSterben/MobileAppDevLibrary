import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  final List<String> _titles = ['Demo', 'Search', 'Convert Temperature'];
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/background.png',
            width: 400.0,
            height: 630.0,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250.0,
                    child: Text(
                      'The best travel in the world',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300.0,
                    child: Text(
                      'lives without limits the world is made to explore and appreciate its beauty',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 40.0,
                    width: 400.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Explore Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of icons and text for demonstration purposes
    final List<Map<String, dynamic>> items = [
      {'image': 'assets/earth.png', 'text': 'Carte'},
      {'image': 'assets/qr-code.png', 'text': 'QRCode'},
      {'image': 'assets/cloudy.png', 'text': 'Meteo'},
      {'image': 'assets/information.png', 'text': 'SityGuides stockes'},
      {'image': 'assets/hiking.png', 'text': 'Marche'},
      {'image': 'assets/mountain-bike.png', 'text': 'VTT'},
      {'image': 'assets/bicyclist.png', 'text': 'Velo'},
      {'image': 'assets/horse.png', 'text': 'Cheval'},
      {'image': 'assets/car.png', 'text': 'Auto / Moto'},
    ];

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                items[index]['image'],
                width: 50,
                height: 50,
              ),
              Text(
                items[index]['text'],
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _controller = TextEditingController();
  String _conversionResult = '';
  bool _isFahrenheitToCelsius = true; // Track which conversion we're doing

  void _convertTemperature() {
    final double? value = double.tryParse(_controller.text);
    if (value != null) {
      double result;
      if (_isFahrenheitToCelsius) {
        result = (value - 32) * 5 / 9;
      } else {
        result = (value * 9 / 5) + 32;
      }
      setState(() {
        _conversionResult = "${_isFahrenheitToCelsius ? 'Celsius' : 'Fahrenheit'}: ${result.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0,),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter temperature',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 100.0),
            ToggleButtons(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('F -> C'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('C -> F'),
                ),
              ],
              isSelected: [_isFahrenheitToCelsius, !_isFahrenheitToCelsius],
              onPressed: (int index) {
                setState(() {
                  _isFahrenheitToCelsius = index == 0;
                });
              },
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white60,
              ),
              onPressed: _convertTemperature,
              child: Text('Submit'),
            ),
            SizedBox(height: 30.0),
            _conversionResult.isNotEmpty
                ? Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                _conversionResult,
                style: TextStyle(fontSize: 20,
                color: Colors.white),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
