import 'dart:io';
import 'package:firebase_test/fire_codebase/firebase_firestore.dart';
import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/main.dart';
import 'package:firebase_test/pages/profilePage.dart';
import 'package:firebase_test/widgets/closeIconButton.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  final filePath;
  UploadPage({this.filePath});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  // 0 == unPublished, 1 == loading, 2 == published, -1 == error
  int uploadStatus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CloseIconButton(),
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(File(widget.filePath))),
                GestureDetector(
                  onTap: () async {
                    if (uploadStatus == 0) {
                      uploadStatus = 1;
                      setState(() {});

                      CommitUser addUser = CommitUser(username);
                      bool uploadTask =
                          await addUser.addPost(filePath: widget.filePath);

                      if (uploadTask) {
                        profileStreamController.add(0.0);
                        uploadStatus = 2;
                      } else if (!uploadTask) uploadStatus = -1;
                      setState(() {});
                    }
                  },
                  child: AnimatedContainer(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      margin: EdgeInsets.all(15),
                      duration: Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                          color: uploadStatus == 0 || uploadStatus == 1
                              ? Colors.blue.shade300
                              : uploadStatus < 0
                                  ? Colors.red.shade400
                                  : Colors.green.shade400,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: uploadStatus == 1
                            ? CircularProgressIndicator.adaptive()
                            : uploadStatus == 0
                                ? Text(
                                    "Publish",
                                    style: GoogleTextStyle.subtitle(
                                        color: Colors.white),
                                  )
                                : uploadStatus < 0
                                    ? Text("An Error Occured",
                                        style: GoogleTextStyle.subtitle(
                                            color: Colors.white))
                                    : Text(
                                        "Publish Successful",
                                        style: GoogleTextStyle.subtitle(
                                            color: Colors.white),
                                      ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
