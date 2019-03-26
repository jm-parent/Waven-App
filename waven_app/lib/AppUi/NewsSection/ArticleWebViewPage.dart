import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_item.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

class ArticleWebViewPage extends StatefulWidget {
  const ArticleWebViewPage({Key key, this.item}) : super(key: key);

  final RssItem item;

  @override
  _ArticleWebViewPageState createState() =>
      new _ArticleWebViewPageState(item: item);
}

class _ArticleWebViewPageState extends State<ArticleWebViewPage> {
  RssItem item;

  _ArticleWebViewPageState({this.item});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
