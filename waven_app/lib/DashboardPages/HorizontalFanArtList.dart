import 'package:flutter/material.dart';
import 'package:waven_app/DashboardPages/BackFanArtListItem.dart';
import 'package:waven_app/DashboardPages/FrontFanArtListItem.dart';
import 'package:waven_app/util/MockDataHelper.dart';
import 'package:flip_card/flip_card.dart';


class HorizontalFanArtList extends StatelessWidget {
  //Get Data
  //
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 150.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: MockDataHelper.dashboardFanArtItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 140.0,maxHeight: 150.0),
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL, // default
                  front: FrontFanArtListItem(
                      MockDataHelper.dashboardFanArtItemList[index]),
                  back:BackFanArtListItem(
                      MockDataHelper.dashboardFanArtItemList[index]),
                )
            );
          },
        ));
  }
}
