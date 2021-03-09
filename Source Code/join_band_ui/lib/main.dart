import 'package:flutter/material.dart';


String bandId;
String userId;

TextEditingController userIdFromText = new TextEditingController();
TextEditingController bandIdFromText = new TextEditingController();

void main() {
  runApp(JoinBand());
}

class JoinBand extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Join Band",
	  theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Join a Band"),
        ),
        body: new GetTextFieldValue()
        )
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

