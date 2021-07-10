import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/fire_codebase/firebase_firestore.dart';
import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/widgets/commentWidget.dart';
import 'package:flutter/material.dart';

class CommentListBuilder extends StatelessWidget {
  final postPath;
  final controller;
  CommentListBuilder(this.postPath, [this.controller]);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
        future: RetrieveReference.postComments(postPath),
        builder: (context, snapshot) {
          //print(widget.postPath);
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 60),
                child: Text(
                  "No Comments Yet :(",
                  style: GoogleTextStyle.subtitle(),
                ),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                controller: null,
                //physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<DocumentSnapshot?>(
                      future: RetrieveUser(snapshot.data![index]["username"])
                          .userInfo(),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          if (index == 0) {
                            return Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Comment(
                                text: snapshot.data![index]["text"],
                                profileUrl: snap.data!.get("profileUrl"),
                                username: snapshot.data![index]["username"],
                              ),
                            );
                          }
                          return Comment(
                            text: snapshot.data![index]["text"],
                            profileUrl: snap.data!.get("profileUrl"),
                            username: snapshot.data![index]["username"],
                          );
                        }
                        return index == 0
                            ? Container(
                                margin: EdgeInsets.only(top: 60),
                                child: CircularProgressIndicator.adaptive())
                            : Container();
                      });
                });
          }
          return Container(
              margin: EdgeInsets.only(top: 60),
              child: CircularProgressIndicator.adaptive());
        });
  }
}
