import 'package:flutter/material.dart';
import 'package:social_media_test/main.dart';
import 'package:social_media_test/profilecontainerwidget.dart';

class ProfilePage extends StatelessWidget {
  final username;
  ProfilePage(this.username);

  final themeColor = Color(0xff8eb8e5);//Color(0xff9CAFB7);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
          child: ListView(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 180,
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -45),
                child: Column(
                  children: [
                    Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "4497",
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
                              ProfileContainer(130,
                                "https://lh3.googleusercontent.com/ogw/ADea4I7MJxPWGtpzLfTsC7242Zt5-Y_tSW7KircvjnSiwQ=s192-c-mo"),
                              Column(
                                children: [
                                  Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "119",
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
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                "Spencer Steadman",
                                style: GoogleTextStyle.subtitle(),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "@spence",
                                style: GoogleTextStyle.username(),
                              ))
                        ],
                      ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Center(child: Text("developer of this app 🤌\n jrt '23 cs, xc & track\nnova swimming", 
                  textAlign: TextAlign.center,
                  style: GoogleTextStyle.text(),)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        decoration: BoxDecoration(
                            boxShadow: boxShadow(),
                            borderRadius: BorderRadius.circular(15),
                            color: themeColor),
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
                            border: Border.all(
                                color: Color.fromRGBO(30, 30, 30, 0.13)),
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
                ),
            ],
          ),
              )
          ],
          ),
        ),
    );
  }
}