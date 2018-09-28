import 'package:waven_app/SpellBuilderWidgets/CardTitle.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostSlider.dart';
import 'package:waven_app/util/widget_utils.dart';
import 'package:flutter/material.dart';

class SpellCostCard extends StatefulWidget {

  final int initialWeight;

  const SpellCostCard({Key key, this.initialWeight}) : super(key: key);

  @override
  _SpellCostCardState createState() => _SpellCostCardState();
}

class _SpellCostCardState extends State<SpellCostCard> {

  int weight;

  @override
  void initState() {
    super.initState();
    weight = widget.initialWeight ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: ScreenAwareHelper.screenAwareSize(20.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardTitle("Cout du sort", subtitle: "(PA)"),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _drawSlider(),
                ),
              ),
            ), //TODO: draw slider
          ],
        ),
      ),
    );
  }


  Widget _drawSlider() {
    return SpellCostBackground(
      child: LayoutBuilder(
        builder: (context, constraints) =>
            SpellCostSlider(
              minValue: 0,
              maxValue: 12,
              value: weight,
              onChanged: (val) => setState(() => weight = val),
              width: constraints.maxWidth,
            ),
      ),
    );
  }
}


class SpellCostBackground extends StatelessWidget {
  final Widget child;

  const SpellCostBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: ScreenAwareHelper.screenAwareSize(50.0, context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 0.3),
            borderRadius:
            new BorderRadius.circular(ScreenAwareHelper.screenAwareSize(3.0, context)),
          ),
          child: child,
        ),
        new Icon(
          Icons.arrow_upward,
          size: ScreenAwareHelper.screenAwareSize(15.0, context),
          color: Color.fromRGBO(49, 84, 129, 1.0),
        )
      ],
    );
  }
}