import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/WavenBuildModel.dart';
import 'package:waven_app/pages/PickShushuPage.dart';
import 'package:waven_app/util/EnumHelper.dart';

class PickClassPage extends StatelessWidget {

  var contextClass;
  @override
  Widget build(BuildContext context) {
    contextClass = context;
    return _pickClassWidget;
  }

  Widget get _pickClassWidget {
    return new Material(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:15.0,bottom: 8.0),
              child: Text("Choisis une classe primaire :",style:  Theme.of(contextClass).textTheme.headline.copyWith(
                  color: Colors.white70),),
            ),
            Expanded(
              child: new GridView.extent(
                maxCrossAxisExtent: 240.0,
                children: _buildPickClassTiles(),
                // mainAxisSpacing: 10.0,
                // crossAxisSpacing: 10.0,
                // padding: EdgeInsets.all(8.0),
              ),
            ),
          ],
        ));
  }

  _buildPickClassTiles() {
    List<Card> containers =
    new List<Card>.generate(18, (int index) {
      var wavenClasse = WavenPrimaryClass.values[index].toString().split('.')[1];
      var url = WavenPrimaryClassAndImages[wavenClasse];
      return Card(
        margin: EdgeInsets.all(8.0),
        child: new GridTile(
          header: Center(
            child: Text(wavenClasse,style:  Theme.of(contextClass).textTheme.headline.copyWith(
                color: Colors.white70),),
          ),
          child: new InkResponse(
            onTap: () => _onTileClicked(index,wavenClasse,contextClass),
            child: new Hero(
              tag: wavenClasse,
              child:  new CachedNetworkImage(
                imageUrl: url,
                placeholder: _loadingView,
                errorWidget: new Icon(Icons.error),

              ),
            ),
          ),
        ),
      );
    });
    return containers;
  }


  _onTileClicked(i,wavenClasse,context) {
    print(wavenClasse);
    WavenBuildModel buildModel = new WavenBuildModel("", wavenClasse, "", null);
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new PickShushuPage(buildModel);
    }));
  }
}

Widget get _loadingView {
  return new Center(
    child: new CircularProgressIndicator(),
  );
}

Widget _tempCard(String label) {
  return Card(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Text(label),
    ),
  );
}



Map<String, String> WavenPrimaryClassAndImages =  new Map.from({
  'Ecaflip': 'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/6.jpg',
  'Eniripsa': 'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/7.jpg',
  'Iop': 'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/8.jpg',
  'Cra':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/9.jpg',
  'Feca':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/1.jpg',
  'Sacrieur':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/11.jpg',
  'Sadida':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/10.jpg',
  'Osamodas':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/2.jpg',
  'Enutrof':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/3.jpg',
  'Sram':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/4.jpg',
  'Xelor':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/5.jpg',
  'Pandawa':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/12.jpg',
  'Roublard':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/13.jpg',
  'Zobal':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/14.jpg',
  'Steamer':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/15.jpg',
  'Eliotrope':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/16.jpg',
  'Huppermage':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/17.jpg',
  'Ouginak':'https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/18.jpg',
});