import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/fire_codebase/firebase_firestore.dart';
import 'package:firebase_test/fire_codebase/firebase_objects.dart';
import 'package:firebase_test/widgets/postContainerWidget.dart';
import 'package:firebase_test/widgets/profileBioWidget.dart';
import 'package:firebase_test/widgets/profileButtons.dart';
import 'package:firebase_test/widgets/profileHeaderFollowWidget.dart';
import 'package:firebase_test/widgets/profileNamesWidget.dart';
import 'package:flutter/material.dart';

StreamController profileStreamController = StreamController.broadcast();

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

            return ProfilePageHeader(
                user: UserMetaData(
              username: data!.get("username"),
              givenName: data.get("givenName"),
              followers: data.get("followers"),
              following: data.get("following"),
              bio: data.get("bio"),
              profileUrl: data.get("profileUrl"),
              themeColor: data.get("themeColor"),
            ));
          }
          return Center(child: CircularProgressIndicator.adaptive());
        });
  }
}

class ProfilePageHeader extends StatefulWidget {
  final UserMetaData user;
  ProfilePageHeader({required this.user});

  @override
  _ProfilePageHeaderState createState() => _ProfilePageHeaderState();
}

class _ProfilePageHeaderState extends State<ProfilePageHeader> {
  late RetrieveUser getUser;

  @override
  void initState() {
    getUser = RetrieveUser(widget.user.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], //Color.fromRGBO(
      //     widget.themeColor[0], widget.themeColor[1], widget.themeColor[2], 1),
      child: RefreshIndicator(
        onRefresh: () async {
          profileStreamController.add(0.0);
          setState(() {});
        },
        color: Colors.black,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(
                        widget.user.themeColor[0],
                        widget.user.themeColor[1],
                        widget.user.themeColor[2],
                        1),
                    Colors.grey.shade200
                  ],
                  begin: Alignment(0, -0.3),
                  end: Alignment(0.0, 0.7),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        ProfileFollow(widget.user.followers,
                            widget.user.following, widget.user.profileUrl),
                        ProfileNames(
                            widget.user.username, widget.user.givenName),
                      ],
                    ),
                  ),
                  ProfileBio(widget.user.bio),
                  ProfileButtons(widget.user.themeColor),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: FutureBuilder<List>(
                  future: getUser.userPosts(),
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            if (index == snapshot.data!.length - 1) {
                              return Container(
                                key: Key(index.toString()),
                                /* margin to counteract the navbar
                            at the bottom */
                                margin: EdgeInsets.only(bottom: 60),
                                child: PostContainer(
                                    post: PostMetaData(
                                  imageUrl: snapshot.data![index]["data"]
                                      ["url"],
                                  likeCount: snapshot.data![index]["data"]
                                      ["likeCount"],
                                  postPath: snapshot.data![index]["path"],
                                  referenceId: snapshot.data![index]["id"],
                                  profileUrl: widget.user.profileUrl,
                                  username: widget.user.username,
                                )),
                              );
                            }
                            return PostContainer(
                                post: PostMetaData(
                              imageUrl: snapshot.data![index]["data"]["url"],
                              likeCount: snapshot.data![index]["data"]
                                  ["likeCount"],
                              postPath: snapshot.data![index]["path"],
                              referenceId: snapshot.data![index]["id"],
                              profileUrl: widget.user.profileUrl,
                              username: widget.user.username,
                            ));
                          });
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    return Center(
                        child: Container(
                            height: 200,
                            child: CircularProgressIndicator.adaptive()));
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
