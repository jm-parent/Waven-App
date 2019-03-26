import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/AppUi/CommonWidget/ElementalWavenWidget.dart';
import 'package:waven_app/AppUi/DeckBuilderPages/DeckBuilderFullDeckPage.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderModel.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiFellow.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiSpell.dart';
import 'package:waven_app/AppUi/Utils/GradientHelper.dart';
import 'package:waven_app/AppUi/Utils/widget_utils.dart';

class DeckBuilderFellowBarPage extends StatefulWidget {
  final DeckBuilderModel deckData;
  final List<ResponseWavenApiSpell> spellList;
  const DeckBuilderFellowBarPage({Key key, this.deckData, this.spellList}) : super(key: key);
  @override
  _DeckBuilderFellowBarPageState createState() =>
      _DeckBuilderFellowBarPageState();
}

class _DeckBuilderFellowBarPageState extends State<DeckBuilderFellowBarPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  static GlobalKey previewFellowBar = new GlobalKey();

  List<ResponseWavenApiFellow> fellowList;

  var _WaterTotalGen = 0;
  var _AirTotalGen = 0;
  var _EarthTotalGen = 0;
  var _FireTotalGen = 0;
  @override
  void initState() {

    fellowList = List<ResponseWavenApiFellow>();
    resetFellowListTarget();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomPadding: false,
            appBar: _buildBar(context),
            endDrawer: _buildFilters(),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: _buildVerticalFellowList(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RepaintBoundary(
                      key: previewFellowBar,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width -
                            ScreenAwareHelper.screenAwareSize(50, context),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Positioned.fill(
                                child: Image.asset(
                                  widget.deckData.shushuData.background,
                                  fit: BoxFit.cover,
                                )),

                            Row(
                              children: <Widget>[
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: new BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0)),
                                        child: Container(
                                            decoration: GradientIop(),
                                            height: ScreenAwareHelper
                                                .screenAwareSize(50, context),
                                            width: ScreenAwareHelper
                                                .screenAwareSize(40, context),
                                            child: GestureDetector(
                                              onTap: ()=> Navigator.push(context,  PageTransition(type: PageTransitionType.rightToLeft, child: DeckBuilderFullDeckPage(deckData: widget.deckData,spellList: widget.spellList,fellowList: fellowList,))),

                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.asset('images/FellowImages/fellow_empty.png',height: 30,),
                                                  Icon(Icons.perm_contact_calendar,color: Colors.grey[300],size: 13,),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Image.asset(
                                              widget.deckData.shushuData
                                                  .uniqueSpellIcon,
                                              width: ScreenAwareHelper
                                                  .screenAwareSize(70, context),
                                              height: ScreenAwareHelper
                                                  .screenAwareSize(
                                                  70, context)),
                                        ),
                                      )
                                    ]),
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ElementalWavenWidget(
                                              imageChild: Image.asset(
                                                  'images/SpellsImages/symbol_water.png',
                                                  height: ScreenAwareHelper
                                                      .screenAwareSize(
                                                      40, context)),
                                              textChild:
                                              _WaterTotalGen.toString(),
                                            ),
                                            ElementalWavenWidget(
                                              imageChild: Image.asset(
                                                  'images/SpellsImages/symbol_wind.png',
                                                  height: ScreenAwareHelper
                                                      .screenAwareSize(
                                                      40, context)),
                                              textChild:
                                              _AirTotalGen.toString(),
                                            ),
                                            ElementalWavenWidget(
                                              imageChild: Image.asset(
                                                  'images/SpellsImages/symbol_earth.png',
                                                  height: ScreenAwareHelper
                                                      .screenAwareSize(
                                                      40, context)),
                                              textChild:
                                              _EarthTotalGen.toString(),
                                            ),
                                            ElementalWavenWidget(
                                              imageChild: Image.asset(
                                                  'images/SpellsImages/symbol_fire.png',
                                                  height: ScreenAwareHelper
                                                      .screenAwareSize(
                                                      40, context)),
                                              textChild:
                                              _FireTotalGen.toString(),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            _buildDragTarget(0),
                                            _buildDragTarget(1),
                                            _buildDragTarget(2),
                                            _buildDragTarget(3),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            _buildDragTarget(4),
                                            _buildDragTarget(5),
                                            _buildDragTarget(6),
                                            _buildDragTarget(7),
                                          ],
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  _buildFilters() {
    return Container();
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Text('Les Compagnons'),
      actions: [
        Builder(
          builder: (context) => IconButton(
                icon: Icon(FontAwesomeIcons.slidersH),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
        ),
      ],
    );
  }

  _buildVerticalFellowList() {}

  _buildDragTarget(int indexFellow) {
    return GestureDetector(
      //onTap: () => swapSpell(indexSpell),
      //onDoubleTap: () => resetSpellListTile(indexSpell),
     child: Image.asset('images/FellowImages/fellow_empty.png',  width: ScreenAwareHelper.screenAwareSize(50, context),
             height: ScreenAwareHelper.screenAwareSize(50, context)),
// DragTarget<ResponseWavenApiSpell>(
//        builder: (context, List<dynamic> candidateData, rejectedData) {
//          return SpellIconWidget(
//              dataSpell: spellListShow[indexSpell],
//              width: ScreenAwareHelper.screenAwareSize(50, context),
//              height: ScreenAwareHelper.screenAwareSize(50, context));
//        },
//        onWillAccept: (data) {
//          var r = data.iconUrl != null;
//          var isUnique = spellListShow
//              .indexWhere((spell) => spell.iconUrl == data.iconUrl) ==
//              -1;
//          return r && isUnique;
//        },
//        onAccept: (data) {
//          // var imageWidget = getSpellSlot(data, 1, indexSpell);
//          spellListShow.removeAt(indexSpell);
//          spellListShow.insert(indexSpell, data);
//          UpdateTotalValue(spellListShow[indexSpell], true);
//        },
//      ),
    );
  }

  void resetFellowListTarget() {
    fellowList.clear();
    fellowList.add(getEmptyFellowModel());
    fellowList.add(getEmptyFellowModel());
    fellowList.add(getEmptyFellowModel());
    fellowList.add(getEmptyFellowModel());
    fellowList.add(getEmptyFellowModel());
    fellowList.add(getEmptyFellowModel());
    fellowList.add(getEmptyFellowModel());
    fellowList.add(getEmptyFellowModel());
  }
  String urlEmptyDragTarget = 'images/FellowImages/fellow_empty.png';
  ResponseWavenApiFellow getEmptyFellowModel() {
      return new ResponseWavenApiFellow(iconUrl: urlEmptyDragTarget);
    }

}
