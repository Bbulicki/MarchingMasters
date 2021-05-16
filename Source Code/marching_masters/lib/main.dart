import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

String bandId;
String userId;

TextEditingController userIdFromText = new TextEditingController();
TextEditingController bandIdFromText = new TextEditingController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marching Masters',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Marching Masters Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            children: [
              Row(children:[Text(' ')]),
              Row(children:[
                ConstrainedBox(constraints: BoxConstraints.tightFor(width: 200, height:300),
                  child:ElevatedButton(
                    child: Text('JOIN A BAND', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JoinBand()),
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  )
                ),
                Spacer(),
                ConstrainedBox(constraints: BoxConstraints.tightFor(width: 200, height:300),
                  child:ElevatedButton(
                    child: 
                    Text('DRILL VISUALIZER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoadDrill()),
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  ),
                )
              ]),
              Row(children:[Text(' ')]),
              Row(children:[
              ConstrainedBox(constraints: BoxConstraints.tightFor(width: 200, height:300),
                  child:ElevatedButton(
                  child: Text('DOCUMENTS & MORE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => post_testing()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                  ),
                )
              ),
              Spacer(),
              ConstrainedBox(constraints: BoxConstraints.tightFor(width: 200, height:300),
                  child:ElevatedButton(
                  child: Text('FEEDBACK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => post_feedback()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  )
                ),
              ]),
              Row(children:[Text(' ')]),
              ConstrainedBox(constraints: BoxConstraints.tightFor(width: 400, height:65),
                  child:ElevatedButton(
                  child: Text('SETTINGS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                  ),
                )
              ),
            ],)
      ),
    );
  }
}

class JoinBand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Join a Band"),
        ),
        body: GetTextFieldValue()
        );
}
}

class GetTextFieldValue extends StatefulWidget {
 
  BandIDWidget createState() => BandIDWidget();
 
}

class BandIDWidget extends State<GetTextFieldValue> {
  @override
  Widget build(BuildContext context) {

    setIds() {
      setState(() {
      userId = userIdFromText.text;
      bandId = bandIdFromText.text;
      userIdFromText.clear();
      bandIdFromText.clear();
      print("User Id is: " + userId);
      print("Band Id is : " + bandId);
      });
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(
            "Enter User and Band ID",
            style: new TextStyle(fontSize: 24.0),
          ), 
          new Container(
            width: 200,
            child: new TextField(
              controller: userIdFromText,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User ID',
              ),
            ),
          ),
          new Container(
            width:200,
            child: new TextField(
              controller: bandIdFromText,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Band ID',
              ),
            ),
          ),
          new ElevatedButton(
            onPressed: setIds,
            child: new Text("Submit")
            )
        ]
      )
    );
  }
}

getUserID() {
  return userId;
}

getBandId() {
  return bandId;
}

class BandInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joining a Band"),
      ),
      body: Center(
        child: Text("Band Info"),
      ),
    );
  }
}

class LoadDrill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drill Visualizer"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DrillVis()),
            );
          },
          child: Text('Load Drill'),
        ),
      ),
    );
  }
}

class DrillVis extends StatelessWidget {
  var child = [
    Image.network("https://s3.us-east-2.amazonaws.com/www.brandinbulicki.com/MarchingGraphics/f1.png"),   
    Image.network("https://s3.us-east-2.amazonaws.com/www.brandinbulicki.com/MarchingGraphics/f2.png"),
    Image.network("https://s3.us-east-2.amazonaws.com/www.brandinbulicki.com/MarchingGraphics/f3.png"),
    Image.network("https://s3.us-east-2.amazonaws.com/www.brandinbulicki.com/MarchingGraphics/f4.png"),
    ];

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Drill Visualizer"),
        ),
        body:
        Container(
          child: Row(
            children: [
              Container(width: 500, color: Colors.lightGreen,
                  child:Column(
                    children: [
                      CarouselSlider(
                        items: child,
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          aspectRatio: 1.7,
                          initialPage: 2,
                        ),
                      )
                    ],
                  )
              ),
              Container(width: 271.5, color: Colors.grey,
                  child:Column(
                    children: [
                      Container(height: 125, width: 271.5, color: Colors.white24,
                        child:Row(
                          children: [
                            Column(
                                children:[
                                  Text(""),
                                  Text(""),
                                  Text("                               Current Set                          "),
                                  Text('Coordinate X:'+' Variable X'),
                                  Text('Coordinate Y:'+' Variable Y')
                                ]
                            )
                          ],
                        ),
                      ),
                      Container(height: 125, width: 271.5, color: Colors.white10,
                          child:Row(
                            children: [
                              Text("                 DEVICE NOT CONNECTED")
                            ],
                          )
                      ),
                      Row(children: [
                        Center(
                          child: Row(
                            children:[
                              Text("                      "),
                              ElevatedButton(
                                onPressed: () 
                                  => buttonCarouselController.previousPage(
                                duration: Duration(milliseconds: 10), curve: Curves.linear)
                                ,
                                child: Text('<<'),
                              ),
                              ElevatedButton(
                                onPressed: () 
                                  => buttonCarouselController.nextPage(
                                duration: Duration(milliseconds: 10), curve: Curves.linear)
                                ,
                                child: Text('>>'),
                              ),
                            ],
                          ),
                        ),
                      ],)
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}

class post_testing extends StatefulWidget {
  @override
  _post_testingState createState() => _post_testingState();
}

class _post_testingState extends State<post_testing> {

  File imageFile;
  String filename;
  final picker = ImagePicker();
  Dio dio = new Dio();

  void postData(filename, imageFile) async{
    try{
      FormData formData = new FormData.fromMap({
        "document" : imageFile,
      });
      var response = await dio.post("https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/uploaddocuments",
        queryParameters: {"user_id" : "test_user" , "filename" : filename},
        data: formData,
      );
      print(response);
    }catch(e){
      print(e);
    }
  }

  _openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        filename = imageFile.path.split("/").last; //not best practice tho
        postData(filename, imageFile);
        print("filename: " + filename);
      } else {
        print('No image selected.');
      }
    });

    //Navigator.of(context).pop();
  }
  void _openCamera(BuildContext context){}

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
        title: Text("event handle screen"),
      ),
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(onPressed: (){
                  _showChoiceDialog(context);
                },
                    child: Text("upload document")),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewdocs()),
                  );
                }, child: Text('view document'),
                )
              ],
            ),
          )
      ),
    );
  }
}

