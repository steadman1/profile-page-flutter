import 'package:flutter/material.dart';
import 'package:social_media_test/customnavbar.dart';
import 'package:social_media_test/postcontainerwidget.dart';
import 'package:social_media_test/profilepage.dart';
import 'package:google_fonts/google_fonts.dart';

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

class GoogleTextStyle {
  String type;
  Color color = Colors.white;
  GoogleTextStyle(this.type);

  static TextStyle title({Color? color}) {
    return GoogleFonts.dmSans(
        color: color, fontSize: 32, fontWeight: FontWeight.w600);
  }

  static TextStyle subtitle({Color? color}) {
    return GoogleFonts.dmSans(
        color: color, fontSize: 22, fontWeight: FontWeight.w500);
  }

  static TextStyle username({Color? color}) {
    return GoogleFonts.dmSans(
        color: color, fontSize: 18, fontWeight: FontWeight.w800);
  }

  static TextStyle text({Color? color}) {
    return GoogleFonts.dmSans(
        color: color, fontSize: 18, fontWeight: FontWeight.w400);
  }
}

List<BoxShadow> boxShadow() => 
[BoxShadow(
  offset: Offset(0, 20),
  blurRadius: 100,
  spreadRadius: 10,
  color: Color.fromRGBO(50, 50, 93, 0.1))];
