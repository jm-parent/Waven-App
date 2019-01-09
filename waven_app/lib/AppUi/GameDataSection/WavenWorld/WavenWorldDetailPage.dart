import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenWorld/WavenWorldItemModel.dart';

class WavenWorldDetailPage extends StatelessWidget {
  final WavenWorldItemModel item;

  const WavenWorldDetailPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(item.category)),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Hero(
                tag: item.title+'tag',
                child: Image.asset(
                  item.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
