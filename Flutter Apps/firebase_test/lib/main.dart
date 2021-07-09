import 'package:firebase_test/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'fire_codebase/firebase_firestore.dart';
import 'flutter custom components/customnavbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainStack();
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}

class MainStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[100],
          child: ProfilePage("spence"),
        ),
        Positioned(bottom: 0, child: CustomNavBar()),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  final username = "spence";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RetrieveUser getUser;
  late CommitUser addUser;

  initState() {
    super.initState();
    getUser = RetrieveUser(widget.username);
    addUser = CommitUser(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.username,
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 100,
            height: 60,
            color: Colors.green[200],
            child: GestureDetector(
              onTap: () => selectImage(),
              child: Text(
                "add post",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          FutureBuilder<List>(
              future: getUser.userPosts(),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        //shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.network(snapshot.data![index]["url"]),
                          );
                        }),
                  );
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}

List<BoxShadow> boxShadow() => [
      BoxShadow(
          offset: Offset(0, 20),
          blurRadius: 100,
          spreadRadius: 10,
          color: Color.fromRGBO(50, 50, 93, 0.1))
    ];

selectImage() async {
  // // request should only fire if never fired previously
  // await Permission.photos.request();
  // var status = await Permission.photos.status;

  // print(status.toString());

  // if (await Permission.photos.isGranted) {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  CommitUser addUser = CommitUser("spence");
  print(await addUser.addPost(filePath: pickedFile!.path));
  // } else if (await Permission.photos.isDenied) {
  //   await Permission.photos.request();
  //   openAppSettings();
  // }
}
