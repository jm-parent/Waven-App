import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';

class RecordMatchCardQuestion extends StatefulWidget {
  final double height;
  final Widget child;
  final String question;

  const RecordMatchCardQuestion(
      {Key key, this.height:100, this.child, this.question})
      : super(key: key);

  @override
  _RecordMatchCardQuestionState createState() =>
      _RecordMatchCardQuestionState();
}

class _RecordMatchCardQuestionState extends State<RecordMatchCardQuestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: AnimatedContainer(

                color: mainDarkBlueD1(),
                duration: Duration(milliseconds: 400),
                height: widget.height,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        DashboardTitleCat(
                            titleCat: widget.question,
                            pageToNavigate: null,
                            titleFontSize: 19,
                            underlineColor: mainYellow(),
                            isMoreShowed: false),
                        Expanded(
                          child: widget.child,
                        )
                      ],
                    )))));
  }
}
