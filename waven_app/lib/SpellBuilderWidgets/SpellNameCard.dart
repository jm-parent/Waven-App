import 'package:waven_app/SpellBuilderWidgets/CardTitle.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostSlider.dart';
import 'package:waven_app/util/widget_utils.dart';
import 'package:flutter/material.dart';

class SpellNameCard extends StatelessWidget {

  int weight;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: ScreenAwareHelper.screenAwareSize(20.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardTitle("Nom du sort", subtitle: ""),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SpellNameField(),
                ),
              ),
            ), //TODO: draw slider
          ],
        ),
      ),
    );
  }



}


class SpellNameField extends StatelessWidget {
  final Widget child;

  const SpellNameField({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new TextField();
  }
}