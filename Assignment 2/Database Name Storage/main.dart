import 'package:flutter/material.dart';
import 'person.dart';
import 'dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  List<Person> persons = [];
  int updateID = -1;

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();

  TextEditingController idDeleteController = TextEditingController();

  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Flutter Assignment 2 Part 1'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: fNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextFormField(
              controller: lNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 170,
                  child: ElevatedButton(
                    child: Text('ADD'),
                    onPressed: () {
                      String fName = fNameController.text;
                      String lName = lNameController.text;
                      _insert(fName, lName);
                      _queryAll();
                      fNameController.clear();
                      lNameController.clear();
                      updateID = -1;
                    },
                  ),
                ),
                Container(
                  width: 170,
                  child: ElevatedButton(
                    child: Text('UPDATE'),
                    onPressed: () {
                      String fName = fNameController.text;
                      String lName = lNameController.text;
                      _update(updateID, fName, lName);
                      _queryAll();
                      fNameController.clear();
                      lNameController.clear();
                      updateID = -1;
                    },
                  ),
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.indigo,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey, // Choose the color you want for the line
                        ),
                      ),
                    ),
                    child: Row(children: [
                      Text(
                        '${persons[index].firstName} ${persons[index].lastName}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          fNameController.text = persons[index].firstName!;
                          lNameController.text = persons[index].lastName!;
                          updateID = persons[index].id!;
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/edit.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _delete(persons[index].id);
                          _queryAll();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/trash.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _createPersonButton() {
    return Row();
  }

  void _insert(firstName, lastName) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnFName: firstName,
      DatabaseHelper.columnLName: lastName
    };
    Person person = Person.fromMap(row);
    final id = await dbHelper.insert(person);
    // _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    persons.clear();
    allRows?.forEach((row) => persons.add(Person.fromMap(row)));
    setState(() {});
  }

  void _update(id, fName, lName) async {
    Person person = Person(id: id, firstName: fName, lastName: lName);
    final rowsAffected = await dbHelper.update(person);
  }

  void _delete(id) async {
    final rowsDeleted = await dbHelper.delete(id);
  }
}
