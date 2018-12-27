import 'package:waven_app/DashboardPages/DashboardItemModel.dart';
import 'package:waven_app/models/CardFlipperModel.dart';
import 'package:waven_app/models/CategoryGodModel.dart';
import 'package:waven_app/models/DashboardFanArtItemModel.dart';
import 'package:waven_app/models/DeckModel.dart';
import 'package:waven_app/models/GameModeModelLight.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:quiver/collection.dart';

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

  static var HeroLightList = [
    new ShushuOfflineModel("Iop",1,"Le chevalier Iop","images/HeroImages/HeroBackground/pc01.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Chavelier"),
    new ShushuOfflineModel("Iop",2,"Le Champion Flamboyant","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_02.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Flamboyant"),
    new ShushuOfflineModel("Iop",3,"Le Ténébreux Spectral","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_03.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Spectral"),
    new ShushuOfflineModel("Iop",4,"La Bouvalière","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_04.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Bouvalière"),
    new ShushuOfflineModel("Iop",5,"Le Iop Coeur Froid","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_05.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Coeur froid"),
    new ShushuOfflineModel("Xelor",6,"L\"aiguille du Xelor","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_01.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Aiguille"),
    new ShushuOfflineModel("Xelor",7,"Le Synchronisateur","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_02.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Synchronisateur"),
    new ShushuOfflineModel("Xelor",8,"La Troteuse Agitée","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_03.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Troteuse"),
    new ShushuOfflineModel("Xelor",9,"La Régulatrice","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_04.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Régulatrice"),
    new ShushuOfflineModel("Xelor",10,"Le Xélor Catalyseur","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_05.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Catalyseur"),
    new ShushuOfflineModel("Sram",11,"L'E****eur S****n","images/HeroImages/HeroBackground/Fond_Waven_PC_Sram_01.png","images/HeroPortraits/Iop-Base-Male-CC.png","le lore sram jaune"),
    new ShushuOfflineModel("Sram",12,"Le T****eur S******n","images/HeroImages/HeroBackground/Fond_Waven_PC_Sram_02.png","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Sram biolet"),
    new ShushuOfflineModel("Osamodas",13,"Le Berger Bouftou","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_01.jpg","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_01.jpg","le lore bouftou"),
    new ShushuOfflineModel("Osamodas",14,"La Bergère Tofu","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_02.jpg","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_02.jpg","le lore tofu"),

  ];



  static var CategoryGodList =
  [
    new CategoryGodModel("Xelor","images/GodsImages/GodKM/bg-xelor-mob.jpg"),
    new CategoryGodModel("Sram","images/GodsImages/GodKM/bg-sram-mob.jpg"),
    new CategoryGodModel("Iop","images/GodsImages/GodKM/bg-iop.jpg"),
    new CategoryGodModel("Osamodas","images/GodsImages/LevelUpOsamodas.png"),

//    new CategoryGodModel("Cra","images/GodsImages/GodKM/bg-cra-mob.jpg"),
//    new CategoryGodModel("Ouginak","images/GodsImages/LevelUpOuginak.png"),
//    new CategoryGodModel("Pandawa","images/GodsImages/LevelUpPandawa.png"),
//    new CategoryGodModel("Roublard","images/GodsImages/LevelUpRoublard.png"),
//    new CategoryGodModel("Sacrieur","images/GodsImages/GodKM/bg-sacrieur-mob.jpg"),
//    new CategoryGodModel("Steamer","images/GodsImages/LevelUpSteamer.png"),
//    new CategoryGodModel("Zobal","images/GodsImages/LevelUpZobal.png"),
//    new CategoryGodModel("Ecaflip","images/GodsImages/GodKM/bg-ecaflip-mob.jpg"),
//    new CategoryGodModel("Eliotrope","images/GodsImages/LevelUpEliotrope.png"),
//    new CategoryGodModel("Eniripsa","images/GodsImages/GodKM/bg-eniripsa-mob.jpg"),
//    new CategoryGodModel("Enutrof","images/GodsImages/LevelUpEnutrof.png"),
//    new CategoryGodModel("Feca","images/GodsImages/GodKM/bg-feca-mob.jpg"),
//    new CategoryGodModel("Huppermage","images/GodsImages/LevelUpHuppermage.png"),
  ];

}


