import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/CommonWidget/CarouselSlider.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/Database/Models/RecordMatchCardQuestion.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiWeapons.dart';
import 'package:waven_app/AppUi/Utils/widget_utils.dart';
import 'package:waven_app/AppUi/WavenToolsPage/CustomRadioButton.dart';

import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';

class RecordNewMatchPage extends StatefulWidget {
  @override
  _RecordNewMatchPageState createState() => _RecordNewMatchPageState();
}

class _RecordNewMatchPageState extends State<RecordNewMatchPage> {
  var selectedMyClass = "";
  var selectedHisClass = "";

  @override
  void initState() {
    this._getAllWeapons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    containerClassPickHeight =
        ScreenAwareHelper.screenAwareSize(300.0, context);
    containerCommentayHeight =
        ScreenAwareHelper.screenAwareSize(400.0, context);
    return Scaffold(
      backgroundColor: mainDarkBlueL1(),
      appBar: AppBar(
        title: Text("Enregistrement d'un match"),
        backgroundColor: mainDarkBlue(),
      ),
      body: ListView(
        children: <Widget>[
          buildGameModePicker(),
          buildQuestionsByGame(),
//            buildCardPickMyWeapon(),
//            buildCardPickHisWeapon(),
//            buildMoreInfos(),
          SizedBox(
            height: 70.0,
          )
        ],
      ),
    );
  }

  buildQuestionsByGame() {
    var childToReturn;
    switch (_selectedMode.toLowerCase()) {
      case '1v1':
        setState(() {
          childToReturn = DuelMatchRecord();
        });
        break;
      case '2v2':
        setState(() {
          childToReturn = Container();
        });
        break;
      case '3v3':
        setState(() {
          childToReturn = Container();
        });
        break;
      case '4vBoss':
        setState(() {
          childToReturn = Container();
        });
        break;
      default:
        setState(() {
          childToReturn = Container();
        });
        ;
    }
    return childToReturn;
  }

  var containerClassPickHeight;
  var containerCommentayHeight;

