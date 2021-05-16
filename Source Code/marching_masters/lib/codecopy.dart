
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: getTesting(),
    );
  }
}

///LOAD FILES AND GET REQUEST HANDLE
class getTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Text("get request"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          ]),
      body: Center(
        child: ElevatedButton(
          child: Text('get Document'),
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => viewdocs()),
            );
            //getData();
          }
        ),
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

class post_testing extends StatefulWidget {
  @override
  _post_testingState createState() => _post_testingState();
}


///FILE UPLOAD AND POST REQUEST HANDLE
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

 */