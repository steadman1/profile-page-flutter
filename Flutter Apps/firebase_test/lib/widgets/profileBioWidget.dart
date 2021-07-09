import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  final String bio;
  ProfileBio(this.bio);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Center(
          child: Text(
        bio,
        textAlign: TextAlign.center,
        style: GoogleTextStyle.text(),
      )),
    );
  }
}