  buildCardPickMyWeapon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: AnimatedContainer(
          color: mainDarkBlueD1(),
          duration: Duration(milliseconds: 400),
          height: containerClassPickHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                DashboardTitleCat(
                    titleCat: 'Quelle arme as tu joué ? (*)',
                    pageToNavigate: null,
                    titleFontSize: 19,
                    underlineColor: mainYellow(),
                    isMoreShowed: false),
//              Expanded(
//                flex: 2,
//                child: WavenClassPickerFilter(callbackClassTapped: (valueTapped)=>updateClassPicked(valueTapped),selectedClass: selectedMyClass,),
//              ),
                Expanded(flex: 5, child: UsWeaponSelection()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCardPickHisWeapon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: AnimatedContainer(
          color: mainDarkBlueD1(),
          duration: Duration(milliseconds: 400),
          height: containerClassPickHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                DashboardTitleCat(
                    titleCat: 'Quelle arme a-t-il joué ? (*)',
                    pageToNavigate: null,
                    titleFontSize: 19,
                    underlineColor: mainYellow(),
                    isMoreShowed: false),
//              Expanded(
//                flex: 2,
//                child: WavenClassPickerFilter(callbackClassTapped: (valueTapped)=>updateHisClassPicked(valueTapped),selectedClass: selectedHisClass,),
//              ),
                Expanded(flex: 5, child: HisWeaponSelection()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _getAllWeapons() async {
    var weapons = await WavenApiProvider.GetAllWeapons();
    this.setState(() {
      allWeaponsData = weapons;
    });
  }

  updateMyClassPicked(String valueTapped) {
    setState(() {
      selectedMyClass = valueTapped;
    });
  }

  updateHisClassPicked(String valueTapped) {
    setState(() {
      selectedHisClass = valueTapped;
    });
  }

  List<ResponseWavenApiWeapon> allWeaponsData =
      new List<ResponseWavenApiWeapon>();

  UsWeaponSelection() {
    if (allWeaponsData == null || allWeaponsData.length == 0)
      return SnapshotLoadingIndicator();
    else {
      // TODO quand l'api aura un champ indiquant la Classe de l'amre
      // var filteredCarouselItems = allWeaponsData.where((weapon)=>weapon.name.toLowerCase() == selectedMyClass.toLowerCase());
      return CarouselSlider(
          viewportFraction: 0.5,
          withDisto: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int index) {
            setState(() {
              debugPrint('${index} sélectionné');
              debugPrint('${allWeaponsData[index].id} sélectionné');
              debugPrint('${allWeaponsData[index].name} sélectionné');
              //weaponName = allWeaponsData[index].name;
              //weaponIdUs = index;
            });
          },
          items: List.generate(
              allWeaponsData.length,
              (i) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CachedNetworkImage(
                    imageUrl: allWeaponsData[i].imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SnapshotLoadingIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ))));
    }
  }

  HisWeaponSelection() {
    if (allWeaponsData == null || allWeaponsData.length == 0)
      return SnapshotLoadingIndicator();
    else {
      // TODO quand l'api aura un champ indiquant la Classe de l'amre
      // var filteredCarouselItems = allWeaponsData.where((weapon)=>weapon.name.toLowerCase() == selectedMyClass.toLowerCase());
      return CarouselSlider(
          viewportFraction: 0.5,
          withDisto: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int index) {
            setState(() {
              debugPrint('${index} sélectionné');
              debugPrint('${allWeaponsData[index].id} sélectionné');
              debugPrint('${allWeaponsData[index].name} sélectionné');
              //weaponName = allWeaponsData[index].name;
              //weaponIdUs = index;
            });
          },
          items: List.generate(
              allWeaponsData.length,
              (i) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CachedNetworkImage(
                    imageUrl: allWeaponsData[i].imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SnapshotLoadingIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ))));
    }
  }


