import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waven_app/util/ThemeHelper.dart';

class SnapshotLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitRipple(
          color: LightColor(),
          size: 80,
        ) ,
      ),
    );
  }
}
