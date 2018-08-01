import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/widgets/FixedAppBar.dart';
import 'package:waven_app/widgets/FlexibleAppBar.dart';


class TheGamePage extends StatefulWidget {
  @override
  TheGamePageState createState() => new TheGamePageState();
}

class TheGamePageState extends State<TheGamePage> {
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }


  @override
  Widget build(BuildContext context) {


    //https://cdn.discordapp.com/attachments/470519553101791243/471018659981164556/DhVNRoYWAAALjiH.jpg
    //Theme/style
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.white,fontSize: 14.0);
    final TextStyle descriptionStyle = theme.textTheme.subhead.copyWith(color: Colors.white70,fontSize: 11.0);
    const Key expandedKey = const PageStorageKey<String>('expanded');
    final Key tileKey = new UniqueKey();
    return NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              expandedHeight: 200.0,
              title: Text("Le Jeu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  )),
              forceElevated: boxIsScrolled,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                centerTitle: true,
                background:
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: new Image.asset('images/thegame_medias/thegame_trailer.gif',fit: BoxFit.fitWidth,),
                ),
              ),
            ),
          ];
        },
        body: Stack(children: <Widget>[
//          Container(
//              decoration: new BoxDecoration(
//            image: new DecorationImage(
//              image: new Image.asset("images/logo_waven.png").image,
//              fit: BoxFit.fitWidth,
//            ),
//          )),
          new ListView(
            children: <Widget>[
              //Row Caractéristique
              new ExpansionTile(
                  key: expandedKey,
                  initiallyExpanded: true,
                  title: const Text('Caractéristiques des personnages'),
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child:new FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: 'https://imgur.com/2IzwxG4.gif',
                                // fit: BoxFit.cover,
                              )
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          flex: 6,
                          child: new Column(
                            children: <Widget>[
                              new ListTile(
                                leading: new Image.asset('images/thegame_medias/thegame_atq.png'),
                                title: new Text("At/Portée",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points d'attaque. Nombre de déâts infligés par un personnage lors d'une attaque. La portée est la distance d'attaque d'un personnage.",style: descriptionStyle),

                              ),
                              new ListTile(
                                leading:new Image.asset('images/thegame_medias/thegame_pv.png'),
                                title: new Text("PV",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Vie. Les Points de Vie sont retirés quand le personnage subit des Dégâts. Quand ils tombent à 0 , le personnage es retiré du terrain.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.asset('images/thegame_medias/thegame_pm.png'),
                                title: new Text("PM",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Mouvement. Les Points de Mouvement représentent la distance de déplacement d'un personnage",style: descriptionStyle),
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ]
              ),
              //Row Effets
              new ExpansionTile(
                  key: expandedKey,
                  initiallyExpanded: false,
                  title: const Text('Effets et états'),
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: new Column(
                            children: <Widget>[
                              new ListTile(
                                leading: new Image.network('https://imgur.com/s0s70nl.png',height: 50.0,width: 50.0,),
                                title: new Text("AR",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points D'armure. Les points d'Armure sont ajoutés aux Points de Vie d'un personnage. Ils ne peuvent pas être soignés",style: descriptionStyle),

                              ),
                              new ListTile(
                                leading: new Image.network('https://imgur.com/brQXb3l.png',height: 50.0,width: 50.0,),
                                title: new Text("PV",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Vie. Les Points de Vie sont retirés quand le personnage subit des Dégâts. Quand ils tombent à 0 , le personnage es retiré du terrain.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://imgur.com/s0s70nl.png',height: 50.0,width: 50.0,),
                                title: new Text("PM",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Mouvement. Les Points de Mouvement représentent la distance de déplacement d'un personnage",style: descriptionStyle),
                              )
                            ],
                          ),

                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child:new FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: 'https://imgur.com/2IzwxG4.gif',
                                // fit: BoxFit.cover,
                              )
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                  ]
              ),
              new ExpansionTile(
                  key: expandedKey,
                  initiallyExpanded: false,
                  title: const Text('Caractéristiques des personnages'),
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child:new FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: 'https://imgur.com/2IzwxG4.gif',
                                // fit: BoxFit.cover,
                              )
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          flex: 6,
                          child: new Column(
                            children: <Widget>[
                              new ListTile(
                                leading: new Image.asset('images/thegame_medias/thegame_atq.png'),
                                title: new Text("At/Portée",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points d'attaque. Nombre de déâts infligés par un personnage lors d'une attaque. La portée est la distance d'attaque d'un personnage.",style: descriptionStyle),

                              ),
                              new ListTile(
                                leading:new Image.asset('images/thegame_medias/thegame_pv.png'),
                                title: new Text("PV",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Vie. Les Points de Vie sont retirés quand le personnage subit des Dégâts. Quand ils tombent à 0 , le personnage es retiré du terrain.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.asset('images/thegame_medias/thegame_pm.png'),
                                title: new Text("PM",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Mouvement. Les Points de Mouvement représentent la distance de déplacement d'un personnage",style: descriptionStyle),
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ]
              ),
              new ExpansionTile(
                  key: expandedKey,
                  initiallyExpanded: false,
                  title: const Text('Caractéristiques des personnages'),
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child:new FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: 'https://imgur.com/2IzwxG4.gif',
                                // fit: BoxFit.cover,
                              )
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          flex: 6,
                          child: new Column(
                            children: <Widget>[
                              new ListTile(
                                leading: new Image.asset('images/thegame_medias/thegame_atq.png'),
                                title: new Text("At/Portée",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points d'attaque. Nombre de déâts infligés par un personnage lors d'une attaque. La portée est la distance d'attaque d'un personnage.",style: descriptionStyle),

                              ),
                              new ListTile(
                                leading:new Image.asset('images/thegame_medias/thegame_pv.png'),
                                title: new Text("PV",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Vie. Les Points de Vie sont retirés quand le personnage subit des Dégâts. Quand ils tombent à 0 , le personnage es retiré du terrain.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.asset('images/thegame_medias/thegame_pm.png'),
                                title: new Text("PM",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Points de Mouvement. Les Points de Mouvement représentent la distance de déplacement d'un personnage",style: descriptionStyle),
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ]
              ),
            ],
          )
        ]));
  }
}
