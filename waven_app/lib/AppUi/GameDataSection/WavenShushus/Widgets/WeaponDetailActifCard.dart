import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/CommonWidget/NumberSlider.dart';
import 'package:waven_app/AppUi/CommonWidget/TitleWavenWidget.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/Widgets/WeaponDetailEnterAnim.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiDetailledClass.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiDetailledSpell.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiSpell.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/widgets/NumberPicker.dart';

class WeaponDetailActifCard extends StatefulWidget {
  final Weapon weaponData;
  final WeaponDetailEnterAnim animation;

  WeaponDetailActifCard({Key key, this.weaponData, this.animation})
      : super(key: key);

  @override
  WeaponDetailActifCardState createState() {
    return new WeaponDetailActifCardState();
  }
}

class WeaponDetailActifCardState extends State<WeaponDetailActifCard> {
  int factor = 1;

  double informationCardHeight = 300;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: informationCardHeight,
        child: Column(
          children: <Widget>[
            Opacity(
              opacity: widget.animation.descWeaponOpacity.value,
              child: TitleWavenWidget(
                title: "Informations",
                leadingIconColor: WaventBlue(),
                titleColor: WaventBlue(),
                underLineColor: WaventBlue(),
                underLineWidth: widget.animation.dividerWidth.value,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                        elevation: 12,
                        color: DarkColor().withOpacity(0.50),
                      child: Container(
                    height: informationCardHeight/3,
                    child: _buildPickLevelWeapon(),
                )),
                  )),
              ],
            ),
           Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 12,
                        color: DarkColor().withOpacity(0.50),
                        child: _buildStatsWidget(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 12,
                        color: DarkColor().withOpacity(0.50),
                        child: _buildActiveSpell(),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  _buildSliderLevel() {
    return LayoutBuilder(builder: (context, constraints) {
      return NumberSlider(
        width: constraints.maxWidth,
        maxValue: 10,
        minValue: 1,
        value: factor,
        onChanged: (value) => onChangedSliderValue(value),
      );
    });
  }

  onChangedSliderValue(int value) {
    setState(() {
      factor = value;
    });
  }

  _buildPickLevelWeapon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.trending_up,
                  color: WaventBlue(),
                ),
                SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  'Niveau d\'arme : ',
                  style: TextStyle(color: WaventBlue(), fontSize: 18),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: Container(
                  color: Colors.black38,
                  height: 40,
                  width: 120,
                  child: _buildSliderLevel()),
            ),
          ],
        ),
      ),
    );
  }

  _buildStatsWidget() {
    return Opacity(
      opacity: widget.animation.descWeaponOpacity.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('images/ShushuStatUi/icon_life.png'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text((12 + 8 * factor).toString()),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('images/ShushuStatUi/icon_attack.png'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text((7 + (factor / 2).round()).toString()),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('images/ShushuStatUi/icon_movement.png'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(3.toString()),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildActiveSpell() {
//    return FutureBuilder<ResponseWavenApiDetailledSpell>(
//        future: WavenApiProvider.GetSpellDetailFromSpellId(widget.weaponData.spells[0]),
//        builder: (context, snapshot) {
//          if (snapshot.hasError) print(snapshot.error);
//          if (!snapshot.hasData) {
//            return Center(child: CircularProgressIndicator());
//          } else {
//            return new Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//               Text(snapshot.data.name),
//
//               Expanded(
//                 child: CachedNetworkImage(
//
//                   imageUrl: snapshot.data.iconUrl,
//                   fit: BoxFit.cover,
//                   placeholder: new Center(
//                     child: new CircularProgressIndicator(),
//                   ),
//                   errorWidget: new Icon(Icons.error),
//                 ),
//               ),
//                AutoSizeText(snapshot.data.description,maxLines: 3,)
//              ],
//            );
//          }
//        });
  }
}
