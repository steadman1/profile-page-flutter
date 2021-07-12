import 'package:firebase_test/fire_codebase/firebase_firestore.dart';
import 'package:firebase_test/pages/profilePage.dart';
import 'package:flutter/material.dart';

class CloseIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.close_rounded,
          size: 30,
        ));
  }
}

class DeleteIconButton extends StatefulWidget {
  final referenceId;
  final imageUrl;
  final username;
  DeleteIconButton(this.referenceId, this.imageUrl, this.username);

  @override
  _DeleteIconButtonState createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<DeleteIconButton> {
  late CommitUser addUser;
  late bool clicked;

  initState() {
    clicked = false;
    addUser = CommitUser(widget.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          if (!clicked) {
            clicked = true;
            setState(() {});
            bool deleteStaus = await addUser.deletePost(
                referenceId: widget.referenceId, imageUrl: widget.imageUrl);
            if (deleteStaus) {
              profileStreamController.add(0.0);
              Navigator.pop(context);
            }
          } else {
            print("already clicked");
          }
        },
        child: Icon(
          Icons.delete_outline_rounded,
          size: 30,
        ));
  }
}
