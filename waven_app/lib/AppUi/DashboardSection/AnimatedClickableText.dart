import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/DashboardSection/DashboardPage.dart';

class AnimatedClickableText extends StatefulWidget {

  final String text;
  final Color startColor;
  final Color endColor;
  final Duration duration;
  final Function(DeckCategory) onChangedIndex;
  final DeckCategory category;
  const AnimatedClickableText({Key key, this.startColor:Colors.purple, this.endColor:Colors.teal, this.text:"Default text", this.duration : const Duration(milliseconds: 300), this.onChangedIndex, this.category}) : super(key: key);

  @override
  AnimatedClickableTextState createState() => AnimatedClickableTextState();
}

class AnimatedClickableTextState extends State<AnimatedClickableText> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _colorTween = ColorTween(begin: widget.startColor, end:widget.endColor)
        .animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) => FlatButton(
        child: Text(widget.text,style: TextStyle(color: _colorTween.value),),
        onPressed: () {
          if (_animationController.status == AnimationStatus.completed) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          setState(() {
            widget.onChangedIndex(widget.category);
          });
        },
      ),
    );
  }
  Future forwardMe()=> _animationController.forward();
  Future reverseMe ()=> _animationController.reverse();

}
