import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/CommonWidget/Clippers/BottomWaveClipper.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiClasses.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiDetailledClass.dart';
import 'package:waven_app/AppUi/SimpleFoldingCell.dart';
import 'package:waven_app/AppUi/Utils/ClassToAnythingHelper.dart';
import 'package:waven_app/AppUi/Utils/GradientHelper.dart';

class ClassesListFolderWidget extends StatefulWidget {
  final ResponseWavenApiClass data;

  const ClassesListFolderWidget({Key key, this.data}) : super(key: key);

  @override
  _ClassesListFolderWidgetState createState() =>_ClassesListFolderWidgetState();
}

class _ClassesListFolderWidgetState extends State<ClassesListFolderWidget> {
  ResponseWavenApiDetailledClass detailledClass;
  MapClassGradient mapClassGradient ;
  MapClassLogo mapClassLogo;
  @override
  void initState() {
    setState(() {
      mapClassGradient = new MapClassGradient();
      mapClassLogo = new MapClassLogo();
    });
    super.initState();
  }
  @override
   Widget build(BuildContext context) {
    return SimpleFoldingCell(
      frontWidget:_buildFrontWidget(),
      innerTopWidget: _buildInnerTopWidget(),
      innerBottomWidget: _buildInnerBottomWidget(),
      cellSize: Size(MediaQuery.of(context).size.width, 150),
    );
  }

  _buildFrontWidget() {
    print(mapClassGradient.classToGradient.length);
    return ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: widget.data.imageUrl == null || widget.data.imageUrl == ""
                ? Image.asset(
                    'images/ShushusImages/ShushusSkill/default.png',
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    alignment: FractionalOffset.topCenter,
                    imageUrl: widget.data.imageUrl,
                    fit: BoxFit.cover,
              placeholder: (context, url) => SnapshotLoadingIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.data.name.toUpperCase(),
                style: TextStyle(fontSize: 26.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                    height: 3.0,
                    child: Container(
                      //GodId: MapFamily.GodFamilyBiMap['Cra']
                      decoration:mapClassGradient.classToGradient[widget.data.name],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildInnerTopWidget() {
    const double headerSize = 40;
    return ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          //le Lore
          Center(child: Image.asset(mapClassLogo.classToLogoAsset[widget.data.name],fit: BoxFit.cover,)),
          Container(
            color: Colors.black.withOpacity(0.70),
          ),
          Container(
            decoration: GradientBg(),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: headerSize, left: 5.0, right: 5.0, bottom: 5.0),
              child: AutoSizeText(
                widget.data.description,
                minFontSize: 12,
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          //L'entete
          Container(
            child: ClipPath(
                clipper: BottomWaveClipper(),
                child: SizedBox(
                  height: headerSize,
                  child: Container(
                    decoration: mapClassGradient.classToGradient[widget.data.name],
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.data.fullName),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  _buildInnerBottomWidget() {
    return ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: FutureBuilder(
            future: WavenApiProvider.GetDetailledClassById(widget.data.id),
            builder: (BuildContext context,
                AsyncSnapshot<ResponseWavenApiDetailledClass> snapshot) {
              return snapshot.data == null
                  ? SnapshotLoadingIndicator()
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.weapons.length,
                      itemBuilder: (BuildContext context, int index) {
                      return _buildWeaponItem(snapshot.data.weapons[index]);
                      },
                    );
            }));
  }

  _buildWeaponItem(Weapon weapon) {
    return GestureDetector(
      onTap: (){
//        Navigator.push(context,
//            PageTransition(type: PageTransitionType.leftToRight, child: WeaponDetailAnimator(weaponData: weapon,) ));
      },
      child: ConstrainedBox(
          constraints:
          BoxConstraints(maxWidth: 115.0, maxHeight: 125.0),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Stack(children: <Widget>[
              Hero(
                tag: "tag"+weapon.id,
                child: weapon.imageUrl == null || weapon.imageUrl == ""?
                Image.asset('images/ShushusImages/ShushusSkill/default.png',  height: 40, fit: BoxFit.cover,
                  width: 40,):
                CachedNetworkImage(
                  imageUrl: weapon.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => new SnapshotLoadingIndicator(),
                  errorWidget: (context, url, error) => Image.asset('images/ShushusImages/ShushusSkill/default.png', height: 40,width: 40,),
                ),
              ),
              Positioned(
                bottom: 3,
                left: 3,
                child:
                weapon.spells[0].iconUrl == null || weapon.spells[0].iconUrl == ""?
                Image.asset('images/ShushusImages/ShushusSkill/default.png',  height: 40, fit: BoxFit.cover,
                  width: 40,):
                CachedNetworkImage(
                  height: 40,
                  width: 40,
                  imageUrl: weapon.spells[0].iconUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => new SnapshotLoadingIndicator(),
                  errorWidget: (context, url, error) => Image.asset('images/ShushusImages/ShushusSkill/default.png', height: 40,width: 40,),
                ),
              ),
            ]),
          )
      ),
    );
  }
}
