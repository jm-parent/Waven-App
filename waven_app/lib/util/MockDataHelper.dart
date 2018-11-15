import 'package:flutter/material.dart';
import 'package:waven_app/DashboardPages/DashboardItem.dart';
import 'package:waven_app/DashboardPages/DashboardItemModel.dart';
import 'package:waven_app/models/DashboardFanArtItemModel.dart';
import 'package:waven_app/models/DeckModel.dart';
import 'package:waven_app/util/EnumHelper.dart';

class MockDataHelper {

  static var deckModelList = [new DeckModel(1,'Tank/Bruiser Terre/Eau Bouvalière','Deck op as fuck en 1v1','images/HeroPortraits/Iop-Bouvalier-Female-CC.png',DeckLevel.Beginner,"tagDeck1",'images/HeroImages/iop_bouvaliere.png'),
  new DeckModel(2,'AGLAGLA','...','images/HeroPortraits/Iop-Froid-Male-CC.png',DeckLevel.Intermediate,"tagDeck2",'images/HeroImages/iop_coeurfroid.png'),
  new DeckModel(3,'Xel Feu basique','Basique ? oui ! GO FACE !','images/HeroPortraits/Xelor-Base-Female-CC.png',DeckLevel.Advanced,"tagDeck3",'images/HeroImages/xelor_base.png'),
  new DeckModel(4,'La tête dans les étoiles','I had a dream !!','images/HeroPortraits/Xelor-Cosmique-Female-CC.png',DeckLevel.Beginner,"tagDeck4",'images/HeroImages/xelor_trotteuse.png'),
  new DeckModel(5,'Tic Tac Tic Tac','Tic Tac Tic Tac ....','images/HeroPortraits/Xelor-Synchronisateur-Female-CC.png',DeckLevel.Intermediate,"tagDeck5",'images/HeroImages/xelor_synchronisatrice.png'),
  new DeckModel(6,'La base frr !','Wesh gros bien ou bien ?','images/HeroPortraits/Iop-Base-Male-CC.png',DeckLevel.Advanced,"tagDeck6",'images/HeroImages/iop_base.png'),
  new DeckModel(7,'Tank/Bruiser Terre/Eau Bouvalière','Deck op as fuck en 1v1','images/HeroPortraits/Iop-Bouvalier-Female-CC.png',DeckLevel.Advanced,"tagDeck7",'images/HeroImages/iop_bouvaliere.png'),
  new DeckModel(8,'AGLAGLA','...','images/HeroPortraits/Iop-Froid-Male-CC.png',DeckLevel.Intermediate,"tagDeck8",'images/HeroImages/iop_coeurfroid.png'),
  new DeckModel(9,'Xel Feu basique','Basique ? oui ! GO FACE !','images/HeroPortraits/Xelor-Base-Female-CC.png',DeckLevel.Advanced,"tagDeck9",'images/HeroImages/xelor_base.png'),
  new DeckModel(10,'La tête dans les étoiles','I had a dream !!','images/HeroPortraits/Xelor-Cosmique-Female-CC.png',DeckLevel.Beginner,"tagDeck10",'images/HeroImages/xelor_trotteuse.png'),
  new DeckModel(11,'Tic Tac Tic Tac','Tic Tac Tic Tac ....','images/HeroPortraits/Xelor-Synchronisateur-Female-CC.png',DeckLevel.Intermediate,"tagDeck11",'images/HeroImages/xelor_synchronisatrice.png'),
  new DeckModel(12,'La base frr !','Wesh gros bien ou bien ?','images/HeroPortraits/Iop-Base-Male-CC.png',DeckLevel.Beginner,"tagDeck12",'images/HeroImages/iop_base.png')];

  static var dashboardBuildersItemList = [
    new DashboardItemModel(1,'Spell Maker','images/Backgrounds/fond-PVP.jpg','Description plus ou moins longue du dashboard item'),
    new DashboardItemModel(2,'Armory Maker','images/Backgrounds/fond-PVP.jpg','Description plus ou moins longue du dashboard item'),
    new DashboardItemModel(3,'Shushu Maker','images/Backgrounds/fond-PVP.jpg','Description plus ou moins longue du dashboard item'),
    new DashboardItemModel(4,'??? Maker','images/Backgrounds/fond-PVP.jpg','Description plus ou moins longue du dashboard item'),
  ];


  static var dashboardFanArtItemList = [
    new DashboardFanArtItemModel(1,'Aon','https://cdn.discordapp.com/attachments/471247713808285706/511551250588893194/IMG_20181112_153954.jpg','No mercy'),
    new DashboardFanArtItemModel(2,'Kouett','https://cdn.discordapp.com/attachments/471247713808285706/471247903231574027/unknown.png','WIP'),
    new DashboardFanArtItemModel(3,'Aon','https://cdn.discordapp.com/attachments/470889851009499139/511520812604456967/IMG_20181112_134020.jpg','Disciple de Iop'),
    new DashboardFanArtItemModel(4,'Kindry','https://media.discordapp.net/attachments/433985136917479427/506897106448023584/unknown.png?width=821&height=433','Miranda'),
    new DashboardFanArtItemModel(1,'Aon','https://cdn.discordapp.com/attachments/470889851009499139/511263858514722846/IMG_20181109_141716.jpg','La noyée des abysses'),
    new DashboardFanArtItemModel(2,'Aon','https://cdn.discordapp.com/attachments/470889851009499139/511263444851359764/sacrieur-2.png','Disciple Sacrieur'),
  ];


}