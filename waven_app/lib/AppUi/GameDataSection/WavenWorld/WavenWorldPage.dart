import 'package:flutter/material.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenWorld/WavenWorldItems.dart';
import 'package:waven_app/AppUi/GameDataSection/WavenWorld/WavenWorldListItem.dart';
import 'package:waven_app/Core/PageTransformer.dart';

class WavenWorldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: WavenWorldItems.length,
                itemBuilder: (context, index) {
                  final item = WavenWorldItems[index];
                  final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);

                  return WavenWorldListItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
