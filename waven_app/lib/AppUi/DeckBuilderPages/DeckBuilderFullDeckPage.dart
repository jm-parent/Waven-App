import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/CommonWidget/ElementalWavenWidget.dart';
import 'package:waven_app/AppUi/DeckBuilderPages/SpellIconWidget.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderModel.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiFellow.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiSpell.dart';
import 'package:waven_app/AppUi/Utils/ThemeHelper.dart';
import 'package:waven_app/AppUi/Utils/widget_utils.dart';

class DeckBuilderFullDeckPage extends StatefulWidget {
  final DeckBuilderModel deckData;
  final List<ResponseWavenApiSpell> spellList;
  final List<ResponseWavenApiFellow> fellowList;
  const DeckBuilderFullDeckPage({Key key, this.deckData, this.spellList, this.fellowList})
      : super(key: key);

  @override
  _DeckBuilderFullDeckPageState createState() =>
      _DeckBuilderFullDeckPageState();
}

class _DeckBuilderFullDeckPageState extends State<DeckBuilderFullDeckPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Container(
                  color: WaventBlue(),
                )),
                Column(
                  children: <Widget>[
                    _buildWeaponBloc(),
                    _buildSkillBloc(),
                    _buildFellowBloc(),
                  ],
                )
              ],
            ),
          )),
    );
  }
  var blocPadding = const EdgeInsets.symmetric(horizontal:4.0,vertical: 2);
  _buildWeaponBloc() {
    return Expanded(
      child: Padding(
        padding: blocPadding,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }

  _buildSkillBloc() {
    return Expanded(
      child: Padding(
        padding: blocPadding,
        child: Stack(
          children: <Widget>[
           // Positioned.fill(child: Container(decoration: GradientDeckBuild(),)),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_water.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_wind.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_earth.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_fire.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildSpell(0),
                      _buildSpell(1),
                      _buildSpell(2),
                      _buildSpell(3),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildSpell(4),
                      _buildSpell(5),
                      _buildSpell(6),
                      _buildSpell(7),
                    ],
                  )
                ]),
          ],
        ),
      ),
    );
  }

  _buildFellowBloc() {
    return Expanded(
      child: Padding(
        padding: blocPadding,
        child: Stack(
          children: <Widget>[
//            Positioned.fill(child: Container(
//              decoration: GradientDeckBuild(),
//            )),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_water.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_wind.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_earth.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                      ElementalWavenWidget(
                        imageChild: Image.asset(
                            'images/SpellsImages/symbol_fire.png',
                            height: ScreenAwareHelper.screenAwareSize(40, context)),
                        textChild: 0.toString(),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildFellow(0),
                      _buildFellow(1),
                      _buildFellow(2),
                      _buildFellow(3),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildFellow(4),
                      _buildFellow(5),
                      _buildFellow(6),
                      _buildFellow(7),
                    ],
                  )
                ]),
          ],
        ),
      ),
    );
  }

  _buildSpell(int index) {
    return SpellIconWidget(
        dataSpell: widget.spellList[index],
        width: ScreenAwareHelper.screenAwareSize(50, context),
        height: ScreenAwareHelper.screenAwareSize(50, context));
  }

  _buildFellow(int i) {
    return Image.asset(widget.fellowList[i].iconUrl,height: 50,);
  }
}
