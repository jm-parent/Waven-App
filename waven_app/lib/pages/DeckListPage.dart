import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waven_app/CustomContainers/ParallelogramContainer.dart';
import 'package:waven_app/pages/DeckDetailPage.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/MockDataHelper.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/util/widget_utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:waven_app/widgets/HighlightedIcon.dart';

class DeckListPage extends StatefulWidget {
  DeckListPage();

  @override
  DeckListPageState createState() {
    return new DeckListPageState();
  }
}

class DeckListPageState extends State<DeckListPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool IsClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: GradientBackground(0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: MockDataHelper.deckModelList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            highlightColor: Colors.blue.withOpacity(0.6),
            splashColor: Colors.blue,
            onLongPress: () => showDialog<Null>(
                  context: context,
                  builder: (BuildContext context) {
                    return buildAlertDialogDeckLongPress(index);
                  },
                ),
            onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return new DeckDetailPage(MockDataHelper.deckModelList[index]);
            })),
            child: new Slidable(
              delegate: new SlidableDrawerDelegate(),
              actionExtentRatio: 0.25,
              child: Card(
                child: Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.white70),
                  ),
                  child: new Row(
                    children: <Widget>[
                      buildLeftSection(index),
                      buildMiddleSection(context,index),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildRightSection(index),
                      )
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
//              new IconSlideAction(
//                caption: 'Favorites',
//                color: Color.fromRGBO(255, 50, 40, 1.0),
//                icon: FontAwesomeIcons.heart,
//                onTap: () => _showSnackBar(context,'Favorites'),
//              ),
                new IconSlideAction(
                  caption: 'Share',
                  color: Colors.indigo,
                  icon: Icons.share,
                  onTap: () =>debugPrint('Share'),
                ),
//              new IconSlideAction(
//                caption: 'Edit',
//                color: Colors.black45,
//                icon: Icons.edit,
//                onTap: () => _showSnackBar(context,'Edit'),
//              ),
              ],
              secondaryActions: <Widget>[
                new IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => debugPrint('Delete'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget buildLeftSection(int index)
  {
    return Hero(
      tag: MockDataHelper.deckModelList[index].tagHero,
      child: Image.asset(
        MockDataHelper.deckModelList[index].assetUrl,
        fit: BoxFit.contain,
        height: 80.0,
      ),
    );
  }

  Widget buildRightSection(int index) {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
//            GestureDetector(
//              onTap: () => setState(() {
//                IsClicked = !IsClicked;
//              }),
//              child: AnimatedCrossFade(
//                  firstChild: Icon(Icons.star_border),
//                  secondChild: Icon(Icons.star),
//                  crossFadeState: IsClicked
//                      ? CrossFadeState.showSecond
//                      : CrossFadeState.showFirst,
//                  duration: Duration(milliseconds: 500)),
//            ),
            new Text(
              "Nom du Créateur",
              style: new TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
            Row(
              children: <Widget>[
                new Text(
                  "10/11/2018",
                  style:
                      new TextStyle(color: Colors.lightGreen, fontSize: 12.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: new CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 4.0,
                      child: Container()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMiddleSection(BuildContext context,int index) {
    return new Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenAwareHelper.screenAwareSize(15.0, context)),
        child: Transform(
          transform: Matrix4.skewX(-0.15),
          child: new Container(
            decoration: new BoxDecoration(
                border: new Border(
                    left: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Padding(
              padding: EdgeInsets.only(
                  left: ScreenAwareHelper.screenAwareSize(5.0, context)),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text(
                    MockDataHelper.deckModelList[index].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  new Text(
                    MockDataHelper.deckModelList[index].desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  buildDeckLevelIndicator(index),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAlertDialogDeckLongPress(int index) {
    return new AlertDialog(
      title: new Text(MockDataHelper.deckModelList[index].name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () => debugPrint('Edit Deck clicked'),
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Deck'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () => debugPrint('Share Deck clicked'),
              child: ListTile(
                leading: Icon(Icons.share),
                title: Text('Share Deck'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () =>
                  debugPrint('Delete Deck clicked'),
              child: ListTile(
                leading: Icon(Icons.delete_forever),
                title: Text('Delete Deck'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'))
      ],
    );
  }

  Widget buildDeckLevelIndicator(int index) {
    if(MockDataHelper.deckModelList[index].deckLevel == DeckLevel.Beginner)
      return Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.green),
          Text(" Beginner",
              style: TextStyle(color: Colors.white))
        ],
      );
    if(MockDataHelper.deckModelList[index].deckLevel == DeckLevel.Intermediate)
      return Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text(" Intermediate",
              style: TextStyle(color: Colors.white))
        ],
      );
    if(MockDataHelper.deckModelList[index].deckLevel == DeckLevel.Advanced)
      return Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.red),
          Text(" Advanced",
              style: TextStyle(color: Colors.white))
        ],
      );

  }
}
