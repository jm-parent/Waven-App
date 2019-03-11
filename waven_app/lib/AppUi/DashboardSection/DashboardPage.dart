import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:waven_app/AppUi/DashboardSection/AnimatedClickableText.dart';
import 'package:waven_app/AppUi/DashboardSection/HorizontalLastNewsList.dart';
import 'package:waven_app/AppUi/DeckBuilderSection/DeckBuilderListPage.dart';
import 'package:waven_app/AppUi/FaqPage.dart';
import 'package:waven_app/DashboardPages/DashboardTitleCat.dart';
import 'package:waven_app/widgets/CarouselSlider.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  var headerHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainDarkBlueL1(),
      appBar: WavenCompanionAppbar(),
      body: ListView(
        children: <Widget>[
          DashboardTitleCat(
              titleCat: "Les Dernières News",
              pageToNavigate: null,
              underlineColor: mainYellow(),
              isMoreShowed: false),
          _BuildCarouselNews(),
          DashboardTitleCat(
              titleCat: "Les Decks du moment",
              pageToNavigate: new DeckBuilderListPage(),
              underlineColor: mainYellow(),
              isMoreShowed: true),
          _BuildPopularDeckList(),
          SizedBox(
            height: 70.0,
          )
        ],
      ),
    );
  }

  _BuildRowHeaderButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: new Container(
                  decoration: GetFirstBackgroundGradient(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Center(
                      child: new Text('Soon ...'),
                    ),
                  ),
                )),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () =>
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new FaqPage())),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Container(
                  decoration: GetSecondBackgroundGradient(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('FAQ')),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Container(
                decoration: GetThirdBackgroundGradient(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Soon ...')),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GetFirstBackgroundGradient() {
    return new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0xFF610305),
            Color(0xFF230648),
          ],
        ));
  }

  GetSecondBackgroundGradient() {
    return new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0xFF230648),
            Color(0xFF1F185A),
          ],
        ));
  }

  GetThirdBackgroundGradient() {
    return new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0xFF1F185A),
            Color(0xFF025173),
          ],
        ));
  }

  @override
  void initState() {
    this._getNewsData();
    super.initState();
  }

  var client = new http.Client();
  RssFeed newsDatas;

  Future<List<RssItem>> _getNewsData() async {
    debugPrint('dansnewsdata');
    var response = await client.get("https://blog.waven-game.com/fr/feed/");
    if (response.statusCode == 200) {
      debugPrint('http ok');
      this.setState(() {
        newsDatas = new RssFeed.parse(response.body);
      });
      debugPrint(newsDatas.items.length.toString());
      return newsDatas.items;
    } else {
      throw Exception('Failed to load Waven News');
    }
  }

  var carouselHeight = 200.0;

  Widget get _loadingView {
    return Container(
      height: carouselHeight,
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }

  int _currentCarousel = 0;

  _BuildCarouselNews() {
    if (newsDatas == null)
      return _loadingView;
    else {
      var newsToShow = newsDatas.items.length >= 5
          ? newsDatas.items.sublist(0, 5)
          : newsDatas.items;
      return Stack(
        children: <Widget>[
          CarouselSlider(
            onPageChanged: (index) {
              setState(() {
                _currentCarousel = index;
              });
            },
            height: carouselHeight,
            viewportFraction: 1.0,
            autoPlay: true,
            withDisto: false,
            scrollDirection: Axis.horizontal,
            autoPlayAnimationDuration: Duration(seconds: 2),
            autoPlayInterval: Duration(seconds: 5),
            items: newsToShow.map((news) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Stack(
                        children: <Widget>[
                          new Positioned.fill(
                            child: new CachedNetworkImage(
                              imageUrl: news.content.images.first,
                              fit: BoxFit.cover,
                              placeholder: new Center(
                                child: Container(),
                              ),
                              errorWidget: new Icon(Icons.error),
                            ),
                          ),
                          Positioned.fill(
                              child: Container(
                                color: Colors.black54,
                              )),
                          Positioned(
                            bottom: 10.0,
                            left: 10.0,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  color: mainYellow(),
                                ),
                                Text(news.pubDate.substring(0, 17)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                          Positioned(
                            top: 10.0,
                            left: 10.0,
                            child: Container(
                              child: AutoSizeText(
                                news.title.toUpperCase(),
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                                maxLines: 3,
                              ),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 2 / 3,
                            ),
                          )
                        ],
                      ));
                },
              );
            }).toList(),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: map<Widget>(newsToShow, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentCarousel == index
                            ? mainYellow()
                            : mainWhite()),
                  );
                }),
              ))
        ],
      );
    }
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  ////////////////////DECKLIST////////////////////////
  DeckCategory _selectedCatDeck = DeckCategory.Standard;
  updateCat(DeckCategory val) {
    setState(() {
      _selectedCatDeck = val;
    });

    if(_selectedCatDeck == DeckCategory.Standard)
      {
        CompetitiveDeckCat.currentState.reverseMe();
        PveDeckCat.currentState.reverseMe();
        setState(() {
          deckListToShow = deckListStandard;
        });
      }
      else if(_selectedCatDeck == DeckCategory.Competitif)
        {
          StandardDeckCat.currentState.reverseMe();
          PveDeckCat.currentState.reverseMe();
          setState(() {
            deckListToShow = deckListCompetitive;
          });
        }
    else if(_selectedCatDeck == DeckCategory.PvE)
    {
      StandardDeckCat.currentState.reverseMe();
      CompetitiveDeckCat.currentState.reverseMe();
      setState(() {
        deckListToShow = deckListPve;
      });
    }

  }
  GlobalKey<AnimatedClickableTextState> StandardDeckCat = GlobalKey();
  GlobalKey<AnimatedClickableTextState> CompetitiveDeckCat = GlobalKey();
  GlobalKey<AnimatedClickableTextState> PveDeckCat  = GlobalKey();
 var deckListToShow = <Widget>[] ;
  var deckListStandard = <Widget>[
    buildDeck(mainDarkBlue()),
    buildDeck(mainDarkBlueD1()),
    buildDeck(mainDarkBlue()),
  ];
  var deckListCompetitive = <Widget>[
    buildDeck(mainDarkBlueD1()),
    buildDeck(mainDarkBlue()),
  ];
  var deckListPve = <Widget>[
    buildDeck(mainDarkBlue()),
    buildDeck(mainDarkBlueD1()),
  ];

  _BuildPopularDeckList() {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            child: Row(
              children: <Widget>[
              new AnimatedClickableText(key:StandardDeckCat,text: "Standard",startColor: mainWhite(),endColor: mainYellow(),onChangedIndex:(val)=> updateCat(val),category: DeckCategory.Standard,),
              Text('|'),
              new AnimatedClickableText(key:CompetitiveDeckCat,text: "Competitif",startColor: mainWhite(),endColor: mainYellow(),onChangedIndex:(val)=> updateCat(val),category: DeckCategory.Competitif),
              Text('|'),
              new AnimatedClickableText(key:PveDeckCat,text: "Fun",startColor: mainWhite(),endColor: mainYellow(),onChangedIndex:(val)=> updateCat(val),category: DeckCategory.PvE),
            ],
            ),
          ),
          Expanded(
            child: Column(
              children: deckListToShow  ,
            ),
          )
        ],
      ),
    );
  }

  static buildDeck(Color bgColor) {
    return Container(
      height: 80,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image.asset('images/ShushusImages/ShushusPortraitsWithLogo/iop_1.png'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text('[IOP]',style: TextStyle(color: Colors.redAccent),),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                                          child: AutoSizeText('Tank contrôle juggernaut blablabli et blablabla',overflow: TextOverflow.ellipsis,softWrap: false,maxLines:1,style: TextStyle(color: mainWhite()),)),
                                    )
                                  ],
                                ),
                                Text('Par XenoTheGod - 26/02/19',style: TextStyle(color: mainYellow(),fontSize: 10),)
                              ],
                            ),
                          ),
                          CachedNetworkImage(
                            imageUrl: 'https://i1.wp.com/blog.waven-game.com/wp-content/uploads/2019/02/Compagnon_Nox.png?fit=800%2C250&ssl=1',
                            fit: BoxFit.cover,
                            placeholder: new Center(
                              child: new CircularProgressIndicator(),
                            ),
                            errorWidget: new Icon(Icons.error),
                          ),
                          CachedNetworkImage(
                            imageUrl: 'https://i2.wp.com/blog.waven-game.com/wp-content/uploads/2019/02/Compagnon_Yugo.png?fit=800%2C250&ssl=1',
                            fit: BoxFit.cover,
                            placeholder: new Center(
                              child: new CircularProgressIndicator(),
                            ),
                            errorWidget: new Icon(Icons.error),
                          ),
                          CachedNetworkImage(
                            imageUrl: 'https://i2.wp.com/blog.waven-game.com/wp-content/uploads/2019/02/Compagnon_SacrieurPaladir.png?fit=800%2C250&ssl=1',
                            fit: BoxFit.cover,
                            placeholder: new Center(
                              child: new CircularProgressIndicator(),
                            ),
                            errorWidget: new Icon(Icons.error),
                          ),
                          CachedNetworkImage(
                            imageUrl: 'https://i0.wp.com/blog.waven-game.com/wp-content/uploads/2019/02/Compagnon_PaladirEnutrof.png?fit=800%2C250&ssl=1',
                            fit: BoxFit.cover,
                            placeholder: new Center(
                              child: new CircularProgressIndicator(),
                            ),
                            errorWidget: new Icon(Icons.error),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: <Widget>[
  Container(
    margin: EdgeInsets.symmetric(horizontal: 4.0),
    decoration: new BoxDecoration(
        border: new Border.all(color: mainYellow())
    ),
    child: CachedNetworkImage(
      imageUrl: 'https://i1.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Heros_chevalierIOP_trancher.png?w=800&ssl=1',
      fit: BoxFit.cover,
      placeholder: new Center(
        child: new CircularProgressIndicator(),
      ),
      errorWidget: new Icon(Icons.error),
    ),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i0.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Air_Uppercut.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i2.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Air_Rafale.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i0.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Eau_Tsunami.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i2.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Terre_HeurtdeGloire.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i0.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Air_Brise.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i0.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Multi_Legendarus.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i2.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Multi_SolAccelerateur.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
  CachedNetworkImage(
    imageUrl: 'https://i1.wp.com/blog.waven-game.com/wp-content/uploads/2019/01/Spell_Iop_Feu_Fulgur.png?w=60%25&ssl=1',
    fit: BoxFit.cover,
    placeholder: new Center(
      child: new CircularProgressIndicator(),
    ),
    errorWidget: new Icon(Icons.error),
  ),
],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}

enum DeckCategory{
  Standard,
  Competitif,
  PvE,
}