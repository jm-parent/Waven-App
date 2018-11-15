import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/DashboardPages/DashboardBuilders.dart';
import 'package:waven_app/Demos/DemoBottomAppBar.dart';
import 'package:waven_app/NotchedBottomNavBar/AnchorOverlay.dart';
import 'package:waven_app/NotchedBottomNavBar/FabWithIcons.dart';
import 'package:waven_app/NotchedBottomNavBar/NotchedBottomNavBarItem.dart';
import 'package:waven_app/pages/AboutPage.dart';
import 'package:waven_app/pages/AnimatedSpellMakerPage.dart';
import 'package:waven_app/pages/HeroesListPage.dart';
import 'package:waven_app/pages/NewsPage.dart';
import 'package:waven_app/util/NavigationView.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/widgets/NavigationBottomAppBar.dart';

class AnimatedTabBarPage extends StatefulWidget {
  const AnimatedTabBarPage({Key key}) : super(key: key);

  @override
  _AnimatedTabBarPageState createState() => new _AnimatedTabBarPageState();
}

class _AnimatedTabBarPageState extends State<AnimatedTabBarPage>
    with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';
  Widget _selectedBody;
  Widget _OldselectedBody;
  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
      if(index == 0)
        _selectedBody = NewsPage(key: keyNews,);
      if(index == 1)
        _selectedBody = HeroesListPage(key: keyListHero,);
      if(index == 2)
        _selectedBody = Placeholder(color: Colors.lime,);
      if(index == 3)
        _selectedBody = AboutPage();
      //FABButton
      if(index == 10) {
        _selectedBody = DashboardBuilders();

      }
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  final Key keyNews = PageStorageKey('pageOne');
  final Key keyListHero = PageStorageKey('pageTwo');
  final Key keySpellMaker = PageStorageKey('pageOne');
  final Key keyAutre = PageStorageKey('pageTwo');

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _selectedTab(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _selectedBody,
      bottomNavigationBar: FABBottomAppBar(

        backgroundColor: Colors.grey[700],
        centerItemText: 'Dashboard',
        color: Colors.white54,
        selectedColor: WaventBlue(),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.fiber_new, text: 'News'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Database'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Armory'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan.withOpacity(0.5),
        onPressed: () => _selectedTab(10),
    tooltip: 'Increment',
    child: Image.asset("images/logowaven.png"),
    elevation: 2.0,
    ),
    );
  }
}
