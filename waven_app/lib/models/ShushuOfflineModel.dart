import 'dart:ui';

class ShushuOfflineModel {

  final String godName;
  final int heroid;
  final String heroName;


  final String portrait;
  final String lore;

  final Color color;

  final String uniquePassiveIcon;
  final String uniquePassiveDesc;
  final String uniqueSpellIcon;
  final String uniqueSpellDesc;

  final String portraitWithLogo;


  ShushuOfflineModel(this.godName, this.heroid, this.heroName, this.portrait, this.lore, this.color, this.uniquePassiveIcon, this.uniquePassiveDesc, this.uniqueSpellIcon, this.uniqueSpellDesc, this.portraitWithLogo);

  String get background => 'images/ShushusImages/GodWavenBg_${heroid??0}.jpg';
  @override
  String toString() {
    return 'HeroModelLight{racedesc: $godName, heroid: $heroid, heroName: $heroName, portrait: $portrait, lore: $lore}';
  }


}
