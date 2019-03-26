import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushuSkins/ShushuSkinItem.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusItems.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';

class ShushuSkinsPage extends StatelessWidget {

  final ShushuOfflineModel shushuModel;

  const ShushuSkinsPage({Key key, this.shushuModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filteredByShushuSkinItems = SkinsItems.where((skin) =>
    skin.shushuId == shushuModel.heroid).toList();
    debugPrint(filteredByShushuSkinItems[0].skinName);
    return ListView.builder(
      shrinkWrap: true,
        itemCount: filteredByShushuSkinItems.length ?? 0,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ShushuSkinItem(skinModel: filteredByShushuSkinItems[index],),
          );
        });
  }
}
