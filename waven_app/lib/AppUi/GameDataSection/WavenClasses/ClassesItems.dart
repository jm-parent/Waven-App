import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenClasses/ClasseOfflineModel.dart';

final ClassesItems = <ClasseOfflineModel>[
  new ClasseOfflineModel(
      'Iop',
      'images/ClassesBg/bg_iop.png',
      'Leur tempérament impétueux et leur amour pour le combat font des Iops des paladins de l’extrême. Leur devise ? On cogne d’abord, on discute ensuite. Puis on cogne à nouveau !',
      Color.fromRGBO(55, 0, 30, 0.9),'CŒUR DE IOP',GradientIop()),
  new ClasseOfflineModel('Sram',
      'images/ClassesBg/bg_sram.png',
      'Trousser les pans d\'une tunique, tâter le fond d\'une poche, faire preuve de doigté, palper enfin des bijoux tant convoités avant de poser un piège ou d\'asséner un coup mortel, voilà la vie d\'un disciple de Sram !',
      Color.fromRGBO(55, 0, 30, 0.9),
      'OMBRE DE SRAM',
      GradientSram()),
  new ClasseOfflineModel(
      'Xelor',
      'images/ClassesBg/bg_xelor.png',
      'En tant que mages du temps, les Xélors jouent avec ses rouages pour ralentir un ennemi, s’accélérer eux-mêmes ou se téléporter où bon leur semble à l’aide de leurs Sinistros.',
      Color.fromRGBO(55, 0, 30, 0.9),'SABLIER DE XÉLOR',GradientXelor()),
  new ClasseOfflineModel('Cra',
      'images/ClassesBg/bg_cra.png',
      'Crâ est la déesse du jugement et de l\'œil avisé. Archers hors pair, ses disciples mettent toujours dans le mille ! Ses puissantes flèches lui permettent de nettoyer le champ de bataille et de tenir la distance !',
      Color.fromRGBO(55, 0, 30, 0.9),
      'ETENDUE DE CRA',
      GradientCra()),
    new ClasseOfflineModel(
      'Eni',
      'images/ClassesBg/bg_eni.png',
      'Les Eniripsas sont des guérisseurs qui soignent d\'un simple mot. Ils utilisent le pouvoir de la parole pour soulager les souffrances de leurs alliés, mais parfois aussi pour blesser leurs ennemis.',
      Color.fromRGBO(55, 0, 30, 0.9),
        'MAINS D\'ENIRIPSA',
        GradientEni()),

  new ClasseOfflineModel('Osa',
      'images/ClassesBg/bg_osa.png',
      'Les Osamodas sont des dompteurs nés ! Ils ont le pouvoir d\'invoquer des créatures et sont de remarquables dresseurs. Une rumeur prétend qu\'ils taillent leurs vêtements dans la peau de leurs ennemis, mais allez donc leur demander ce qu\'il en est...',
      Color.fromRGBO(55, 0, 30, 0.9),
      'FOUET D\'OSAMODAS',
      GradientOsa()),
//  new ClasseOfflineModel('Ecaflip', 'images/HeroPortraits/Iop-Base-Male-CC.png',
//      'le lore Chavelier', Color.fromRGBO(55, 0, 30, 0.9),'Default Title',DefaultGradient()),
//  new ClasseOfflineModel(
//      'Eliotrope',
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
Decoration GradientXelor()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0,0.5,1.0],
        colors: [
          Color(0xFF081041),
          Color(0xFF253BCC),
          Color(0xFF081041),
        ],
      ));
}
Decoration GradientCra()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0,0.5,1.0],
        colors: [
          Color(0xFF0A2132),
          Color(0xFF459588),
          Color(0xFF0A2132),
        ],
      ));
}
Decoration GradientEni()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0,0.5,1.0],
        colors: [
          Color(0xFF212932),
          Color(0xFFD47248),
          Color(0xFF212932),
        ],
      ));
}

Decoration GradientSram()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0,0.5,1.0],
        colors: [
          Color(0xFF0B1828),
          Color(0xFF454995),
          Color(0xFF0B1828),
        ],
      ));
}
Decoration GradientOsa()
{
  return new BoxDecoration(
      gradient: new LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0,0.5,1.0],
        colors: [
          Color(0xFF0B1828),
          Color(0xFF454995),
          Color(0xFF0B1828),
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