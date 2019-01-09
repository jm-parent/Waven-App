import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waven_app/AppUi/CommonWidget/RoundConnerBottomSheet.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenShushus/ShushuBottomSheetFilter/ShushuFilterModel.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class ShushuBottomSheetFilterContainer extends StatefulWidget {
  final Function(ShushuFilterModel) callbackNavigateTo;

  const ShushuBottomSheetFilterContainer({Key key, this.callbackNavigateTo})
      : super(key: key);

  @override
  ShushuBottomSheetFilterContainerState createState() {
    return new ShushuBottomSheetFilterContainerState();
  }
}

class ShushuBottomSheetFilterContainerState
    extends State<ShushuBottomSheetFilterContainer> {
  bool _enableIop;
  bool _enableSram;
  bool _enableXelor;
  bool _enableOsamodas;

  String prefKey = 'switchFilter';
  ShushuSwitchModel filter;
  String shushuIopKey = 'Iop';
  String shushuSramKey = 'Sram';
  String shushuXelorKey = 'Xelor';
  String shushuOsaKey = 'Osamodas';


  Future<bool> saveFilter(bool value,String shushuKey) async {
   var prefs = await SharedPreferences.getInstance();
   filter.setValueByKey(shushuKey, value);
   var st= filter.toString()??"";
    return prefs.setString(prefKey,st );
  }

  Future loadFilter() async {
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getString(prefKey)??"";
    filter.fromString(result);
    setState(() {
      _enableIop = filter.iopSW;
      _enableSram = filter.sramSW;
      _enableXelor = filter.iopSW;
      _enableOsamodas = filter.iopSW;
    });
  }

  _onLayoutDone(_){
    filter = new ShushuSwitchModel(true,true,true,true);
    loadFilter();
  }


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoundConnerBottomSheet(
        backgroundColor: DarkColor(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildRowSwitch(shushuIopKey,_enableIop),
            _buildRowSwitch(shushuXelorKey,_enableXelor),
            _buildRowSwitch(shushuSramKey,_enableSram),
            _buildRowSwitch(shushuOsaKey,_enableOsamodas),
          ],
        )
    );
  }

  _buildRowSwitch(String key,bool _enable)
  {
    return Row(
      children: <Widget>[
        Text(key),
        new Switch(
          value: _enable,
          onChanged: (bool toShow) {
            setState(() {
              _enable = toShow;
              saveFilter(toShow,key);
              widget.callbackNavigateTo(new ShushuFilterModel(key, toShow));
            });
          },
        ),
      ],
    );
  }

}


