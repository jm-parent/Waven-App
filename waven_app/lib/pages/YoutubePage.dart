import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class YoutubePage extends StatefulWidget {
  @override
  YoutubePageState createState() => new YoutubePageState();
}

class YoutubePageState extends State<YoutubePage> {

  static String key = 'AIzaSyBEVjoemQwL5i9sUeJwhSw_0IgCJQpdZ6E';
  YoutubeAPI ytApi = new YoutubeAPI(key);
  List<YT_API> ytResult = [];

  call_API() async {
    print('UI callled');
    String query = "Gobelyn";
    ytResult = await ytApi.Search(query);
    setState(() {
      print('UI Updated');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    call_API();
    return new Container(
      child: ListView.builder(
          itemCount: ytResult.length,
          itemBuilder: (_, int index) => ListItem(index)
      ),);

  }
  Widget ListItem(index){
    return new Card(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child:new Row(
          children: <Widget>[
            new Image.network(ytResult[index].thumbnail['default']['url'],),
            new Padding(padding: EdgeInsets.only(right: 20.0)),
            new Expanded(child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    ytResult[index].title,
                    softWrap: true,
                    style: TextStyle(fontSize:18.0),
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: 1.5)),
                  new Text(
                    ytResult[index].channelTitle,
                    softWrap: true,
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: 3.0)),
                  new Text(
                    ytResult[index].description,
                    softWrap: true,
                  ),
                ]
            ))
          ],
        ),
      ),
    );
  }
}


