
import 'dart:async';

import 'package:feedparser/feedparser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

class ArticleWebViewPage extends StatefulWidget {
  const ArticleWebViewPage({Key key, this.item}) : super(key: key);

  final FeedItem item;

  @override
  _ArticleWebViewPageState createState() => new _ArticleWebViewPageState(item: item);
}

class _ArticleWebViewPageState extends State<ArticleWebViewPage> {
  FeedItem item;

  _ArticleWebViewPageState({this.item});


  @override
  Widget build(BuildContext context) {
       return
      new WebviewScaffold(
        url: item.link,
        appBar: new AppBar(
          title: Text(item.title),
        ),
        withLocalStorage: true,
      );
  }


}
