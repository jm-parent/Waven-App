import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyScrollTabListApp());
}

class MyScrollTabListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "aa", home: MyScrollTabListHomePage());
  }
}

class MyScrollTabListHomePage extends StatefulWidget {
  @override
  MyScrollTabListHomePageState createState() {
    return new MyScrollTabListHomePageState();
  }
}

class MyScrollTabListHomePageState extends State<MyScrollTabListHomePage>
    with SingleTickerProviderStateMixin {
  final int _listItemCount = 300;
  final int _tabCount = 8;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabCount, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
        expandedHeight: 240.0,
        title: Text("Title"),
        pinned: true,
        bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: List<Tab>.generate(_tabCount, (int i) {
          return Tab(text: "TAB$i");
        }),
      ),
    ),
    TabBarView(
    controller: _tabController,
    children: List<Widget>.generate(_tabCount, (int i) {
    return Text('line $i');
    }),
    ),
    ],
    ),
    );
  }
}