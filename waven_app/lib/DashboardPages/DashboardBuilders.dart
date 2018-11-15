import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:waven_app/Builders/BuilderDetailPage.dart';
import 'package:waven_app/DashboardPages/DashboardItem.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';
import 'package:waven_app/DashboardPages/HorizontalFanArtList.dart';
import 'package:waven_app/DashboardPages/PageTampon.dart';
import 'package:waven_app/pages/AnimatedSpellMakerPage.dart';
import 'package:waven_app/util/MockDataHelper.dart';

class DashboardBuilders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Placeholder(
            fallbackHeight: 80.0,
          ),
          DashboardTitleCat("Actualités"),
          buildMockedHoritzontalList(),
          DashboardTitleCat("Les Shushu"),
          buildMockedHoritzontalList(),
          DashboardTitleCat("Les Decks du moment"),
          buildMockedHoritzontalList(),
          DashboardTitleCat("Les vidéos du moment"),
          buildMockedHoritzontalList(),
          DashboardTitleCat("La communauté"),
          HorizontalFanArtList(),
          SizedBox(
            height: 30.0,
          )
        ],
      ),
    ));
  }

  buildMockedHoritzontalList() {
    return new Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.red,
            ),
            Container(
              width: 160.0,
              color: Colors.orange,
            ),
            Container(
              width: 160.0,
              color: Colors.pink,
            ),
            Container(
              width: 160.0,
              color: Colors.yellow,
            ),
          ],
        ));
  }

//  buildCoreDashboard(BuildContext context) {
//    final Orientation orientation = MediaQuery
//        .of(context)
//        .orientation;
//    return GridView.builder(
//        itemCount: MockDataHelper.dashboardBuildersItemList.length,
//        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4),
//        itemBuilder: (context, index) {
//            return Card(
//                shape: const RoundedRectangleBorder(
//                borderRadius: BorderRadius.all(Radius.circular(10.0))),
//              child: DashboardItem(
//                dashboardItemModel: MockDataHelper.dashboardBuildersItemList[index],
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => BuilderDetailPage(MockDataHelper.dashboardBuildersItemList[index]),
//                    ),
//                  );
//                },
//              ),
//            );
//        });
//  }
}
