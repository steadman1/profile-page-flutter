import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/flutter%20custom%20components/customSlideTransition.dart';
import 'package:firebase_test/main.dart';
import 'package:firebase_test/pages/postPage.dart';
import 'package:firebase_test/pages/profilePage.dart';
import 'package:firebase_test/widgets/cachedImageContainer.dart';
import 'package:firebase_test/widgets/likeButtonWidget.dart';
import 'package:firebase_test/widgets/profilecontainerwidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/commentButtonWidget.dart';

final double borderRadiusExtent = 30.0;

class PostContainer extends StatefulWidget {
  final post;
  PostContainer({this.post});

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: profileStreamController.stream,
        builder: (context, snapshot) {
          return Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            decoration: BoxDecoration(boxShadow: boxShadow()),
            child: Stack(
              children: [
                PostBody(post: widget.post),
                Positioned(
                    left: 15,
                    bottom: 15 + borderRadiusExtent,
                    child: Row(
                      children: [
                        LikeButton(widget.post.likeCount, true),
                        CommentButton(),
                      ],
                    ))
              ],
            ),
          );
        });
  }
}

class PostBody extends StatelessWidget {
  final post;
  PostBody({this.post});

  final pagePushDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: PostUsername(post.profileUrl, post.username),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadiusExtent),
                topRight: Radius.circular(borderRadiusExtent),
              )),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            bottomToTopWithFade(
              pagePushDuration: pagePushDuration,
              child: PostPage(post: post),
            ),
          ),
          // PageTransition(
          //   child: PostPage(
          //     imageUrl: imageUrl,
          //     likeCount: likeCount,
          //     postPath: postPath,
          //     profileUrl: profileUrl,
          //     username: username,
          //   ),
          //   type: PageTransitionType.bottomToTop,
          //   curve: Curves.fastOutSlowIn,
          //   duration: Duration(milliseconds: 250),
          //   reverseDuration: Duration(milliseconds: 250),
          //   //curve: Curves.bounceIn
          // )),
          //onDoubleTap: () => likeStreamController.add(0),
          child: Transform.translate(
            offset: Offset(0, -borderRadiusExtent),
            child: Hero(
              tag: post.imageUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadiusExtent),
                child: CachedImageContainer(post.imageUrl),
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
