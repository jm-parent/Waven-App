import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushuSkins/ShushuSkinsPage.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';

class ShushusDetailPage extends StatefulWidget {

  final ShushuOfflineModel shushuModel;

  const ShushusDetailPage({Key key, this.shushuModel}) : super(key: key);

  @override
  _ShushusDetailPageState createState() => _ShushusDetailPageState();
}

class _ShushusDetailPageState extends State<ShushusDetailPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    // "Unmount" the controllers:
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(widget.shushuModel.heroName),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    imageOverlayGradient,
                    Positioned.fill(child: Hero(
                        tag: 'ShushusDetailHero_${widget.shushuModel.heroid}',
                        child: Image.asset("images/ShushusImages/GodWavenBg_${widget.shushuModel.heroid}.jpg",fit:BoxFit.cover,)),),

                  ],
                ),
              ),
              expandedHeight: 200.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
              bottom: TabBar(
                indicatorColor: widget.shushuModel.color,
                tabs: <Widget>[
                  Tab(text: "Présentation"),
                  Tab(text: "Skins"),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            Container(
              color: widget.shushuModel.color.withAlpha(50),

              child: Center(child: Text("Tab1"),),),
            Container(
              color: widget.shushuModel.color.withAlpha(50),
              child: ShushuSkinsPage(shushuModel: widget.shushuModel)),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
