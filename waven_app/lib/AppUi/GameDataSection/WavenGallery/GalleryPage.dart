import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
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
      body: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(12),
        crossAxisCount: 4,
        mainAxisSpacing: 24,
        crossAxisSpacing: 12,
        itemCount: GalleryItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: new Column(
              children: <Widget>[
                new Stack(
                  children: <Widget>[
                    //new Center(child: new CircularProgressIndicator()),
                    new Center(
                      child: new FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: GalleryItems[index].imageUrl),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: new Column(
                        children: <Widget>[
                          new Text(
                            GalleryItems[index].artistName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            GalleryItems[index].artName,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(icon: Icon(FontAwesomeIcons.twitter),),
                              new Text(
                                GalleryItems[index].twitterUrl,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      ),
    );
  }
}
