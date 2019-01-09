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



 // static ShushuOfflineModel GetShushuModelByShushuId(int id) => HeroLightList.firstWhere((x) => x.heroid == id);
 // static List<ShushuOfflineModel> GetShushusModelByGodName(String name) => HeroLightList.where((x) => x.godName == name);
}

