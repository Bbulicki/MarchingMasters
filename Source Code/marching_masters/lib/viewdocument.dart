import 'package:flutter/material.dart';

class viewdocument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("view document screen"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'File name...',
                      style: TextStyle(
                        color: Colors. white,),
                    ),
                  ],
                )
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}