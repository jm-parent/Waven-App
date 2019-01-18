import 'dart:ui';

class ShushuOfflineModel {

  final String godName;
  final int heroid;
  final String heroName;

  final String portrait;
  final String lore;
  final Color color;

  ShushuOfflineModel(this.godName, this.heroid, this.heroName, this.portrait, this.lore, this.color);

  String get background => 'images/ShushusImages/GodWavenBg_${heroid??0}.jpg';
  @override
  String toString() {
    return 'HeroModelLight{racedesc: $godName, heroid: $heroid, heroName: $heroName, portrait: $portrait, lore: $lore}';
  }


}
