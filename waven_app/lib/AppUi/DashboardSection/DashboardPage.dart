import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/AppUi/CommonWidget/Buttons/SimpleRoundButton.dart';
import 'package:waven_app/AppUi/DashboardSection/HorizontalLastNewsList.dart';
import 'package:waven_app/AppUi/DeckBuilderPages/DeckBuilderSkillBarPage.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderListPage.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';
import 'package:waven_app/util/EnumHelper.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var headerHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
              height: headerHeight,
              child: Image.asset(
                'images/header.jpg',
                fit: BoxFit.cover,
              )),
          _BuildRowHeaderButton(),
          DashboardTitleCat(
              titleCat: "Les Dernières News",
              pageToNavigate: null,
              isMoreShowed: false),
          SizedBox(
              height:120,child: HorizontalLastNewsList()),
          DashboardTitleCat(
              titleCat: "Les Decks du moment",
              pageToNavigate: new DeckBuilderListPage(),
              isMoreShowed: true),
        ],
      ),
    );
  }

  _BuildRowHeaderButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: new GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: DeckBuilderSkillBarPage())),
                child: ClipRRect(
                    borderRadius: new BorderRadius.circular(8.0),
                    child: new Container(
                      decoration: GetFirstBackgroundGradient(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Center(
                          child: new Text('Deck Builder'),
                        ),
                      ),
                    ))),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Container(
                decoration: GetSecondBackgroundGradient(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Les Sorts')),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Container(
                decoration: GetThirdBackgroundGradient(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Les Shushus')),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GetFirstBackgroundGradient() {
    return new BoxDecoration(
        gradient: new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0],
      colors: [
        Color(0xFF610305),
        Color(0xFF230648),
      ],
    ));
  }

  GetSecondBackgroundGradient() {
    return new BoxDecoration(
        gradient: new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0],
      colors: [
        Color(0xFF230648),
        Color(0xFF1F185A),
      ],
    ));
  }

  GetThirdBackgroundGradient() {
    return new BoxDecoration(
        gradient: new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0],
      colors: [
        Color(0xFF1F185A),
        Color(0xFF025173),
      ],
    ));
  }
}
