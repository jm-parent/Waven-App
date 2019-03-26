import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/CardFlipperModel.dart';

class CardFlipperItem extends StatelessWidget {
  final CardFlipperModel viewModel;
  final double parallaxPercent; // [0.0, 1.0] (0.0 for all the way right, 1.0 for all the way left)

  CardFlipperItem({
    this.viewModel,
    this.parallaxPercent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Background
        new ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: new Container(
            child: new FractionalTranslation(
              translation: new Offset(parallaxPercent * 3.0, 0.0),
              child: new OverflowBox(
                maxWidth: double.infinity,
                child: new Image.asset(
                  viewModel.backdropAssetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        // Content
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: new Text(
                '${viewModel.title}',
                style:TextStyle(
                fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                fontFamily: "BebasNeue",
                letterSpacing: 2),
              ),
            ),
            new Expanded(child: new Container()),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
              child: new Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(30.0),
                  border: new Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: RaisedButton(
                  color: Colors.transparent,
                  onPressed: (){
                    _NavigateToDetail(viewModel,context);
                  },
                  child: new Text(
                    'En savoir plus ...',
                    style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'petita',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void _NavigateToDetail(CardFlipperModel viewModel, BuildContext context) {

}