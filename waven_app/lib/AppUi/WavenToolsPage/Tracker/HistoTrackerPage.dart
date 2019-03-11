import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/Database/Database.dart';
import 'package:waven_app/AppUi/Database/Models/HistoDeckDbModel.dart';
import 'package:waven_app/AppUi/WavenToolsPage/Tracker/AddNewMatchPopup.dart';

class HistoTrackerPage extends StatefulWidget {
  @override
  _HistoTrackerPageState createState() => _HistoTrackerPageState();
}

class _HistoTrackerPageState extends State<HistoTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainDarkBlueL1(),
      appBar: AppBar(title: Text("Mon historique")),
      body: FutureBuilder<List<HistoDeckDbModel>>(
        future: DBProvider.db.getAllHistoDeckDbModels(),
        builder: (BuildContext context,
            AsyncSnapshot<List<HistoDeckDbModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(

              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                HistoDeckDbModel item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteHistoDeckDbModel(item.id);
                  },
                  child: _buildHistoTile(item),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AddNewMatchPopup(
                      imageUrl:
                          "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                      title: Text('Granny Eating Chocolate',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600)),
                      description: Text(
                        'This is a granny eating chocolate dialog box.This library helps you easily create fancy giffy dialog',
                        textAlign: TextAlign.center,
                      ),
                      onOkButtonPressed: saveGame,
                    ));
          }
          ),
    );
  }

  Future saveGame(HistoDeckDbModel dataToSave) async {
    setState(() {});
    await DBProvider.db.addHistoDeck(dataToSave);
  }

  GetLeftWinnerDeco()
  {
    return new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,

          stops: [0.0,0.5,1.0],
          colors: [
            mainDarkBlueD2(),
            mainDarkBlueD1(),
            Color(0xFF0FA529),
          ],
        ));
  }
  GetRightWinnerDeco()
  {
    return new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0,0.5,1.0],
          colors: [
            mainDarkBlueD2(),
            mainDarkBlueD1(),
            Color(0xFF0FA529),
          ],
        ));
  }
  _buildHistoTile(HistoDeckDbModel item) {

    return  ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
         decoration: item.winnerSide == "Us" ? GetLeftWinnerDeco():GetRightWinnerDeco(),
          child: Stack(
            children: <Widget>[
            Positioned(
              left: 10,
              top: 10,
              bottom: 10,
              child: CachedNetworkImage(
                imageUrl: item.imageUsUrl,
                fit: BoxFit.cover,
                placeholder: new Center(
                  child: new CircularProgressIndicator(),
                ),
                errorWidget: new Icon(Icons.error),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              bottom: 10,
              child: CachedNetworkImage(
                imageUrl: item.imageThemUrl,
                fit: BoxFit.cover,
                placeholder: new Center(
                  child: new CircularProgressIndicator(),
                ),
                errorWidget: new Icon(Icons.error),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
