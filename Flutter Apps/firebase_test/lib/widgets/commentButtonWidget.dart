import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class CommentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
        margin: EdgeInsets.only(left: 10),
        height: 40,
        width: 40,
        color: Colors.grey.shade400.withOpacity(0.3),
        blur: 3,
        borderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: Icon(
          Icons.chat_bubble_outline_rounded,
          color: Colors.white,
        ));
  }
}