final List<GameModeModelLight> GameModeList = [
  new GameModeModelLight('PvM','https://images.jeugeek.com/uploads/files/waven-dofus-cube.jpg','','C\'est nul ! Oubliez ça'),
  new GameModeModelLight('1v1','https://waven-game.com/wp-content/uploads/2018/11/Combat_1v1_01.png','',''),
  new GameModeModelLight('3v3','https://pbs.twimg.com/media/DsXao9AXgAYXbDT.jpg','',''),
  new GameModeModelLight('4 vs Boss','https://waven-game.com/wp-content/uploads/2018/11/BF_01.png','',''),
  new GameModeModelLight('10v10','https://i.ytimg.com/vi/dxN1xh_Bzxc/hqdefault.jpg','',''),
];

final List<int> IndexSpellList = [2,3,13,15,21,31,32,36,43,48,57,62,65,71,72,74,75,79,85,88,90,91,94,95,96,101,104,106,113,115,116,121,122,126,127,132,133,134,139,141,142,143,145,146,147,148,149,150,151,153,155,158,159,161,163,173,179,182,183,194,201,209,210,211,217,219,220,223,225,229,230,232,234,235,236,239,241,244,245,246,250,265,266,267,268,279,282,283,284,287,290,291,300,303,306,308,322,323,328,329,330,331,336,338,339,340,341,342,353,358,359,361,364,367,369,371,372,378,379,380,387,390,393,397,401,406,407,408,409,410,414,417,428,429,430,432,435,448,449,450,451,453,455,458,459,462,463,468,469,474,475,476,478,480,489,490,496,499,500,501,502,503,509,512,514,515,516,517,524,528,529,530,537,543,544,547,549,553,555,556,557,558,559,561,564,566,567,568,575,581,588,591,592,597,599,600,608,610,611,612,616,618,619,620,623,627,628,634,635,638,639,640,641,642,644,646,647,648,649,652,655,660,672,673,674,675,677,678,682,686,692,699,700,705,716,717,718,727,728,730,737,739,740,743,746,751,753,755,756,758,759,765,768,769,773,775,776,777,778,779,780,786,788,794,796,797,798,802,803,811,814,818,819,820,821,824,827,829,831,834,837,840,841,848,853,854,856,861,862,869,873,877,883,885,891,892,893,899,904,906,915,916,925,927,930,938,945,946,947,949,951,952,959,965,974,975,976,977,978,987,988,996,997,999,1105,1355,1907,2035,2503,3129,3271];


class BiMapGodFamily
{
  BiMap<String, int> GodFamilyBiMap = new HashBiMap();
  BiMapGodFamily() {
    GodFamilyBiMap.addAll(new Map.from(
        {
          'None': 0,
          'Iop': 1,
          'Cra': 2,
          'Eniripsa': 3,
          'Ecaflip': 4,
          'Enutrof': 5,
          'Sram': 6,
          'Xelor': 7,
          'Sacrieur': 8,
          'Feca': 9,
          'Sadida': 10,
          'Osamodas': 11,
          'Pandawa': 12,
          'Roublard': 13,
          'Zobal': 14,
          'Steamer': 15,
          'Eliotrope': 16,
          'Unknown': 17,
          'Huppermage': 18,
          'Ouginak': 19,
          'Sinistro': 20,
          'Chacha': 30,
          'Momie': 31,
          'Hydruille': 32,
          'Cadran': 33,
          'Balise': 34,
          'AmeSpectrale': 35,
          'Bouftou': 36,
          'Tofu': 37,
          'Corbac': 38,
          'Ombre': 39,
          'Chafer': 40,
        }));
  }
}
