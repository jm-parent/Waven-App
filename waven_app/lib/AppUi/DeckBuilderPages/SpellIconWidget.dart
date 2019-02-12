import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiSpell.dart';
import 'package:waven_app/widgets/ShadowText.dart';

class SpellIconWidget extends StatelessWidget {
  final ResponseWavenApiSpell dataSpell;
  final double width;
  final double height;
  const SpellIconWidget({Key key,
    this.dataSpell,
    this.width : 40,
    this.height : 50
  }) :
      assert(dataSpell != null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5),
        child: new CachedNetworkImage(
          width: width,
          height: height,
          imageUrl: dataSpell.iconUrl,
          fit: BoxFit.cover,
          placeholder: new Center(
            child: new CircularProgressIndicator(),
          ),
          errorWidget: new Icon(Icons.error),
        ),
      ),
      dataSpell.cost == null ? SizedBox(height: height/2,):
      Stack(alignment: Alignment.center, children: <Widget>[
        Image.asset(
          'images/SpellsImages/spell_pa_icon.png',
          height: height/2,
        ),
        ShadowText(
          dataSpell.cost.toString(),
          style: TextStyle(fontSize: 17.0),
        ),
      ])
    ]);
  }
}
