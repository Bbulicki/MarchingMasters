import 'package:flutter/material.dart';


String username;
String password;

TextEditingController usernameFromText = new TextEditingController();
TextEditingController passwordFromText = new TextEditingController();

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Login",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Login"),
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
      username = usernameFromText.text;
      password = passwordFromText.text;
      usernameFromText.clear();
      passwordFromText.clear();
      print("User name is: " + username);
      print("password is : " + password);
      });
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(
            "Login",
            style: new TextStyle(fontSize: 24.0),
          ), 
          new Container(
            width: 200,
            child: new TextField(
              controller: usernameFromText,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              ), 
            ),
          ),
          new Container(
            width:200,
            child: new TextField(
              controller: passwordFromText,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
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
  return username;
}

getBandId() {
  return password;
}