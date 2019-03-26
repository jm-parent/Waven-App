import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class HorizontalLastNewsList extends StatefulWidget {
  @override
  _HorizontalLastNewsListState createState() => _HorizontalLastNewsListState();
}

class _HorizontalLastNewsListState extends State<HorizontalLastNewsList> {
  @override
  Widget build(BuildContext context) {
    if (newsDatas == null) return _loadingView;
    return _buildLastNewsList();
  }

  @override
  void initState()
  {
    this._getNewsData();
    super.initState();
  }

   _buildLastNewsList() {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: newsDatas.items.length >= 3 ? 3 : newsDatas.items.length ,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(newsDatas.items[index].title),
                    ),
                    Spacer(),
                  ],
                ),
              );
            });
  }


  var client = new http.Client();
  RssFeed newsDatas;

  Future<List<RssItem>> _getNewsData() async
  {
    debugPrint('dansnewsdata');
    var response = await client.get("https://blog.waven-game.com/fr/feed/");
    if (response.statusCode == 200) {
      debugPrint('http ok');
      this.setState(() {
        newsDatas = new RssFeed.parse(response.body);
      });
      debugPrint(newsDatas.items.length.toString());
      return newsDatas.items;
    } else {
      throw Exception('Failed to load Waven News');
    }
  }

  Widget get _loadingView {
    return  new Center(
        child: new CircularProgressIndicator(),
    );
  }
}
