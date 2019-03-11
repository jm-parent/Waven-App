import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/FluidNavBar/FluidTabItem.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class FluidNavBar extends StatefulWidget {

  Function(int) callbackSelectedIndex;

  FluidNavBar(this.callbackSelectedIndex);

  @override
  _FluidNavBarState createState() => _FluidNavBarState();
}

class _FluidNavBarState extends State<FluidNavBar>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Tween<double> _positionTween;
  Animation<double> _positionAnimation;

  AnimationController _fadeOutController;
  Animation<double> _fadeFabOutAnimation;
  Animation<double> _fadeFabInAnimation;

  double fabIconAlpha = 1;
  IconData nextIcon =  FontAwesomeIcons.home;
  IconData activeIcon =  FontAwesomeIcons.home;

  int currentSelected = 2;


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: ANIM_DURATION));
    _fadeOutController = AnimationController(
        vsync: this, duration: Duration(milliseconds: (ANIM_DURATION ~/ 5)));

    _positionTween = Tween<double>(begin: 0, end: 0);
    _positionAnimation = _positionTween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            activeIcon = nextIcon;
          });
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.8, 1, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
    _initAnimationAndStart(0,0);
  }

  @override
  Widget build(BuildContext context) {

    var ignorePosition = 90.0;

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 50,
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(color: barColor, boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)
          ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FluidTabItem(
                  selected: currentSelected == 0,
                  iconData: FontAwesomeIcons.newspaper,
                  title: "News",
                  callbackFunction: () {
                    setState(() {
                      nextIcon =FontAwesomeIcons.newspaper;
                      currentSelected = 0;
                      widget.callbackSelectedIndex(currentSelected);
                    });
                    _initAnimationAndStart(_positionAnimation.value, -1);
                  }),

              FluidTabItem(
                  selected: currentSelected == 1,
                  iconData: Icons.videogame_asset,
                  title: "Game Data",
                  callbackFunction: () {
                    setState(() {
                      nextIcon = Icons.videogame_asset;
                      currentSelected = 1;
                      widget.callbackSelectedIndex(currentSelected);
                    });
                    _initAnimationAndStart(_positionAnimation.value, -0.5);
                  }),
              FluidTabItem(
                  selected: currentSelected == 2,
                  iconData: FontAwesomeIcons.home,
                  title: "Home",
                  callbackFunction: () {
                    setState(() {
                      nextIcon = FontAwesomeIcons.home;
                      currentSelected = 2;
                      widget.callbackSelectedIndex(currentSelected);
                    });
                    debugPrint('_positionAnimation.value :'+_positionAnimation.value.toString());
                    _initAnimationAndStart(_positionAnimation.value, 0);
                  }),
              FluidTabItem(
                  selected: currentSelected == 3,
                  iconData: FontAwesomeIcons.toolbox,
                  title: "Tools",
                  callbackFunction: () {
                    setState(() {
                      nextIcon = FontAwesomeIcons.toolbox;
                      currentSelected = 3;
                      widget.callbackSelectedIndex(currentSelected);
                    });
                    _initAnimationAndStart(_positionAnimation.value, 0.5);
                  }),
              FluidTabItem(
                  selected: currentSelected == 4,
                  iconData: FontAwesomeIcons.cogs,
                  title: "Settings",
                  callbackFunction: () {
                    setState(() {
                      nextIcon = FontAwesomeIcons.cogs;
                      currentSelected = 4;
                      widget.callbackSelectedIndex(currentSelected);
                    });
                    debugPrint('_positionAnimation.value :'+_positionAnimation.value.toString());
                    _initAnimationAndStart(_positionAnimation.value, 1);
                  }),
            ],
          ),
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Align(
              heightFactor: 1,
              alignment: Alignment(_positionAnimation.value, 0),
              child: FractionallySizedBox(
                widthFactor: 1 / 5,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: ignorePosition,
                      width: ignorePosition,
                      child: ClipRect(
                          clipper: HalfClipper(),
                          child: Container(
                            child: Center(
                              child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)])
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                        height: 60,
                        width: ignorePosition,
                        child: CustomPaint(
                          painter: HalfPainter(),
                        )),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ICONCOLOR,
                            border: Border.all(
                                color: barColor,
                                width: 3,
                                style: BorderStyle.none)),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Opacity(
                            opacity: fabIconAlpha,
                            child: Icon(
                              activeIcon,
                              color: barColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height / 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

var barColor = mainDarkBlue();

class HalfPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
    final Rect afterRect =
        Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, vector.radians(0), vector.radians(90), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, vector.radians(0), -vector.radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, vector.radians(180), vector.radians(-90), false);
    path.close();

    canvas.drawPath(path, Paint()..color = barColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
