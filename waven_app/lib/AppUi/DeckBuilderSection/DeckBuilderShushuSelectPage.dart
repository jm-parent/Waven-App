import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/AppUi/DeckBuilderPages/DeckBuilderSkillBarPage.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderModel.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusItems.dart';

class DeckBuilderShushuSelectPage extends StatefulWidget {
  final DeckBuilderModel deckData;

  const DeckBuilderShushuSelectPage({Key key, this.deckData}) : super(key: key);

  @override
  _DeckBuilderShushuSelectPageState createState() =>
      _DeckBuilderShushuSelectPageState();
}

class _DeckBuilderShushuSelectPageState
    extends State<DeckBuilderShushuSelectPage> {
  PageController controller;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filteredShushuByGod = ShushusItems.where(
            (shushu) => shushu.godName == widget.deckData.classData.className)
        .toList();

    return new Scaffold(
      appBar: AppBar(
        title: Text('Choisis un Shushu'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: widget.deckData.classData.className + 'tag',
              child: Image.asset(
                widget.deckData.classData.background,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          new Center(
            child:Container(),// _buildTransformPageViewShushus(filteredShushuByGod),
          ),
        ],
      ),
    );
  }

//  _buildTransformPageViewShushus(List<ShushuOfflineModel> filteredShushuByGod) {
//    return SafeArea(
//      child: new TransformerPageView(
//          loop: false,
//          pageSnapping: true,
//          viewportFraction: 0.5,
//          transformer: new PageTransformerBuilder(
//              builder: (Widget child, TransformInfo info) {
//            return GestureDetector(
//                onTap: () => _tapOnClass(filteredShushuByGod[info.index]),
//                child: new Padding(
//                  padding: new EdgeInsets.only(
//                      bottom: 60.0, top: 30, left: 30, right: 30),
//                  child: new Material(
//                    elevation: 4.0,
//                    textStyle: new TextStyle(color: Colors.white),
//                    borderRadius: new BorderRadius.circular(10.0),
//                    child: new Stack(
//                      fit: StackFit.expand,
//                      children: <Widget>[
//
//                        new ParallaxImage.asset(
//                          filteredShushuByGod[info.index].portraitWithLogo,
//                          imageFactor: 1.5,
//                          position: info.position,
//                        ),
//                        Container(
//                          decoration: BoxDecoration(
//                            gradient: LinearGradient(
//                              begin: FractionalOffset.topCenter,
//                              end: FractionalOffset.bottomCenter,
//                              stops: [0.0, 0.8, 1.0],
//                              colors: [
//                                const Color(0x00000000),
//                                const Color(0xAA000000),
//                                const Color(0xFF000000),
//                              ],
//                            ),
//                          ),
//                        ),
//                        new Positioned(
//                          child: new Column(
//                            mainAxisSize: MainAxisSize.min,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              new ParallaxContainer(
//                                child: Text(
//                                  filteredShushuByGod[info.index].heroName,
//                                  style: TextStyle(
//                                    fontStyle: FontStyle.italic,
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 30.0,
//                                    fontFamily: "BebasNeue",
//                                  ),
//                                ),
//                                position: info.position,
//                                translationFactor: 300.0,
//                              ),
//                              new SizedBox(
//                                height: 8.0,
//                              ),
//                              ParallaxContainer(
//                                child: DashboardTitleCat(
//                                    titleCat: "Actif",
//                                    pageToNavigate: null,
//                                    isMoreShowed: false),
//                                position: info.position,
//                                translationFactor: 300.0,
//                              ),
//                              ParallaxContainer(
//                                position: info.position,
//                                translationFactor: 300.0,
//                                child: Row(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  mainAxisSize: MainAxisSize.min,
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Expanded(
//                                      child: Padding(
//                                        padding: const EdgeInsets.all(4.0),
//                                        child: new Image.asset(
//                                          filteredShushuByGod[info.index]
//                                              .uniqueSpellIcon,
//                                        ),
//                                      ),
//                                    ),
//                                    Expanded(
//                                      flex: 4,
//                                      child: Text(
//                                        filteredShushuByGod[info.index]
//                                            .uniqueSpellDesc,
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                              ParallaxContainer(
//                                child: DashboardTitleCat(
//                                    titleCat: "Passif",
//                                    pageToNavigate: null,
//                                    isMoreShowed: false),
//                                position: info.position,
//                                translationFactor: 300.0,
//                              ),
//                              ParallaxContainer(
//                                position: info.position,
//                                translationFactor: 300.0,
//                                child: Row(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  mainAxisSize: MainAxisSize.min,
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Expanded(
//                                        child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Placeholder(
//                                        fallbackHeight: 60,
//                                      ),
//                                    )),
//                                    Expanded(
//                                      flex: 4,
//                                      child: Text(
//                                        filteredShushuByGod[info.index]
//                                            .uniquePassiveDesc,
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ],
//                          ),
//                          left: 10.0,
//                          right: 10.0,
//                          bottom: 10.0,
//                        ),
//
//                      ],
//                    ),
//                  ),
//                ));
//          }),
//          itemCount: filteredShushuByGod.length),
//    );
//  }

  void _tapOnClass(shushu) {
    widget.deckData.shushuData = shushu;
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: DeckBuilderSkillBarPage(deckData: widget.deckData,)));
  }
}
