import 'package:firebase_test/flutter%20custom%20components/GoogleTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class LikeButton extends StatefulWidget {
  final int likeCount;
  final bool isLiked;
  LikeButton(this.likeCount, this.isLiked);
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late String formattedLikeCount;
  late bool liked;

  @override
  void didChangeDependencies() {
    formattedLikeCount = widget.likeCount > 999999
        ? (widget.likeCount / 1000000).toStringAsFixed(1) + "M"
        : widget.likeCount > 999
            ? (widget.likeCount / 1000).toStringAsFixed(1) + "K"
            : widget.likeCount.toString();
    liked = widget.isLiked;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        liked = liked ? false : true;
        setState(() {});
      },
      child: GlassContainer.clearGlass(
        height: 40,
        width: 70 + formattedLikeCount.length * 8,
        color:
            liked ? Colors.grey.shade400.withOpacity(0.3) 
            : Colors.red.shade300,
        blur: 3,
        borderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                liked ? Icons.favorite_border : Icons.favorite,
                color: Colors.white,
              ),
              Text(
                formattedLikeCount.toString(),
                style: GoogleTextStyle.text(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
