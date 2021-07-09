import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:flutter/material.dart';

class ProfileNames extends StatelessWidget {
  final String username;
  final String givenName;
  ProfileNames(this.username, this.givenName);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            givenName,
            style: GoogleTextStyle.subtitle(),
          )),
      Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            "@" + username,
            style: GoogleTextStyle.username(),
          ))
    ]);
  }
}
