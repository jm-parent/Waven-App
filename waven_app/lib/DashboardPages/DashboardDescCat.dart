import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class DashboardDescCat extends StatefulWidget {
  String descCat;

  DashboardDescCat(this.descCat);

  @override
  DashboardDescCatState createState() {
    return new DashboardDescCatState();
  }
}

class DashboardDescCatState extends State<DashboardDescCat>
    with TickerProviderStateMixin {
  var containerHeight = 120.0;
  var isOpened = false;
  var maxLine = 3;

  AnimationController _controller;
  Animation<int> maxLineAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);

    maxLineAnimation = IntTween(begin: 3, end: 40).animate(
        new CurvedAnimation(curve: Curves.linear, parent: _controller));

    _controller.addListener(() {
      this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isOpened = isOpened ? false : true;
              containerHeight = isOpened ? 400.0 : 120.0;
              maxLine = isOpened ? 30 : 3;
              isOpened ? _controller.forward() : _controller.reverse();
              debugPrint('$isOpened');

            });
          },
          child: AnimatedSize(
              vsync: this,
              curve: Curves.linear,
              duration: Duration(milliseconds: 1000),
              child: Column(
                children: <Widget>[
                  AnimatedSize(
                    duration: Duration(milliseconds: 500),
                    vsync: this,
                    child: new FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'https://waven-game.com/fr/wp-content/uploads/2018/10/header.jpg',
                      // fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.descCat,
                      maxLines: maxLineAnimation.value,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 500),
                    crossFadeState: isOpened
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Container(),
                    secondChild: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Spacer(),
                        Text('Clic pour en savoir plus...')
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
