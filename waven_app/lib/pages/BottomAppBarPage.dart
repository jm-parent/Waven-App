import 'package:flutter/material.dart';
import 'package:waven_app/pages/AnimatedSpellMakerPage.dart';
import 'package:waven_app/pages/HeroesListPage.dart';
import 'package:waven_app/pages/NewsPage.dart';
import 'package:waven_app/util/NavigationView.dart';
import 'package:waven_app/widgets/WavenClassCarroussel.dart';

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: iconTheme.size - 8.0,
      height: iconTheme.size - 8.0,
      color: iconTheme.color,
    );
  }
}

class CustomInactiveIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return Container(
        margin: const EdgeInsets.all(4.0),
        width: iconTheme.size - 8.0,
        height: iconTheme.size - 8.0,
        decoration: BoxDecoration(
          border: Border.all(color: iconTheme.color, width: 2.0),
        )
    );
  }
}

class BottomNavigationDemo extends StatefulWidget {
  static const String routeName = '/material/bottom_navigation';

  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<NavigationView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationView>[
      NavigationView(
        page: NewsPage(),
        icon: Image.asset("images/menu_icons/News.png",width: 32.0,),
        title: 'News',
        color: Colors.deepPurple,
        vsync: this,
      ),
      NavigationView(
        page: HeroesListPage(),
        icon: Image.asset("images/menu_icons/Heros.png",width: 32.0,),
        title: 'Compagnons',
        color: Colors.deepOrange,
        vsync: this,
      ),
      NavigationView(
        page: AnimatedSpellMakerPage(),
        icon: Image.asset("images/menu_icons/Spellmaker1.png",width: 32.0,),
        title: 'Arsenal',
        color: Colors.teal,
        vsync: this,
      ),
      NavigationView(
        page: Container(),
        icon: Image.asset("images/menu_icons/Reserve_Iop_Mini.png",width: 32.0,),
        title: 'Spell Maker',
        color: Colors.indigo,
        vsync: this,
      ),
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

    return Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>((NavigationView navigationView) => navigationView.item)
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom navigation'),
        actions: <Widget>[
          PopupMenuButton<BottomNavigationBarType>(
            onSelected: (BottomNavigationBarType value) {
              setState(() {
                _type = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<BottomNavigationBarType>>[
              const PopupMenuItem<BottomNavigationBarType>(
                value: BottomNavigationBarType.fixed,
                child: Text('Fixed'),
              ),
              const PopupMenuItem<BottomNavigationBarType>(
                value: BottomNavigationBarType.shifting,
                child: Text('Shifting'),
              )
            ],
          )
        ],
      ),
      body: Center(
          child: _buildTransitionsStack()
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}