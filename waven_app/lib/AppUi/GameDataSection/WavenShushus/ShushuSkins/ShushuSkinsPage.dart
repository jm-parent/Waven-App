import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushuSkins/ShushuSkinCard.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';

class ShushuSkinsPage extends StatelessWidget {

  final ShushuOfflineModel shushuModel;

  const ShushuSkinsPage({Key key, this.shushuModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.9,
      crossAxisCount: 2,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      children: <Widget>[
        ShushuSkinCard(
          img: "images/ShushusImages/GodWavenBg_${shushuModel.heroid}.jpg",
          name: "Skin de ouf",
          price: 19.9,
        ),ShushuSkinCard(
          img: "images/ShushusImages/GodWavenBg_${shushuModel.heroid}.jpg",
          name: "Skin de ouf",
          price: 19.9,
        ),
        ShushuSkinCard(
          img: "images/ShushusImages/GodWavenBg_${shushuModel.heroid}.jpg",
          name: "Skin de ouf",
          price: 19.9,
        ),
        ShushuSkinCard(
          img: "images/ShushusImages/GodWavenBg_${shushuModel.heroid}.jpg",
          name: "Skin de ouf",
          price: 19.9,
        ),
        ShushuSkinCard(
          img: "images/ShushusImages/GodWavenBg_${shushuModel.heroid}.jpg",
          name: "Skin de ouf",
          price: 19.9,
        ),ShushuSkinCard(
          img: "images/ShushusImages/GodWavenBg_${shushuModel.heroid}.jpg",
          name: "Skin de ouf",
          price: 19.9,
        ),
        ShushuSkinCard(
          img: "images/ShushusImages/GodWavenBg_${shushuModel.heroid}.jpg",
          name: "Skin de ouf",
          price: 19.9,
        ),
      ],
    );
  }
}
