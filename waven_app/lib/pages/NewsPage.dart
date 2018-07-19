import 'package:flutter/material.dart';
import 'package:waven_app/models/NewsArticleModel.dart';
import 'package:waven_app/util/NewsHelper.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => new NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        NewsArticle article = NewsHelper.getArticle(position);

        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    article.categoryTitle,
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.0),
                  ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,1.0,0.0,0.0),
                child: Row (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
        Expanded(
        child:  Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    article.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  flex: 3,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.author,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      article.date + " . " + article.readTime,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            )
          ],
                    ),
        ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(

                            height: 95.0,
                            width: 80.0,
                            child: Image.asset(
                              "images/" + article.imageAssetName,
                              fit: BoxFit.cover,

                            )),
                      ],
                    ),
                    ],
                  )
              )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: NewsHelper.articleCount,
    );
  }
}
