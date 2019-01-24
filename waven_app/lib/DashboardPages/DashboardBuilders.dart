//import 'package:flutter/material.dart';
//import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';
//import 'package:waven_app/DashboardPages/HorizontalFanArtList.dart';
//import 'package:waven_app/GenWidgets/WavenPageWithBackground.dart';
//import 'package:waven_app/util/EnumHelper.dart';
//
//class DashboardBuilders extends StatelessWidget {
//  Function(int) callbackNavigateTo;
//
//  DashboardBuilders(this.callbackNavigateTo);
//
//  @override
//  Widget build(BuildContext context) {
//    return new Center(
//        child: new WavenPageWithBackground(
//      child: ListView(
//        scrollDirection: Axis.vertical,
//        children: <Widget>[
//          Placeholder(
//            fallbackHeight: 80.0,
//          ),
//          DashboardTitleCat(titleCat:"Les News" ,callbackNavigateTo: callbackNavigateToPage,indexToNavigate:NavigationIndexName.news.index ,isMoreShowed: true,),
//          buildMockedHoritzontalList(),
//          DashboardTitleCat(titleCat:"Les Decks du moment",callbackNavigateTo:callbackNavigateToPage,indexToNavigate:NavigationIndexName.armory.index,isMoreShowed: true),
//          buildMockedHoritzontalList(),
//          DashboardTitleCat(titleCat:"Les vidéos du moment",callbackNavigateTo:callbackNavigateToPage,indexToNavigate:NavigationIndexName.community.index,isMoreShowed: true),
//          buildMockedHoritzontalList(),
//          DashboardTitleCat(titleCat:"La communauté",callbackNavigateTo:callbackNavigateToPage,indexToNavigate:NavigationIndexName.community.index,isMoreShowed: true),
//          HorizontalFanArtList(),
//          DashboardTitleCat(titleCat:"Les Outils",callbackNavigateTo:callbackNavigateToPage,indexToNavigate:NavigationIndexName.tools.index,isMoreShowed: true),
//          buildMockedHoritzontalList(),
//          SizedBox(
//            height: 30.0,
//          )
//        ],
//      ),
//    ));
//  }
//
//  callbackNavigateToPage(int enumpage) {
//    callbackNavigateTo(enumpage);
//  }
//
//  buildMockedHoritzontalList() {
//    return new Container(
//        margin: EdgeInsets.symmetric(vertical: 20.0),
//        height: 100.0,
//        child: new ListView(
//          scrollDirection: Axis.horizontal,
//          children: <Widget>[
//            Container(
//              width: 160.0,
//              color: Colors.red,
//            ),
//            Container(
//              width: 160.0,
//              color: Colors.orange,
//            ),
//            Container(
//              width: 160.0,
//              color: Colors.pink,
//            ),
//            Container(
//              width: 160.0,
//              color: Colors.yellow,
//            ),
//          ],
//        ));
//  }
//
//}
