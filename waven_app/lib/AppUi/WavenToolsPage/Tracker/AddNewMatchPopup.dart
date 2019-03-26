import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/CommonWidget/RadioToggleButton.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/Database/Models/HistoDeckDbModel.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiWeapons.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';

class AddNewMatchPopup extends StatefulWidget {
  final String imageUrl;
  final Text title;
  final Text description;
  final bool onlyOkButton;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final double buttonRadius;
  final double cornerRadius;
  final void Function(HistoDeckDbModel dataToSave) onOkButtonPressed;

  AddNewMatchPopup({
    Key key,
    @required this.imageUrl,
    @required this.title,
    @required this.onOkButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor,
    this.buttonCancelColor,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(imageUrl != null),
        assert(title != null),
        super(key: key);

  @override
  _AddNewMatchPopupState createState() => _AddNewMatchPopupState();
}

class _AddNewMatchPopupState extends State<AddNewMatchPopup>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            DashboardTitleCat(
                titleCat: "Enregistre un résultat",
                underlineColor: mainYellow(),
                centerTitle: true,
                isMoreShowed: false),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8 / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: UsWeaponSelection(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8 / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: ThemWeaponSelection(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: !widget.onlyOkButton
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: <Widget>[
                  !widget.onlyOkButton
                      ? RaisedButton(
                          color: widget.buttonCancelColor ?? Colors.grey,
                    textColor: mainDarkBlue(),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(widget.buttonRadius)),
                          onPressed: () => Navigator.of(context).pop(),
                          child: widget.buttonCancelText ??
                              Text(
                                'Cancel',
                                style: TextStyle(color: mainDarkBlue()),
                              ),
                        )
                      : Container(),
                  RaisedButton(
                    color: widget.buttonOkColor ?? mainYellow(),
                    textColor: mainDarkBlue(),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.buttonRadius)),
                    onPressed: (){
                      HistoDeckDbModel dataToSave = new HistoDeckDbModel();
                      setState(() {
                        debugPrint('weaponIdUs ${weaponIdUs} weaponIdThem ${weaponIdThem} allWeaponsData[weaponIdUs].id ${allWeaponsData[weaponIdUs].id}' );
                        dataToSave.weaponsUsId = allWeaponsData[weaponIdUs].name;
                        dataToSave.weaponsThemId = allWeaponsData[weaponIdThem].name;
                        dataToSave.winnerSide = commonRadioWinnerValue;
                        dataToSave.savedDate = DateTime.now().toIso8601String();
                        dataToSave.matchMode = "1v1";
                        dataToSave.pseudoUs = "Us";
                        dataToSave.pseudoThem ="Un noob";
                        dataToSave.imageUsUrl = allWeaponsData[weaponIdUs].imageUrl;
                        dataToSave.imageThemUrl = allWeaponsData[weaponIdThem].imageUrl;
                      });
                      widget.onOkButtonPressed(dataToSave);
                      Navigator.of(context).pop();
                    },
                    child: widget.buttonOkText ??
                        Text(
                          'Save',
                          style: TextStyle(color: mainDarkBlue()),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    this._getAllWeapons();
    super.initState();
  }

  Future _getAllWeapons() async {
    var weapons = await WavenApiProvider.GetAllWeapons();
    this.setState(() {
      allWeaponsData = weapons;
    });
  }

  List<ResponseWavenApiWeapon> allWeaponsData =
      new List<ResponseWavenApiWeapon>();
  var weaponIdUs = 0;
  var weaponIdThem = 0;
  var commonRadioWinnerValue = "Us"; // Us or Them
  UsWeaponSelection() {
    if (allWeaponsData == null || allWeaponsData.length == 0)
      return SnapshotLoadingIndicator();
    else {
      return Column(
        children: <Widget>[
          Text('Toi',style: TextStyle(fontSize: 18),),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Carousel(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    type: "slideswiper",
                    //  "simple", "slideswiper", "xrotating", "yrotating", "zrotating", "multirotating"
                    indicatorType: "bar",
                    // "bar", "dot", "bubble"
                    arrowColor: Colors.white,
                    axis: Axis.horizontal,
                    showArrow: true,
                    showIndicator: false,
                    onPageChange: (int index) {
                      setState(() {
                        //weaponName = allWeaponsData[index].name;
                        weaponIdUs = index;
                      });
                    },
                    children: List.generate(
                        allWeaponsData.length,
                        (i) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CachedNetworkImage(
                              imageUrl: allWeaponsData[i].imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => SnapshotLoadingIndicator(),
                              errorWidget: (context, url, error) => new Icon(Icons.error),
                            ))));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: RadioToggleButton(
              text: 'Winner',
              buttonRadioValue: "Us",
              commonRadioValue: commonRadioWinnerValue,
              onChange: updateCommonRadioValue,
            ),
          )
        ],
      );
    }
  }

  ThemWeaponSelection() {
    if (allWeaponsData == null || allWeaponsData.length == 0)
      return SnapshotLoadingIndicator();
    else {
      return Column(
        children: <Widget>[
          Text('Lui',style: TextStyle(fontSize: 18),),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Carousel(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    type: "slideswiper",
                    //  "simple", "slideswiper", "xrotating", "yrotating", "zrotating", "multirotating"
                    indicatorType: "bar",
                    // "bar", "dot", "bubble"
                    arrowColor: Colors.white,
                    axis: Axis.horizontal,
                    showArrow: true,
                    showIndicator: false,
                    onPageChange: (int index) {
                      setState(() {
                        //weaponName = allWeaponsData[index].name;
                        weaponIdThem = index;
                      });
                    },
                    children: List.generate(
                        allWeaponsData.length,
                        (i) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CachedNetworkImage(
                              imageUrl: allWeaponsData[i].imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => SnapshotLoadingIndicator(),
                              errorWidget: (context, url, error) => new Icon(Icons.error),
                            ))));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: RadioToggleButton(
              text: 'Winner',
              buttonRadioValue: "Them",
              commonRadioValue: commonRadioWinnerValue,
              onChange: updateCommonRadioValue,
            ),
          )
        ],
      );
    }
  }

  void updateCommonRadioValue(String activeRadioValue) {
    setState(() {
      commonRadioWinnerValue = activeRadioValue;
    });
  }
}
