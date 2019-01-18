import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:waven_app/AppUi/CommonDatas/Gradients.dart';
import 'package:waven_app/AppUi/CommonWidget/Clippers/BottomWaveClipper.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenGods/GodsItems.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusItems.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class GodsListPage extends StatefulWidget {
  @override
  GodsListPageState createState() {
    return new GodsListPageState();
  }
}

class GodsListPageState extends State<GodsListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GodPage'),
          elevation: 0.0,
        ),
        body: Container(
            color: DarkColor(),
            child: AnimatedList(
                initialItemCount: GodsItems.length,
                key: _listKey,
                itemBuilder: (context, int index, Animation animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: _buildCell(context, index),
                  );
                })));
  }

  Widget _buildCell(BuildContext context, int index) {
    return SimpleFoldingCell(
      frontWidget: _buildFrontWidget(index),
      innerTopWidget: _buildInnerTopWidget(index),
      innerBottomWidget: _buildInnerBottomWidget(index),
      cellSize: Size(MediaQuery.of(context).size.width, 125),
    );
  }

  _buildFrontWidget(int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Image.asset(
            GodsItems[index].background,
            fit: BoxFit.cover,
            alignment: new Alignment(0.0, -0.9),
          )),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Text(
              GodsItems[index].godName,
              style: TextStyle(fontSize: 26.0),
            ),
          ),
        ],
      ),
    );
  }

  _buildInnerTopWidget(int index) {

    const double headerSize = 40;

    return ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          //le Lore
          Container(
            decoration: BoxDecoration(gradient: GradientKrosmoz),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top:headerSize,left: 5.0,right: 5.0,bottom: 5.0),
              child: AutoSizeText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non accumsan quam, tempus malesuada orci. Nullam et ultricies ex. Cras lorem ligula, condimentum a tellus quis, malesuada efficitur mauris. Vivamus aliquam tristique aliquam. Praesent sodales massa eget ex faucibus porta. Maecenas dui orci, vestibulum ut diam quis, lacinia ornare sem. Donec vulputate tellus felis, non mollis dui malesuada sit amet. Ut eu facilisis magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                minFontSize: 15,
                style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,),
            ),
          ),
          //L'entete
          Container(
            child: ClipPath(
                clipper: BottomWaveClipper(),
                child: SizedBox(
                  height: headerSize,
                  child: Container(
                    decoration: BoxDecoration(gradient: GradientEni),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(GodsItems[index].godName),
                    ),
                  ),
                )),
          ),


        ],
      ),
    );
  }

  _buildInnerBottomWidget(int index) {
    var filteredShushuByGod = ShushusItems.where((shushu)=> shushu.godName == GodsItems[index].godName).toList();
    return
      filteredShushuByGod.length == 0 ?
      Container(color: Colors.grey,):
      ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: filteredShushuByGod.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(filteredShushuByGod[index].background),
          );
        },
      ));

  }
}
