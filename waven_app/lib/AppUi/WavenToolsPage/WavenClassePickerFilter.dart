import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/ColorsHelper.dart';
import 'package:waven_app/AppUi/WavenToolsPage/CustomRadioButton.dart';

class WavenClassPickerFilter extends StatefulWidget {
  final Function(String) callbackClassTapped;
  final String selectedClass;
  const WavenClassPickerFilter({Key key, this.callbackClassTapped, this.selectedClass : ""}) : super(key: key);
  @override
  _WavenClassPickerFilterState createState() => _WavenClassPickerFilterState();
}

class _WavenClassPickerFilterState extends State<WavenClassPickerFilter> {
  var iconHeight = 100.0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        color: mainDarkBlueD2(),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            CustomRadioButton(callbackTap: (value)=>widget.callbackClassTapped(value),myValue: "Iop",groupedValue: widget.selectedClass,child: Image.asset('images/GodIcon/IconIop.png',height: iconHeight,),),
            CustomRadioButton(callbackTap: (value)=>widget.callbackClassTapped(value),myValue: "Sram",groupedValue: widget.selectedClass,child: Image.asset('images/GodIcon/IconSram.png',height: iconHeight,),),
            CustomRadioButton(callbackTap: (value)=>widget.callbackClassTapped(value),myValue: "Sacrieur",groupedValue: widget.selectedClass,child: Image.asset('images/GodIcon/IconSacrieur.png',height: iconHeight,),),
            CustomRadioButton(callbackTap: (value)=>widget.callbackClassTapped(value),myValue: "Xelor",groupedValue: widget.selectedClass,child: Image.asset('images/GodIcon/IconXelor.png',height: iconHeight,),),
            CustomRadioButton(callbackTap: (value)=>widget.callbackClassTapped(value),myValue: "Cra",groupedValue: widget.selectedClass,child: Image.asset('images/GodIcon/IconCra.png',height: iconHeight,),),
            CustomRadioButton(callbackTap: (value)=>widget.callbackClassTapped(value),myValue: "Eni",groupedValue: widget.selectedClass,child: Image.asset('images/GodIcon/IconEniripsa.png',height: iconHeight,),),
            CustomRadioButton(callbackTap: (value)=>widget.callbackClassTapped(value),myValue: "Osa",groupedValue: widget.selectedClass,child: Image.asset('images/GodIcon/IconOsamodas.png',height: iconHeight,),),
          ],
        ),
      ),
    );
  }
}
