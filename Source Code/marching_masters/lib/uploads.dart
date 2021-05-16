import 'package:flutter/material.dart';
import 'uploaddocument.dart';

class uploads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu),onPressed: (){
          }),
          title: Text("uploadfile"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.menu),onPressed: (){
            }),
          ]
      ),
      body: Center(
        child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)),)
                  ),
                    child: Text('Upload Document',
                      style: TextStyle(
                        color: Colors. white,
                      ),
                    ),
                  onPressed:(){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => uploaddocument()),
                    );
                  }),
                ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)),)
                    ),
                    child: Text('Upload Document',
                      style: TextStyle(
                        color: Colors. white,
                      ),
                    ),
                    onPressed:(){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => uploaddocument()),
                      );
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)),)
                    ),
                    child: Text('Upload Document',
                      style: TextStyle(
                        color: Colors. white,
                      ),
                    ),
                    onPressed:(){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => uploaddocument()),
                      );
                    }),
              ),
              ]),
      ),
    );
  }
}
