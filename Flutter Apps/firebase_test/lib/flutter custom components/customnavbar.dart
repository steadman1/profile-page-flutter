import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final double radius = 30.0;
  final double iconSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 40),
              blurRadius: 100,
              spreadRadius: 20,
              color: Color.fromRGBO(50, 50, 93, 0.25))
        ],
      ),
      child: ClipPath(
        clipper: CustomNavBarClipper(30),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width / 5.5 - iconSize / 2,
                top: 20,
                child: Icon(
                  Icons.home_rounded,
                  size: iconSize,
                ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width / 5.5 - iconSize / 2,
                top: 20,
                child: Icon(
                  Icons.person,
                  size: iconSize,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  final double borderRadius;
  final double middleWidth = 80.0;
  final double boxWidth = 15.0;
  CustomNavBarClipper(this.borderRadius);

  @override
  getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, borderRadius)
      ..arcToPoint(
        Offset(borderRadius, 0),
        radius: Radius.circular(borderRadius),
      )
      ..lineTo(size.width / 2 - middleWidth / 2 - borderRadius * 2 + boxWidth, 0)
      ..arcToPoint(
        Offset(
            size.width / 2 - middleWidth / 2 - borderRadius + boxWidth, borderRadius),
        radius: Radius.circular(borderRadius),
      )
      ..arcToPoint(
          Offset(size.width / 2 - middleWidth / 2 + boxWidth, borderRadius * 2),
          radius: Radius.circular(borderRadius),
          clockwise: false)
      ..lineTo(size.width / 2 + middleWidth / 2 - boxWidth, borderRadius * 2)
      ..arcToPoint(
          Offset(size.width / 2 + middleWidth / 2 + borderRadius - boxWidth,
              borderRadius),
          radius: Radius.circular(borderRadius),
          clockwise: false)
      ..arcToPoint(
        Offset(size.width / 2 + middleWidth / 2 + borderRadius * 2 - boxWidth, 0),
        radius: Radius.circular(borderRadius),
      )
      ..lineTo(size.width - borderRadius, 0)
      ..arcToPoint(
        Offset(size.width, borderRadius),
        radius: Radius.circular(borderRadius),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

/*
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
*/
