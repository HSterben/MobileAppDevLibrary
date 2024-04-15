import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  DateTime currentDate = DateTime.now();
  Future<void> _selectTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2030));
    if(pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currentDate.toString()),
            ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text('Pick a Date'))
          ],
        ),
      ),
    );
  }
}