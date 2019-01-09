import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenWorld/WavenWorldDetailPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenWorld/WavenWorldItems.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenWorld/WavenWorldListItem.dart';
import 'package:waven_app/Core/PageTransformer.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class WavenWorldPage extends StatefulWidget {
  @override
  WavenWorldPageState createState() {
    return new WavenWorldPageState();
  }
}

class WavenWorldPageState extends State<WavenWorldPage>
    with SingleTickerProviderStateMixin {

  PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: _buildAppBar(),
        body:Stack(
          children: <Widget>[
            Container(
              decoration: GetGradient(),
            ),
            buildLorePageView()
          ],
        )
       );
  }

  Decoration GetGradient()
  {
    return new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0,0.5,1],
          colors: [
           LightColor(),

            Color.fromRGBO(2,16,25, 1.0),

           DarkColor(),
          ],
        ));
  }

  buildLorePageView() {
    return PageTransformer(
      pageViewBuilder: (context, visibilityResolver) {
        return PageView.builder(
          controller: _pageController,
          itemCount: WavenWorldItems.length,
          itemBuilder: (context, index) {
            final item = WavenWorldItems[index];
            final pageVisibility =
                visibilityResolver.resolvePageVisibility(index);
                  return GestureDetector(
                    onTap: () {
                     Navigator.push(context,new MaterialPageRoute( builder: (context) => new WavenWorldDetailPage(item: item,)));
                    },
                    child: Hero(
                      tag: item.title+'tag',
                      child: WavenWorldListItem(
                        item: item,
                        pageVisibility: pageVisibility,
                      ),
                    ),
                );
          },
        );
      },
    );
  }

  _buildAppBar() {
    return  AppBar(
      backgroundColor: DarkColor(),
      title: Row(
        children: <Widget>[
          Text("Le Lore"),
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
              'https://besl.pro/storage/images/teams/notlikethis-0ql0gpt2o7.png')
        ],
      ),
    );
  }


}
