import 'package:waven_app/util/EnumHelper.dart';

class DeckModel {

  final String name;
  final String desc;
  final int idHero;
  final DeckLevel deckLevel;
  final String tagHero;
  String assetUrl = '';
  String assetUrlBackgroundDetail = '';
  DeckModel(this.idHero, this.name, this.desc, this.assetUrl,this.deckLevel,this.tagHero,this.assetUrlBackgroundDetail);
}




