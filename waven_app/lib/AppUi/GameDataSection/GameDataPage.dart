import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:waven_app/AppUi/GameDataSection/Companions/CompanionListPage.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataCard.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataCardV2.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataHelper.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenClasses/ClassesListPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenGallery/GalleryPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusListPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenSpells/SpellsListPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenWorld/WavenWorldPage.dart';
import 'package:waven_app/AppUi/SpellList/SpellListTabbarPage.dart';
import 'package:waven_app/pages/ComingSoonPage.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class GameDataPage extends StatefulWidget {
  @override
  _GameDataPageState createState() => _GameDataPageState();
}

class _GameDataPageState extends State<GameDataPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainDarkBlueL1(),
      appBar: WavenCompanionAppbar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GameDataCardV2(
            titleTextP1: "Les",
            titleTextP2: "Classes",
            urlImage: "images/classes.png",
            callbackOnTapNavigation:callbackNavigateTo,
            menu: GameDataMenu.Gods,
          ),
          GameDataCardV2(
            titleTextP1: "Les",
            titleTextP2: "Armes",
            isSwapped: true,
            urlImage: "images/Sélection_Perso_Xélor.png",
            callbackOnTapNavigation:callbackNavigateTo,
            menu: GameDataMenu.Shushus,
          ),
          GameDataCardV2(
            titleTextP1: "Les",
            titleTextP2: "Sorts",
            urlImage: "images/spells.png",
            callbackOnTapNavigation:callbackNavigateTo,
            menu: GameDataMenu.Spells,
          ),
          GameDataCardV2(
            titleTextP1: "Les",
            titleTextP2: "Compagnons",
            isSwapped: true,
            urlImage: "images/fond-compagnons.jpg",
            callbackOnTapNavigation:callbackNavigateTo,
            menu: GameDataMenu.Companions,
          ),
          GameDataCardV2(
            titleTextP1: "Les modes",
            titleTextP2: "de Jeu",
            urlImage: "images/HavreIle_02.png",
            callbackOnTapNavigation:callbackNavigateTo,
            menu: GameDataMenu.GameModes,
          ),
   SizedBox(
            height: 70.0,
          )
        ],
      ),
    );
  }

  callbackNavigateTo(enumPage) {
    if (enumPage == GameDataMenu.Lore.index)
      Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage()));
      if (enumPage == GameDataMenu.Gods.index)
          Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ClassesListPage()));
        if (enumPage == GameDataMenu.Shushus.index)
            Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ShushusListPage()));
          if (enumPage == GameDataMenu.Spells.index)
              Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new SpellsListPage()));
            if (enumPage == GameDataMenu.Companions.index)
              Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage()));//  Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new CompanionListPage()));
              if (enumPage == GameDataMenu.Skins.index)
    Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage()));// Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new SkinsListPage()));
                if (enumPage == GameDataMenu.Consommables.index)
    Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage())); //  Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage()));
    if (enumPage == GameDataMenu.GameModes.index)
    Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage()));//   Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new GameModesListPage()));
      if (enumPage == GameDataMenu.Market.index)
        Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage())); //  Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new MarketListPage()));
    if (enumPage == GameDataMenu.Gallery.index)
      Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new GalleryPage()));

  }
}
