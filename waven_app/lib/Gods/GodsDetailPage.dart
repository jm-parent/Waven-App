import 'package:flutter/material.dart';
import 'package:waven_app/GenWidgets/WavenPageWithBackground.dart';
import 'package:waven_app/models/GodModel.dart';

class GodsDetailPage extends StatelessWidget {

  final GodOfflineModel GodModelParam;

  const GodsDetailPage({Key key,@required this.GodModelParam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WavenPageWithBackground(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(GodModelParam.godName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Hero(
                      tag: 'GodDetailHeroTagBg${GodModelParam.godName}',
                      child: Image.asset(
                        GodModelParam.imgBackgroundUrl,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ];
          },
          body: Center(
            child: Text("Sample Text"),
          ),
        ),
      ),
    );
  }
}
