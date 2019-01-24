import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/NewsSection/NewsAnimatedContainer.dart';
import 'package:waven_app/AppUi/AboutSection/AboutPage.dart';
import 'package:waven_app/AppUi/BottomNavNotchedBar/NotchedBottomNavBar.dart';
import 'package:waven_app/DashboardPages/DashboardBuilders.dart';
import 'package:waven_app/pages/ComingSoonPage.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/AppUi/GameDataSection/GameDataPage.dart';

class AnimatedTabBarPage extends StatefulWidget {
  const AnimatedTabBarPage({Key key}) : super(key: key);

  @override
  _AnimatedTabBarPageState createState() => new _AnimatedTabBarPageState();
}

class _AnimatedTabBarPageState extends State<AnimatedTabBarPage>
    with TickerProviderStateMixin {

  Widget _selectedBody;

  void _selectedTab(int index) {
    setState(() {
      if(index == NavigationIndexName.news.index)
        _selectedBody = NewsAnimatedContainer();
      if(index == NavigationIndexName.database.index)
        _selectedBody = GameDataPage();
      if(index == NavigationIndexName.armory.index)
        _selectedBody = ComingSoonPage();
      if(index == NavigationIndexName.settings.index)
        _selectedBody = AboutPage();
      if(index == NavigationIndexName.community.index)
        _selectedBody = ComingSoonPage();
      if(index == NavigationIndexName.tools.index)
        _selectedBody = ComingSoonPage();
      if(index == NavigationIndexName.dashboard.index) {
        _selectedBody = Container();//DashboardBuilders(callbackNavigateTo);
      }
    });
  }

  @override
  void initState() {
    _selectedTab(NavigationIndexName.news.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _selectedBody,
      bottomNavigationBar: NotchedBottomNavBar(
        backgroundColor: Colors.grey[700],
        centerItemText: 'Dashboard',
        color: Colors.white54,
        selectedColor: WaventBlue(),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          NotchedBottomNavBarItem(iconData: Icons.fiber_new, text: 'News'),
          NotchedBottomNavBarItem(iconData: Icons.layers, text: 'Database'),
          NotchedBottomNavBarItem(iconData: Icons.dashboard, text: 'Armory'),
          NotchedBottomNavBarItem(iconData: Icons.settings, text: 'Settings'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan.withOpacity(0.5),
        onPressed: () => _selectedTab(NavigationIndexName.dashboard.index),
        tooltip: 'Increment',
        child: Image.asset("images/logowaven.png"),
        elevation: 2.0,
      ),
    );
  }

  callbackNavigateTo(enumPage) {
    setState(() {
      _selectedTab(enumPage);
    });
  }
}
