import 'package:flutter/material.dart';
import 'package:waven_app/DashboardPages/DashboardItemModel.dart';

class BuilderDetailPage extends StatefulWidget {
  BuilderDetailPage(this.dashboardItemModel);

  final DashboardItemModel dashboardItemModel;

  @override
  _BuilderDetailPageState createState() => _BuilderDetailPageState();
}

class _BuilderDetailPageState extends State<BuilderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(child:Center(child: Text(widget.dashboardItemModel.name),)));
  }
}
