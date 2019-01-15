import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerPage extends StatelessWidget {

  final String imageUrl;
  final String skinName;

  const ImageViewerPage({Key key, this.imageUrl, this.skinName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('skinImage${imageUrl}');
    return Scaffold(
      appBar: AppBar(
        title: Text(skinName),
      ),
      body: Container(
          child: Hero(
            tag: 'skinImage${skinName}',
            child: PhotoView(
              imageProvider: FadeInImage.assetNetwork(
                  placeholder: 'images/loading.gif',
                  image: imageUrl).image,
            ),
          )
      ),
    );
  }
}
