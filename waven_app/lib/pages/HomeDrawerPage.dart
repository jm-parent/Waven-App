import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:waven_app/models/DrawerItem.dart';
import 'package:waven_app/pages/DeckBuilderPage.dart';
import 'package:waven_app/pages/HeroesListPage.dart';

import 'package:waven_app/pages/NewsPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:waven_app/pages/TheGamePage.dart';
import 'package:waven_app/pages/YoutubePage.dart';

//Définition de la page
class HomeDrawerPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("A la une", new Icon(Icons.rss_feed)),
    new DrawerItem("Le Jeu", new Icon(Icons.ac_unit)),
    new DrawerItem("Les Héros", new Icon(Icons.wifi_tethering)),
    new DrawerItem("Les Vidéos", new Icon(FontAwesomeIcons.youtube)),
    new DrawerItem("Deck Builder", new Icon(FontAwesomeIcons.calendar)),
    new DrawerItem("Test", new Icon(FontAwesomeIcons.oldRepublic)),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomeDrawerPageState();
  }
}

class HomeDrawerPageState extends State<HomeDrawerPage> {
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
        return new DeckBuilderPage();
      case 5:
        return new Text("Error");
      default:
        return new Text("Error");
    }
  }

  //Permet la récupération de la page en fonction de la position
  _getAppBarIfNeeded(int pos) {
    switch (pos) {
      case 0:
        return new AppBar(
          title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        );
      case 1:
        return new AppBar(
          title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        );
      case 2:
        return new AppBar(
          title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        );
        case 3:
      return new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      );
      case 4:
        return new AppBar(
          title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        );
      default:
      return new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ); }
  }


//Permet l'affichage d'une popup de confirmation de quitter
  Future<bool> _onWillPop() async{
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    flutterWebviewPlugin.close();
    flutterWebviewPlugin.dispose();
    return false;
  }

  //Fermeture du drawer => Changement de state index
  _onSelectItem(int index) {

      setState(() => _selectedDrawerIndex = index);
      Navigator.of(context).pop();
    // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: d.icon,
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    Color gradientStart = Color(0xFF0277bd); //Change start gradient color here
    Color gradientEnd = Color(0xFF4fc3f7); //Change end gradient color here
    
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          appBar: _getAppBarIfNeeded(_selectedDrawerIndex),
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: const Text('MyAccountName'),
                  accountEmail: const Text('mymail@example.com'),
                ),
                new Column(children: drawerOptions)
              ],
            ),
          ),
          body: _getDrawerItemWidget(_selectedDrawerIndex),
            /*new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("images/fondwaven.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null *//* add child content content here *//*,
              ),*/


          ),

        );
  }
}