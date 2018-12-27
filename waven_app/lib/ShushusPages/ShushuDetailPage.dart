import 'package:flutter/material.dart';
import 'package:waven_app/ShushusPages/ShushuStatContainer.dart';

class ShushuDetailPage extends StatefulWidget {

  final int idWeapon;

  const ShushuDetailPage({Key key, this.idWeapon}) : super(key: key);

  @override
  _ShushuDetailPageState createState() => _ShushuDetailPageState();
}

class _ShushuDetailPageState extends State<ShushuDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("mocked"),
        bottom:   TabBar(
          isScrollable: true,
          tabs: <Widget>[
            Tab(text: "Stats"),
            Tab(text: "Decks"),
            Tab(text: "Histoire"),
            Tab(text: "Skins"),
          ],
          controller: _tabController,
        ),
      ),
        body: Stack(
          children: <Widget>[
            new Positioned.fill(
              child:
              new Image.asset(
                "images/weaponsImages/Full_Vertical_${widget.idWeapon}.jpg",
                fit: BoxFit.cover,
              ),
            ),
            new Positioned.fill(
              child:
             Container(
               color: Colors.black54,
             )
            ),

            TabBarView(
              children: <Widget>[
                ShushuStatContainer(IdWeapon: widget.idWeapon),
                //DeckListPage(),
                Center(
                  child: new Text("Page 3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      )),
                ),
                Center(
                  child: new Text("Page 4",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      )),
                ),
              ],
              controller: _tabController,
            ),
          ],
        ),
    );
  }
}
