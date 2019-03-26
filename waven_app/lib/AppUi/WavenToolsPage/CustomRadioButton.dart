import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final String groupedValue;
  final String myValue;
  final Color bgButtonColor;
  final Color bgButtonClickedColor;
  final Function(String) callbackTap;
  final Widget child;
  final double width;
  const CustomRadioButton({Key key, this.groupedValue, this.myValue, this.bgButtonColor :const Color(0xFF37474F), this.bgButtonClickedColor : const  Color(0xFF4c626d), this.child, this.callbackTap, this.width:0}) : super(key: key);
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {

  @override
  Widget build(BuildContext context) {
    var isMe = widget.groupedValue.toLowerCase() == widget.myValue.toLowerCase();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        child:  ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: AnimatedContainer(
            height: 100,
            duration: Duration(milliseconds: 300),
            color: isMe ? widget.bgButtonClickedColor : widget.bgButtonColor ,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(child: widget.child),
            ),
          ),
        ),
        onTap:(){
         widget.callbackTap(widget.myValue.toLowerCase());
        }
        ,
      ),
    );
  }
}
