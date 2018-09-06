import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:waven_app/models/DrawerItem.dart';
import 'package:waven_app/pages/AnimatedTabBarPage.dart';
import 'package:waven_app/pages/CustomShushuPage.dart';
import 'package:waven_app/pages/CustomSpellPage.dart';
import 'package:waven_app/pages/CustomSpellPreSetupPage.dart';
import 'package:waven_app/pages/DecksHomePage.dart';
import 'package:waven_app/pages/HeroesListPage.dart';

import 'package:waven_app/pages/NewsPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waven_app/pages/PickClassPage.dart';

import 'package:waven_app/pages/TheGamePage.dart';
import 'package:waven_app/pages/YoutubePage.dart';
import 'package:waven_app/widgets/ResideCustomMenu.dart';

//Définition de la page
class HomeDrawerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomeDrawerPageState();
  }
}

class HomeDrawerPageState extends State<HomeDrawerPage>
    with TickerProviderStateMixin {

  //Page par défaut = Première page
  int _selectedDrawerIndex = 0;

  //Permet la récupération de la page en fonction de la position
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return  new NewsPage();
      case 1:
        return new TheGamePage();
      case 2:
        return new HeroesListPage();
      case 3:
        return new YoutubePage();
      case 4:
        return new PickClassPage();
      case 5:
        return new CustomSpellPreSetupPage();
      case 6:
        return new CustomShushuPage();
      default:
        return new Text("Error");
    }
  }

  MenuController _menuController;

//Permet l'affichage d'une popup de confirmation de quitter
  Future<bool> _onWillPop() async {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    flutterWebviewPlugin.close();
    flutterWebviewPlugin.dispose();
    return false;
  }

  //Fermeture du drawer => Changement de state index
//  _onSelectItem(int index) {
//      setState(() => _selectedDrawerIndex = index);
//      Navigator.of(context).pop();
//    // close the drawer
//  }

  @override
  void initState() {
    super.initState();
    _menuController = new MenuController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        body: buildScaffoldBody(),
      ),
    );
  }


  Widget buildScaffoldBody() {
    return ResideCustomMenu.scafford(
        direction: ScrollDirection.LEFT,
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new CachedNetworkImageProvider(
                    'https://i1.wp.com/waven-game.com/wp-content/uploads/2018/06/Waven_Carte.png?resize=800%2C445&ssl=1'),
                fit: BoxFit.cover)),
        controller: _menuController,
        leftScaffold: new MenuScaffold(
          header: new ConstrainedBox(
            constraints: new BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
            child: new CircleAvatar(
              backgroundImage: new AssetImage('images/logo_waven.png'),
              radius: 40.0,
            ),
          ),
          children: <Widget>[
            buildResideItem("A la une", Icons.rss_feed,context,0),
            buildResideItem("Le Jeu", Icons.ac_unit,context,1),
            buildResideItem("Les Héros",Icons.wifi_tethering,context,2),
           // buildResideItem("Les Vidéos", FontAwesomeIcons.youtube,context,3),
            buildResideItem("Deck Builder", FontAwesomeIcons.calendar,context,4),
            buildResideItem("W***n S***l M***r", FontAwesomeIcons.bookOpen,context,5),
            buildResideItem("W***n S****u M***r", FontAwesomeIcons.spaceShuttle,context,6),
            buildResideItem("Test", FontAwesomeIcons.oldRepublic,context,7),
          ],
        ),
        child: new Scaffold(
          body: _getDrawerItemWidget(_selectedDrawerIndex),

          appBar: new AppBar(
            leading: new GestureDetector(
              child: const Icon(Icons.menu),
              onTap: () {
               _menuController.openMenu(true);
              },
            ),

            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: new Text('Waven Companion'),
          ),
        ),
      onClose: () {
//        print("closed");
      },
      onOpen: (left) {
      },
      onOffsetChange: (offset) {
      },
    );

  }

  Widget buildResideItem(var menuName, var icon, var context,var index) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        child: ResideMenuItem(
          title: menuName,
          icon: Icon(icon, color: Color(0xffdddddd)),
        ),
        onTap: () {
          setState(() => _selectedDrawerIndex = index);
          _menuController.closeMenu();
         // Navigator.of(context).pop();
        },
      ),
    );
  }

}
