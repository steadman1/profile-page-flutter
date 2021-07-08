import 'package:flutter/material.dart';
import 'package:social_media_test/flutter custom components/customnavbar.dart';
import 'package:social_media_test/postcontainerwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainStack(),
      ),
    );
  }
}

class MainStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[100],
          child: PostContainer(),
        ),
        Positioned(bottom: 0, child: CustomNavBar()),
      ],
    );
  }
}

List<BoxShadow> boxShadow() => 
[BoxShadow(
  offset: Offset(0, 20),
  blurRadius: 100,
  spreadRadius: 10,
  color: Color.fromRGBO(50, 50, 93, 0.1))];