class viewdocs extends StatelessWidget {
  Dio dio = new Dio();
  int len;
  List<dynamic> documents;

  Future<dynamic> getData() async {
    var response = await dio.get(
        "https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/retrievedocuments",
        queryParameters: {"user_id" : "test_user"}
    );

    print("...." + response.data.toString());
    var data = await json.decode(json.encode(response.data));
    documents = data["documents"];
    len = documents.length;

    print(documents.length);
    return documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("view document screen"),
        ),
        body: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print("YYYYYYYY " + snapshot.data.toString());
              if(snapshot.data == null){
                return Container(
                  child: Center(
                      child: Text("Loading...")
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  print("documents" + snapshot.data[index]);
                  return Card(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              snapshot.data[index],
                              style: TextStyle(
                                color: Colors. black,),
                            ),
                          ],
                        )
                    ),
                  );
                },
              );
            },
          ),
        )
    );
  }
}

class Feedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Center(
        child: Text("Feedback"),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}


class post_feedback extends StatefulWidget {
  @override
  _post_feedbackState createState() => _post_feedbackState();
}

class _post_feedbackState extends State<post_feedback> {

  File imageFile;
  String filename;
  final picker = ImagePicker();
  Dio dio = new Dio();

  void postData(filename, imageFile) async{
    try{
      FormData formData = new FormData.fromMap({
        "document" : imageFile,
      });
      var response = await dio.post("https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/uploaddocuments",
        queryParameters: {"user_id" : "test_user" , "filename" : filename},
        data: formData,
      );
      print(response);
    }catch(e){
      print(e);
    }
  }

  _openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        filename = imageFile.path.split("/").last; //not best practice tho
        postData(filename, imageFile);
        print("filename: " + filename);
      } else {
        print('No image selected.');
      }
    });

    //Navigator.of(context).pop();
  }
  void _openCamera(BuildContext context){}

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Select Feedback File"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("File"),
                onTap: (){
                  _openGallery(context);
                },
              ),
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
        title: Text("Feedback"),
      ),
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(onPressed: (){
                  _showChoiceDialog(context);
                },
                    child: Text("Upload Comments")),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewdocs()),
                  );
                }, child: Text('View Feedback'),
                )
              ],
            ),
          )
      ),
    );
  }
}

class viewFeedback extends StatelessWidget {
  Dio dio = new Dio();
  int len;
  List<dynamic> documents;

  Future<dynamic> getData() async {
    var response = await dio.get(
        "https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/retrievedocuments",
        queryParameters: {"user_id" : "test_user"}
    );

    print("...." + response.data.toString());
    var data = await json.decode(json.encode(response.data));
    documents = data["documents"];
    len = documents.length;

    print(documents.length);
    return documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View Feedback Screen"),
        ),
        body: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print("YYYYYYYY " + snapshot.data.toString());
              if(snapshot.data == null){
                return Container(
                  child: Center(
                      child: Text("Loading...")
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  print("documents" + snapshot.data[index]);
                  return Card(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              snapshot.data[index],
                              style: TextStyle(
                                color: Colors. black,),
                            ),
                          ],
                        )
                    ),
                  );
                },
              );
            },
          ),
        )
    );
  }
}
