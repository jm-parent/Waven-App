import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderListPage.dart';
import 'package:waven_app/AppUi/WavenToolsPage/Stats/MyStatsPage.dart';
import 'package:waven_app/AppUi/WavenToolsPage/Tracker/HistoTrackerPage.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WavenMiniToolCard.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WavenToolCard.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WavenToolsMenuModel.dart';
import 'package:waven_app/AppUi/WavenToolsPage/WeaponMaker/WeaponMakerPage.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';

class WavenToolsPage extends StatefulWidget {
  @override
  _WavenToolsPageState createState() => _WavenToolsPageState();
}

class _WavenToolsPageState extends State<WavenToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WavenCompanionAppbar(),
      backgroundColor: mainDarkBlueL1(),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
            child: Column(
              children: <Widget>[
                DashboardTitleCat(
                    titleCat: "Activités Récente",
                    pageToNavigate: null,
                    underlineColor: mainYellow(),
                    isMoreShowed: false),
                Expanded(
                  child:_buildHorizontalRecentList()
                ),
              ],
            ),
          ),

          Wrap(
            children: <Widget>[
              DashboardTitleCat(
                  titleCat: "Waven Tools",
                  pageToNavigate: null,
                  underlineColor: mainYellow(),
                  isMoreShowed: false),
              WavenToolCard(
                titleTextP1: "Waven",
                titleTextP2: "Tracker",
                urlImage: "images/DeckBuilder/deckbuilder.png",
                navigateTo:HistoTrackerPage(),
              ),
              WavenToolCard(
                titleTextP1: "Mes",
                titleTextP2: "Stats",
                urlImage: "images/DeckBuilder/deckbuilder.png",
                navigateTo:MyStatsPage(),
                isSwapped: true,
              ),
              WavenToolCard(
                titleTextP1: "Mes",
                titleTextP2: "Decks",
                urlImage: "images/DeckBuilder/deckbuilder.png",
                navigateTo:DeckBuilderListPage(),
              ),
              WavenToolCard(
                titleTextP1: "Deck",
                titleTextP2: "Builder",
                urlImage: "images/DeckBuilder/deckbuilder.png",
                navigateTo:DeckBuilderListPage(),
                isSwapped: true,
              ),
              WavenToolCard(
                titleTextP1: "La",
                titleTextP2: "Meta",
                urlImage: "images/DeckBuilder/deckbuilder.png",
                navigateTo:DeckBuilderListPage(),
              ),
              WavenToolCard(
                isSwapped: true,
                titleTextP1: "Weapon",
                titleTextP2: "Maker",
                urlImage: "images/DeckBuilder/deckbuilder.png",
                navigateTo:WeaponMakerPage(),
              ),
            ],
          ),
          SizedBox(
            height: 70.0,
          )
        ],
      ),
    );
  }

  _buildHorizontalRecentList() {
    return  ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        WavenMiniToolCard(model:new WavenToolsMenuModel("https://www.catanfusion.com/images/20461-200.png", "https://webgradients.com/public/webgradients_png/076%20Premium%20Dark.png", "Deck builder",DeckBuilderListPage()) ),
      ],
    );
  }
}
