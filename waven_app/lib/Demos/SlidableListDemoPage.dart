import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableDemo extends StatefulWidget {
  SlidableDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SlidableDemoState createState() => new _SlidableDemoState();
}

class Data {
  final String url = 'https://via.placeholder.com/350x150';
}
Future<Data> getData() async {
  await Future.delayed(Duration(seconds: 1));
  return Data();
}


class _SlidableDemoState extends State<SlidableDemo> {

  final SlidableController slidableController = new SlidableController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return FutureBuilder<Data>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Slidable(
                  delegate: SlidableScrollDelegate(),
                  actionExtentRatio: 0.25,
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      //onTap: () => removeLocation(location),
                    ),
                  ],
                  child: ListTile(
                    // onTap: () {
                    //   Navigator.pushNamed(context, Routes.closeUp);
                    // },

                    leading: SizedBox(
                      width: 64.0,
                      height: 64.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(64.0),
                        child: RepaintBoundary(
                          child: Image(
                            image: NetworkImage(snapshot.data.url),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: new Text(text)));
  }
}
