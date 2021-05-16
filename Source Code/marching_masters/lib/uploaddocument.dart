import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';


//might have to make this stateful
//using image picker package, need to add it to the pubspes.yaml

String userId;

class uploaddocument extends StatefulWidget {
  @override
  _uploadocumentState createState() => _uploadocumentState();
}

class _uploadocumentState extends State<uploaddocument> {
  File imageFile;
  final picker = ImagePicker();

  _openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    try{
      String filename = imageFile.path.split("/").last; //not best practice tho

    }catch(e){
      print(e);
    }
    //Navigator.of(context).pop();
  }


  _openCamera(BuildContext context) async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("make a choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                }
              )
            ],
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("upload document screen"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("No img rn"),
              ElevatedButton(onPressed: (){
                _showChoiceDialog(context);
              }, child: Text("browse img")),
            ],
          ),
        )
      ),
    );
  }
}
