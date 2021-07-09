import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/fire_codebase/firebase_firestore.dart';
import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/widgets/postContainerWidget.dart';
import 'package:firebase_test/widgets/profileBioWidget.dart';
import 'package:firebase_test/widgets/profileButtons.dart';
import 'package:firebase_test/widgets/profileHeaderFollowWidget.dart';
import 'package:firebase_test/widgets/profileNamesWidget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final username;
  ProfilePage(this.username);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late RetrieveUser getUser;

  initState() {
    super.initState();
    getUser = RetrieveUser(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot?>(
        future: getUser.userInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DocumentSnapshot? data = snapshot.data;
            print(snapshot.data!.data().toString() + "- userInfo");

            return ProfilePageHeader(
              username: data!.get("username"),
              givenName: data.get("givenName"),
              followers: data.get("followers"),
              following: data.get("following"),
              bio: data.get("bio"),
              profileUrl: data.get("profileUrl"),
              themeColor: data.get("themeColor"),
            );
          }
          return Center(child: CircularProgressIndicator.adaptive());
        });
  }
}

class ProfilePageHeader extends StatefulWidget {
  final username;
  final givenName;

  final followers;
  final following;

  final bio;
  final profileUrl;
  final themeColor;
  ProfilePageHeader(
      {this.username,
      this.givenName,
      this.followers,
      this.following,
      this.bio,
      this.profileUrl,
      this.themeColor});

  @override
  _ProfilePageHeaderState createState() => _ProfilePageHeaderState();
}

class _ProfilePageHeaderState extends State<ProfilePageHeader> {
  late RetrieveUser getUser;

  @override
  void didChangeDependencies() {
    getUser = RetrieveUser(widget.username);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(widget.themeColor[0], widget.themeColor[1],
                  widget.themeColor[2], 1),
              Colors.grey.shade100
            ],
            begin: Alignment(0, -0.8),
            end: Alignment(0.0, -0.2),
          ),
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                ProfileFollow(
                    widget.followers, widget.following, widget.profileUrl),
                ProfileNames(widget.username, widget.givenName),
              ],
            ),
          ),
          ProfileBio(widget.bio),
          ProfileButtons(widget.themeColor),
          FutureBuilder<List>(
              future: getUser.userPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        // print(snapshot.data.toString() + "sss");
                        // if (snapshot.data!.length == 0 ||
                        //     snapshot.data == null) {
                        //   return Center(
                        //     child: Container(
                        //       height: 200,
                        //       child: Text(
                        //         "No Posts Yet",
                        //         style: GoogleTextStyle.subtitle(),
                        //       ),
                        //     ),
                        //   );
                        // } else 
                        if (index == snapshot.data!.length - 1) {
                          return Container(
                            /* margin to counteract the navbar
                            at the bottom */
                            margin: EdgeInsets.only(bottom: 60),
                            child: PostContainer(
                              imageUrl: snapshot.data![index]["url"],
                              likeCount: snapshot.data![index]["likeCount"],
                              profileUrl: widget.profileUrl,
                              username: widget.username,
                            ),
                          );
                        }
                        return PostContainer(
                          imageUrl: snapshot.data![index]["url"],
                          likeCount: snapshot.data![index]["likeCount"],
                          profileUrl: widget.profileUrl,
                          username: widget.username,
                        );
                      });
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return Center(child: Container(
                  height: 200,
                  child: CircularProgressIndicator.adaptive()));
              })
        ]),
      ),
    );
  }
}
