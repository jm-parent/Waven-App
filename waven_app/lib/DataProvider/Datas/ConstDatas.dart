import 'package:waven_app/models/GodModel.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';

class ConstDatas{

  static var GameDataGodList =
  [
    new GodOfflineModel("Cra","images/background_logo/logo_Cra.png","images/GodsImages/LevelUpCra.png",2),
    new GodOfflineModel("Ecaflip","images/background_logo/logo_Ecaflip.png","images/GodsImages/LevelUpEcaflip.png",4),
    new GodOfflineModel("Eliotrope","images/background_logo/logo_Eliotrope.png","images/GodsImages/LevelUpEliotrope.png",16),
    new GodOfflineModel("Eniripsa","images/background_logo/logo_Eniripsa.png","images/GodsImages/LevelUpEniripsa.png",3),
    new GodOfflineModel("Enutrof","images/background_logo/logo_Enutrof.png","images/GodsImages/LevelUpEnutrof.png",5),
    new GodOfflineModel("Feca","images/background_logo/logo_Feca.png","images/GodsImages/LevelUpFeca.png",9),
    new GodOfflineModel("Huppermage","images/background_logo/logo_Huppermage.png","images/GodsImages/LevelUpHuppermage.png",18),
    new GodOfflineModel("Iop","images/background_logo/logo_Iop.png","images/GodsImages/LevelUpIop.png",1),
    new GodOfflineModel("Osamodas","images/background_logo/logo_Osamodas.png","images/GodsImages/LevelUpOsamodas.png",11),
    new GodOfflineModel("Ouginak","images/background_logo/logo_Ouginak.png","images/GodsImages/LevelUpOuginak.png",19),
    new GodOfflineModel("Pandawa","images/background_logo/logo_Pandawa.png","images/GodsImages/LevelUpPandawa.png",12),
    new GodOfflineModel("Roublard","images/background_logo/logo_Roublard.png","images/GodsImages/LevelUpRoublard.png",13),
    new GodOfflineModel("Sacrieur","images/background_logo/logo_Sacrieur.png","images/GodsImages/LevelUpSacrieur.png",8),
    new GodOfflineModel("Sram","images/background_logo/logo_Sadida.png","images/GodsImages/LevelUpSram.png",6),
    new GodOfflineModel("Steamer","images/background_logo/logo_Sram.png","images/GodsImages/LevelUpSteamer.png",15),
    new GodOfflineModel("Xelor","images/background_logo/logo_Steamer.png","images/GodsImages/LevelUpXelor.png",7),
    new GodOfflineModel("Zobal","images/background_logo/logo_Xelor.png","images/GodsImages/LevelUpZobal.png",14),
  ];


  static GodOfflineModel GetGodModelByGodId(int id) => GameDataGodList.firstWhere((x) => x.idFamily == id);
  static GodOfflineModel GetGodModelByGodName(String name) => GameDataGodList.firstWhere((x) => x.godName == name);


  static var HeroLightList = [
    new ShushuOfflineModel("Iop",919,"Le chevalier Iop","images/HeroImages/HeroBackground/pc01.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Chavelier"),
    new ShushuOfflineModel("Iop",534,"Le Champion Flamboyant","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_02.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Flamboyant"),
    new ShushuOfflineModel("Iop",143,"Le Ténébreux Spectral","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_03.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Spectral"),
    new ShushuOfflineModel("Iop",497,"La Bouvalière","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_04.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Bouvalière"),
    new ShushuOfflineModel("Iop",911,"Le Iop Coeur Froid","images/HeroImages/HeroBackground/Fond_Waven_PC_Iop_05.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Coeur froid"),
    new ShushuOfflineModel("Xelor",193,"L\"aiguille du Xelor","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_01.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Aiguille"),
    new ShushuOfflineModel("Xelor",490,"Le Synchronisateur","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_02.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Synchronisateur"),
    new ShushuOfflineModel("Xelor",945,"La Troteuse Agitée","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_03.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Troteuse"),
    new ShushuOfflineModel("Xelor",161,"La Régulatrice","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_04.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Régulatrice"),
    new ShushuOfflineModel("Xelor",614,"Le Xélor Catalyseur","images/HeroImages/HeroBackground/Fond_Waven_PC_Xélor_05.jpg","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Catalyseur"),
    new ShushuOfflineModel("Sram",620,"L'Egorgeur Shugen","images/HeroImages/HeroBackground/Fond_Waven_PC_Sram_01.png","images/HeroPortraits/Iop-Base-Male-CC.png","le lore sram jaune"),
    new ShushuOfflineModel("Sram",937,"Le Traqueur Sourokan","images/HeroImages/HeroBackground/Fond_Waven_PC_Sram_02.png","images/HeroPortraits/Iop-Base-Male-CC.png","le lore Sram biolet"),
    new ShushuOfflineModel("Osamodas",196,"Pâtre Laineux","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_01.jpg","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_01.jpg","le lore bouftou"),
    new ShushuOfflineModel("Osamodas",995,"L'Eleveur Zélé","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_02.jpg","images/HeroImages/HeroBackground/Fond_Waven_PC_Osamodas_02.jpg","le lore tofu"),

  ];


  static ShushuOfflineModel GetShushuModelByShushuId(int id) => HeroLightList.firstWhere((x) => x.heroid == id);
  static List<ShushuOfflineModel> GetShushusModelByGodName(String name) => HeroLightList.where((x) => x.godName == name);
}

