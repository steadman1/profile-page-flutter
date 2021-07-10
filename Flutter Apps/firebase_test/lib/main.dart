import 'package:firebase_test/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'fire_codebase/firebase_firestore.dart';
import 'flutter custom components/customNavbar.dart';

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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: 60,
              height: 50,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.white,
                child: Icon(Icons.add_rounded, size: 40, color: Colors.black,),
                onPressed: () => selectImage(),
                
              ),
            ),
          ),
        )
      ],
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
