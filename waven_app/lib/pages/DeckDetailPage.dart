import 'package:flutter/material.dart';
import 'package:waven_app/models/DeckModel.dart';

class DeckDetailPage extends StatefulWidget {
  final DeckModel _deck;

  DeckDetailPage(this._deck);

  @override
  DeckDetailPageState createState() {
    return new DeckDetailPageState();
  }
}

class DeckDetailPageState extends State<DeckDetailPage>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  ScrollController _scrollViewController;
  var nbTabs = 4;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: nbTabs, vsync: this);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          new SliverAppBar(
            expandedHeight: 200.0,
            title: Text(widget._deck.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
            floating: true,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Hero(
                    tag: widget._deck.tagHero,
                    child: new Image.asset(
                      widget._deck.assetUrlBackgroundDetail,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: "Overview"),
                Tab(
                  text: "Spells",
                ),
                Tab(
                  text: "Fellows",
                ),
                Tab(
                  text: "Notes",
                ),
              ],
              controller: _tabController,
            ),
          ),
        ];
      },
      body: Material(
        child: TabBarView(
          children: <Widget>[
        Center(
        child: new Text("Overview",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            )),
      ),
        Center(
          child: new Text("Spells",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              )),
        ),
            Center(
              child: new Text("Fellows",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
            ),
            Center(
              child: new Text("Notes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

