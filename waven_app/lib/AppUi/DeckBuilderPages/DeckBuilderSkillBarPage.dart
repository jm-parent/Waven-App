import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/CommonWidget/BorderContainer.dart';
import 'package:waven_app/AppUi/CommonWidget/ElementalWavenWidget.dart';
import 'package:waven_app/AppUi/CommonWidget/SimpleRoundText.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/CommonWidget/TitleWavenWidget.dart';
import 'package:waven_app/AppUi/DeckBuilderPages/DeckBuilderFellowBarPage.dart';
import 'package:waven_app/AppUi/DeckBuilderPages/SpellIconWidget.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderModel.dart';
import 'package:waven_app/AppUi/Models/CommonDataForModel.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiSpell.dart';
import 'package:waven_app/AppUi/Utils/GradientHelper.dart';
import 'package:waven_app/AppUi/Utils/ThemeHelper.dart';
import 'package:waven_app/AppUi/Utils/widget_utils.dart';

class DeckBuilderSkillBarPage extends StatefulWidget {
  final DeckBuilderModel deckData;

  const DeckBuilderSkillBarPage({Key key, this.deckData}) : super(key: key);

  @override
  _DeckBuilderSkillBarPageState createState() =>
      _DeckBuilderSkillBarPageState();
}

class _DeckBuilderSkillBarPageState extends State<DeckBuilderSkillBarPage>
    with SingleTickerProviderStateMixin {

  AnimationController animatedIconController ;
  List<ResponseWavenApiSpell> spellListShow;
  String urlEmptyDragTarget = 'https://imgur.com/IXhxlw4.png';
  Widget _appBarTitle = new Text('Liste des Sorts');
  Icon _searchIcon = new Icon(Icons.search);
  var _WaterTotalGen = 0;
  var _AirTotalGen = 0;
  var _EarthTotalGen = 0;
  var _FireTotalGen = 0;

  @override
  void initState() {
    WavenApiProvider.GetSpellsFromClassName(
        widget.deckData.classData.className);
    spellListShow = List<ResponseWavenApiSpell>();
    resetSpellListTarget();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    animatedIconController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    super.initState();
  }
@override
void dispose(){
    animatedIconController.dispose();
    super.dispose();
}

  String filter;
  TextEditingController controller = new TextEditingController();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  double _lowerValue = 0.0;
  double _upperValue = 15.0;
  static GlobalKey previewSkillBar = new GlobalKey();

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
                    child: _buildVerticalSpellList(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: RepaintBoundary(
                  key: previewSkillBar,
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

                        Container(
                            color: Colors.black54,
                            child: Row(
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
                                              onTap: ()=> Navigator.push(context,  PageTransition(type: PageTransitionType.rightToLeft, child: DeckBuilderFellowBarPage(deckData: widget.deckData,spellList:spellListShow))),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.asset('images/FellowImages/fellow_empty.png',height: 30,),
                                                  AnimatedIcon(icon: AnimatedIcons.play_pause,progress: animatedIconController,),
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
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  var spellIconSize = 65.0;

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: controller,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle =  new Text('Liste des Sorts');
//       this._appBarTitle = new Text(
//            '${widget.deckData.classData.className} -> ${widget.deckData.shushuData.heroName}');
        controller.clear();
      }
    });
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
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

  _buildVerticalSpellList() {
    return FutureBuilder(
      future: WavenApiProvider.GetSpellsFromClassName(
          widget.deckData.classData.className),
      builder: (BuildContext context,
          AsyncSnapshot<List<ResponseWavenApiSpell>> snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text('Loading...'),
            ),
          );
        }
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return isfilterNullOrEmpty(filter)
                  ? isDataBetweenPaValues(snapshot.data[index])
                      ? isDataIsSelectedElement(snapshot.data[index])
                        ?
                      LongPressDraggable(
                          data: snapshot.data[index],
                          child: getDetailledSpellSlotWithGesture(
                              snapshot.data[index], 1, index),
                          feedback: getSpellSlotWithGesture(
                              snapshot.data[index], 1.3, index),
                          childWhenDragging: Container(),
                        )
                      : Container()
                  :Container()
                  : snapshot.data[index].name.toLowerCase().contains(filter)
                      ? snapshot.data[index].cost >= _lowerValue &&
                              snapshot.data[index].cost <= _upperValue
                          ? LongPressDraggable(
                              data: snapshot.data[index],
                              child: getDetailledSpellSlotWithGesture(
                                  snapshot.data[index],
                                  ScreenAwareHelper.screenAwareSize(1, context),
                                  index),
                              feedback: getSpellSlotWithGesture(
                                  snapshot.data[index],
                                  ScreenAwareHelper.screenAwareSize(
                                      1.3, context),
                                  index),
                              childWhenDragging: Container(),
                            )
                          : Container()
                      : Container();

            });
      },
    );
  }

  _buildDragTarget(int indexSpell) {
    return GestureDetector(
      onTap: () => swapSpell(indexSpell),
      onDoubleTap: () => resetSpellListTile(indexSpell),
      child: DragTarget<ResponseWavenApiSpell>(
        builder: (context, List<dynamic> candidateData, rejectedData) {
          return SpellIconWidget(
              dataSpell: spellListShow[indexSpell],
              width: ScreenAwareHelper.screenAwareSize(50, context),
              height: ScreenAwareHelper.screenAwareSize(50, context));
        },
        onWillAccept: (data) {
          var r = data.iconUrl != null;
          var isUnique = spellListShow
                  .indexWhere((spell) => spell.iconUrl == data.iconUrl) ==
              -1;
          return r && isUnique;
        },
        onAccept: (data) {
          // var imageWidget = getSpellSlot(data, 1, indexSpell);
          spellListShow.removeAt(indexSpell);
          spellListShow.insert(indexSpell, data);
          UpdateTotalValue(spellListShow[indexSpell], true);
        },
      ),
    );
  }

  void resetSpellListTile(int index) {
    UpdateTotalValue(spellListShow[index], false);
    replaceSpellByIndex(index, getEmptySpellModel());
  }

  void resetSpellListTarget() {
    spellListShow.clear();
    spellListShow.add(getEmptySpellModel());
    spellListShow.add(getEmptySpellModel());
    spellListShow.add(getEmptySpellModel());
    spellListShow.add(getEmptySpellModel());
    spellListShow.add(getEmptySpellModel());
    spellListShow.add(getEmptySpellModel());
    spellListShow.add(getEmptySpellModel());
    spellListShow.add(getEmptySpellModel());
  }

  getEmptySpellModel() {
    return new ResponseWavenApiSpell(iconUrl: urlEmptyDragTarget);
  }

  addSpellToBar(ResponseWavenApiSpell data, int index) {
    var isNotInSkillBar =
        spellListShow.indexWhere((spell) => spell.iconUrl == data.iconUrl) ==
            -1;
    if (isNotInSkillBar) {
      debugPrint("Dans addspelltobar : ${data.name} & ${index.toString()}");

      var indexFirst = spellListShow
          .indexWhere((spell) => spell.iconUrl == urlEmptyDragTarget);

      debugPrint(
          "Dans addspelltobar : ${data.name} & ${indexFirst.toString()}");
      AnimatedIconToFellow();
      if (indexFirst != -1) //Si on a trouvé un élément
      {
        UpdateTotalValue(data, true);
        setState(() {

          spellListShow.removeAt(indexFirst);
          spellListShow.insert(indexFirst, data);
        });
      }
    }
  }

  void replaceSpellByIndex(int index, ResponseWavenApiSpell widget) {
    setState(() {
      spellListShow.removeAt(index);
      spellListShow.insert(index, widget);
    });
  }

  CachedNetworkImage getEmptySlot() {
    return new CachedNetworkImage(
      width: ScreenAwareHelper.screenAwareSize(spellIconSize, context),
      height: ScreenAwareHelper.screenAwareSize(spellIconSize, context),
      imageUrl: urlEmptyDragTarget,
      fit: BoxFit.cover,
      placeholder: (context, url) => SnapshotLoadingIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }

  getDetailledSpellSlotWithGesture(
      ResponseWavenApiSpell data, double factor, int index) {
    debugPrint('Dans Création de l\'image du skill : ' + data.name);

    if (isSpellInBar(data))
      return BorderContainer(
        borderColor: Colors.green,
        borderRadius: 0,
        child: GestureDetector(
          onTap: () => addSpellToBar(data, index),
          child: getDetailledSpellSlot(data, index),
        ),
      );
    else
      return GestureDetector(
        onTap: () => addSpellToBar(data, index),
        child: getDetailledSpellSlot(data, index),
      );
  }

  Widget getDetailledSpellSlot(ResponseWavenApiSpell data, int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        color: Colors.black54,
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            trailing: _buildGridElementalSpellGen(data),
            title: Row(
              children: <Widget>[
                AutoSizeText(
                  data.name,
                  style: Theme.of(context).textTheme.title,
                  maxLines: 1,
                  maxFontSize: 15,
                ),
              ],
            ),
            subtitle: AutoSizeText(
              data.description,
              style: Theme.of(context).textTheme.subtitle,
              maxLines: 4,
              maxFontSize: 12,
              minFontSize: 7,
            ),
            leading: SpellIconWidget(
              dataSpell: data,
              width: ScreenAwareHelper.screenAwareSize(40, context),
              height: ScreenAwareHelper.screenAwareSize(50, context),
            )),
      ),
    );
  }

  getSpellSlotWithGesture(
      ResponseWavenApiSpell data, double factor, int index) {
    return GestureDetector(
      onTap: () => addSpellToBar(data, index),
      child: getSpellSlot(data, factor, index),
    );
  }

  CachedNetworkImage getSpellSlot(
      ResponseWavenApiSpell data, double factor, int index) {
    return new CachedNetworkImage(
      width: ScreenAwareHelper.screenAwareSize(spellIconSize * factor, context),
      height:
          ScreenAwareHelper.screenAwareSize(spellIconSize * factor, context),
      imageUrl: data.iconUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => SnapshotLoadingIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }

  var indexSavedSpell;
  var savedSpell;
  var isSpellSaved = false;

  swapSpell(int indexSpell) {
    setState(() {
      if (isSpellSaved == false) {
        indexSavedSpell = indexSpell;
        isSpellSaved = true;
      } else {
        savedSpell = spellListShow[indexSpell];
        replaceSpellByIndex(indexSpell, spellListShow[indexSavedSpell]);
        replaceSpellByIndex(indexSavedSpell, savedSpell);
        isSpellSaved = false;
      }
    });
  }

  _ShareBuildCode() {
    var code = "[";
    spellListShow.forEach((spell) => code += '${spell.name},');
    code = code.substring(0, code.length - 1);
    code += ']';
    //Share.share("Regarde mon deck : ${code}");
  }

  takeScreenShot() async {
    RenderRepaintBoundary boundary =
        previewSkillBar.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    await EsysFlutterShare.shareImage(
        'MyDeck${widget.deckData.shushuData.heroName}.png',
        byteData,
        'MyDeck${widget.deckData.shushuData.heroName}');
  }

  bool isSpellInBar(ResponseWavenApiSpell data) {
    var result = spellListShow.where((spell) => spell.name == data.name);
    return result.length > 0;
  }

  _buildGridElementalSpellGen(ResponseWavenApiSpell spell) {
    var fireGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Feu,
            orElse: () => Resource(quantity: 0))
        .quantity;
    var airGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Air,
            orElse: () => Resource(quantity: 0))
        .quantity;
    var earthGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Terre,
            orElse: () => Resource(quantity: 0))
        .quantity;
    var waterGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Eau,
            orElse: () => Resource(quantity: 0))
        .quantity;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            waterGen != 0
                ? ElementalWavenWidget(
                    imageChild: Image.asset(
                      'images/SpellsImages/symbol_water.png',
                      height: ScreenAwareHelper.screenAwareSize(30, context),
                    ),
                    textChild: waterGen.toString(),
                    fontsizeChild: 15,
                  )
                : _buildEmptyManaGen(),
            airGen != 0
                ? ElementalWavenWidget(
                    imageChild: Image.asset(
                      'images/SpellsImages/symbol_wind.png',
                      height: ScreenAwareHelper.screenAwareSize(30, context),
                    ),
                    textChild: airGen.toString(),
                    fontsizeChild: 15)
                : _buildEmptyManaGen(),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            earthGen != 0
                ? ElementalWavenWidget(
                    imageChild: Image.asset(
                      'images/SpellsImages/symbol_earth.png',
                      height: ScreenAwareHelper.screenAwareSize(30, context),
                    ),
                    textChild: earthGen.toString(),
                    fontsizeChild: 15)
                : _buildEmptyManaGen(),
            fireGen != 0
                ? ElementalWavenWidget(
                    imageChild: Image.asset(
                      'images/SpellsImages/symbol_fire.png',
                      height: ScreenAwareHelper.screenAwareSize(30, context),
                    ),
                    textChild: fireGen.toString(),
                    fontsizeChild: 15)
                : _buildEmptyManaGen()
          ],
        ),
      ],
    );
  }

  _buildEmptyManaGen() {
    return ElementalWavenWidget(
      imageChild: Image.asset(
        'images/SpellsImages/symbol_water.png',
        height: ScreenAwareHelper.screenAwareSize(30, context),
        color: Colors.transparent,
      ),
      textChild: "",
      fontsizeChild: 15,
    );
  }

  void UpdateTotalValue(ResponseWavenApiSpell spell, bool isAdd) {
    AnimatedIconToFellow();
    var fireGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Feu,
            orElse: () => Resource(quantity: 0))
        .quantity;
    var airGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Air,
            orElse: () => Resource(quantity: 0))
        .quantity;
    var earthGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Terre,
            orElse: () => Resource(quantity: 0))
        .quantity;
    var waterGen = spell.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Eau,
            orElse: () => Resource(quantity: 0))
        .quantity;
    if (isAdd)
      setState(() {
        _FireTotalGen += fireGen;
        _AirTotalGen += airGen;
        _WaterTotalGen += waterGen;
        _EarthTotalGen += earthGen;
      });
    else {
      _FireTotalGen -= fireGen;
      _AirTotalGen -= airGen;
      _WaterTotalGen -= waterGen;
      _EarthTotalGen -= earthGen;
    }
  }


  bool isFireSelected = false;
  bool isWindSelected = false;
  bool isEarthSelected = false;
  bool isWaterSelected = false;
  _buildFilters() {
    Color bgMenuColor = Color(0xFF607D8B).withAlpha(100);
    Color bgButtonColor = Color(0xFF37474F);
    Color bgButtonClickedColor = Color(0xFF4c626d);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom:10.0),
              child: TitleWavenWidget(
                title: "Filters",
                leadingIconColor: WaventBlue(),
                titleColor: WaventBlue(),
                underLineColor: WaventBlue(),
                underLineWidth: MediaQuery.of(context).size.width,
              ),
            ),
            Expanded(
              child: new ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(ScreenAwareHelper.screenAwareSize(12, context)),topRight: Radius.circular(ScreenAwareHelper.screenAwareSize(12, context))),
                      child: Container(
                        color: bgMenuColor,
                        child: ExpansionTile(
                          backgroundColor: Color(0xFF263238),
                          title: Text('Elements'),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: RaisedButton(
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(ScreenAwareHelper.screenAwareSize(4, context))),
                                          splashColor: WaventBlue(),
                                          color: LightColor(),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('ALL'),
                                          ),
                                          onPressed:() {
                                            setState(() {
                                              isFireSelected = isEarthSelected=isWaterSelected=isWindSelected=false;
                                            });
                                          }
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                     Expanded(
                                       child: RaisedButton(
                                       shape: new RoundedRectangleBorder(
                                           borderRadius: new BorderRadius.circular(ScreenAwareHelper.screenAwareSize(4, context))),
                                       splashColor: bgButtonClickedColor,
                                       color: isFireSelected ? bgButtonClickedColor : bgButtonColor ,
                                       child:  Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Image.asset('images/SpellsImages/symbol_fire.png',height: ScreenAwareHelper.screenAwareSize(30, context),),
                                       ),
                                       onPressed:(){
                                         setState(() {
                                           isFireSelected = !isFireSelected;
                                         });
                                       }

                                       ,
                                     ),
                                     ),
                                     Expanded(
                                       child: RaisedButton(
                                         shape: new RoundedRectangleBorder(
                                             borderRadius: new BorderRadius.circular(ScreenAwareHelper.screenAwareSize(4, context))),
                                         splashColor: bgButtonClickedColor,
                                         color: isWindSelected ? bgButtonClickedColor : bgButtonColor ,
                                         child:  Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Image.asset('images/SpellsImages/symbol_wind.png',height: ScreenAwareHelper.screenAwareSize(30, context),),
                                         ),
                                           onPressed:(){
                                             setState(() {
                                               isWindSelected = !isWindSelected;
                                             });
                                           }
                                       ),
                                     ),
                                     Expanded(
                                       child: RaisedButton(
                                         shape: new RoundedRectangleBorder(
                                             borderRadius: new BorderRadius.circular(ScreenAwareHelper.screenAwareSize(4, context))),
                                         splashColor: bgButtonClickedColor,
                                         color: isWaterSelected ? bgButtonClickedColor : bgButtonColor ,
                                         child:  Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Image.asset('images/SpellsImages/symbol_water.png',height: ScreenAwareHelper.screenAwareSize(30, context),),
                                         ),
                                           onPressed:(){
                                             setState(() {
                                               isWaterSelected = !isWaterSelected;
                                             });
                                           }
                                       ),
                                     ),
                                     Expanded(
                                       child: RaisedButton(
                                         shape: new RoundedRectangleBorder(
                                             borderRadius: new BorderRadius.circular(ScreenAwareHelper.screenAwareSize(4, context))),
                                         splashColor: bgButtonClickedColor,
                                         color: isEarthSelected ? bgButtonClickedColor : bgButtonColor ,
                                         child:  Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Image.asset('images/SpellsImages/symbol_earth.png',height: ScreenAwareHelper.screenAwareSize(30, context),),
                                         ),
                                           onPressed:(){
                                             setState(() {
                                               isEarthSelected = !isEarthSelected;
                                             });
                                           }
                                       ),
                                     ),

                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
    Divider(height: 1,color: Colors.grey,),
    Container(
    color: bgMenuColor,
    child: ExpansionTile(
                    backgroundColor: Color(0xFF263238),
                    title: Text('Cout PA'),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SimpleRoundText(value: _lowerValue.toInt().toString()),
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                overlayColor: LightColor(),
                                activeTickMarkColor: Colors.transparent,
                                activeTrackColor: WaventBlue(),
                                inactiveTrackColor: Colors.red.withOpacity(0.3),
                                thumbColor: WaventBlue(),
                                valueIndicatorColor: Colors.teal,
                                showValueIndicator: ShowValueIndicator.never
                             //   ? ShowValueIndicator.always
                             //       : ShowValueIndicator.onlyForDiscrete,
                                ),
                              child: new RangeSlider(

                                min: 0.0,
                                max: 15.0,
                                lowerValue: _lowerValue,
                                upperValue: _upperValue,
                                divisions: 15,
                                valueIndicatorMaxDecimals: 1,
                                touchRadiusExpansionRatio: 2,
                                onChanged:
                                    (double newLowerValue, double newUpperValue) {
                                  setState(() {
                                    _lowerValue = newLowerValue;
                                    _upperValue = newUpperValue;
                                  });
                                },
                                onChangeStart:
                                    (double startLowerValue, double startUpperValue) {
                                  print(
                                      'Started with values: $startLowerValue and $startUpperValue');
                                },
                                onChangeEnd:
                                    (double newLowerValue, double newUpperValue) {
                                  print(
                                      'Ended with values: $newLowerValue and $newUpperValue');
                                },
                              ),
                            ),
                          ),
                          SimpleRoundText(
                              value: _upperValue.toInt().toString()),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  isfilterNullOrEmpty(String filter) {
    return filter == null || filter == "";
  }

  isDataBetweenPaValues(ResponseWavenApiSpell data) {
    return data.cost >= _lowerValue &&
        data.cost <= _upperValue;
  }

  isDataIsSelectedElement(ResponseWavenApiSpell data) {
    var boolToReturn = false;
    if(!isFireSelected && !isWindSelected && !isEarthSelected && !isWaterSelected) return true;
    if(isFireSelected && data.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Feu,
        orElse: () => Resource(quantity: 0))
        .quantity > 0)
      return true;
    if(isWindSelected && data.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Air,
        orElse: () => Resource(quantity: 0))
        .quantity > 0)
      return true;
    if(isWaterSelected &&  data.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Eau,
        orElse: () => Resource(quantity: 0))
        .quantity > 0)
      return true;
    if(isEarthSelected && data.resources
        .firstWhere((spellRes) => spellRes.element == ElementEnum.Terre,
        orElse: () => Resource(quantity: 0))
        .quantity > 0)
      return true;
    return boolToReturn;

  }

  void AnimatedIconToFellow() {
    debugPrint('taille list ' +spellListShow.length.toString());
    spellListShow.where((slot)=> slot == getEmptySlot()).length == 0?
      animatedIconController.reverse()
    :
      animatedIconController.forward();
  }
}
