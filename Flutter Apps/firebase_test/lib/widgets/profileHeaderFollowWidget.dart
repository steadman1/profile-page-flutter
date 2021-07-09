import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/widgets/profileContainerWidget.dart';
import 'package:flutter/material.dart';

class ProfileFollow extends StatelessWidget {
  final int followers;
  final int following;
  final String profileUrl;
  ProfileFollow(this.followers, this.following, this.profileUrl);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  followers.toString(),
                  style: GoogleTextStyle.subtitle(),
                )),
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "followers",
                  style: GoogleTextStyle.text(),
                )),
          ],
        ),
        ProfileContainer(120, profileUrl),
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  following.toString(),
                  style: GoogleTextStyle.subtitle(),
                )),
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "following",
                  style: GoogleTextStyle.text(),
                )),
          ],
        ),
      ],
    );
  }
}
