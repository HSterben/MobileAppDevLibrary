import 'package:flutter/material.dart';
import 'profileModel.dart';
import 'ApiService.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late List<ProfileModel>? _profileModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _profileModel = (await ApiService().getPhotos());
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('REST example 2'),
        ),
        body: _profileModel == null || _profileModel!.isEmpty
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: _profileModel!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                    ClipOval(
                      child: Image.network("${_profileModel![index].thumbnailUrl}",
                        width: 50,
                        height: 50, // Adjust this property based on your needs
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 190,
                    child:
                    Column(
                      children: [
                        Text('${_profileModel![index].title}'),
                        Text('${_profileModel![index].id}'),
                        Text('${_profileModel![index].albumId}'),

                      ],
                    ),
                  ),
                  Spacer(),
                  Image.network("${_profileModel![index].url}",
                    width: 100,
                    height: 100, // Adjust this property based on your needs
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}