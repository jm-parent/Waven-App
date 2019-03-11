import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderModel.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderShushuSelectPage.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiClasses.dart';

class DeckBuilderListPage extends StatefulWidget {
  @override
  _DeckBuilderListPageState createState() => _DeckBuilderListPageState();
}

class _DeckBuilderListPageState extends State<DeckBuilderListPage> {
  PageController controller;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
    WavenApiProvider.GetAllClass();
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
    return new Scaffold(
      appBar: AppBar(
        title: Text('Choisis une Classe'),
        centerTitle: true,
      ),
      body: new Center(
        child: _buildTransformPageViewClasses(),
      ),
    );
  }

  _buildTransformPageViewClasses() {
    return SafeArea(
      child: FutureBuilder(
          future: WavenApiProvider.GetAllClass(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ResponseWavenApiClass>> snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            }
            return new TransformerPageView(
                loop: false,
                pageSnapping: true,
                viewportFraction: 0.7,
                transformer: new PageTransformerBuilder(
                    builder: (Widget child, TransformInfo info) {
                  return GestureDetector(
                    onTap: () => _tapOnClass(info.index),
                    child: new Padding(
                      padding: new EdgeInsets.only(
                          bottom: 60.0, top: 15, left: 15, right: 15),
                      child: new Material(
                        elevation: 4.0,
                        textStyle: new TextStyle(color: Colors.white),
                        borderRadius: new BorderRadius.circular(10.0),
                        child: new Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Hero(
                              tag: snapshot.data[info.index].name + 'tag',
                              child: ParallaxContainer(
                                translationFactor: info.position * 0.3,
                                child: CachedNetworkImage(
                                  imageUrl:  snapshot.data[info.index].imageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: new Center(
                                    child: new CircularProgressIndicator(),
                                  ),
                                  errorWidget: new Icon(Icons.error),
                                ),
                                position: info.position,
                              ),
                            ),
                            new Positioned(
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new ParallaxContainer(
                                    child: new Text(
                                      snapshot.data[info.index].name,
                                      style: new TextStyle(fontSize: 15.0),
                                    ),
                                    position: info.position,
                                    translationFactor: 300.0,
                                  ),
                                  new SizedBox(
                                    height: 8.0,
                                  ),
                                  new ParallaxContainer(
                                    child: new Text(
                                        snapshot.data[info.index].fullName,
                                        style: new TextStyle(fontSize: 18.0)),
                                    position: info.position,
                                    translationFactor: 200.0,
                                  ),
                                ],
                              ),
                              left: 10.0,
                              right: 10.0,
                              bottom: 10.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                itemCount: snapshot.data.length);
          }),
    );
  }

  void _tapOnClass(index) {
    var newDeck = new DeckBuilderModel();
    //newDeck.classData = ClassesItems[index];
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            child: DeckBuilderShushuSelectPage(
              deckData: newDeck,
            )));
  }
}
