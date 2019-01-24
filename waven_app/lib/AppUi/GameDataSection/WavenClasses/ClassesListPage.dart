import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:waven_app/AppUi/CommonDatas/Gradients.dart';
import 'package:waven_app/AppUi/CommonWidget/Clippers/BottomWaveClipper.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenClasses/ClassesItems.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusItems.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class ClassesListPage extends StatefulWidget {
  @override
  ClassesListPageState createState() {
    return new ClassesListPageState();
  }
}

class ClassesListPageState extends State<ClassesListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Les Classes'),
          elevation: 0.0,
        ),
        body: Container(
            //color: DarkColor(),
            child: AnimatedList(
                initialItemCount: ClassesItems.length,
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
      cellSize: Size(MediaQuery.of(context).size.width, 150),
    );
  }

  _buildFrontWidget(int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Image.asset(
            ClassesItems[index].background,
            fit: BoxFit.cover,
          )),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ClassesItems[index].loreTitle,
                style: TextStyle(fontSize: 26.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(height: 3.0,
                    child: Container(decoration: ClassesItems[index].gradient,)),
              ),
            ],
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
            decoration: GradientIopBg(),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top:headerSize,left: 5.0,right: 5.0,bottom: 5.0),
              child: AutoSizeText(ClassesItems[index].lore,
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
                    decoration:ClassesItems[index].gradient,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ClassesItems[index].loreTitle),
                    ),
                  ),
                )),
          ),


        ],
      ),
    );
  }

  _buildInnerBottomWidget(int index) {
    var filteredShushuByGod = ShushusItems.where((shushu)=> shushu.godName == ClassesItems[index].className).toList();
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
          debugPrint('filteredShushuByGod[index].uniqueSpellIcon  :  ' + filteredShushuByGod[index].uniqueSpellIcon);
          return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 115.0,maxHeight: 125.0),
              child:FlipCard(
                direction: FlipDirection.HORIZONTAL, // default
                front: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Stack(children: <Widget>[

                    Image.asset(filteredShushuByGod[index].portrait,fit: BoxFit.cover,),
                    Positioned(
                      bottom: 3,
                      left: 3,
                      child:   Image.asset(filteredShushuByGod[index].uniqueSpellIcon,fit: BoxFit.cover,height: 40,width: 40,),
                    ),
                  ]),
                ),
                back:Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                             decoration:  GradientIopBg(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: AutoSizeText('(P) '+filteredShushuByGod[index].uniquePassiveDesc,maxLines: 4,minFontSize: 2,),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[

                            Container(
                              decoration:  GradientIopBg(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: AutoSizeText('(A) '+filteredShushuByGod[index].uniqueSpellDesc,maxLines: 4,minFontSize: 9,),
                            ),
                          ],
                        ),
                      ),
                      //Text(filteredShushuByGod[index].uniqueSpellName), //TODO
                    ],
                  ),
                ),
              ));

        },
      ));

  }
}

