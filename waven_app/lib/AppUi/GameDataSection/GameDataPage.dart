import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/Companions/CompanionListPage.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataCard.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataHelper.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenClasses/ClassesListPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenGallery/GalleryPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusListPage.dart';
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
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        GameDataCard(
          titleText: "Le Monde de Waven",
          isEnableBackground: true,
          urlImage:
              "https://img.gaming.gentside.com/article/waven/waven-ios-android-pc-mac-date-de-sortie-trailers-news-et-gameplay-du-nouveau-jeu-de-strategie_459b1b896aa15ffb15029dfd53d7fc696f0f9666.jpg",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Lore,
        ),
        GameDataCard(
          titleText: "Les Classes",
          isEnableBackground: true,
          urlImage:
              "https://s.ankama.com/www/static.ankama.com/upload/backoffice/direct/2017-12-26/042bf8d4283d7dcbcf208578bc957b96.jpg",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Gods,
        ),
        GameDataCard(
          titleText: "Les Shushus",
          isEnableBackground: true,
          urlImage:
              "https://waven-game.com/wp-content/uploads/2018/11/Select_Perso_01.png",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Shushus,
        ),
        GameDataCard(
          titleText: "Les Sorts",
          isEnableBackground: true,
          urlImage:
              "https://i1.wp.com/tot-prod.blog/wp-content/uploads/2018/09/planche_comparatifs.png",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Spells,
        ),
        GameDataCard(
          titleText: "Les Compagnons",
          isEnableBackground: true,
          urlImage:
              "https://waven-game.com/wp-content/uploads/2018/10/fond-compagnons.jpg",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Companions,
        ),
//          GameDataCard(
//            titleText: "Les Skins",
//            isEnableBackground: true,
//            urlImage:
//                "https://i1.wp.com/tot-prod.blog/wp-content/uploads/2017/10/Capture-d%E2%80%99e%CC%81cran-2017-10-25-a%CC%80-16.17.29.png?w=1551&ssl=1",
//            callbackOnTapNavigation:callbackNavigateTo,
//            menu: GameDataMenu.Skins,
//          ),
        GameDataCard(
          titleText: "Les Consommables",
          isEnableBackground: true,
          urlImage:
              "https://s.ankama.com/www/static.ankama.com/shops/img/highlights/1073/mea_fr_950_310.jpg",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Consommables,
        ),
        GameDataCard(
          titleText: "Les Modes de Jeu",
          isEnableBackground: true,
          urlImage:
              "https://waven-game.com/wp-content/uploads/2018/11/Select_Mode_01.png",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.GameModes,
        ),
        GameDataCard(
          titleText: "La Boutique",
          isEnableBackground: true,
          urlImage:
              "https://www.breakflip.com/uploads/Dofus/Aluqat/t-shirts.jpg",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Market,
        ),
        GameDataCard(
          titleText: "La Galerie",
          isEnableBackground: true,
          urlImage:
          "https://imgur.com/nFDYrBV.png",
          callbackOnTapNavigation:callbackNavigateTo,
          menu: GameDataMenu.Gallery,
        ),
        SizedBox(
          height: 70.0,
        )
      ],
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
            Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new ComingSoonPage()));//   Navigator.push(context,          new CupertinoPageRoute(builder: (context) => new SpellListTabbarPage()));
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
