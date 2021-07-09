import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/main.dart';
import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  final themeColor;
  ProfileButtons(this.themeColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2 - 50,
            decoration: BoxDecoration(
                boxShadow: boxShadow(),
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(
                  themeColor[0], themeColor[1], themeColor[2], 0.8),),
            child: Center(
                child: Text(
              "Follow",
              style: GoogleTextStyle.text(),
            )),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2 - 50,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(30, 30, 30, 0.13)),
                boxShadow: boxShadow(),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Center(
                child: Text(
              "Message",
              style: GoogleTextStyle.text(),
            )),
          ),
        ],
      ),
    );
  }
}
