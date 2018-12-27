import 'package:flutter/material.dart';
import 'package:waven_app/util/EnumHelper.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class DashboardTitleCat extends StatefulWidget {

  String titleCat;

  bool isMoreShowed ;

  int indexToNavigate;
  Function(int) callbackNavigateTo;

  DashboardTitleCat({Key key, this.titleCat,this.callbackNavigateTo,this.isMoreShowed : false,this.indexToNavigate}): super(key: key);
  @override
  DashboardTitleCatState createState() {
    return new DashboardTitleCatState();
  }
}

class DashboardTitleCatState extends State<DashboardTitleCat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(widget.titleCat , style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: "BebasNeue",
                ),
                ),
                Spacer(),
                Visibility(child:buildMore(),
                  visible: widget.isMoreShowed,),
              ],
            ),
            SizedBox(height: 3.0,
            child: Container(color: WaventBlue())),
          ],
        ),
      ),
    );
  }

  buildMore() {
    return InkWell(
      onTap:(){
        widget.callbackNavigateTo(widget.indexToNavigate);
      },
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Text("more",style:TextStyle(
              fontSize: 18.0,
              fontFamily: "BebasNeue",)),
          ),
          Icon(Icons.chevron_right)

        ],
      ),
    );
  }
}

