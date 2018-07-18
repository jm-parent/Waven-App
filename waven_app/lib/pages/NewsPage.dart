import 'package:flutter/material.dart';

//définition de l'enum

enum TabsDemoStyle { iconsAndText, iconsOnly, textOnly }

//Une sous page
class _Page {
  const _Page({this.icon, this.text});

  final IconData icon;
  final String text;
}

//Liste des Tabs
const List<_Page> _allPages = const <_Page>[
  const _Page(icon: Icons.grade, text: 'TRIUMPH'),
  const _Page(icon: Icons.playlist_add, text: 'NOTE'),
  const _Page(icon: Icons.check_circle, text: 'SUCCESS'),
  const _Page(icon: Icons.question_answer, text: 'OVERSTATE'),
  const _Page(icon: Icons.sentiment_very_satisfied, text: 'SATISFACTION'),
  const _Page(icon: Icons.camera, text: 'APERTURE'),
  const _Page(icon: Icons.assignment_late, text: 'WE MUST'),
  const _Page(icon: Icons.assignment_turned_in, text: 'WE CAN'),
  const _Page(icon: Icons.group, text: 'ALL'),
  const _Page(icon: Icons.block, text: 'EXCEPT'),
  const _Page(icon: Icons.sentiment_very_dissatisfied, text: 'CRYING'),
  const _Page(icon: Icons.error, text: 'MISTAKE'),
  const _Page(icon: Icons.loop, text: 'TRYING'),
  const _Page(icon: Icons.cake, text: 'CAKE'),
];

class NewsPage extends StatefulWidget {
  static const String routeName = '/material/scrollable-tabs';

  @override
  NewsPageState createState() => new NewsPageState();
}

class NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.iconsOnly;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeDemoStyle(TabsDemoStyle style) {
    setState(() {
      _demoStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).accentColor;
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[],
          title:  new TabBar(
            controller: _controller,
            isScrollable: true,
            indicatorColor: Colors.blue,
            labelColor: Colors.red,
            tabs: _allPages.map((_Page page) {
              switch (_demoStyle) {
                case TabsDemoStyle.iconsAndText:
                  return new Tab(text: page.text, icon: new Icon(page.icon));
                case TabsDemoStyle.iconsOnly:
                  return new Tab(icon: new Icon(page.icon));
                case TabsDemoStyle.textOnly:
                  return new Tab(text: page.text);
              }
            }).toList(),
          ),
        ),
        body: new TabBarView(
            controller: _controller,
            children: _allPages.map((_Page page) {
              return new SafeArea(
                top: false,
                bottom: false,
                child: new Container(
                  key: new ObjectKey(page.icon),
                  padding: const EdgeInsets.all(12.0),
                  child: new Card(
                    child: new Center(
                      child: new Icon(
                        page.icon,
                        color: iconColor,
                        size: 128.0,
                      ),
                    ),
                  ),
                ),
              );
            }).toList()),
      ),

    );
}
}
