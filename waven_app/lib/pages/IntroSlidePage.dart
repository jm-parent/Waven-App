import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroSliderPage extends StatefulWidget {
  @override
  _IntroSliderPageState createState() => new _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "SCHOOL",
        styleTitle:
        TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        styleDescription:
        TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "images/logo_waven.png",
        backgroundColor: 0xFFFFDEAD,
      ),
    );
    slides.add(
      new Slide(
        title: "MUSEUM",
        styleTitle:
        TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description: "Ye indulgence unreserved connection alteration appearance",
        styleDescription:
        TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "images/logo_waven.png",
        backgroundColor: 0xffFFFACD,
      ),
    );
    slides.add(
      new Slide(
        title: "COFFEE",
        styleTitle:
        TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription:
        TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "images/logo_waven.png",
        backgroundColor: 0xffFFF8DC,
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacementNamed('/Mainhome');
  }

  void onSkipPress() {
    Navigator.of(context).pushReplacementNamed('/Mainhome');
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: 0x33000000,
      highlightColorSkipBtn: 0xff000000,

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: 0x33000000,
      highlightColorDoneBtn: 0xff000000,

      // Dot indicator
      colorDot: 0x33D02090,
      colorActiveDot: 0xffD02090,
      sizeDot: 13.0,
    );
  }
}