import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/CommonWidget/RoundConnerBottomSheet.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushuBottomSheetFilter/ShushuBottomSheetFilterContainer.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushuBottomSheetFilter/ShushuFilterModel.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusDetailPage.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushusItems.dart';
import 'package:waven_app/GameDataPages/GameDataCardHeroDescWidget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waven_app/models/ShushuOfflineModel.dart';
import 'package:rubber/rubber.dart';

class ShushusListPage extends StatefulWidget {
  List<ShushuOfflineModel> filteredShushusList;
  List<ShushuFilterModel> filters;

  @override
  ShushusListPageState createState() {
    return new ShushusListPageState();
  }
}

class ShushusListPageState extends State<ShushusListPage> {


  Icon _searchIcon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {

    if(widget.filteredShushusList == null) {
      widget.filteredShushusList = List<ShushuOfflineModel>();
      widget.filteredShushusList.addAll(ShushusItems.toList());
      widget.filteredShushusList.sort((a,b)=> a.heroid.compareTo(b.heroid));
    }

    if(widget.filters == null)
      {
        widget.filters = List<ShushuFilterModel>();
      }

    return Scaffold(
        appBar: AppBar(title: Text("Shushu list"),
//        actions: <Widget>[
//          IconButton(icon:_searchIcon,
//              onPressed: (){
//               // _showBottomSheet();
//              },
//          )
//        ],
        ),
        body:ListView.builder(
           itemCount: widget.filteredShushusList?.length??0,
            itemBuilder: (context,int index){
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        PageTransition(type: PageTransitionType.leftToRight, child: ShushusDetailPage(shushuModel: widget.filteredShushusList[index],)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(child: Hero(
                              tag: 'ShushusDetailHero_${widget.filteredShushusList[index].heroid}',
                              child: Image.asset(widget.filteredShushusList[index].background,fit: BoxFit.cover,alignment: new Alignment(0, -0.5),))),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                  height: 90.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(widget.filteredShushusList[index].heroName,style: TextStyle(fontSize: 18.0),),
                                        Text(widget.filteredShushusList[index].lore,style: TextStyle(fontSize: 14.0),),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        })
    );
  }

  _showBottomSheet(){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return ShushuBottomSheetFilterContainer(callbackNavigateTo: _FilterChanged);
      }
    );
  }

  _FilterChanged(ShushuFilterModel filter) {
    setState(() {
      if(filter.isShow)
        {
          widget.filteredShushusList.addAll(ShushusItems.where((shushuItem)=> shushuItem.godName == filter.godName ));
          widget.filteredShushusList.sort((a,b)=> a.heroid.compareTo(b.heroid));
        }
      else
        {
          widget.filteredShushusList.removeWhere((x)=> x.godName == filter.godName);
          widget.filteredShushusList.sort((a,b)=> a.heroid.compareTo(b.heroid));
        }

    });
  }
}
