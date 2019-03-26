import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_menu/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/CommonDatas/WavenApiProvider.dart';
import 'package:waven_app/AppUi/CommonWidget/SnapshotNullLoadingIndicator.dart';
import 'package:waven_app/AppUi/CommonWidget/WavenCompanionAppBar.dart';
import 'package:waven_app/AppUi/Models/ResponseWavenApiSpell.dart';

class SpellsListPage extends StatefulWidget {
  @override
  _SpellsListPageState createState() => _SpellsListPageState();
}

class _SpellsListPageState extends State<SpellsListPage> {
  @override
  void initState() {
    scrollController = new ScrollController();
    globalKey = new GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainDarkBlueL1(),
        appBar: WavenCompanionAppbar(),
        body: DefaultDropdownMenuController(
          onSelected: ({int menuIndex, int index, int subIndex, dynamic data}) {
            print(
                "menuIndex:$menuIndex index:$index subIndex:$subIndex data:$data");
          },
          child: Column(
            children: <Widget>[
              buildDropdownHeader(),
              Expanded(
                  child: Stack(
                children: <Widget>[_buildSpellList(), buildDropdownMenu()],
              )),
            ],
          ),
        ));
  }

  Widget _buildSpellList() {
    return FutureBuilder(
        future: WavenApiProvider.GetAllSpell(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ResponseWavenApiSpell>> snapshot) {
          if (snapshot.data == null) {
            return SnapshotLoadingIndicator();
          }
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AutoSizeText(
                    snapshot.data[index].name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    minFontSize: 2,
                  ),
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: snapshot.data[index].iconUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SnapshotLoadingIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  GlobalKey globalKey;
  ScrollController scrollController;
  int TYPE_INDEX = 2;

  void _onTapHead(int index) {
    RenderObject renderObject = globalKey.currentContext.findRenderObject();
    DropdownMenuController controller =
        DefaultDropdownMenuController.of(globalKey.currentContext);
    //
    scrollController
        .animateTo(scrollController.offset + renderObject.semanticBounds.height,
            duration: new Duration(milliseconds: 150), curve: Curves.ease)
        .whenComplete(() {
      controller.show(index);
    });
  }

  buildDropdownHeader() {
    return new DropdownHeader(
      onTap: _onTapHead,
      titles: [TYPES[TYPE_INDEX], 'test', 'test3'],
    );
  }

  List<Map<String, dynamic>> TYPES = [
    {"title": "全部", "id": 0},
    {"title": "甜点饮品", "id": 1},
    {"title": "生日蛋糕", "id": 2},
    {"title": "火锅", "id": 3},
    {"title": "自助餐", "id": 4},
    {"title": "小吃", "id": 5},
    {"title": "快餐", "id": 6},
    {"title": "日韩料理", "id": 7},
    {"title": "西餐", "id": 8},
    {"title": "聚餐", "id": 9},
    {"title": "烧烤", "id": 10},
    {"title": "川菜", "id": 11},
    {"title": "江浙菜", "id": 12},
    {"title": "东北菜", "id": 13},
    {"title": "蒙餐", "id": 14},
    {"title": "新疆菜", "id": 15},
  ];

  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(maxMenuHeight: kDropdownMenuItemHeight * 10,
        //  activeIndex: activeIndex,
        menus: [
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPES.length),
        ]);
  }
}
