import 'package:flutter/material.dart';
import 'package:waven_app/models/GodModel.dart';

class GameDataGodCatOfflineWidget extends StatefulWidget {
  final GodOfflineModel godData;

  const GameDataGodCatOfflineWidget({Key key, this.godData}) : super(key: key);
  @override
  _GameDataGodCatOfflineWidgetState createState() => _GameDataGodCatOfflineWidgetState();
}

class _GameDataGodCatOfflineWidgetState extends State<GameDataGodCatOfflineWidget>
    with TickerProviderStateMixin{
  var durationAnimationContainer = Duration(milliseconds: 300);
  var isVisible = false;
  double scrollPercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSize(
          vsync: this,
          curve: Curves.linear,
          duration: durationAnimationContainer,
          child: Stack(
            children: <Widget>[
              Positioned.fill(child:
              Image.asset(widget.godData.imgBackgroundDofusUrl,fit: BoxFit.cover,alignment: Alignment(0, -0.7))),
              Visibility(child : Positioned.fill(child: Container(color: Colors.black87,)),
                visible: isVisible,
              ),
              Visibility(
                child :SizedBox(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${widget.godData.godName}',style: TextStyle(fontSize: 18.0),),
                      ],
                    ),
                  ),),
                visible: !isVisible,
              ),
              Visibility(
                child:SizedBox(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  child:Container(color: Colors.transparent),
                ),
                visible: isVisible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

