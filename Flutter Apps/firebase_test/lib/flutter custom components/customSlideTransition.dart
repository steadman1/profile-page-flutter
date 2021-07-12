import 'package:flutter/material.dart';

bottomToTopWithFade({
  required Duration pagePushDuration,
  required Widget child,
}) {
  return PageRouteBuilder(
      maintainState: true,
      transitionDuration: pagePushDuration,
      reverseTransitionDuration: pagePushDuration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return child;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.linearToEaseOut,
              reverseCurve: Curves.easeInToLinear)),
          child: FadeTransition(
            opacity: animation,
            child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child),
          ),
        );
      });
}
