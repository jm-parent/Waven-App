class DashboardFanArtItemModel {
  final int id;
  final String artisteName;
  final String imageNetUrl;
  final String title;

  DashboardFanArtItemModel(
      this.id, this.artisteName, this.imageNetUrl, this.title,

      );

  DashboardFanArtItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        artisteName = json['artisteName'],
        imageNetUrl = json['imageNetUrl'],
        title = json['title'];
}