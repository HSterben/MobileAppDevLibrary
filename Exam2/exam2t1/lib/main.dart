import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: "CloudFireStoreExample",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Stream<QuerySnapshot> _taskStream =
      FirebaseFirestore.instance.collection('Tasks').snapshots();

  CollectionReference tasks = FirebaseFirestore.instance.collection('Tasks');
  String name = ' ';

  Future<void> addTask() {
    return tasks
        .add({
      'name': name,
      'createdAt': FieldValue.serverTimestamp(), // This will store the current timestamp
    })
        .then((value) => print("Task added"))
        .catchError((error) => print("Failed to add the task"));
  }

  Future<void> updateTask(String id, String newName) async {
    await tasks
        .doc(id)
        .update({'name': newName})
        .then((value) => print("Task added"))
        .catchError((error) => print("Failed to add the task"));
  }

  Future<void> deleteTask(String id) async {
    await tasks
        .doc(id)
        .delete()
        .then((value) => print("Task added"))
        .catchError((error) => print("Failed to add the Task"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CloudFireStoreExample'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    addTask();
                  },
                  child: Text(' Add Task')),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: _taskStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    }
                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        String docId = document.id;
                        Timestamp? createdAt = data['createdAt'] as Timestamp?;
                        String formattedDate = createdAt != null ? DateFormat('dd.MM.yyyy HH:mm').format(createdAt.toDate()) : "Date not available";
                        return ListTile(
                          title: Text(data['name']),
                          subtitle: Text('Created at $formattedDate'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        String newName = '';
                                        return AlertDialog(
                                          title: Text('Edit Task'),
                                          content: TextField(
                                            onChanged: (value) {
                                              newName = value;
                                            },
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  updateTask(docId, newName);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Update'))
                                          ],
                                        );
                                      });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  deleteTask(docId);
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value) {
            name = value;
          },
          decoration: InputDecoration(
              hintText: 'Task name',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0))),
        ),
      ),
    );
  }
}
