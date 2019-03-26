import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenGallery/ArtistCard.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenGallery/GalleryItems.dart';


class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    var randomSort = shuffle(GalleryItems);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Gallery",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: _buildArtistList(),
    );
  }

  _buildArtistList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ArtistList.length,
        itemBuilder: (BuildContext context, int index) {
          return ArtistCard(artistItem: ArtistList[index]);
        });
  }
}
