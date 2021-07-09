import 'package:firebase_test/main.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String image;
  final double size;
  final clipPercentage = 0.45;
  ProfileContainer(this.size, this.image);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            boxShadow: boxShadow(),
              borderRadius: BorderRadius.circular((size - 12) * clipPercentage),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover))),
    );
  }
}

// return Container(
//       width: size,
//       height: size,
//       padding: EdgeInsets.all(2.5),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment(0, 0),
//             end: Alignment(0, 1),
//             colors: [Colors.purple, Colors.red, Colors.yellow]),
//         borderRadius: BorderRadius.circular(size * clipPercentage),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(3.0),
//         decoration: BoxDecoration(
//           color: UIColors.subground,
//           borderRadius: BorderRadius.circular((size - 6) * clipPercentage),
//         ),
//         child:
//         Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular((size - 12) * clipPercentage),
//                 image: DecorationImage(
//                     image: NetworkImage(image), fit: BoxFit.cover))),
//       ),
//     );
