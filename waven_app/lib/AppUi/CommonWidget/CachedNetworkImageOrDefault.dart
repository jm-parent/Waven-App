import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageOrDefault extends StatelessWidget {
  final CachedNetworkImage image;

  const CachedNetworkImageOrDefault({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return image.imageUrl == null || image.imageUrl == ""?
    Image.asset('images/ShushusImages/ShushusSkill/default.png',height: image.height,fit: image.fit,width: image.width,):
    image;
  }
}
