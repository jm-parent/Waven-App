import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waven_app/GenWidgets/WavenPageWithBackground.dart';
import 'package:waven_app/WavenModels/SpellDefModel.dart';
import 'package:waven_app/util/MockDataHelper.dart';

class SpellListByGodPage extends StatelessWidget {
  final int GodId;
  const SpellListByGodPage({Key key, this.GodId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BuildSpellList();

  }
  static BiMapGodFamily MapFamily = new BiMapGodFamily();

  Future<List<SpellDefModel>> _getSpellsByGodId() async
  {
    List<SpellDefModel> spells = [];
    SpellDefModel spellDef = new SpellDefModel();

    for (var item in IndexSpellList) {
      print("IndexSpellList id: ${item}");
      String jsonSpell = await rootBundle.loadString('assets/spells/${item}.json');
      try {
        final jsonResponse = json.decode(jsonSpell);
        spellDef = SpellDefModel.fromJson(jsonResponse);
        spells.add(spellDef);
      }
      catch (e) {
        print(e.toString());
      }

    }
    print("Taille de la liste de spell: "+spells.length.toString());
    spells.removeWhere((i) => i.god != GodId);
    spells.removeWhere((i) => i.textFr.description == "" && i.textFr.name == "");
    print("Taille de la liste filtered de spell: "+spells.length.toString());
    return spells;
  }

  BuildSpellList() {
    return FutureBuilder(
      future: _getSpellsByGodId(),
      builder: (BuildContext context,AsyncSnapshot<List<SpellDefModel>> snapshot)
      {
        if(snapshot.data == null)
          {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          }
          else
            {
              return ListView.builder(itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index)
                {
                  return ListTile(
                    leading: Image.asset("images/GodIcon/Icon${MapFamily.GodFamilyBiMap.inverse[snapshot.data[index].god]}.png",height: 60,),
                    title: Row(
                      children: <Widget>[
                        Text(snapshot.data[index].textFr.name+" (${snapshot.data[index].id})"),
                        Spacer(),
                        Text("Level 10",style: TextStyle(fontSize: 12.0),),
                      ],
                    ),
                    subtitle: AutoSizeText("Description : "+ buildDescription(snapshot.data[index]),maxLines: 3,softWrap: true, ),
                  );
                },);
            }

      },
    );
  }

  String buildDescription(SpellDefModel data) {
    var strToReturn ;
    strToReturn = data.textFr.description;

    for(var valueRef in data.precomputedData.dynamicValueReferences)
      {
        if(valueRef.referenceId == "dmg")
                strToReturn = strToReturn.toString().replaceFirst("{damage:${valueRef.referenceId}}", valueRef.values[9].toString());
      }
    strToReturn = strToReturn.toString().replaceAll("{%PA}","PA");
    strToReturn = strToReturn.toString().replaceAll("{%reserve}","reserve");

    return strToReturn;
  }

  Widget buildStyledDescription(SpellDefModel data) {
    var strToReturn ;
    strToReturn = data.textFr.description;

    for(var valueRef in data.precomputedData.dynamicValueReferences)
    {
      if(valueRef.referenceId == "dmg")
        strToReturn = strToReturn.toString().replaceFirst("{damage:${valueRef.referenceId}}", valueRef.values[9].toString());
    }
    strToReturn = strToReturn.toString().replaceAll("{%PA}","PA");
    strToReturn = strToReturn.toString().replaceAll("{%reserve}","reserve");

    return strToReturn;
  }
}
