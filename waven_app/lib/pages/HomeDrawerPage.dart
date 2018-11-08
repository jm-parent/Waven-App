import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:waven_app/Demos/SlidableListDemoPage.dart';
import 'package:waven_app/pages/AboutPage.dart';
import 'package:waven_app/pages/AnimatedSpellMakerPage.dart';
import 'package:waven_app/pages/AnimatedTabBarPage.dart';
import 'package:waven_app/pages/ArmoryBuilder.dart';
import 'package:waven_app/pages/CustomShushuPage.dart';
import 'package:waven_app/pages/CustomSpellPreSetupPage.dart';
import 'package:waven_app/pages/DeckListPage.dart';
import 'package:waven_app/pages/DemoLoginPage.dart';
import 'package:waven_app/pages/HeroesListPage.dart';
import 'package:waven_app/pages/NewsPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waven_app/pages/PickClassPage.dart';
import 'package:waven_app/pages/TestPage.dart';
import 'package:waven_app/pages/TheGamePage.dart';
import 'package:waven_app/pages/CustomTeamPreBuilderPage.dart';
import 'package:waven_app/util/Constants.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/widgets/GradientAppBar.dart';
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
        return new NewsPage();
      case 1:
        return new HeroesListPage();
      case 2:
        return new ArmoryBuilderPage();
      case 3:
        return new AnimatedSpellMakerPage();
      case 4:
        return new CustomShushuPage();
      case 5:
        return new CustomTeamPreBuilderPage();
      case 6:
        return new DeckListPage();
      case 7 :
        return new AboutPage();
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
    var index = 0;
    return ResideCustomMenu.scafford(
        direction: ScrollDirection.LEFT,
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: Image.asset('images/fondwaven.png').image,
                fit: BoxFit.cover)),
        controller: _menuController,
        leftScaffold: new MenuScaffold(

//          header: new ConstrainedBox(
//            constraints: new BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
//            child: new CircleAvatar(
//              backgroundImage: new AssetImage('images/logowaven.png'),
//              radius: 40.0,
//            ),
//          ),

          children: <Widget>[
            buildResideItem("A la une", Icons.rss_feed,context,index),
            buildResideItem("Les Héros",Icons.wifi_tethering,context,++index),
            buildResideItem("Deck Builder", FontAwesomeIcons.calendar,context,++index),
            buildResideItem("Spell Maker", FontAwesomeIcons.bookOpen,context,++index),
            buildResideItem("Shushus Maker", FontAwesomeIcons.spaceShuttle,context,++index),
            buildResideItem("Team Builder", FontAwesomeIcons.wrench,context,++index),
            buildResideItem("Armory List", FontAwesomeIcons.oldRepublic,context,++index),
            buildResideItem("About", FontAwesomeIcons.infoCircle,context,++index),
          ],
        ),
        child: new Scaffold(
          body: _getDrawerItemWidget(_selectedDrawerIndex),

          appBar: GradientAppBar(
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context){
                  return ConstantsPopupMenu.choices.map((String choice){
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
            backgroundColorStart: Color.fromRGBO(20,61,88,1.0),
            backgroundColorEnd: Color.fromRGBO(20,61,88,1.0) ,
            elevation: 5.0,
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
  void choiceAction(String choice) {
    if (choice == ConstantsPopupMenu.About) {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return new AboutPage();
      }));
    }
  }

  Widget buildResideItem(var menuName, var icon, var context,var index) {
    return new InkWell(
      child: ResideMenuItem(
        title: menuName,
        icon: Icon(icon, color: Color(0xffdddddd)),
      ),
      onTap: () {
        setState(() => _selectedDrawerIndex = index);
        _menuController.closeMenu();
       // Navigator.of(context).pop();
      },
    );
  }

}

