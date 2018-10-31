import 'package:flutter/material.dart';
import 'package:waven_app/pages/ArmoryBuilderCreateNew.dart';
import 'package:waven_app/util/EnumHelper.dart';

class ArmoryBuilderPage extends StatefulWidget {
  @override
  _ArmoryBuilderPageState createState() => _ArmoryBuilderPageState();
}

class _ArmoryBuilderPageState extends State<ArmoryBuilderPage> {
  final int nbGodsCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black12, child: _buildGodList());
  }

  _buildGodList() {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return GridView.builder(
        itemCount: 18,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4),
        itemBuilder: (context, index) {
          var className =
              WavenPrimaryClass.values[index].toString().split('.')[1];
          return InkWell(
            onTap: () => _onGodClicked(className),
            child: GridGodItem(
                loreTitle: className,
                imgUrl: "images/background_logo/logo_$className.png"),
          );
        });
  }

  _onGodClicked(className) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ArmoryBuilderCreatePage(urlClasseBackground:"images/background_logo/logo_$className.png",)),
    );
  }
}


class GridGodItem extends StatelessWidget {
  final String imgUrl;
  final String loreTitle;
  static const double height = 220.0;

  GridGodItem(
      {Key key,
        @required this.loreTitle,
        this.imgUrl})
      : assert(loreTitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.white);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Transform(
        alignment: Alignment.center,
          transform: Matrix4.skewX(-0.15),
          child: new SafeArea(
            top: false,
            bottom: false,
            child: new Container(
              color: Colors.grey[800],
              padding: const EdgeInsets.all(3.0),
              height: height,
              child: Container(
                decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white70),
                  image: new DecorationImage(
                    image: new Image.asset(imgUrl).image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: new Text(
                    loreTitle,
                    style: titleStyle,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
