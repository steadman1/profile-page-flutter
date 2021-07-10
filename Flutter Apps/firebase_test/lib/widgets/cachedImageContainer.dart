import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageContainer extends StatelessWidget {
  final imageUrl;
  CachedImageContainer(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        color: Colors.white,
        child: Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
