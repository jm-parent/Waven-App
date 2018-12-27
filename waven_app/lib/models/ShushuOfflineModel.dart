class ShushuOfflineModel {

  final String godName;
  final int heroid;
  final String heroName;
  final String background;
  final String portrait;
  final String lore;

  ShushuOfflineModel(this.godName, this.heroid, this.heroName, this.background, this.portrait, this.lore);

  @override
  String toString() {
    return 'HeroModelLight{racedesc: $godName, heroid: $heroid, heroName: $heroName, background: $background, portrait: $portrait, lore: $lore}';
  }


}
