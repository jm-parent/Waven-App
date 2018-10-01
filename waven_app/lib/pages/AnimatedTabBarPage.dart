import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/pages/AnimatedSpellMakerPage.dart';
import 'package:waven_app/pages/HeroesListPage.dart';
import 'package:waven_app/pages/NewsPage.dart';
import 'package:waven_app/util/NavigationIconView.dart';

class AnimatedTabBarPage extends StatefulWidget {
  const AnimatedTabBarPage({Key key}) : super(key: key);



  @override
  _AnimatedTabBarPageState createState() => new _AnimatedTabBarPageState();
}

class _AnimatedTabBarPageState extends State<AnimatedTabBarPage>  with TickerProviderStateMixin {

  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<NavigationView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationView>[
      new NavigationView(
        page: NewsPage(),
        icon: Image.asset("images/menu_icons/News.png",width: 32.0,),

        title: 'News',
        color: Colors.blueGrey[700],
        vsync: this,
      ),

      new NavigationView(
        page: HeroesListPage(),
        icon: Image.asset("images/menu_icons/Heros.png",width: 32.0,),
        title: 'Compagnons',
        color: Colors.blueGrey[700],
        vsync: this,
      ),
      new NavigationView(
        page: AnimatedSpellMakerPage(),
        icon: Image.asset("images/menu_icons/Spellmaker1.png",width: 32.0,),
        title: 'Arsenal',
        color: Colors.blueGrey[700],
        vsync: this,
      ),
      new NavigationView(
        page: Image.asset("images/menu_icons/Test.png",width: 32.0,),
        icon: Image.asset("images/menu_icons/Test.png",width: 32.0,),
        title: '???',
        color: Colors.blueGrey[700],
        vsync: this,
      )
    ];

    for (NavigationView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }
  @override
  void dispose() {
    for (NavigationView view in _navigationViews)
      view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }


  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationView view in _navigationViews)
      transitions.add(view.transition(_type, context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return new Stack(children: transitions);
  }


  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return
      new Scaffold(
        body: new Center(
            child: _buildTransitionsStack()
        ),
        bottomNavigationBar: botNavBar,
      );
  }


}
