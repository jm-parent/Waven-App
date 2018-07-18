import 'dart:async';
import 'package:flutter/material.dart';
import 'package:waven_app/models/DrawerItem.dart';
import 'package:waven_app/pages/NewsPage.dart';

//Définition de la page
class HomeDrawerPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("News", Icons.rss_feed),
    new DrawerItem("Les Héros", Icons.face),
    new DrawerItem("Les ", Icons.info),
    new DrawerItem("Press", Icons.developer_board),
    new DrawerItem("Contact", Icons.phone),
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
        return new NewsPage();
  /*    case 1:
        return new TeamsWidget();
      case 2:
        return new RecruitementWidget();
      case 3:
        return new PressWidget();
      case 4:
        return new ContactWidget();*/
      default:
        return new Text("Error");
    }
  }

//Permet l'affichage d'une popup de confirmation de quitter
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  //Fermeture du drawer => Changement de state index
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
          ),
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
        ));
  }
}
