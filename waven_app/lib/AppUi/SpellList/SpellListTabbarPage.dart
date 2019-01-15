import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/SpellList/SpellListByGodPage.dart';
import 'package:waven_app/util/MockDataHelper.dart';

class SpellListTabbarPage extends StatefulWidget {
  @override
  SpellListTabbarPageState createState() {
    return new SpellListTabbarPageState();
  }
}

class SpellListTabbarPageState extends State<SpellListTabbarPage>
    with SingleTickerProviderStateMixin {

  BiMapGodFamily MapFamily = new BiMapGodFamily();
  TabController _controllerTab;

  @override
  void initState() {
    super.initState();
    _controllerTab = new TabController(vsync: this, length: 18);
    _controllerTab.addListener(_handleTabSelection);
  }

  var _GodNamePage;

  void _handleTabSelection() {
    setState(() {
      _GodNamePage = GodPages[_controllerTab.index];
    });
  }

  @override
  void dispose() {
    _controllerTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 18,
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                controller: _controllerTab,
                isScrollable: true,
                tabs: [
                  Tab(
                    icon: Image.asset("images/GodIcon/IconCra.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconEcaflip.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconEliotrope.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconEniripsa.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconEnutrof.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconFeca.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconHuppermage.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconIop.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconOsamodas.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconOuginak.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconPandawa.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconRoublard.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconSacrieur.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconSadida.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconSram.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconStreamer.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconXelor.png"),
                  ),
                  Tab(
                    icon: Image.asset("images/GodIcon/IconZobal.png"),
                  ),
                ],
              ),
              title: Text('Les Sorts ${_GodNamePage}'),
            ),
            body: Stack(
              children: <Widget>[
                new Positioned.fill(
                    child: Image.asset(
                  'images/Backgrounds/Background.jpg',
                  fit: BoxFit.cover,
                )),
                new Positioned.fill(
                    child: Container(
                  color: Colors.black12,
                )),
                TabBarView(
                  controller: _controllerTab,
                  children: [
                    SpellListByGodPage(
                      GodId: MapFamily.GodFamilyBiMap['Cra'],                    ),
                    SpellListByGodPage(
                      GodId: MapFamily.GodFamilyBiMap['Ecaflip'],
                    ),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Eliotrope']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Eniripsa']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Enutrof']),
                    SpellListByGodPage(GodId: MapFamily.GodFamilyBiMap['Feca']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Huppermage']),
                    SpellListByGodPage(GodId: MapFamily.GodFamilyBiMap['Iop']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Osamodas']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Ouginak']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Pandawa']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Roublard']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Sacrieur']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Sadida']),
                    SpellListByGodPage(GodId: MapFamily.GodFamilyBiMap['Sram']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Streamer']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Xelor']),
                    SpellListByGodPage(
                        GodId: MapFamily.GodFamilyBiMap['Zobal']),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final List<String> GodPages = <String>[
  "Cra",
  "Ecaflip",
  "Eliotrope",
  "Eniripsa",
  "Enutrof",
  "Feca",
  "Huppermage",
  "Iop",
  "Osamodas",
  "Ouginak",
  "Pandaw",
  "Roublard",
  "Sacrieur",
  "Sadida",
  "Sram",
  "Streamer",
  "Xelor",
  "Zobal"
];
