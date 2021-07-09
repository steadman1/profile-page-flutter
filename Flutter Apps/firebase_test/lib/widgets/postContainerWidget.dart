import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/main.dart';
import 'package:firebase_test/widgets/likeButtonWidget.dart';
import 'package:firebase_test/widgets/profilecontainerwidget.dart';
import 'package:flutter/material.dart';
import 'commentButtonWidget.dart';

final double borderRadiusExtent = 30.0;

class PostContainer extends StatelessWidget {
  final imageUrl;
  final likeCount;
  final profileUrl;
  final username;
  PostContainer(
      {this.imageUrl, this.profileUrl, this.username, this.likeCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(boxShadow: boxShadow()),
      child: Stack(
        children: [
          PostBody(
            imageUrl: imageUrl,
            profileUrl: profileUrl,
            username: username,
          ),
          Positioned(
              left: 15,
              bottom: 15 + borderRadiusExtent,
              child: Row(
                children: [
                  LikeButton(likeCount),
                  CommentButton(),
                ],
              ))
        ],
      ),
    );
  }
}

class PostBody extends StatelessWidget {
  final imageUrl;
  final profileUrl;
  final username;
  PostBody({this.imageUrl, this.profileUrl, this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: PostUsername(profileUrl, username),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadiusExtent),
                topRight: Radius.circular(borderRadiusExtent),
              )),
        ),
        Transform.translate(
          offset: Offset(0, -borderRadiusExtent),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadiusExtent),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class PostUsername extends StatelessWidget {
  final String profileUrl;
  final String username;
  final double usernameMargin = 15.0;
  PostUsername(this.profileUrl, this.username);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: usernameMargin,
          right: usernameMargin,
          left: usernameMargin,
          bottom: usernameMargin + borderRadiusExtent),
      child: Row(
        children: [
          ProfileContainer(35, profileUrl),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "@" + username,
              style: GoogleTextStyle.username(),
            ),
          )
        ],
      ),
    );
  }
}
