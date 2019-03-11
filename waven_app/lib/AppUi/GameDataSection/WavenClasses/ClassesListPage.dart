import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenClasses/ClassesListFolderWidget.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiClasses.dart';

class ClassesListPage extends StatefulWidget {
  @override
  ClassesListPageState createState() {
    return new ClassesListPageState();
  }
}

class ClassesListPageState extends State<ClassesListPage> {
  List<ResponseWavenApiClass> wavenClasses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainDarkBlueL1(),
        appBar: WavenCompanionAppbar(),
        body: Container(
            //color: DarkColor(),
            child: _buildVerticalSpellList()));
  }

  _buildVerticalSpellList() {
    return FutureBuilder(
        future: WavenApiProvider.GetAllClass(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ResponseWavenApiClass>> snapshot) {
          if (snapshot.data == null) {
            return SnapshotLoadingIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ClassesListFolderWidget(data: snapshot.data[index]);
            },
          );
        });
  }
}
