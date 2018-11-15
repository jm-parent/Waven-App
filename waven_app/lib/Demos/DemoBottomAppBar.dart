import 'package:flutter/material.dart';

class DemoBottomAppBar extends StatelessWidget {
  const DemoBottomAppBar({
    this.color,
    this.fabLocation,
    this.shape
  });

  final Color color;
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;

  static final List<FloatingActionButtonLocation> kCenterLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowContents = <Widget> [
      IconButton(
        icon: const Icon(Icons.menu, semanticLabel: 'Show bottom sheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) => const _DemoDrawer(),
          );
        },
      ),
    ];

    if (kCenterLocations.contains(fabLocation)) {
      rowContents.add(
        const Expanded(child: SizedBox()),
      );
    }

    rowContents.addAll(<Widget> [
      IconButton(
        icon: const Icon(Icons.search, semanticLabel: 'show search action',),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            const SnackBar(content: Text('This is a dummy search action.')),
          );
        },
      ),
      IconButton(
        icon: Icon(
          Theme.of(context).platform == TargetPlatform.iOS
              ? Icons.more_horiz
              : Icons.more_vert,
          semanticLabel: 'Show menu actions',
        ),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            const SnackBar(content: Text('This is a dummy menu action.')),
          );
        },
      ),
    ]);

    return BottomAppBar(
      color: color,
      child: Row(children: rowContents),
      shape: shape,
    );
  }
}

// A drawer that pops up from the bottom of the screen.
class _DemoDrawer extends StatelessWidget {
  const _DemoDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
          ),
          ListTile(
            leading: Icon(Icons.threed_rotation),
            title: Text('3D'),
          ),
        ],
      ),
    );
  }
}