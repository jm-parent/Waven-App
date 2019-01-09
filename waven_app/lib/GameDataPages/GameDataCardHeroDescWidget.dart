import 'package:flutter/material.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';

class GameDataCardHeroDescWidget extends StatefulWidget {
  final ShushuOfflineModel heroData;

  GameDataCardHeroDescWidget({Key key, this.heroData}) : super(key: key);

  @override
  GameDataCardHeroDescWidgetState createState() {
    return new GameDataCardHeroDescWidgetState();
  }
}

class GameDataCardHeroDescWidgetState extends State<GameDataCardHeroDescWidget>
    with TickerProviderStateMixin {
  var durationAnimationContainer = Duration(milliseconds: 300);
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    debugPrint('widget.heroData.background : ${widget.heroData.background}');
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: AnimatedSize(
        vsync: this,
        duration: durationAnimationContainer,
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: Image.asset(widget.heroData.background,fit: BoxFit.cover,alignment: new Alignment(0, -0.5),)),
            Column(
              children: <Widget>[
                SizedBox(
                    height: 90.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.heroData.heroName,style: TextStyle(fontSize: 18.0),),
                          Text(widget.heroData.lore,style: TextStyle(fontSize: 14.0),),
                        ],
                      ),
                    )),
                Visibility(
                  child:Container(color: Colors.transparent,height: 200.0,),
                  visible: isVisible,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

