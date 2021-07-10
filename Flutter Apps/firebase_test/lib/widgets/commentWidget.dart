import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/widgets/profileContainerWidget.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final text;
  final username;
  final profileUrl;
  //final likeCount;
  //final replies;
  Comment({this.text, this.username, this.profileUrl});

  final mainMargins = 25.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mainMargins, right: mainMargins, left: mainMargins, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContainer(45, profileUrl),
          Container(
            /* screen size - margin^ (left + right) - pfp width 
            - this widget's margin */
            width: MediaQuery.of(context).size.width - mainMargins * 2 - 45 - 10,
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Text(
                  username,
                  style: GoogleTextStyle.username(),
                )),
                Container(
                    child: Text(
                  text,
                  style: GoogleTextStyle.text(),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
