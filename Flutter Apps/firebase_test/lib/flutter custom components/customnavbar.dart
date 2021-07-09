import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final double radius = 30.0;
  final double iconSize = 35.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 40),
              blurRadius: 100,
              spreadRadius: 20,
              color: Color.fromRGBO(50, 50, 93, 0.25))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        color: Colors.white,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home_rounded,
              size: iconSize,
            ),
            Icon(
              Icons.search_rounded,
              size: iconSize,
            ),
            Icon(
              Icons.person,
              size: iconSize,
            )
          ],
        ),
      ),
    );
  }
}
