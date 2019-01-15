class SkinOfflineModel {

  final String skinName;
  final int shushuId;

  final String skinImageUrl;
  final String skinShopUrl;
  final double skinPrice;
  SkinOfflineModel(this.skinName, this.shushuId, this.skinImageUrl, this.skinShopUrl, this.skinPrice);

  @override
  String toString() {
    return 'SkinOfflineModel{skinName: $skinName, shushuId: $shushuId, skinImageUrl: $skinImageUrl, skinShopUrl: $skinShopUrl}';
  }
//String get background => 'images/ShushusImages/GodWavenBg_${heroid??0}.jpg';



}
