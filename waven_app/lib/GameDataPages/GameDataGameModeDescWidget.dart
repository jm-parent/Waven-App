import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/models/GameModeModelLight.dart';

class GameDataGameModeDescWidget extends StatefulWidget {
  final GameModeModelLight gameModeData;

  GameDataGameModeDescWidget({Key key, this.gameModeData}) : super(key: key);

  @override
  GameDataGameModeDescWidgetState createState() {
    return new GameDataGameModeDescWidgetState();
  }
}

class GameDataGameModeDescWidgetState extends State<GameDataGameModeDescWidget>
    with TickerProviderStateMixin {
  var durationAnimationContainer = Duration(milliseconds: 300);
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('IsVisible : ${isVisible}');
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSize(
          vsync: this,
          duration: durationAnimationContainer,
          child: Stack(
            children: <Widget>[
              Positioned.fill(child:
              new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.gameModeData.background,
                 fit: BoxFit.cover,
              ),

              ),
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
                            Text(widget.gameModeData.gameModeName,style: TextStyle(fontSize: 18.0),),
                            Text(widget.gameModeData.gameModeDesc,style: TextStyle(fontSize: 14.0),),
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
      ),
    );
  }
}

