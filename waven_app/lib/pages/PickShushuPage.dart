import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/models/WavenBuildModel.dart';
import 'package:waven_app/util/EnumHelper.dart';

class PickShushuPage extends StatelessWidget {

  WavenBuildModel buildModel;

  PickShushuPage(this.buildModel);

  var contextClass;
  @override
  Widget build(BuildContext context) {
    contextClass = context;
    return _pickShushuWidget;
  }

  Widget get _pickShushuWidget {
    return new Material(
        child: Column(
          children: <Widget>[
            new AppBar(title: Text("Choisis un shushu")),
            Expanded(
              child: new GridView.extent(
                maxCrossAxisExtent: 240.0,
                children: _buildPickShushuTiles(),
                // mainAxisSpacing: 10.0,
                // crossAxisSpacing: 10.0,
                // padding: EdgeInsets.all(8.0),
              ),
            ),
          ],
    ));
    }


  _buildPickShushuTiles() {
    List<Card> containers =
    new List<Card>.generate(3, (int index) {
      var UrlsShushu = WavenShushus[buildModel.PrimaryClass];
      var urlCutted = UrlsShushu.split('|')[index].toString();
      return Card(
        margin: EdgeInsets.all(8.0),
        child: new GridTile(
          child: new InkResponse(
            onTap: () => _onTileClicked(index,buildModel.PrimaryClass,contextClass),
            child: new Hero(
              tag: 'test'+index.toString(),
              child:  new CachedNetworkImage(
                imageUrl: urlCutted,
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


  _onTileClicked(i,wavenShushu,context) {
    print(wavenShushu);
    WavenBuildModel shushuBuildModel = new WavenBuildModel("", buildModel.PrimaryClass,wavenShushu, null);
   // Navigator.push(context, new MaterialPageRoute(builder: (context) {
    //  return new PickSpellsPage(shushuBuildModel);
    //}));
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

Map<String, String> WavenShushus =  new Map.from({
  'Ecaflip': "https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/6.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/6.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/6.jpg",
  'Eniripsa': "https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/7.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/7.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/7.jpg",
  'Iop': "https://i2.wp.com/waven-game.com/wp-content/uploads/2018/06/class_iop_chevalier.png|https://i2.wp.com/waven-game.com/wp-content/uploads/2018/06/class_iop_framboyant.png|https://i1.wp.com/waven-game.com/wp-content/uploads/2018/06/class_iop_spectral.png",
  'Cra':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/9.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/9.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/9.jpg",
  'Feca':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/1.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/1.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/1.jpg",
  'Sacrieur':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/11.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/11.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/11.jpg",
  'Sadida':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/10.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/10.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/10.jpg",
  'Osamodas':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/2.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/2.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/2.jpg",
  'Enutrof':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/3.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/3.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/3.jpg",
  'Sram':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/4.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/4.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/4.jpg",
  'Xelor':"https://i1.wp.com/waven-game.com/wp-content/uploads/2018/06/class_xelor.png|https://i0.wp.com/waven-game.com/wp-content/uploads/2018/06/class_xelor_synchronisateur.png|https://i0.wp.com/waven-game.com/wp-content/uploads/2018/06/class_xelor_multielement.png",
  'Pandawa':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/12.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/12.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/12.jpg",
  'Roublard':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/13.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/13.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/13.jpg",
  'Zobal':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/14.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/14.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/14.jpg",
  'Steamer':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/15.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/15.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/15.jpg",
  'Eliotrope':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/16.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/16.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/16.jpg",
  'Huppermage':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/17.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/17.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/17.jpg",
  'Ouginak':"https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/18.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/18.jpg|https://s.ankama.com/www/static.ankama.com/dofus/ng/modules/mmorpg/encyclopedia/breeds/assets/illu/18.jpg",
});