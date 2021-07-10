import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        color: color, fontSize: 16, fontWeight: FontWeight.w800);
  }

  static TextStyle text({Color? color}) {
    return GoogleFonts.dmSans(
        color: color, fontSize: 16, fontWeight: FontWeight.w400);
  }
}