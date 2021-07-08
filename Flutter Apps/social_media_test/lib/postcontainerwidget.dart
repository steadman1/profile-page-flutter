import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:social_media_test/main.dart';
import 'package:social_media_test/widgets/profilecontainerwidget.dart';
import 'flutter custom components/GoogleTextStyle.dart';

class PostContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(25),
        width: MediaQuery.of(context).size.width,
        height: 670,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: boxShadow(),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(children: [
              ProfileContainer(50, "https://lh3.googleusercontent.com/ogw/ADea4I7MJxPWGtpzLfTsC7242Zt5-Y_tSW7KircvjnSiwQ=s192-c-mo"),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("@spence", style: GoogleTextStyle.username(),),
              )
            ],),
          ),
          Stack(
            children: [
              Container(
                //margin: EdgeInsets.only(top: 25),
                width: MediaQuery.of(context).size.width,
                height: 580,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://images.unsplash.com/photo-1534270804882-6b5048b1c1fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8OHx8fGVufDB8fHx8&w=1000&q=80"),
                  )
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Row(children: [
                //mainAxisAlignment: MainAxisAlignment.end,
                  GlassContainer.clearGlass(  
                  width: 90,
                  height: 50,
                  color: Colors.grey.shade400.withOpacity(0.4),
                  blur: 2,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.favorite_outline_rounded, size: 30, color: Colors.white),
                      Text("1.3k", style: GoogleTextStyle.text(color: Colors.white))
                    ]
                  ),
                ),
                GlassContainer.clearGlass(  
                  margin: EdgeInsets.only(left: 15),
                  width: 50,
                  height: 50,
                  color: Colors.grey.shade400.withOpacity(0.4),
                  blur: 2,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  child: Icon(Icons.chat_bubble_outline, size: 30, color: Colors.white,),
                )
                ],)
              )
            ],
          ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   margin: EdgeInsets.only(top: 25),
          //   child: Text("New york's so pretty", style: GoogleTextStyle.text(),),
          // ),
          // Container(
          //   margin: EdgeInsets.only(top: 25),
          //   child: Row(
          //     //mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Container(
          //       width: 90,
          //       height: 50,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         color: Colors.grey[200],
          //         boxShadow: boxShadow(),
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Icon(Icons.favorite_outline_rounded, size: 30,),
          //           Text("1.3k", style: GoogleTextStyle.text(),)
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: 50,
          //       height: 50,
          //       margin: EdgeInsets.only(left: 15),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         color: Colors.grey[200],
          //         boxShadow: boxShadow(),
          //       ),
          //       child: Icon(Icons.chat_bubble_outline, size: 30)),
              
          //   ],),
          // ),
        ],),
      ),
    );
  }
}