import 'package:flutter/material.dart';

enum ToggleButtonAlignment { verticle, horizontal }

class RadioToggleButton extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color textColor;
  final String text;
  final Color textDeactivatedColor;
  final Color deactivatedColor;
  final ToggleButtonAlignment axis;
  final double borderRadius;
  final void Function(String activeRadioValue) onChange;
  final bool initialValue;
  final List<BoxShadow> boxShadow;
  final Duration duration;
  final String commonRadioValue;
  final String buttonRadioValue;

  RadioToggleButton(
      {this.size: 15.0,
      this.backgroundColor: Colors.green,
      this.foregroundColor: Colors.white,
      this.axis: ToggleButtonAlignment.horizontal,
      this.borderRadius: 12.0,
      this.initialValue: false,
      this.deactivatedColor: Colors.grey,
      this.boxShadow: const [],
      this.onChange,
      this.duration: const Duration(milliseconds: 300),
      @required this.commonRadioValue,
      @required this.buttonRadioValue,
      this.textColor: Colors.black,
      this.textDeactivatedColor: Colors.black54,
      this.text: ""});

  @override
  State<StatefulWidget> createState() {
    return RadioToggleButtonState();
  }
}

class RadioToggleButtonState extends State<RadioToggleButton> {
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    if (widget.axis == ToggleButtonAlignment.horizontal) {
      width = widget.size * 5.0;
      height = widget.size * 2.0;
    } else {
      height = widget.size * 5.0;
      width = widget.size * 2.0;
    }
    return GestureDetector(
      child: AnimatedContainer(
        duration: widget.duration,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: widget.commonRadioValue == widget.buttonRadioValue
                ? widget.backgroundColor
                : widget.deactivatedColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: widget.boxShadow),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.commonRadioValue == widget.buttonRadioValue
                  ? widget.textColor
                  : widget.textDeactivatedColor,
            ),
          ),
        ),
      ),
      onTap: () {
        if (widget.onChange != null) {
          widget.onChange(widget.buttonRadioValue);
        }
      },
    );
  }
}
