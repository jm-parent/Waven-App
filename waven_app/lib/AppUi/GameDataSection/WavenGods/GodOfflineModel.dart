
import 'dart:ui';

class GodOfflineModel {

  final String godName;

  final String portrait;
  final String lore;
  final Color color;

  GodOfflineModel(this.godName, this.portrait, this.lore, this.color);

  String get background => 'images/GodsImages/LevelUp${godName??0}.png';

  @override
  String toString() {
    return 'GodOfflineModel{godName: $godName, portrait: $portrait, lore: $lore, color: $color}';
  }


}
