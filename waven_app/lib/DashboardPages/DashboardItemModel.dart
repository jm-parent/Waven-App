
class DashboardItemModel {
  final int id;
  final String name;
  final String imageAssetUrl;
  final String description;

  DashboardItemModel(
      this.id,
      this.name,
      this.imageAssetUrl,
      this.description,
      );

  DashboardItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageAssetUrl = json['image'],
        description = json['description'];
}