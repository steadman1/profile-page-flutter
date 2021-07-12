import 'package:firebase_test/fire_codebase/firebase_firestore.dart';
import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:firebase_test/main.dart';
import 'package:firebase_test/widgets/cachedImageContainer.dart';
import 'package:firebase_test/widgets/closeIconButton.dart';
import 'package:firebase_test/widgets/commentButtonWidget.dart';
import 'package:firebase_test/widgets/commentListWidget.dart';
import 'package:firebase_test/widgets/likeButtonWidget.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final post;
  PostPage(
      {this.post});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> with TickerProviderStateMixin {
  late ScrollController draggableScrollableController;
  late RetrieveUser getUser;
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    draggableScrollableController = ScrollController();
    getUser = RetrieveUser(widget.post.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[200],
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CloseIconButton(),
                    Text(
                      widget.post.username,
                      style: GoogleTextStyle.subtitle(),
                    ),
                    DeleteIconButton(
                      widget.post.referenceId, 
                      widget.post.imageUrl, 
                      widget.post.username)
                  ],
                ),
              ),
              Stack(
                children: [
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy >= 20.0) {
                        Navigator.pop(context);
                      }
                    },
                    child: Hero(
                        tag: widget.post.imageUrl,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CachedImageContainer(widget.post.imageUrl))),
                  ),
                  Positioned(
                      left: 15,
                      bottom: 15,
                      child: FadeTransition(
                        opacity: Tween(begin: 0.0, end: 1.0)
                            .animate(animationController),
                        child: Row(
                          children: [
                            LikeButton(widget.post.likeCount, true),
                            CommentButton(),
                          ],
                        ),
                      ))
                ],
              ),
              Flexible(
                child: Stack(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                        tag: "comments",
                        child: CommentListBuilder(widget.post.postPath)),
                    ExpandButton(
                        postPath: widget.post.postPath,
                        child: Icon(Icons.expand_less_rounded, size: 36)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandButton extends StatelessWidget {
  final bool expanding;
  final String postPath;
  final Widget child;
  ExpandButton(
      {required this.postPath, required this.child, this.expanding = true});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap: () {
            if (expanding) {
              expandCommentSection(context, postPath);
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: boxShadow(),
              color: Colors.white,
            ),
            child: child,
          )),
    );
  }
}

expandCommentSection(context, postPath) {
  const double radius = 30.0;
  return showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.0),
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 600,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    boxShadow: boxShadow(),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius))),
                width: MediaQuery.of(context).size.width,
                height: 600,
                child:
                    Hero(tag: "comments", child: CommentListBuilder(postPath)),
              ),
              ExpandButton(
                  postPath: postPath,
                  expanding: false,
                  child: Icon(Icons.expand_more_rounded, size: 36)),
            ],
          ),
        );
      });
}
