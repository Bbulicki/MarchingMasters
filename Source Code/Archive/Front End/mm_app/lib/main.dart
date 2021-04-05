import 'package:flutter/material.dart';

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
            ElevatedButton(
              child: Text('Band Information'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BandInfo()),
                );
              }
            ),
            ElevatedButton(
              child: Text('Drill Visualization'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoadDrill()),
                );
              }
            ),
            ElevatedButton(
              child: Text('Event Handling'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventHandle()),
                );
              }
            ),
            ElevatedButton(
              child: Text('Feedback'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Feedback()),
                );
              }
            ),
            ElevatedButton(
              child: Text('Settings'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              }
            ),
        ],)
      ),
    );
  }
}

class BandInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Band Information"),
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
                  Text("DRILL VISUAL GOES HERE")
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
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => DrillVis()),
                              // );
                            },
                            child: Text('<<'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => DrillVis()),
                              // );
                            },
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

class EventHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: Center(
        child: Text("Events"),
      ),
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