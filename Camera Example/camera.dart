//DEPENDENCIES:
//
// image_picker: ^1.0.7 -> flutter:

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraAccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraAccess extends StatefulWidget {
  const CameraAccess({super.key});

  @override
  State<CameraAccess> createState() => _CameraAccessState();
}

class _CameraAccessState extends State<CameraAccess> {
  File? cameraFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> selectFromCamera(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        cameraFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Access'),
        backgroundColor: Colors.blue,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      selectFromCamera(ImageSource.camera);
                    },
                    child: Text(' Open the Camera')),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      selectFromCamera(ImageSource.gallery);
                    },
                    child: Text(' Open the Gallery')),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                    height: 200.0,
                    width: 300.0,
                    child: cameraFile == null
                        ? Center(child: Text('No Image selected'))
                        : Center(
                      child: Image.file(cameraFile!),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}