
import 'package:waven_app/AppUi/GameDataSection/WavenClasses/ClasseOfflineModel.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';

class DeckBuilderModel {

  ClasseOfflineModel classData;
  ShushuOfflineModel shushuData;
  ShushuOfflineModel get ShushuData => shushuData;
  set ShushuData(ShushuOfflineModel newShushuData) => shushuData = newShushuData;

  ClasseOfflineModel get ClassData => classData;
  set ClassData(ClasseOfflineModel newClassData) => classData = newClassData;
}
