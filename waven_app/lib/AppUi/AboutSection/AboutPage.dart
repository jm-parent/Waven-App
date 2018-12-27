import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/GenWidgets/WavenPageWithBackground.dart';
import 'package:waven_app/util/ThemeHelper.dart';
import 'package:waven_app/util/widget_utils.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WavenPageWithBackground(),
      ListView(
        children: <Widget>[
          buildAboutCard('', buildAppVersion(context),context),
          buildAboutCard('Waven & Ankama', buildCopyright(context),context),
          buildAboutCard('Support', buildAboutMe(context),context),
        ],
      )
    ]);
  }

  buildAboutCard(String title, Widget child,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        color: LightColor(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title!=''?ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Container(
              decoration:  BoxDecoration(
                color: DarkColor(),
                borderRadius:
                new BorderRadius.circular(ScreenAwareHelper.screenAwareSize(3.0, context)),
              ),
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0,right: 8.0,left: 25.0,bottom: 8.0),
                  child: Text(title,
                      style: Theme.of(context).textTheme.headline),
                ),
              ),
            ):Container(),
            child,
          ],
        ),
      ),
    );
  }

  Widget buildCopyright(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,right: 8.0,left: 25.0,bottom: 8.0),
      child: new RichText(
        text: new TextSpan(
          children: [
            new TextSpan(
              style: Theme.of(context).textTheme.subhead,
              text:
                  'Waven and all content shown in this app is Copyright @ Ankama Games - All Rights Reserved. This app is not related with ',
            ),
            new TextSpan(
              text: 'Ankama Games',
              style: Theme.of(context).textTheme.subhead,
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Hyperlink to https://www.ankama.com/fr/games');
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppVersion(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,right: 8.0,left: 25.0,bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  style: Theme.of(context).textTheme.subhead,
                  text:
                  'Waven Companion v0.1',
                ),
              ],
            ),
          ),
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  style: Theme.of(context).textTheme.subhead,
                  text:
                  'Powered by Flutter',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAboutMe(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,right: 8.0,left: 25.0,bottom: 8.0),
      child: Column(
        children: <Widget>[
          new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  style: Theme.of(context).textTheme.subhead,
                  text:
                  'You can support Waven Companion rating high this app in the market and sharing it with your friends.',
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
              onPressed: () => print('hello'),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              child: new Center(child: new Text('Coming Soon...', style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
            ),
          ),
        ],
      ),
    );
  }
}
