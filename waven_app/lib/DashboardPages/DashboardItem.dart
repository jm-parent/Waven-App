import 'package:flutter/material.dart';
import 'package:waven_app/DashboardPages/DashboardItemImage.dart';
import 'package:waven_app/DashboardPages/DashboardItemModel.dart';


class DashboardItem extends StatelessWidget {
  DashboardItem({
    this.dashboardItemModel,
    this.onTap,
    this.onFavoriteToggle,
    this.isFavorite = false,
  });

  final DashboardItemModel dashboardItemModel;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          new Positioned.fill(
            child:
            Hero(
              tag: 'dashboardItemImage-${dashboardItemModel.name}',
              child: DashboardItemImage(photo: dashboardItemModel.imageAssetUrl),
            ),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            bottom: 0.0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10.0),
              height: 35.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                border: Border(
                  top: BorderSide(
                    color: Colors.black.withOpacity(0.35),
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                dashboardItemModel.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}