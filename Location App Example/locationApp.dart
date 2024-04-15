import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Flutter Layout Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/lake.jpg'),
              Image.asset('assets/lake.jpg'),
              Image.asset('assets/lake.jpg'),
              TitleSection(
                name: 'Oeschinen Lake',
                location: 'Kandersteg, SwitzerLand',
              ),
              ButtonSection(),
              TextSection(
                  description:
                  ' Getting to Oeschinensee is definitely best by train. First '
                      'the views coming into Kandersteg are amazing! Second, '
                      'its a very fast and efficient way to '
              'get to the mountains '
                  'and you can get there easily from most major cities'),
            ],
          ),
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget{
  final String description;
  TextSection({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(35),
      child: Text(
        description,
        softWrap: true,
      ),);
  }
}

class ButtonSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    // TODO: implement build
    return SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonText(
                color: color,
                icon:Icons.call,
                label :' CAL'
            ),
            ButtonText(
                color: color,
                icon:Icons.near_me,
                label :'Route'
            ),
            ButtonText(
                color: color,
                icon:Icons.share,
                label :'Share'
            ),
          ],
        )

    );
  }
}

class ButtonText extends StatelessWidget{
  final Color color;
  final IconData icon;
  final String label;
  ButtonText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,

  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),)
      ],
    );
  }

}

class TitleSection extends StatelessWidget {
  final String name;
  final String location;

  TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
            // expanded is useful to fit inside the space if the widget crosses
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.green[500]),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
  }
}