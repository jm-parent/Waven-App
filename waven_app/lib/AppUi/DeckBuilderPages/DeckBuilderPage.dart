import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:waven_app/AppUi/Models/SpellsWavenApiModel.dart';

class DeckBuilderPage extends StatefulWidget {
  @override
  _DeckBuilderPageState createState() => _DeckBuilderPageState();
}

class _DeckBuilderPageState extends State<DeckBuilderPage> with TickerProviderStateMixin{
  //List<CachedNetworkImage> spellListShow;
  List<SpellsWavenApiModel> spellListShow;
  String urlEmptyDragTarget = 'https://imgur.com/IXhxlw4.png';
  String url = 'https://waven-api.synedh.fr/spells';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('Xeno:superpassword'));

  Future<List<SpellsWavenApiModel>> getSpells() async {
    List<SpellsWavenApiModel> data;

    var response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json", 'authorization': basicAuth});
    return spellsWavenApiModelFromJson(response.body);
  }

  @override
  void initState() {
    this.getSpells();
    spellListShow = List<SpellsWavenApiModel>();
    resetSpellListTarget();
    _scrollController = ScrollController()
      ..addListener(() {
        _setDialVisible(_scrollController.position.userScrollDirection == ScrollDirection.forward);
      });
  }
  _setDialVisible(bool value) {
    setState(() {
      _dialVisible = value;
    });
  }
  ScrollController _scrollController;
  bool _dialVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deck builder 0.0.1'),
        ),
        floatingActionButton: _buildDeckBuilderSpeedDial(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 8,
                    child: _buildVerticalSpellList(),
                  ),
                ),
              ),
              Expanded(
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Container(
                        color: Colors.black54,
                        child: Column(children: <Widget>[
                          Text('Sorts'),
                          SizedBox(
                            height: 4,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            spacing: 4,
                            runSpacing: 4,
                            //75x75
                            children: <Widget>[
                              _buildDragTarget(0),
                              _buildDragTarget(1),
                              _buildDragTarget(2),
                              _buildDragTarget(3),
                              _buildDragTarget(4),
                              _buildDragTarget(5),
                              _buildDragTarget(6),
                              _buildDragTarget(7),
                            ],
                          ),
                        ])),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  var spellIconSize = 70.0;

  _buildVerticalSpellList() {
    return FutureBuilder(
      future: getSpells(),
      builder: (BuildContext context,
          AsyncSnapshot<List<SpellsWavenApiModel>> snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text('Loading...'),
            ),
          );
        }
        return ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return LongPressDraggable(
                data: snapshot.data[index],
                child: getDetailledSpellSlotWithGesture(
                    snapshot.data[index], 1, index),
                feedback:
                    getSpellSlotWithGesture(snapshot.data[index], 1.3, index),
                childWhenDragging: Container(),
              );
            });
      },
    );
  }

  _buildHorizontalSpellList() {
    return FutureBuilder(
      future: getSpells(),
      builder: (BuildContext context,
          AsyncSnapshot<List<SpellsWavenApiModel>> snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text('Loading...'),
            ),
          );
        }
        return ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return LongPressDraggable(
                data: snapshot.data[index],
                child: getSpellSlotWithGesture(snapshot.data[index], 1, index),
                feedback:
                    getSpellSlotWithGesture(snapshot.data[index], 1.3, index),
                childWhenDragging: Container(),
              );
            });
      },
    );
  }

  _buildDragTarget(int indexSpell) {
    return GestureDetector(
      onTap: () => swapSpell(indexSpell),
      onDoubleTap: () => resetSpellListTile(indexSpell),
      child: DragTarget<SpellsWavenApiModel>(
        builder: (context, List<dynamic> candidateData, rejectedData) {
          return getImageFromSpellData(spellListShow[indexSpell]);
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
        },
      ),
    );
  }

  void resetSpellListTile(int index) {
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
  getEmptySpellModel(){
    return new SpellsWavenApiModel(iconUrl: urlEmptyDragTarget);
  }
  CachedNetworkImage getImageFromSpellData(SpellsWavenApiModel data) {
    return new CachedNetworkImage(
      width: spellIconSize,
      height: spellIconSize,
      imageUrl: data.iconUrl,
      fit: BoxFit.cover,
      placeholder: new Center(
        child: new CircularProgressIndicator(),
      ),
      errorWidget: new Icon(Icons.error),
    );
  }


  addSpellToBar(SpellsWavenApiModel data, int index) {
    debugPrint("Dans addspelltobar : ${data.name} & ${index.toString()}");
    var indexFirst = spellListShow
        .indexWhere((spell) => spell.iconUrl == urlEmptyDragTarget);

    debugPrint("Dans addspelltobar : ${data.name} & ${indexFirst.toString()}");
    if (indexFirst != -1) //Si on a trouvé un élément
    {
      setState(() {
        spellListShow.removeAt(indexFirst);
        spellListShow.insert(indexFirst, data);
      });
    }
  }

  void replaceSpellByIndex(int index, SpellsWavenApiModel widget) {
    setState(() {
      spellListShow.removeAt(index);
      spellListShow.insert(index, widget);
    });
  }

  CachedNetworkImage getEmptySlot() {
    return new CachedNetworkImage(
      width: spellIconSize,
      height: spellIconSize,
      imageUrl: urlEmptyDragTarget,
      fit: BoxFit.cover,
      placeholder: new Center(
        child: new CircularProgressIndicator(),
      ),
      errorWidget: new Icon(Icons.error),
    );
  }

  getDetailledSpellSlotWithGesture(
      SpellsWavenApiModel data, double factor, int index) {
    return GestureDetector(
      onTap: () => addSpellToBar(data, index),
      child: getDetailledSpellSlot(data, index),
    );
  }

  Widget getDetailledSpellSlot(SpellsWavenApiModel data, int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        color: Colors.black54,
        child: ListTile(
          title: AutoSizeText(
            data.name,
            style: Theme.of(context).textTheme.title,
            maxLines: 1,
            maxFontSize: 15,
          ),
          subtitle: AutoSizeText(
            data.description,
            style: Theme.of(context).textTheme.subtitle,
            maxLines: 4,
            maxFontSize: 12,
            minFontSize: 7,
          ),
          leading: new CachedNetworkImage(
            width: 40,
            height: 50,
            imageUrl: data.iconUrl,
            fit: BoxFit.cover,
            placeholder: new Center(
              child: new CircularProgressIndicator(),
            ),
            errorWidget: new Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  getSpellSlotWithGesture(SpellsWavenApiModel data, double factor, int index) {
    return GestureDetector(
      onTap: () => addSpellToBar(data, index),
      child: getSpellSlot(data, factor, index),
    );
  }

  CachedNetworkImage getSpellSlot(
      SpellsWavenApiModel data, double factor, int index) {
    return new CachedNetworkImage(
      width: spellIconSize * factor,
      height: spellIconSize * factor,
      imageUrl: data.iconUrl,
      fit: BoxFit.cover,
      placeholder: new Center(
        child: new CircularProgressIndicator(),
      ),
      errorWidget: new Icon(Icons.error),
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

  _buildDeckBuilderSpeedDial() {
    return  SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      visible: _dialVisible,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            child: Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            foregroundColor: Colors.black,
            label: 'Share DeckCode',
            labelBackgroundColor: Colors.black54,
            onTap: () => _ShareBuildCode()
        ),

      ],
    );
  }

  _ShareBuildCode() {
    var code = "[";
    spellListShow.forEach((spell) => code+= '${spell.name},');
    code.substring(code.length-1);
    code+=']';
    Share.share("Regarde mon deck : ${code}");
  }

}
