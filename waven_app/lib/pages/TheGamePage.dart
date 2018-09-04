import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waven_app/widgets/FixedAppBar.dart';
import 'package:waven_app/widgets/FlexibleAppBar.dart';
import 'package:zoomable_image/zoomable_image.dart';

class TheGamePage extends StatefulWidget {
  @override
  TheGamePageState createState() => new TheGamePageState();
}

class TheGamePageState extends State<TheGamePage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    //Theme/style
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.white,fontSize: 14.0);
    final TextStyle descriptionStyle = theme.textTheme.subhead.copyWith(color: Colors.white70,fontSize: 11.0);
    const Key expandedKey = const PageStorageKey<String>('expanded');

       return   new ListView(
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
                                title: new Text("Blindage",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Le Blindage fonctionne de la même manière que les points de vie, à la différence qu'ils ne sont pas sensibles aux dégâts magiques et qu'ils ne peuvent pas être soignés.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/ZOsterD.png',height: 50.0,width: 50.0,),
                                title: new Text("Assomer",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Effet qui empêche un personnage de se déplacer et d'attaquer jusqu'à son prochain tour.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/5GLYiEv.png',height: 50.0,width: 50.0,),
                                title: new Text("Charge",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Cet effet permet au personnage de se déplacer en ligne droite. Nécessite un adversaire à portée sur la ligne pour être lancée.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/JpoamI3.png',height: 50.0,width: 50.0,),
                                title: new Text("Rembobinage",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Effet qui permet de faire revenir un sort en main 1 fois par tour s'il n'est pas le premier sort joué du tour.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/q8SGmL1.png',height: 50.0,width: 50.0,),
                                title: new Text("Mouillé",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Etat élémentaire d'Eau appliqué à un personnage qui permet de lui appliquer des effets supplémentaires.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/Kr3kD31.png',height: 50.0,width: 50.0,),
                                title: new Text("Boueux",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Etat élémentaire de Terre appliqué à un personnage qui permet de lui appliquer des effets supplémentaires.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/syffPFl.png',height: 50.0,width: 50.0,),
                                title: new Text("Huilé",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Etat élémentaire de Feu appliqué à un personnage qui permet de lui appliquer des effets supplémentaires.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/f3MVVRW.png',height: 50.0,width: 50.0,),
                                title: new Text("Eventé",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Etat élémentaire d'Air appliqué à un personnage qui permet de lui appliquer des effets supplémentaires.",style: descriptionStyle),
                              ),
                            ],
                          ),

                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 5.0,bottom: 100.0),
                                  child:new FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://i1.wp.com/tot-prod.blog/wp-content/uploads/2018/05/Sablier_gif_picto.gif?resize=334%2C332&ssl=1',
                                    // fit: BoxFit.cover,
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5.0,bottom: 100.0),
                                  child:new FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://imgur.com/AkRM9iC.gif',
                                    // fit: BoxFit.cover,
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5.0,bottom: 10.0),
                                  child:new FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://i2.wp.com/tot-prod.blog/wp-content/uploads/2018/05/Brulure_gif_picto.gif?resize=346%2C312&ssl=1',
                                    // fit: BoxFit.cover,
                                  )
                              ),
                            ],
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
                  title: const Text('Termes Utilisés :'),
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 5.0,bottom: 100.0),
                                  child:new FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://imgur.com/lwvfpEP.gif',
                                    // fit: BoxFit.cover,
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5.0,bottom: 100.0),
                                  child:new FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://cdn.discordapp.com/attachments/470519553101791243/474335918216708099/PetiteVieille_Pigeons-1.gif',
                                    // fit: BoxFit.cover,
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5.0,bottom: 10.0),
                                  child:new FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://imgur.com/ErclPcu.gif',
                                    // fit: BoxFit.cover,
                                  )
                              ),
                            ],
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          flex: 6,
                          child: new Column(
                            children: <Widget>[
                              new ListTile(
                                leading: new Image.network('https://i.imgur.com/5Vir9Dk.png',height: 50.0,width: 50.0,),
                                title: new Text("Adjacent",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Les cases adjacentes à un personnage sont les 4 cases voisines d'un personnage",style: descriptionStyle),

                              ),
                              new ListTile(
                                leading:new Image.network('https://i.imgur.com/I9Qd7U0.png',height: 50.0,width: 50.0,),
                                title: new Text("Autour",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Les cases autour d'un personnage sont les 8 cases autour d'un personnage",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.network('https://i.imgur.com/f8IbmDo.png',height: 50.0,width: 50.0,),
                                title: new Text("Compagnon",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Personnage pouvant être placé sur le terrain quand vous avez suffisamment de points élémentaires. Ils se déplacent et attaquent de la même manière que votre Héros",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.network('https://i.imgur.com/rUHlNF8.png',height: 50.0,width: 50.0,),
                                title: new Text("Héros",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Personnage principal d'un joueur. La mort d'un héros met fin à la partie.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.network('https://i.imgur.com/1P9W1J1.png',height: 50.0,width: 50.0,),
                                title: new Text("PA",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Les Points d'Action permettent de lancer des sorts en combat.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.network('https://i.imgur.com/YvY23wh.png',height: 50.0,width: 50.0,),
                                title: new Text("Points Elémentaire",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Permettent d'invoquer vos compagnons. Jouer des sorts permet de cumuler les points dans les jauges correspondantes à leurs éléments.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.network('https://i.imgur.com/NZud3Wp.png',height: 50.0,width: 50.0,),
                                title: new Text("Mécanisme",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "Un mécanisme se pose sur une case vide , il n'est pas sensible aux sorts. Il ne peut ni attaquer , ni se déplacer.",style: descriptionStyle),
                              ),
                              new ListTile(
                                leading:new Image.network('https://i.imgur.com/0CRz0zb.png',height: 50.0,width: 50.0,),
                                title: new Text("Réserve",style: titleStyle),
                                isThreeLine: true,
                                subtitle: new Text(
                                    "La réserve est spécifique à la classe du Héros d'un joueur. Une fois activée , elle offre un bonus au Héros pour le tour.",style: descriptionStyle),
                              ),
                            ],
                          ),

                        )
                      ],
                    ),
                  ]
              ),
            ],
          );
       // ]));
  }
}