  var _selectedMode = "1v1";
  buildGameModePicker() {
    return RecordMatchCardQuestion(
      question: "Quel mode de jeu ?",
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              width: ScreenAwareHelper.screenAwareSize(80, context),
              child: CustomRadioButton(
                child: Text("1v1"),
                myValue: "1v1",
                groupedValue: _selectedMode,
                callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                bgButtonClickedColor: mainYellowD1(),
              )),
          Container(
              width: ScreenAwareHelper.screenAwareSize(80, context),
              child: CustomRadioButton(
                child: Text("2v2"),
                myValue: "2v2",
                groupedValue: _selectedMode,
                callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                bgButtonClickedColor: mainYellowD1(),
              )),
          Container(
              width: ScreenAwareHelper.screenAwareSize(80, context),
              child: CustomRadioButton(
                child: Text("3v3"),
                myValue: "3v3",
                groupedValue: _selectedMode,
                callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                bgButtonClickedColor: mainYellowD1(),
              )),
          Container(
              width: ScreenAwareHelper.screenAwareSize(80, context),
              child: CustomRadioButton(
                child: Text("4vBoss"),
                myValue: "4vBoss",
                groupedValue: _selectedMode,
                callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                bgButtonClickedColor: mainYellowD1(),
              )),
        ],
      ),
    );
  }

  updateGameModePicked(String pickedValue) {
    setState(() {
      _selectedMode = pickedValue;
    });
    debugPrint("selectedmode = ${_selectedMode}");
  }

  var _selectedClass = "Iop";

  DuelMatchRecord() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: Column(
        children: <Widget>[
          RecordMatchCardQuestion(
              question: "Quel arme as-tu joué ?",
              height: 300,
              child: CarouselSlider(
                  viewportFraction: 0.45,
                  withDisto: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int index) {
                    setState(() {
                      debugPrint('${index} sélectionné');
                    });
                  },
                  items: List.generate(
                      5,
                      (i) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            'images/WavenClientRessources/${_selectedClass}/SpriteEntier/chara_select_${_selectedClass.toLowerCase()}_0${i + 1}.png',
                            fit: BoxFit.cover,
                          ))))),
          buildHisNameCard(),
          RecordMatchCardQuestion(
              question: "Quel arme ton adversaire a-t-il joué ?",
              height: 300,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          width: ScreenAwareHelper.screenAwareSize(80, context),
                          child: CustomRadioButton(
                            child: Column(children: <Widget>[
                              Text('Iop'),
                              Image.asset('images/WavenClientRessources/Dieu/statue/IOP_UIStatue.png',height: 50,)
                            ],),
                            myValue: "iop",
                            groupedValue: _selectedClass,
                            callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                            bgButtonClickedColor: mainYellowD1(),
                          )),
                      Container(
                          width: ScreenAwareHelper.screenAwareSize(80, context),
                          child: CustomRadioButton(
                            child: Text("2v2"),
                            myValue: "2v2",
                            groupedValue: _selectedMode,
                            callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                            bgButtonClickedColor: mainYellowD1(),
                          )),
                      Container(
                          width: ScreenAwareHelper.screenAwareSize(80, context),
                          child: CustomRadioButton(
                            child: Text("3v3"),
                            myValue: "3v3",
                            groupedValue: _selectedMode,
                            callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                            bgButtonClickedColor: mainYellowD1(),
                          )),
                      Container(
                          width: ScreenAwareHelper.screenAwareSize(80, context),
                          child: CustomRadioButton(
                            child: Text("4vBoss"),
                            myValue: "4vBoss",
                            groupedValue: _selectedMode,
                            callbackTap: (pickedValue) => updateGameModePicked(pickedValue),
                            bgButtonClickedColor: mainYellowD1(),
                          )),
                    ],
                  ),
                  Expanded(
                    child: CarouselSlider(
                        viewportFraction: 0.45,
                        withDisto: true,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (int index) {
                          setState(() {
                            debugPrint('${index} sélectionné');
                          });
                        },
                        items: List.generate(
                            5,
                                (i) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(
                                  'images/WavenClientRessources/${_selectedClass}/SpriteEntier/chara_select_${_selectedClass.toLowerCase()}_0${i + 1}.png',
                                  fit: BoxFit.cover,
                                )))),
                  ),
                ],
              )),
          buildCommentaryCard(),
        ],
      ),
    );
  }


  FocusNode _nodeMatchHisName = FocusNode();
  buildHisNameCard() {
    return RecordMatchCardQuestion(
      question: "Quel est le pseudo de ton adversaire ?",
      height: 150,
      child: Center(
        child: TextField(
          maxLines: 1,
          //onChanged: (newValue) => weaponModel.actifDesc = newValue,
          focusNode: _nodeMatchHisName,
          cursorColor: mainYellow(),
          decoration: InputDecoration(
            fillColor: mainDarkBlueD1(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: mainYellow()),
            ),
            labelStyle: TextStyle(color: mainYellow()),
            hintStyle: TextStyle(color: mainYellow()),
            filled: true,
            labelText: 'Son Pseudo',
          ),
        ),
      ),
    );
  }

  FocusNode _nodeMatchCommentary = FocusNode();
  buildCommentaryCard() {
    return  RecordMatchCardQuestion(
      question: "Un commentaire sur le match ? ",
      height: 150,
      child:  TextField(
        maxLines: 4,
        //onChanged: (newValue) => weaponModel.actifDesc = newValue,
        focusNode: _nodeMatchCommentary,
        cursorColor: mainYellow(),
        decoration: InputDecoration(
          fillColor: mainDarkBlueD1(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainYellow()),
          ),
          labelStyle: TextStyle(color: mainYellow()),
          hintStyle: TextStyle(color: mainYellow()),
          filled: true,
          labelText: 'Commentaires',
        ),
      ),
    );
  }
}
