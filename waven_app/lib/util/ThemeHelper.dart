import 'package:flutter/material.dart';

Decoration GradientBackground(int offset)
{
  return new BoxDecoration(
      gradient: new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.4, 0.6, 0.8],
      colors: [
        Color.fromRGBO(60+offset,71+offset,106+offset, 1.0),
        Color.fromRGBO(60+offset,71+offset,106+offset, 0.7),
        Color.fromRGBO(60+offset,71+offset,106+offset, 0.4),
        Color.fromRGBO(60+offset,71+offset,106+offset, 0.1),
      ],
  ));
}
Decoration NegGradientBackground(int offset)
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.1, 0.4, 0.5, 0.7],
        colors: [
          Color.fromRGBO(60+offset,71+offset,106+offset, 0.1),
          Color.fromRGBO(60+offset,71+offset,106+offset, 0.4),
          Color.fromRGBO(60+offset,71+offset,106+offset, 0.7),
          Color.fromRGBO(60+offset,71+offset,106+offset, 1.0),
        ],
      ));
}
Decoration BackgroundNews()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3, 0.4, 0.6, 0.7],
        colors: [
          Color.fromRGBO(0,7,28, 1.0),
          Color.fromRGBO(0,10,34, 0.7),
          Color.fromRGBO(0,10,34, 0.4),
          Color.fromRGBO(0,7,28, 0.1),
        ],
      ));
}

TextStyle TitleNewsStyle(BuildContext context)
{
  final ThemeData theme = Theme.of(context);
  final TextStyle titleStyle =
  theme.textTheme.headline.copyWith(color: Colors.white,fontSize: 15.0,fontFamily:"VT323" );

  return titleStyle;
}

Decoration ImageDecoration(String url,BoxFit fit)
{
  return new BoxDecoration(

    image: new DecorationImage(
      image:
      new Image.asset(url).image,
      fit: fit,
    ),
  );
}