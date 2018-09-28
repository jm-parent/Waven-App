
import 'package:waven_app/models/NewsArticleModel.dart';

class NewsHelper {

  static var articleCount = 7;

  static var categoryTitles = ["IOP", "XELOR", "XELOR", "XELOR","IOP","IOP","IOP"];
  static var titles = ["Présentation du Iop Flamboyant", "Présentation du Xelor Synchronisateur", "Présentation du Xelor Ténébreux Spectral", "Présentation du Xelor Trotteuse","Présentation du Iop Flamboyant","Présentation du Iop Flamboyant","Présentation du Iop Flamboyant"];
  static var authorNames = ["Gobelyn", "Space Sapien", "Xyale", "ToT", "Space Sapien", "Space Sapien", "Space Sapien"];
  static var date = ["1 h", "17/07", "10/07", "02/07", "10/07", "10/07", "10/07"];
  static var readTimes = ["7 min lu", "14 min lu", "8 min lu", "8 min lu", "14 min lu", "14 min lu", "14 min lu"];
  static var imageAssetName = ["iop.flamboyant.jpg","xel.synchronisateur.jpg","xel.tenebreuxspectral.png","xel.trotteuseagite.jpg","iop.flamboyant.jpg","iop.flamboyant.jpg","iop.flamboyant.jpg"];

  static getArticle(int position) {
    return NewsArticle(categoryTitles[position], titles[position], authorNames[position],date[position],readTimes[position], imageAssetName[position]);
  }
//  static getNews(int position,RssFeed newsData) {
//    return NewsArticle(newsData.items[position].category, newsData.items[position].title, newsData.items[position].author,newsData.items[position].pubDate,"", "");
//  }
}