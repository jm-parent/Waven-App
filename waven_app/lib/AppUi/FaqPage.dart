import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/CommonWidget/TitleWavenWidget.dart';
import 'package:waven_app/AppUi/Utils/ThemeHelper.dart';
import 'package:waven_app/AppUi/Utils/widget_utils.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}
Color bgMenuColor = Color(0xFF607D8B).withAlpha(100);
Color bgButtonColor = Color(0xFF37474F);
Color bgButtonClickedColor = Color(0xFF4c626d);
class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        leading: BackButton(color: WaventBlue(),),
        title: TitleWavenWidget(
          title: "FAQ",
          leadingIconColor: WaventBlue(),
          titleColor: WaventBlue(),
          underLineColor: WaventBlue(),
          underLineWidth: MediaQuery.of(context).size.width,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: new ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(ScreenAwareHelper.screenAwareSize(12, context)),topRight: Radius.circular(ScreenAwareHelper.screenAwareSize(12, context))),
                      child: Container(
                        color: bgMenuColor,
                        child: ExpansionTile(
                          backgroundColor: Color(0xFF263238),
                          title: AutoSizeText('Quelle est la date de l\'alpha ?'),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText('Nous ne connaissons pas la date de l’alpha pour le moment. XyaLe partagera la date dans un article d’ici la fin du mois.'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Aurons nous le choix du sexe de notre personnage ?','Oui, mais pas dans les premières versions de l’alpha.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Waven est-il un jeu PvP ?','Pvp et pvm. Seul le pvp 1v1 sera disponible au début de l’alpha.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Quand vont sortir les autres classes ?','7 classes disponibles pour l’alpha : Iop, Xelor, Osamodas, Sram, Eniripsa, Sacrieur, Cra . \nLes autres classes seront peut-être ajoutées au fil des ans, au moins pour les 12 dieux principaux. Pour le reste, rien n’est décidé.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Comment fonctionne l\'exp  ?','Nous n’avons pas d’infos récentes sur le sujet.\nDe ce que l’on sait, une ressource obtenable par le biais de récompenses (pvp, pvm, quêtes…) permet d’augmenter le niveau des sorts, compagnons etc… \nLe niveau du personnage n’apporte aucun boost de statistique et ne représente seulement que le temps passé sur le jeu.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Comment va fonctionner l\'équipement ?','Le seul équipement de WAVEN est l’arme : \nL’arme change tes statistiques, ton skin et te donne 1 passif et 1 sort.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Combien de clé pour l\'alpha ?','Nous n’avons pas l’information pour le moment.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Faire partie du discord suffit-il à obtenir une clé pour l\'alpha ?','Non.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Quel est le modèle économique du jeu ?','Le jeu sera un F2P avec une boutique de customisation. (des skins alternatifs des armes qui ne change que le look du perso mais garde les mêmes stats, par exemple : L’épée Champion Flamboyant pourra avoir en boutique un skin alternatif qui permet de jouer un Champion Flamboyant de couleur noir plutôt que rouge)'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Le jeu aura-t-il un Open World ?','Non, l’exploration du monde sera par zones instanciées. On a pas plus d’informations pour l’instant (nombre de joueurs etc…)'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Des nations, des guildes sont-elles prévues ?','Les nations comme Bonta ou Brakmar seront présentes d’une certaine manière, on ne sait pas encore précisément comment. Il y aura bien un système de guilde.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Combien de compagnons sont prévus ?','70 et de nouveaux compagnons pourront être ajoutés au fil des mises à jour / extensions.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Combien d\'armes sont prévues pour la sortie du jeu ?','5 armes sont disponibles pour l’alpha, Ankama souhaiterait 10 armes pour chaque classe à la sortie officielle.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Il y aura des lignes de vu et des obstacle dans les combat ?','Certains sorts ont des conditions de lancer (par exemple : en ligne) pas de ligne de vue actuellement. \nDes obstacles peuvent être invoqués dans le combat par certaines classes (les sinistros du Xelor par exemple), on ne connaît pas l’apparence finale ni la variété des arènes de combat. Donc peut-être qu’il y aura des arènes avec des obstacles, peut-être pas.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Il y aura des armes et des compagnons dans la boutique ou que des skins ?','C’est possible, la boutique n’a pas encore été construite par Ankama, donc rien n’est fixe pour son contenu futur. En revanche si des armes ou des compagnons seront achetables en boutique, on pourra aussi les obtenir IG, la boutique permettra seulement de les avoir plus rapidement.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Comment on fera évoluer l\'île qui nous appartient ?','On ne le sait pas encore.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Pourrons-nous choisir un pseudo ou est-ce que ce sera celui de notre compte ?','Pour jouer à Waven, tu devras créer un personnage en choisissant sa classe (Iop, Cra, Sram etc…) tu devras lui choisir un nom, et cela deviendra ton pseudo IG.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Waven a-t-il un objectif de devenir un jeu "e-sport" ?','Ankama souhaite créer des évènements esport avec Waven, mais Waven ne sera pas un jeu uniquement Esport.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Y aura t-il des “mini-jeux”  dans la version finale ?','Différents modes de jeux sont prévus. “Battle Royal”, Boss Fight, 3v3, 2v2, 1v1, GvG, Donjons etc…'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Est-ce que l\'alpha sera sous NDA ?','Non, on pourra partager publiquement le contenu découvert sur l’alpha.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Y aura-t-il un abonnement ?','Non'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion(' Combien de sort pourra t\'on avoir au maximum dans notre main ?','7.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('On commence le combat avec combien de sorts dans la main ?','4 et tu pioches un sort au début de ton tour, donc 5.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Les “skins alternatif” d’une arme sont toujours d’actualité ?','Oui.'),
                  Divider(height: 1,color: Colors.grey,),
                  _buildQuestion('Les sorts sont piochés aléatoirement à chaque tour ?','Au début du combat le premier tirage est aléatoire. Ensuite, les sorts forment une rotation dans l\'ordre dans lesquels on les lance. De telle façon que l\'on peut anticiper à quel moment chaque joueur va piocher tel ou tel sort une fois qu\'ils ont lancé une première fois les 9 sorts de leur deck.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildQuestion(String s, String t) {
   return Container(
      color: bgMenuColor,
      child: ExpansionTile(
        backgroundColor: Color(0xFF263238),
        title: AutoSizeText(s),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(t),
          ),
        ],
      ),
    );
  }
}
