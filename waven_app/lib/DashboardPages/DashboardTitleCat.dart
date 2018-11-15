import 'package:flutter/material.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class DashboardTitleCat extends StatelessWidget {
  String titleCat;

  DashboardTitleCat(this.titleCat);

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
                Text(titleCat , style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: "BebasNeue",
                ),
                ),
                Spacer(),
                Text("more",style:TextStyle(
                    fontSize: 18.0,
                    fontFamily: "BebasNeue",)),
                Icon(Icons.chevron_right)
              ],
            ),
            SizedBox(height: 3.0,
            child: Container(color: WaventBlue())),
          ],
        ),
      ),
    );
  }
}
