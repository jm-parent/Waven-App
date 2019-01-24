import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenClasses/ClasseOfflineModel.dart';

final ClassesItems = <ClasseOfflineModel>[
  new ClasseOfflineModel(
      'Iop',
      'images/ClassesBg/bg_Iop.png',
      'Leur tempérament impétueux et leur amour pour le combat font des Iops des paladins de l’extrême. Leur devise ? On cogne d’abord, on discute ensuite. Puis on cogne à nouveau !',
      Color.fromRGBO(55, 0, 30, 0.9),'CŒUR DE IOP',GradientIop()),
//  new ClasseOfflineModel('Cra', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Ecaflip', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel(
//      'Eliotrope',
//      'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier',
//      Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel(
//      'Eniripsa',
//      'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier',
//      Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Enutrof', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Feca', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel(
//      'Huppermage',
//      'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier',
//      Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel(
//      'Osamodas',
//      'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier',
//      Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Ouginak', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Pandawa', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel(
//      'Roublard',
//      'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier',
//      Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel(
//      'Sacrieur',
//      'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier',
//      Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Sadida', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Sram', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Steamer', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Xelor', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel('Zobal', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
];

Decoration GradientIop()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0,0.5,1.0],
        colors: [
          Color(0xFF972E21),
          Color(0xFFF3844A),
          Color(0xFF972E21),
        ],
      ));
}

Decoration GradientIopBg()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0,1.0],
        colors: [
          Color(0xFF0D1527),
          Color(0xFF311817),
        ],
      ));
}